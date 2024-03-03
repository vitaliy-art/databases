namespace Storages

open DataConnections
open LinqToDB
open Models
open System
open System.Linq
open System.Runtime.ExceptionServices

type DefaultStorage (dataConnection) =
  member private _.db: DefaultDataConnection = dataConnection

  interface IDisposable with
    member this.Dispose () = this.db.Dispose ()

  interface IAsyncDisposable with
    member this.DisposeAsync () = this.db.DisposeAsync ()

  member this.AddDepartmentAsync (name) = async {
    let dep = Department (name)
    let! id = this.db.InsertWithInt32IdentityAsync dep |> Async.AwaitTask
    dep.Id <- id
    return dep
  }

  member this.AddPersonAsync (name, address, birthDate) = async {
    let per = Person (name, address, birthDate)
    this.db.InsertAsync per |> Async.AwaitTask |> ignore
    return per
  }

  member this.AddEmployeeAsync (person, department, position) = async {
    let emp = Employee (position, department, person)
    emp.DepartmentId <- department.Id
    emp.PersonId <- person.Id
    this.db.InsertAsync emp |> Async.AwaitTask |> ignore
    return emp
  }

  member this.AddEmployeeWithPersonAsync (department, name, address, birthDate, position) = async {
    let! per = this.AddPersonAsync (name, address, birthDate)
    return! this.AddEmployeeAsync (per, department, position)
  }

  member this.Update (obj) = this.db.UpdateAsync obj |> Async.AwaitTask |> ignore


  member this.GetAllDepartmentsAsync () = this.db.Departments.ToListAsync () |> Async.AwaitTask

  member this.GetAllPeopleAsync () = this.db.People.ToListAsync () |> Async.AwaitTask

  member this.GetAllEmployeesAsync () = async {
    let! employees = this.db.Employees.ToListAsync() |> Async.AwaitTask
    for emp in employees do
      let! dep = this.db.Departments.FirstAsync (fun d -> d.Id = emp.DepartmentId) |> Async.AwaitTask
      let! per = this.db.People.FirstAsync (fun p -> p.Id = emp.PersonId) |> Async.AwaitTask
      emp.Department <- dep
      emp.Person <- per

    return employees
  }

  member this.DeleteDepartment (department: Department) =
    let mutable edi: Option<ExceptionDispatchInfo> = None

    async {
      use! tx = this.db.BeginTransactionAsync () |> Async.AwaitTask
      try
        this.db.Employees.DeleteAsync (fun e -> e.DepartmentId = department.Id) |> Async.AwaitTask |> ignore
        this.db.DeleteAsync department |> Async.AwaitTask |> ignore
      with
        | e ->
          edi <- Some(ExceptionDispatchInfo.Capture(e))
          tx.RollbackAsync () |> Async.AwaitTask |> ignore
          return ()

      tx.CommitAsync () |> Async.AwaitTask |> ignore
    } |> Async.RunSynchronously

    match edi with
      | Some(e) -> e.Throw ()
      | None -> ()

  member this.DeleteDepartments (departments: Department[]) =
    let mutable edi: Option<ExceptionDispatchInfo> = None
    let ids = departments.Select (fun d -> d.Id)

    async {
      use! tx = this.db.BeginTransactionAsync () |> Async.AwaitTask
      try
        this.db.Employees.DeleteAsync (fun e -> ids.Contains e.DepartmentId) |> Async.AwaitTask |> ignore
        this.db.Departments.DeleteAsync (fun d -> ids.Contains d.Id) |> Async.AwaitTask |> ignore
      with
        | e ->
          edi <- Some(ExceptionDispatchInfo.Capture e)
          tx.RollbackAsync () |> Async.AwaitTask |> ignore
          return ()

      tx.CommitAsync () |> Async.AwaitTask |> ignore
    } |> Async.RunSynchronously

    match edi with
      | Some(e) -> e.Throw ()
      | None -> ()

  member this.DeletePerson (person: Person) =
    let mutable edi: Option<ExceptionDispatchInfo> = None

    async {
      use! tx = this.db.BeginTransactionAsync () |> Async.AwaitTask
      try
        this.db.Employees.DeleteAsync (fun e -> e.PersonId = person.Id) |> Async.AwaitTask |> ignore
        this.db.DeleteAsync person |> Async.AwaitTask |> ignore
      with
        | e ->
          edi <- Some(ExceptionDispatchInfo.Capture e)
          tx.RollbackAsync () |> Async.AwaitTask |> ignore
          return ()

      tx.CommitAsync () |> Async.AwaitTask |> ignore
    } |> Async.RunSynchronously

    match edi with
      | Some(e) -> e.Throw ()
      | None -> ()

  member this.DeletePeople (people: Person[]) =
    let mutable edi: Option<ExceptionDispatchInfo> = None
    let ids = people.Select (fun p -> p.Id)

    async {
      use! tx = this.db.BeginTransactionAsync () |> Async.AwaitTask
      try
        this.db.Employees.DeleteAsync (fun e -> ids.Contains e.PersonId) |> Async.AwaitTask |> ignore
        this.db.People.DeleteAsync (fun p -> ids.Contains p.Id) |> Async.AwaitTask |> ignore
      with
        | e ->
          edi <- Some(ExceptionDispatchInfo.Capture e)
          tx.RollbackAsync () |> Async.AwaitTask |> ignore
          return ()

      tx.CommitAsync () |> Async.AwaitTask |> ignore
    } |> Async.RunSynchronously

    match edi with
      | Some(e) -> e.Throw ()
      | None -> ()

  member this.DeleteEmployee (employee: Employee) = this.db.DeleteAsync (employee) |> Async.AwaitTask |> ignore

  member this.DeleteEmployees (employees: Employee[]) =
    match Array.length employees with
      | 0 -> ()
      | _ ->
        async {
          let ids = employees.Select (fun e -> e.Id)
          this.db.Employees.DeleteAsync (fun e -> ids.Contains e.Id) |> Async.AwaitTask |> ignore
        } |> Async.RunSynchronously
