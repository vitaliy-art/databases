open DataConnections
open LinqToDB.Data
open Models
open Settings
open Storages
open System

DataConnection.DefaultSettings <- ConnectionSettings ()
let storage = new DefaultStorage (new DefaultDataConnection ())

using (new DefaultStorage (new DefaultDataConnection ())) (fun storage ->
async {
  async {
    printf "Clean up database... "
    let! departments = storage.GetAllDepartmentsAsync ()
    let! people = storage.GetAllPeopleAsync ()
    let! employees = storage.GetAllEmployeesAsync ()
    storage.DeleteDepartments (departments.ToArray ())
    storage.DeletePeople (people.ToArray ())
    storage.DeleteEmployees (employees.ToArray ())
    printfn "done\n"
  } |> Async.RunSynchronously

  printf "Add departments... "
  let! dep1 = storage.AddDepartmentAsync "Department One"
  let! dep2 = storage.AddDepartmentAsync "Department Two"
  printfn "done\n"

  async {
    printfn "Added departments:"
    let! departments = storage.GetAllDepartmentsAsync ()
    departments.ForEach (fun d -> printfn $"{d}")
    printfn ""
  } |> Async.RunSynchronously

  printf "Add people... "
  let! per1 = storage.AddPersonAsync ("Ivan", "Moscow", DateOnly (1990, 10, 02))
  let! per2 = storage.AddPersonAsync ("John", "London", DateOnly (1998, 01, 14))
  printfn "done\n"

  async {
    printfn "Added people:"
    let! people = storage.GetAllPeopleAsync ()
    people.ForEach (fun p -> printfn $"{p}")
    printfn ""
  } |> Async.RunSynchronously

  printf "Add employees... "
  let! _ = storage.AddEmployeeAsync (per1, dep1, Position.Staffer)
  let! _ = storage.AddEmployeeAsync (per2, dep1, Position.Staffer)
  let! _ = storage.AddEmployeeWithPersonAsync (dep2, "Nick", "Berlin", DateOnly (1995, 02, 23), Position.Manager)
  let! _ = storage.AddEmployeeWithPersonAsync (dep2, "Stan", "Oslo", DateOnly (1988, 04, 21), Position.Boss)
  printfn "done\n"

  async {
    printfn "Added employees:"
    let! employees = storage.GetAllEmployeesAsync ()
    employees.ForEach (fun e -> printfn $"{e}")
    printfn ""
  } |> Async.RunSynchronously

  printf "Delete Department One... "
  storage.DeleteDepartment dep1
  printfn "done\n"

  printf "Update Department Two... "
  dep2.Name <- "Department"
  storage.Update dep2
  printfn "done\n"

  printf "Update Ivan... "
  per1.Address <- "Tula"
  storage.Update per1
  printfn "done\n"

  async {
    printfn "Remain departments:"
    let! departments = storage.GetAllDepartmentsAsync ()
    departments.ForEach (fun d -> printfn $"{d}")
    printfn ""

    printfn "Remain people:"
    let! people = storage.GetAllPeopleAsync ()
    people.ForEach (fun p -> printfn $"{p}")
    printfn ""

    printfn "Remain employees:"
    let! employees = storage.GetAllEmployeesAsync ()
    employees.ForEach (fun e -> printfn $"{e}")
    printfn ""
  } |> Async.RunSynchronously

  printf "Delete Department Two... "
  storage.DeleteDepartment dep2
  printfn "done\n"

  async {
    let! departments = storage.GetAllDepartmentsAsync ()
    let! people = storage.GetAllPeopleAsync ()
    let! employees = storage.GetAllEmployeesAsync ()
    printfn $"Remain departments count: {departments.Count}\n"
    printfn $"Remain people count: {people.Count}\n"
    printfn $"Remain employees count: {employees.Count}\n"
  } |> Async.RunSynchronously

  async {
    printf "Delete people... "
    let! people = storage.GetAllPeopleAsync ()
    storage.DeletePeople (people.ToArray ())
    printfn "done\n"
  } |> Async.RunSynchronously

  async {
    let! people = storage.GetAllPeopleAsync ()
    printfn $"Remain people count: {people.Count}\n"
  } |> Async.RunSynchronously
} |> Async.RunSynchronously)
