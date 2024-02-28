namespace Models

open System
open System.ComponentModel.DataAnnotations

type Person () =
  [<Key>]
  member val Id: Guid = Guid.Empty with get, set
  member val Name: string = null with get, set
  member val Address: string = null with get, set
  member val BirthDate: DateOnly = DateOnly () with get, set

  new (name, address, birthDate) as this =
    Person ()
    then
      this.Name <- name
      this.Address <- address
      this.BirthDate <- birthDate

  with override this.ToString () =
        $"""Person {{ Id: {this.Id}, Name: {this.Name}, Address: {this.Address}, BirthDate: {this.BirthDate.ToString "dd.MM.yyyy"} }}"""

