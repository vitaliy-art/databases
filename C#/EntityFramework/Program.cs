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
