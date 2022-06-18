using Context;
using Models;
using Service;

var factory = new ApplicationContextFactory();
var service = new EntityService(factory);

Console.Write("Clean up database... ");
var departments = await service.GetAllAsync<Department>();
await service.RemoveRangeAsync(departments);
var people = await service.GetAllAsync<Person>();
await service.RemoveRangeAsync(people);
var employees = await service.GetAllAsync<Employee>();
await service.RemoveRangeAsync(employees);
Console.WriteLine("done");

Console.Write("\nAdd departments... ");
var dep1 = await service.AddNewDepartmentAsync("Department One");
var dep2 = await service.AddNewDepartmentAsync("Department Two");
Console.WriteLine("done");

Console.WriteLine("\nAdded departments:");
departments = await service.GetAllAsync<Department>();
foreach (var dep in departments)
    Console.WriteLine($"    {dep}");

Console.Write("\nAdd persons... ");
var person1 = await service.AddNewPersonAsync("Ivan", "Moscow", new(1990, 10, 02));
var person2 = await service.AddNewPersonAsync("John", "London", new(1998, 01, 14));
Console.WriteLine("done");

Console.WriteLine("\nAdded persons:");
people = await service.GetAllAsync<Person>();
foreach (var per in people)
    Console.WriteLine($"    {per}");

Console.Write("\nAdd employees... ");
await service.AddNewEmployeeAsync(person1.Id, dep1.Id, Position.Staffer);
await service.AddNewEmployeeAsync(person2.Id, dep1.Id, Position.Staffer);
await service.AddNewEmployeeAsync(dep2.Id, "Nick", "Berlin", new(1995, 02, 23), Position.Manager);
await service.AddNewEmployeeAsync(dep2.Id, "Stan", "Oslo", new(1988, 04, 21), Position.Boss);
Console.WriteLine("done");

Console.WriteLine("\nAdded employees:");
employees = await service.GetAllAsync<Employee>();
employees = employees.Select(e => service.GetEmployeeAsync(e.Id).Result!).ToList();
foreach (var emp in employees)
    Console.WriteLine($"    {emp}");

Console.Write("\nDelete Department One... ");
await service.RemoveEntryAsync(dep1);
Console.WriteLine("done");

Console.Write("\nUpdate Department Two... ");
dep2.Name = "Department";
await service.UpdateEntityAsync(dep2);
Console.WriteLine("done");

Console.Write("\nUpdate Ivan... ");
person1.Address = "Tula";
await service.UpdateEntityAsync(person1);
Console.WriteLine("done");

Console.WriteLine("\nRemain departments:");
departments = await service.GetAllAsync<Department>();
foreach (var dep in departments)
    Console.WriteLine($"    {dep}");

Console.WriteLine("\nRemain persons:");
people = await service.GetAllAsync<Person>();
foreach (var per in people)
    Console.WriteLine($"    {per}");

Console.WriteLine("\nRemain employees:");
employees = await service.GetAllAsync<Employee>();
employees = employees.Select(e => service.GetEmployeeAsync(e.Id).Result!).ToList();
foreach (var emp in employees)
    Console.WriteLine($"    {emp}");

Console.Write("\nDelete Department Two... ");
await service.RemoveEntryAsync<Department>(dep2.Id);
Console.WriteLine("done");

Console.Write("\nRemain departments count: ");
departments = await service.GetAllAsync<Department>();
Console.WriteLine(departments.Count());

Console.WriteLine("\nRemain persons:");
people = await service.GetAllAsync<Person>();
foreach (var per in people)
    Console.WriteLine($"    {per}");

Console.Write("\nRemain employees count: ");
employees = await service.GetAllAsync<Employee>();
Console.WriteLine(employees.Count());

Console.Write("\nDelete persons... ");
await service.RemoveRangeAsync(people);
Console.WriteLine("done");

Console.Write("\nRemain persons count: ");
people = await service.GetAllAsync<Person>();
Console.WriteLine(people.Count());
