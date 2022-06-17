namespace Service;

using Context;
using Microsoft.EntityFrameworkCore;
using Models;

public class EntityService
{
    private readonly ApplicationContextFactory _contextFactory;

    public EntityService(ApplicationContextFactory contextFactory)
    {
        _contextFactory = contextFactory ?? throw new ArgumentNullException("contextFactory cannot be null");
    }

    public async Task<TEntity> AddNewEntityAsync<TEntity>(TEntity entity) where TEntity : class
    {
        if (entity is null)
            throw new ArgumentNullException("entity cannot be null");

        using (var c = _contextFactory.GetContext())
        {
            await c.AddAsync(entity);
            await c.SaveChangesAsync();
            return entity;
        }
    }

    public async Task<Department> AddNewDepartmentAsync(string name)
    {
        if (string.IsNullOrWhiteSpace(name))
            throw new ArgumentException("name cannot be empty or whitespace");

        return await AddNewEntityAsync(new Department{ Name = name });
    }

    public async Task<Person> AddNewPersonAsync(string name, string address, DateTime birthDate)
    {
        if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(address))
            throw new ArgumentException("name and address cannot be empty or whitespace");

        return await AddNewEntityAsync(new Person{ Name = name, Address = address, BirthDate = birthDate });
    }

    public async Task<Employee> AddNewEmployeeAsync(Person person, Department department, Position position)
    {
        if (person is null || department is null)
            throw new ArgumentNullException("person and department cannot be null");

        return await AddNewEntityAsync(new Employee{ Person = person, Department = department, Position = position });
    }

    public async Task<Employee> AddNewEmployeeAsync(Guid personId, int departmentId, Position position)
    {
        using (var c = _contextFactory.GetContext())
        {
            var person = (await c.People!.FindAsync(personId)) ?? throw new KeyNotFoundException($"person with id {personId} not found");
            var department = (await c.Departments!.FindAsync(departmentId)) ?? throw new KeyNotFoundException($"department with id {departmentId} not found");
            var employee = new Employee{ Person = person, Department = department, Position = position };
            await c.Employees!.AddAsync(employee);
            await c.SaveChangesAsync();
            return employee;
        }
    }

    public async Task<Employee> AddNewEmployeeAsync(int departmentId, string name, string address, DateTime birthDate, Position position)
    {
        var person = await AddNewPersonAsync(name, address, birthDate);

        using (var c = _contextFactory.GetContext())
        {
            var department = (await c.Departments!.FindAsync(departmentId)) ?? throw new KeyNotFoundException($"department with id {departmentId} not found");
            return await AddNewEmployeeAsync(person, department, position);
        }
    }

    public async Task UpdateEntityAsync<TEntity>(TEntity entity) where TEntity : class
    {
        using (var c = _contextFactory.GetContext())
        {
            c.Update<TEntity>(entity);
            await c.SaveChangesAsync();
        }
    }

    public async Task<Department?> GetDepartmentAsync(int Id)
    {
        using (var c = _contextFactory.GetContext())
            return await c.Departments!.FindAsync(Id);
    }

    public async Task<Person?> GetPersonAsync(Guid id)
    {
        using (var c = _contextFactory.GetContext())
            return await c.People!.FindAsync(id);
    }

    public async Task<Employee?> GetEmployeeAsync(Guid id)
    {
        using (var c = _contextFactory.GetContext())
            return await c.Employees!.Include(e => e.Department).Include(e => e.Person).Where(e => e.Id == id).FirstOrDefaultAsync();
    }

    public async Task<List<TEntity>> GetAllAsync<TEntity>() where TEntity : class
    {
        using (var c = _contextFactory.GetContext())
            return await c.Set<TEntity>().ToListAsync();
    }

    public async Task RemoveEntryAsync<TEntity>(TEntity entry) where TEntity : class
    {
        using (var c = _contextFactory.GetContext())
        {
            c.Remove(entry);
            await c.SaveChangesAsync();
        }
    }

    public async Task RemoveEntryAsync<TEntity>(object id) where TEntity : class
    {
        using (var c = _contextFactory.GetContext())
        {
            var entity = await c.FindAsync<TEntity>(id);

            if (entity is not null)
                await RemoveEntryAsync(entity);
        }
    }

    public async Task RemoveRangeAsync(IEnumerable<object> range)
    {
        using (var c = _contextFactory.GetContext())
        {
            c.RemoveRange(range);
            await c.SaveChangesAsync();
        }
    }
}