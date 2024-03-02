namespace Context;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

public class ApplicationContextFactory : IDesignTimeDbContextFactory<ApplicationContext>
{
    private readonly string _connectionString;

    public ApplicationContextFactory()
    {
        _connectionString = "Filename=db.bd";
    }

    public ApplicationContextFactory(string connectionString)
    {
        _connectionString = connectionString;
    }

    public ApplicationContext GetContext(string? connectionString = null)
    {
        var builder = new DbContextOptionsBuilder<ApplicationContext>()
            .UseSqlite(connectionString ?? _connectionString)
            .EnableSensitiveDataLogging();

        var ctx = new ApplicationContext(builder.Options);
        return ctx;
    }

    public ApplicationContext CreateDbContext(string[] parameters) =>
        GetContext(parameters.Count() > 0 ? parameters[0] : null);
}
