namespace Context;

using Microsoft.EntityFrameworkCore;
using Models;

public class ApplicationContext : DbContext
{
    private static bool migrated = false;

    public DbSet<Department>? Departments { get; set; }
    public DbSet<Person>? People { get; set; }
    public DbSet<Employee>? Employees { get; set; }

    public ApplicationContext()
        : base() {}

    public ApplicationContext(DbContextOptions<ApplicationContext> options)
        : base(options)
    {
        if (!migrated)
        {
            Database.Migrate();
            migrated = true;
        }
    }
}