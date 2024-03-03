namespace Models

open LinqToDB.Mapping

[<Table "departments">]
type Department (name) =
  new () = Department ("")

  [<PrimaryKey>][<Identity>][<Column "id">]
  member val Id = 0 with get, set

  [<Column "name">][<NotNull>]
  member val Name = name with get, set

  with override this.ToString () =
        $"{{ Department: {{ Id: {this.Id}, Name: {this.Name} }} }}"
