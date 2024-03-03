namespace DataConnections

open LinqToDB
open LinqToDB.Data
open Models

type DefaultDataConnection (configurationString: string) =
  inherit DataConnection (configurationString)

  new () as this =
    new DefaultDataConnection ("Default")
    then
      this.CreateTable<Department> (tableOptions=TableOptions.CreateIfNotExists) |> ignore
      this.CreateTable<Person> (tableOptions=TableOptions.CreateIfNotExists) |> ignore
      this.CreateTable<Employee> (tableOptions=TableOptions.CreateIfNotExists) |> ignore

  member this.Departments = this.GetTable<Department> ()
  member this.People = this.GetTable<Person> ()
  member this.Employees = this.GetTable<Employee> ()
