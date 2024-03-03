namespace Settings

open LinqToDB
open LinqToDB.Configuration
open System.Linq

type ConnectionStringSettings =
  struct
    val _connectionString : string
    val _name: string
    val _providerName: string
    val _isGlobal: bool
    new(connectionString, name, providerName, isGlobal) = {
      _connectionString = connectionString;
      _name = name;
      _providerName = providerName;
      _isGlobal = isGlobal;
    }
  end

  interface IConnectionStringSettings with
    member this.ConnectionString = this._connectionString
    member this.Name = this._name
    member this.ProviderName = this._providerName
    member this.IsGlobal = this._isGlobal

type ConnectionSettings () =
  interface ILinqToDBSettings with
    member val DefaultConfiguration = "SQLite"
    member val DefaultDataProvider = "SQLite"
    member _.DataProviders with get () = Enumerable.Empty<IDataProviderSettings> ()
    member _.ConnectionStrings with get () =
      [| ConnectionStringSettings("Data Source=db.bd", "Default", ProviderName.SQLite, false) |]
