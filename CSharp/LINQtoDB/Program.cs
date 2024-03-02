using DataConnections;
using LinqToDB.Data;
using Models;
using Settings;
using Storages;

var log = (string msg) => Console.Write(msg);

var logLine = (string msg) => Console.WriteLine(msg);

DataConnection.DefaultSettings = new ConnectionSettings();
using var storage = new DefaultStorage(new DefaultDataConnection());

log("Clean up database... ");
await storage.DeleteDepartments(storage.GetAllDepartments());
await storage.DeletePeople(storage.GetAllPeople());
await storage.DeleteEmployees(storage.GetAllEmployees());
logLine("done");
logLine("");

log("Add departments... ");
var dep1 = await storage.AddDepartment("Department One");
var dep2 = await storage.AddDepartment("Department Two");
logLine("done");
logLine("");

logLine("Added departments:");
storage.GetAllDepartments().ToList().ForEach(d => logLine(d?.ToString() ?? ""));
logLine("");

log("Add people... ");
var per1 = await storage.AddPerson("Ivan", "Moscow", new DateOnly(1990, 10, 02));
var per2 = await storage.AddPerson("John", "London", new DateOnly(1998, 01, 14));
logLine("done");
logLine("");

logLine("Added people:");
storage.GetAllPeople().ToList().ForEach(p => logLine(p?.ToString() ?? ""));
logLine("");

log("Add employees... ");
await storage.AddEmployee(per1, dep1, Position.Staffer);
await storage.AddEmployee(per2, dep1, Position.Staffer);
await storage.AddEmployeeWithPerson(dep2, "Nick", "Berlin", new DateOnly(1995, 02, 23), Position.Manager);
await storage.AddEmployeeWithPerson(dep2, "Stan", "Oslo", new DateOnly(1988, 04, 21), Position.Boss);
logLine("done");
logLine("");

logLine("Added employees:");
storage.GetAllEmployees().ToList().ForEach(e => logLine(e?.ToString() ?? ""));
logLine("");

log("Delete Department One... ");
await storage.DeleteDepartment(dep1);
logLine("done");
logLine("");

log("Update Department Two... ");
dep2.Name = "Department";
await storage.Update(dep2);
logLine("done");
logLine("");

log("Update Ivan... ");
per1.Address = "Tula";
await storage.Update(per1);
logLine("done");
logLine("");

logLine("Remain departments:");
storage.GetAllDepartments().ToList().ForEach(d => logLine(d?.ToString() ?? ""));
logLine("");

logLine("Remain people:");
storage.GetAllPeople().ToList().ForEach(p => logLine(p?.ToString() ?? ""));
logLine("");

logLine("Remain employees:");
storage.GetAllEmployees().ToList().ForEach(e => logLine(e?.ToString() ?? ""));
logLine("");

log("Delete Department Two... ");
await storage.DeleteDepartment(dep2);
logLine("done");
logLine("");

logLine($"Remain departments count: {storage.GetAllDepartments().ToList().Count()}");
logLine("");

logLine($"Remain people count: {storage.GetAllPeople().ToList().Count()}");
logLine("");

logLine($"Remain employees count: {storage.GetAllEmployees().ToList().Count()}");
logLine("");

log("Delete people... ");
await storage.DeletePeople(storage.GetAllPeople());
logLine("done");
logLine("");

logLine($"Remain people count: {storage.GetAllPeople().ToList().Count()}");
