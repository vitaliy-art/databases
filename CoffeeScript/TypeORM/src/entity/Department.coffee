import { EntitySchema } from "typeorm"

export DepartmentSchema = new EntitySchema Department.schema

export class Department
  @schemaName: "Department"
  @tableName: "departments"

  constructor: (@name ###:string###) ->
    @id

  toString: ###:string### ->
    "Department { Id: #{@id}, Name: #{@name} }"

  @schema:
    name: Department.schemaName
    tableName: Department.tableName
    columns:
      id:
        primary: yes
        type: "int"
        generated: "increment"
      name:
        type: "varchar"
