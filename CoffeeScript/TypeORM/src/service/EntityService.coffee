import { Department } from "../entity/Department.js"
import { Person } from "../entity/Person.js"
import { Employee } from "../entity/Employee.js"
import { DataSource } from "typeorm/data-source/DataSource.js"

export class EntityService
  constructor: (@connection ###:DataSource###) ->

  getDepartment: (id ###:number###) ###:Department|null### ->
    rep = @connection.getRepository Department.schemaName
    dep await rep.findOneBy {id: id}
    new Department dep.name

  getPerson: (id ###:string###) ###:Person|null### ->
    rep = @connection.getRepository Person.schemaName
    per = await rep.findOneBy {id: id}
    new Person per.name, per.address, new Date per.birthDate

  getEmployee: (id ###:string###) ###:Employee|null### ->
    rep = @connection.getRepository Employee.schemaName
    emp = await rep.findOne
      where:
        id: id
      relatios:
        person: yes
        department: yes
      relationLoadStrategy: "join"
    new Employee emp.department, emp.person, emp.position

  save = (connection ###:DataSource###, entity ###:any###, schemaName ###:string###) ###:Promise<any>### ->
    rep = connection.getRepository schemaName
    rep.save entity

  addNewDepartment: (name ###:string###) ###:Promise<Department>### ->
    dep = new Department name
    save @connection, dep, Department.schemaName

  addNewPerson: (name ###:string###, address ###:string###, birthDate ###:Date###) ###:Promise<Person>### ->
    per = new Person name, address, birthDate
    save @connection, per, Person.schemaName

  addNewEmployee: (person ###:Person###, department ###:Department###, position ###:number###) ###:Promise<Employee>### ->
    emp = new Employee department, person, position
    save @connection, emp, Employee.schemaName

  saveDepartment: (department ###:Department###) ###:Promise<Department>### ->
    save @connection, department, Department.schemaName

  savePerson: (person ###:Person###) ###:Promise<Person>### ->
    save @connection, person, Person.schemaName

  saveEmployee: (employee ###:Employee###) ###:Promise<Employee>### ->
    save @connection, employee, Employee.schemaName

  addNewEmployeeAndPerson: (department ###:Department###, name ###:string###, address ###:string###, birthDate ###:Date###, position ###:number###) ###:Promise<Employee>### ->
    person = await @addNewPerson name, address, birthDate
    @addNewEmployee person, department, position

  getAll = (connection ###:DataSource###, schemaName ###:string###) ###:Promise<any>### ->
    rep = connection.getRepository schemaName
    rep.find()

  getAllDepartments: ###:Department[]### ->
    entities = await getAll @connection, Department.schemaName
    newDep = (e) ->
      dep = new Department e.name
      dep.id = e.id
      dep
    newDep entity for entity in entities

  getAllPersons: ###:Person[]### ->
    entities = await getAll @connection, Person.schemaName
    newPer = (e) ->
      per = new Person e.name, e.address, new Date e.birthDate
      per.id = e.id
      per
    newPer entity for entity in entities

  getAllEmployees: ###:Employee[]### ->
    rep = @connection.getRepository Employee.schemaName
    entities = await rep.find
      relations:
        person: yes
        department: yes
      relationLoadStrategy: "join"
    newEmp = (e) ->
      dep = new Department e.department.name
      dep.id = e.department.id
      per = new Person e.person.name, e.person.address, new Date e.person.birthDate
      per.id = e.person.id
      emp = new Employee dep, per, e.position
      emp.id = e.id
      emp
    newEmp entity for entity in entities

  remove = (connection ###:DataSource###, entity ###:any###, schemaName ###:string###) ###:Promise<any>### ->
    rep = connection.getRepository schemaName
    rep.remove entity

  removeDepartments: (departments ###:Department|Departments[]###) ###:Promise<Department|Departments[]>### ->
    remove @connection, departments, Department.schemaName

  removePersons: (persons ###:Person|Person[]###) ###:Promise<Person|Person[]>### ->
    remove @connection, persons, Person.schemaName

  removeEmployees: (employees ###:Employee|Employee[]###) ###:Promise<Employee|Employee[]>### ->
    remove @connection, employees, Employee.schemaName
