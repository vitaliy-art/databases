namespace Models

open LinqToDB
open LinqToDB.Mapping
open System

type Position =
  | Boss = 0
  | Manager = 1
  | Staffer = 2

[<Table "employees">]
type Employee (position, department, person) =
  new () = Employee(Position.Staffer, Department (), Person ())

  [<PrimaryKey>][<Column "id">][<DataType (dataType=DataType.Text)>]
  member val Id = Guid.NewGuid () with get, set

  [<Column "position">][<DataType (dataType=DataType.Text)>][<NotNull>]
  member val Position = position with get, set

  [<Column "department_id">][<NotNull>]
  member val DepartmentId = 0 with get, set

  [<Association (ThisKey="department_id", OtherKey="id")>]
  member val Department = department with get, set

  [<Column "person_id">][<DataType (dataType=DataType.Text)>][<NotNull>]
  member val PersonId = Guid.Empty with get, set

  [<Association (ThisKey="person_id", OtherKey="id")>]
  member val Person = person with get, set

  with override this.ToString () =
        $"{{ Employee: {{ Id: {this.Id}, Person: {this.Person}, Department: {this.Department}, Position: {this.Position} }} }}"
