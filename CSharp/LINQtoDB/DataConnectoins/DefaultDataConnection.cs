using LinqToDB;
using LinqToDB.Data;
using Models;

namespace DataConnections;

public class DefaultDataConnection : DataConnection
{
    public DefaultDataConnection() : base("Default") {
        this.CreateTable<Department>(tableOptions: TableOptions.CreateIfNotExists);
        this.CreateTable<Person>(tableOptions: TableOptions.CreateIfNotExists);
        this.CreateTable<Employee>(tableOptions: TableOptions.CreateIfNotExists);
    }

    public ITable<Department> Departments => this.GetTable<Department>();
    public ITable<Person> People => this.GetTable<Person>();
    public ITable<Employee> Employees => this.GetTable<Employee>();
}
