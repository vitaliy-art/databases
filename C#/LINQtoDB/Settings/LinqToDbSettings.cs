using LinqToDB;
using LinqToDB.Configuration;

namespace Settings;

public class ConnectionStringSettings : IConnectionStringSettings
{
    public string ConnectionString { get; set; } = "";
    public string Name { get; set; } = "";
    public string ProviderName { get; set; } = "";
    public bool IsGlobal => false;
}

public class ConnectionSettings : ILinqToDBSettings
{
    public IEnumerable<IDataProviderSettings> DataProviders
        => Enumerable.Empty<IDataProviderSettings>();

    public string DefaultConfiguration => "SQLite";
    public string DefaultDataProvider => "SQLite";

    public IEnumerable<IConnectionStringSettings> ConnectionStrings
    {
        get
        {
            yield return
                new ConnectionStringSettings
                {
                    Name = "Default",
                    ProviderName = ProviderName.SQLite,
                    ConnectionString = "Data Source=db.bd",
                };
        }
    }
}
