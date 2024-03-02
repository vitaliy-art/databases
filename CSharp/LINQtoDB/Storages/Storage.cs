using DataConnections;
using LinqToDB;
using Models;

namespace Storages;

class DefaultStorage : IDisposable, IAsyncDisposable
{
    private readonly DefaultDataConnection _db;

    public DefaultStorage(DefaultDataConnection dataConnection)
    {
        _db = dataConnection;
    }

    public void Dispose()
    {
        _db.Dispose();
    }

    public async ValueTask DisposeAsync()
    {
        await _db.DisposeAsync();
    }

    public async Task<Department> AddDepartment(string name)
    {
        var dep = new Department{ Name = name };
        dep.Id = await _db.InsertWithInt32IdentityAsync(dep);
        return dep;
    }

    public async Task<Person> AddPerson(string name, string address, DateOnly birthDate)
    {
        var per = new Person{ Name = name, Address = address, BirthDate = birthDate };
        await _db.InsertAsync(per);
        return per;
    }

    public async Task<Employee> AddEmployee(Person person, Department department, Position position)
    {
        var emp = new Employee
        {
            Department = department,
            DepartmentId = department.Id,
            Person = person,
            PersonId = person.Id,
            Position = position,
        };

        await _db.InsertAsync(emp);
        return emp;
    }

    public async Task<Employee> AddEmployeeWithPerson(Department department, string name, string address, DateOnly birthDate, Position position)
    {
        var per = await AddPerson(name, address, birthDate);
        return await AddEmployee(per, department, position);
    }

    public async Task Update<T>(T obj) where T: class => await _db.UpdateAsync(obj);

    public IEnumerable<Department> GetAllDepartments() => _db.Departments.ToList();

    public IEnumerable<Person> GetAllPeople() => _db.People.ToList();

    public IEnumerable<Employee> GetAllEmployees()
    {
        var employees_join =
            from e in _db.Employees
            join d in _db.Departments on e.DepartmentId equals d.Id
            join p in _db.People on e.PersonId equals p.Id
            select new
            {
                Employee = e,
                Department = d,
                Person = p,
            };

        var employees = employees_join.ToList().Select(o => new Employee{
            Id = o.Employee.Id,
            Department = o.Department,
            DepartmentId = o.Department.Id,
            Person = o.Person,
            PersonId = o.Person.Id,
            Position = o.Employee.Position,
        });

        return employees;
    }

    public async Task DeleteDepartment(Department department)
    {
        using var tx = await _db.BeginTransactionAsync();
        try
        {
            await _db.Employees.DeleteAsync(e => e.DepartmentId == department.Id);
            await _db.DeleteAsync(department);
        }
        catch
        {
            await tx.RollbackAsync();
            throw;
        }

        await tx.CommitAsync();
    }

    public async Task DeleteDepartments(IEnumerable<Department> departments)
    {
        var ids = departments.Select(d => d.Id);
        using var tx = await _db.BeginTransactionAsync();
        try
        {
            await _db.Employees.DeleteAsync(e => ids.Contains(e.DepartmentId));
            foreach (var d in departments)
            {
                await _db.DeleteAsync(d);
            }
        }
        catch
        {
            await tx.RollbackAsync();
            throw;
        }

        await tx.CommitAsync();
    }

    public async Task DeletePerson(Person person)
    {
        using var tx = await _db.BeginTransactionAsync();
        try
        {
            await _db.Employees.DeleteAsync(e => e.PersonId == person.Id);
            await _db.DeleteAsync(person);
        }
        catch
        {
            await tx.RollbackAsync();
            throw;
        }

        await tx.CommitAsync();
    }

    public async Task DeletePeople(IEnumerable<Person> people)
    {
        var ids = people.Select(p => p.Id);
        using var tx = await _db.BeginTransactionAsync();
        try
        {
            await _db.Employees.DeleteAsync(e => ids.Contains(e.PersonId));
            foreach (var p in people)
            {
                await _db.DeleteAsync(p);
            }
        }
        catch
        {
            await tx.RollbackAsync();
            throw;
        }

        await tx.CommitAsync();
    }

    public async Task DeleteEmployee(Employee employee) => await _db.DeleteAsync(employee);

    public async Task DeleteEmployees(IEnumerable<Employee> employees)
    {
        foreach (var e in employees)
        {
            await _db.DeleteAsync(e);
        }
    }
}
