namespace Models

open System
open System.ComponentModel.DataAnnotations

type Person () =
  [<Key>]
  member val Id: Guid = Guid.Empty with get, set
  member val Name: string = null with get, set
  member val Address: string = null with get, set
  member val BirthDate: DateTime = DateTime () with get, set

  with override this.ToString () =
        $"""Person: {{ Id: {this.Id}, Name: {this.Name}, Address: {this.Address}, BirthDate: {this.BirthDate.ToString "dd.MM.yyyy"} }}"""

