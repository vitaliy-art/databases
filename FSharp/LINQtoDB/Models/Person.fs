namespace Models

open LinqToDB
open LinqToDB.Mapping
open System

[<Table "people">]
type Person (name, address, birthDate) =
  new () =
    let today = DateTime.Today
    Person ("", "", DateOnly (today.Year, today.Month, today.Day))

  [<PrimaryKey>][<Column "id">][<DataType (dataType=DataType.Text)>]
  member val Id = Guid.NewGuid () with get, set

  [<Column "name">][<NotNull>]
  member val Name = name with get, set

  [<Column "address">][<NotNull>]
  member val Address = address with get, set

  [<Column "birth_date">][<NotNull>]
  member val BirthDate = birthDate with get, set

  with override this.ToString () =
        let format = "yyyy-MM-dd"
        $"{{ Person: {{ Id: {this.Id}, Name: {this.Name}, Address: {this.Address}, BirthDate: {this.BirthDate.ToString format} }} }}"
