namespace Models

open System

type Position =
  | Boss = 0
  | Manager = 1
  | Staffer = 2

type Employee () =
  // [<Key>]
  member val Id: Guid = Guid.Empty with get, set

  member val PersonId: Guid = Guid.Empty with get, set
  member val Person: Person = Person () with get, set

  member val DepartmentId: int = Int32 () with get, set
  member val Department: Department = Department () with get, set

  member val Position: Position = Position () with get, set

  new (person, department, position) as this =
    Employee ()
    then
      this.Person <- person
      this.Department <- department
      this.Position <- position

  with override this.ToString () =
        $"Employee {{ Id: {this.Id}, Person: {this.Person}, Department: {this.Department}, Pisition: {this.Position} }}"
