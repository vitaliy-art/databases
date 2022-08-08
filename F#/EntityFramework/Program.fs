open Context
open Models
open Services
open System

let factory = ApplicationContextFactory ()
let service = EntityService factory

async {
  printf "Clean up database... "
  let! departments = service.GetAllAsync<Department> ()
  do! service.RemoveRangeAsync departments
  let! persons = service.GetAllAsync<Person> ()
  do! service.RemoveRangeAsync persons
  let! employees = service.GetAllAsync<Employee> ()
  do! service.RemoveRangeAsync employees
  printfn "done"

  printf "\nAdd departments... "
  let! dep1 = service.AddNewDepartmentAsync "Department One"
  let! dep2 = service.AddNewDepartmentAsync "Department Two"
  printfn "done"

  printfn "\nAdded departments:"
  let! departments = service.GetAllAsync<Department> ()
  for dep in departments do
    printfn $"{dep}"

  printf "\nAdd persons... "
  let! per1 = service.AddNewPersonAsync "Ivan" "Moscow" (DateOnly (1990, 10, 02))
  let! per2 = service.AddNewPersonAsync "John" "London" (DateOnly (1998, 01, 14))
  printfn "done"

  printfn "\nAdded persons:"
  let! persons = service.GetAllAsync<Person> ()
  for per in persons do
    printfn $"{per}"

  printf "\nAdd employees... "
  let! _ = service.AddNewEmployeeAsync per1.Id dep1.Id Position.Staffer
  let! _ = service.AddNewEmployeeAsync per2.Id dep1.Id Position.Staffer
  let! _ = service.AddNewEmployeeAndPersonAsync dep2.Id "Nick" "Berlin" (DateOnly (1995, 02, 23)) Position.Manager
  let! _ = service.AddNewEmployeeAndPersonAsync dep2.Id "Stan" "Oslo" (DateOnly (1988, 04, 21)) Position.Boss
  printfn "done"

  printfn "\nAdded employees:"
  let! employees = service.GetAllEmployeesAsync ()
  for emp in employees do
    printfn $"{emp}"

  printf "\nDelete Department One... "
  do! service.RemoveEntityAsync dep1
  printfn "done"

  printf "\nUpdate Department Two... "
  dep2.Name <- "Department"
  do! service.UpdateEntityAsync dep2
  printfn "done"

  printf "\nUpdate Ivan... "
  per1.Address <- "Tula"
  do! service.UpdateEntityAsync per1
  printfn "done"

  printfn "\nRemain departments:"
  let! departments = service.GetAllAsync<Department> ()
  for dep in departments do
    printfn $"{dep}"

  printfn "\nRemain persons:"
  let! persons = service.GetAllAsync<Person> ()
  for per in persons do
    printfn $"{per}"

  printfn "\nRemain employees:"
  let! employees = service.GetAllEmployeesAsync ()
  for emp in employees do
    printfn $"{emp}"

  printf "\nDelete Department Two... "
  do! service.RemoveEntityAsync dep2
  printfn "done"

  printf "\nRemain departments count: "
  let! departments = service.GetAllAsync<Department> ()
  Seq.toArray departments |> Array.length |> printfn "%d"

  printfn "\nRemain persons:"
  let! persons = service.GetAllAsync<Person> ()
  for per in persons do
    printfn $"{per}"

  printf "\nRemain employees count: "
  let! employees = service.GetAllEmployeesAsync ()
  Seq.toArray employees |> Array.length |> printfn "%d"

  printf "\nDelete persons... "
  do! service.RemoveRangeAsync persons
  printfn "done"

  printf "\nRemain persons count: "
  let! persons = service.GetAllAsync<Person> ()
  Seq.toArray persons |> Array.length |> printfn "%d"
}
|> Async.RunSynchronously


