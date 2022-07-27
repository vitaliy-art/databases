import { EntitySchema } from "typeorm"

export PersonSchema = new EntitySchema Person.schema

export class Person
  @schemaName = "Person"
  @tableName = "people"

  constructor: (@name ###:string ###, @address ###:string###, birthDate ###:Date###) ->
    @id
    @birthDate = birthDate.toDateString

  toString: ###:string### ->
    "Person { Id: #{@id}, Name: #{@name}, Address: #{@address}, BirthDate: #{new Date(@birthDate).toISOSrting().split("T")[0]}"

  @schema:
    name: Person.schemaName
    tableName: Person.tableName
    columns:
      id:
        primary: yes
        type: "varchar"
        generated: "uuid"
      name:
        type: "varchar"
      address:
        type: "varchar"
      birthDate:
        type: "date"
