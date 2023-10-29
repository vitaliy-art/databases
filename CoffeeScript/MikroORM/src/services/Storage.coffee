import { Employee } from "../models/Employee.js"
import { Person } from "../models/Person.js"
import { Department } from "../models/Department.js"

export class StorageService

  constructor: (@em) ->

  save: (entity) ->
    await @em.persistAndFlush entity
    entity

  addDepartment: (name) ->
    dep = new Department name
    @save dep

  addPerson: (name, address, birthDate) ->
    per = new Person name, address, birthDate
    @save per

  addEmployee: (person, department, position) ->
    emp = new Employee department, person, position
    @save emp

  addEmployeeWithPerson: (name, address, birthDate, department, position) ->
    per = await @addPerson name, address, birthDate
    @addEmployee per, department, position

  getAll: (entityName) -> @em.find(entityName, {})

  update: (entity) -> @save entity

  remove: (entities) -> @em.removeAndFlush entities
