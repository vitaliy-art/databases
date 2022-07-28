import { createConnection } from "typeorm"
import { DepartmentSchema } from "./entity/Department.js"
import { EmployeeSchema } from "./entity/Employee.js"
import { PersonSchema } from "./entity/Person.js"
import { Position } from "./entity/Position.js"
import { EntityService } from "./service/EntityService.js"

connConfig =
  type: "sqlite",
  database: "bd.db",
  synchronize: on,
  logging: off,
  entities: [
    DepartmentSchema
    PersonSchema
    EmployeeSchema
  ]

createConnection(connConfig)
  .then (conn) ->
    entityService = new EntityService conn
    log = console.log

    log "Clean up database..."
    departments = await entityService.getAllDepartments()
    persons = await entityService.getAllPersons()
    employees = await entityService.getAllEmployees()
    await entityService.removeDepartments departments
    await entityService.removePersons persons
    await entityService.removeEmployees employees
    log "done"

    log "\nAdd departments..."
    dep1 = await entityService.addNewDepartment "Department One"
    dep2 = await entityService.addNewDepartment "Department Two"
    log "done"

    log "\nAdded departments:"
    departments = await entityService.getAllDepartments()
    log "#{dep}" for dep in departments

    log "\nAdd persons..."
    per1 = await entityService.addNewPerson "Ivan", "Moscow", new Date 1990, 10, 2
    per2 = await entityService.addNewPerson "John", "London", new Date 1998, 1, 14
    log "done"

    log "\nAdded persons:"
    persons = await entityService.getAllPersons()
    log "#{per}" for per in persons

    log "\nAdd employees..."
    await entityService.addNewEmployee per1, dep1, Position.Staffer
    await entityService.addNewEmployee per2, dep1, Position.Staffer
    await entityService.addNewEmployeeAndPerson dep2, "Nick", "Berlin", new Date(1995, 2, 23), Position.Manager
    await entityService.addNewEmployeeAndPerson dep2, "Stan", "Oslo", new Date(1998, 4, 21), Position.Boss
    log "done"

    log "\nAdded employees:"
    employees = await entityService.getAllEmployees()
    log "#{emp}" for emp in employees

    log "\nDelete Department One..."
    await entityService.removeDepartments dep1
    log "done"

    log "\nUpdate Department Two..."
    dep2.name = "Department"
    await entityService.saveDepartment dep2
    log "done"

    log "\nUpdate Ivan..."
    per1.address = "Tula"
    await entityService.savePerson per1
    log "done"

    log "\nRemain departments:"
    departments = await entityService.getAllDepartments()
    log "#{dep}" for dep in departments

    log "\nRemain persons:"
    persons = await entityService.getAllPersons()
    log "#{per}" for per in persons

    log "\nRemain employees:"
    employees = await entityService.getAllEmployees()
    log "#{emp}" for emp in employees

    log "\nDelete Department Two..."
    await entityService.removeDepartments dep2
    log "done"

    log "\nRemain departments count:"
    departments = await entityService.getAllDepartments()
    log "#{departments.length}"

    log "\nRemain persons:"
    persons = await entityService.getAllPersons()
    log "#{per}" for per in persons

    log "\nRemaint employees count:"
    employees = await entityService.getAllEmployees()
    log "#{employees.length}"

    log "\nDelete persons..."
    await entityService.removePersons persons
    log "done"

    log "\nRemain persons count:"
    persons = await entityService.getAllPersons()
    log "#{persons.length}"
