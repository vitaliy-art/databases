namespace Context

open EntityFrameworkCore.FSharp.Extensions
open Microsoft.EntityFrameworkCore
open Models

type ApplicationContext (options: DbContextOptions<ApplicationContext>) =
  inherit DbContext (options)

  static member val private migrated = false with get, set

  [<DefaultValue>] val mutable departments: DbSet<Department>
  member this.Departments with get () = this.departments and set v = this.departments <- v

  [<DefaultValue>] val mutable people: DbSet<Person>
  member this.People with get () = this.people and set v = this.people <- v

  [<DefaultValue>] val mutable employees: DbSet<Employee>
  member this.Employees with get () = this.employees and set v = this.employees <- v

  member this.Init () =
    if not ApplicationContext.migrated then
      ApplicationContext.migrated <- true
      this.Database.Migrate ()

  override _.OnModelCreating builder =
    builder.RegisterOptionTypes()



