import { StorageService } from "./services/storage.js"
import { Employee, Position } from "./models/Employee.js"
import { Person } from "./models/Person.js"
import { Department } from "./models/Department.js"
import dbInit from "./dbInit.js"

print = (msg = "") -> console.log msg

dbInit()
  .then (orm) ->
    await orm.schema.updateSchema()
    orm

  .then (orm) ->
    em = orm.em
    storage = new StorageService em

    print "Clean up database"
    departments = await storage.getAll Department
    people = await storage.getAll Person
    employees = await storage.getAll Employee
    await storage.remove [...departments, ...people, ...employees]
    print "done"
    print()

    print "Add departments..."
    dep1 = await storage.addDepartment "Department One"
    dep2 = await storage.addDepartment "Department Two"
    print "done"
    print()

    print "Added departments:"
    departments = await storage.getAll Department
    print department.toString() for department in departments
    print()

    print "Add people..."
    per1 = await storage.addPerson "Ivan", "Moscow", new Date 1990, 9, 2
    per2 = await storage.addPerson "John", "London", new Date 1998, 0, 14
    print "done"
    print()

    print "Added people:"
    people = await storage.getAll Person
    print person.toString() for person in people
    print()

    print "Add employees..."
    await storage.addEmployee per1, dep1, Position.STAFFER
    await storage.addEmployee per2, dep1, Position.STAFFER
    await storage.addEmployeeWithPerson "Nick", "Berlin", (new Date 1995, 1, 21),
                                        dep2, Position.MANAGER
    await storage.addEmployeeWithPerson "Stan", "Oslo", (new Date 1988, 3, 21),
                                        dep2, Position.BOSS
    print "done"
    print()

    print "Added employees:"
    employees = await storage.getAll Employee
    print employee.toString() for employee in employees
    print()

    print "Delete Department One..."
    await storage.remove dep1
    print "done"
    print()

    print "Update Department Two..."
    dep2.name = "Department"
    await storage.update dep2
    print "done"
    print()

    print "Update Ivan..."
    per1.address = "Tula"
    await storage.update per1
    print "done"
    print()

    print "Remain departments:"
    print department.toString() for department in await storage.getAll Department
    print()

    print "Remain people:"
    print person.toString() for person in await storage.getAll Person
    print()

    print "Remain employees:"
    print employee.toString() for employee in await storage.getAll Employee
    print()

    print "Delete Department Two..."
    await storage.remove dep2
    print "done"
    print()

    departments = await storage.getAll Department
    print "Remain departments count: #{departments.length}"
    print()

    people = await storage.getAll Person
    print "Remain people count: #{people.length}"
    print()

    employees = await storage.getAll Employee
    print "Remain employees count: #{employees.length}"
    print()

    print "Delete people..."
    await storage.remove people
    print "done"
    print()

    people = await storage.getAll Person
    print "Remain people count: #{people.length}"
    print()

    orm

  .then (orm) -> await orm.close()
