namespace Context

open Microsoft.EntityFrameworkCore
open Microsoft.EntityFrameworkCore.Design

type ApplicationContextFactory (_connectionString) as this =
  interface IDesignTimeDbContextFactory<ApplicationContext> with
    member _.CreateDbContext parameters =
      if Array.length parameters > 0 then this.GetContext parameters[1] else this.GetContext ()

  new() = ApplicationContextFactory "Filename=db.bd"

  member _.GetContext (?connectionString: string) =
    let mutable builder = new DbContextOptionsBuilder<ApplicationContext> ()
    builder <- builder.UseSqlite(if connectionString.IsSome then connectionString.Value else _connectionString)
    builder <- builder.EnableSensitiveDataLogging ()

    let ctx = new ApplicationContext (builder.Options)
    ctx.Init ()
    ctx
