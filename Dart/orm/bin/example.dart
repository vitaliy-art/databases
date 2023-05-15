import 'package:example/formatter.dart';
import 'package:example/position.dart';
import 'package:example/storage.dart';
import 'dart:io';

void main(List<String> arguments) async {
  final log = stdout.write;
  final storage = Storage("file:./bd.db");

  log("\nClean up database... ");
  var departments = await storage.getAllDepartments();
  var people = await storage.getAllPeople();
  var employees = await storage.getAllEmployees();
  await storage.deleteDepartments(departments);
  await storage.deletePeople(people);
  await storage.deleteEmployees(employees);
  log("done\n");

  log("\nAdd departments... ");
  final dep1 = await storage.addDepartment("Department One");
  final dep2 = await storage.addDepartment("Department Two");
  log("done\n");

  log("\nAdded departments:\n");
  for (final dep in [dep1, dep2]) {
    log("${dep.format()}\n");
  }

  log("\nAdd people... ");
  final per1 = await storage.addPerson("Ivan", "Moscow", DateTime(1990, 10, 2));
  final per2 = await storage.addPerson("John", "London", DateTime(1998, 1, 14));
  log("done\n");

  log("\nAdded people:\n");
  for (final per in [per1, per2]) {
    log("${per.format()}\n");
  }

  log("\nAdd employees... ");
  final emp1 = await storage.addEmployee(per1, dep1, Position.staffer);
  final emp2 = await storage.addEmployee(per2, dep1, Position.staffer);
  final emp3 = await storage.addEmployeeAndPerson(
      dep2, "Nick", "Berlin", DateTime(1995, 2, 23), Position.manager);
  final emp4 = await storage.addEmployeeAndPerson(
      dep2, "Stan", "Oslo", DateTime(1988, 4, 21), Position.boss);
  log("done\n");

  log("\nAdded employees:\n");
  for (final emp in [emp1, emp2, emp3, emp4]) {
    log("${emp.format((await storage.getPersonById(emp.personId))!, (await storage.getDepartmentById(emp.departmentId))!)}\n");
  }

  log("\nDelete Department One... ");
  await storage.deleteDepartment(dep1);
  log("done\n");

  log("\nUpdate Department Two... ");
  await storage.updateDepartment(dep2.id, name: "Department");
  log("done\n");

  log("\nUpdate Ivan... ");
  await storage.updatePerson(per1.id, address: "Tula");
  log("done\n");

  log("\nRemain departments:\n");
  for (final dep in await storage.getAllDepartments()) {
    log("${dep.format()}\n");
  }

  log("\nRemain people:\n");
  for (final per in await storage.getAllPeople()) {
    log("${per.format()}\n");
  }

  log("\nRemain employees:\n");
  for (final emp in await storage.getAllEmployees()) {
    log("${emp.format((await storage.getPersonById(emp.personId))!, (await storage.getDepartmentById(emp.departmentId))!)}\n");
  }

  log("\nDelete Department Two... ");
  await storage.deleteDepartment(dep2);
  log("done\n");

  log("\nRemain departments count: ${(await storage.getAllDepartments()).length}\n");
  log("\nRemain people count: ${(await storage.getAllPeople()).length}\n");
  log("\nRemain employees count: ${(await storage.getAllEmployees()).length}\n");

  log("\nDelete people... ");
  await storage.deletePeople(await storage.getAllPeople());
  log("done\n");

  log("\nRemain people count: ${(await storage.getAllPeople()).length}\n");
}
