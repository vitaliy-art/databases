namespace Services

open Context
open Microsoft.EntityFrameworkCore
open Models
open System
open System.Collections.Generic

type EntityService (contextFactory: ApplicationContextFactory) =

  member private _.AddNewEntityAsync (entity: 'T) = async {
    use c = contextFactory.GetContext ()
    (c.AddAsync entity).AsTask () |> Async.AwaitTask |> ignore
    c.SaveChangesAsync () |> Async.AwaitTask |> ignore
    return entity
  }

  member this.AddNewDepartmentAsync name = async {
    if String.IsNullOrWhiteSpace name then raise (ArgumentException "name cannot be empty or whitespace")
    let! dep = Department name |> this.AddNewEntityAsync
    return dep
  }

  member this.AddNewPersonAsync name address birthDate = async {
    if String.IsNullOrWhiteSpace name || String.IsNullOrWhiteSpace address then
      raise (ArgumentException "name and address cannot be empty or whitespace")

    let! per = Person (name, address, birthDate) |> this.AddNewEntityAsync
    return per
  }

  member this.AddNewEmployeeAsync personId departmentId position = async {
    use c = contextFactory.GetContext ()
    let! per = this.GetPersonAsync personId
    let per: Person = per
    let! dep = this.GetDepartmentAsync departmentId
    let dep: Department = dep
    let emp = Employee (per, dep, position)
    // Otherwise EF by tries to save to database dep and per and throws an constraint exception cause these records already exists.
    (c.Entry per).State <- EntityState.Unchanged
    (c.Entry dep).State <- EntityState.Unchanged
    (c.Employees.AddAsync emp).AsTask () |> Async.AwaitTask |> ignore
    c.SaveChangesAsync () |> Async.AwaitTask |> ignore
    return emp
  }

  member this.AddNewEmployeeAndPersonAsync departmentId name address birthDate position = async {
    let! per = this.AddNewPersonAsync name address birthDate
    let! emp = this.AddNewEmployeeAsync per.Id departmentId position
    return emp
  }

  member _.UpdateEntityAsync (entity: 'T) = async {
    use c = contextFactory.GetContext ()
    c.Update entity |> ignore
    c.SaveChangesAsync () |> Async.AwaitTask |> ignore
  }

  member _.GetDepartmentAsync (id: int) = async {
    use c = contextFactory.GetContext ()
    let! dep = (c.Departments.FindAsync id).AsTask () |> Async.AwaitTask
    return dep
  }

  member _.GetPersonAsync (id: Guid) = async {
    use c = contextFactory.GetContext ()
    let! per = (c.People.FindAsync id).AsTask () |> Async.AwaitTask
    return per
  }

  member _.GetEmployeeAsync (id: Guid) =
    use c = contextFactory.GetContext ()
    query {
        for employee in c.Employees do
        join department in c.Departments
          on (employee.DepartmentId = department.Id)
        join person in c.People
          on (employee.PersonId = person.Id)
        where (employee.Id.Equals(id))
        select (employee)
      }
      |> Seq.tryHead

  member _.GetAllAsync<'T when 'T: not struct> () = async {
    use c = contextFactory.GetContext ()
    let! all = (c.Set<'T> ()).ToListAsync () |> Async.AwaitTask
    return all
  }

  member _.GetAllEmployeesAsync () = async {
    use c = contextFactory.GetContext ()
    let! all = c.Employees.Include(fun c -> c.Department).Include(fun c -> c.Person).ToListAsync () |> Async.AwaitTask
    return all
  }

  member _.RemoveEntityAsync (entity: 'T) = async {
    use c = contextFactory.GetContext ()
    c.Remove(entity) |> ignore
    c.SaveChangesAsync () |> Async.AwaitTask |> ignore
  }

  member _.RemoveRangeAsync (range: List<'T>) = async {
    use c = contextFactory.GetContext ()
    let arr = range |> Seq.map (fun e -> e :> obj) |> Seq.toArray
    c.RemoveRange arr |> ignore
    c.SaveChangesAsync () |> Async.AwaitTask |> ignore
  }

