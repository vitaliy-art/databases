namespace Models

open System
open System.ComponentModel.DataAnnotations

type Department () =
  [<Key>]
  member val Id: int = Int32 () with get, set
  member val Name: string = null with get, set

  new (name) as this =
    Department ()
    then
      this.Name <- name

  with override this.ToString () =
        $"Department {{ Id: {this.Id}, Name: {this.Name} }}"

