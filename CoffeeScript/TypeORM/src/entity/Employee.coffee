import { EntitySchema } from "typeorm"
import { Position } from "./Position.js"
import { Department } from "./Department.js"
import { Person } from "./Person.js"

export EmployeeSchema = new EntitySchema Employee.schema

export class Employee
  @schemaName: "Employee"
  @tableName: "employees"

  constructor: (@department ###:Department###, @person ###:Person###, @position ###:number###) ->
    @id

  toString: ###:string### ->
    "Employee { Id: #{@id}, Person: #{@person}, Department: #{@department}, Position: #{Position.toString @position} }"

  @schema:
    name: Employee.schemaName
    tableName: Employee.tableName
    columns:
      id:
        primary: yes
        type: "varchar"
        generated: "uuid"
      position:
        type: "int"
        enum: Position
    relations:
      department:
        target: Department.schemaName
        type: "many-to-one"
        eager: yes
        onDelete: "CASCADE"
        onUpdate: "CASCADE"
      person:
        target: Person.schemaName
        type: "many-to-one"
        eager: yes
        onDelete: "CASCADE"
        onUpdate: "CASCADE"
