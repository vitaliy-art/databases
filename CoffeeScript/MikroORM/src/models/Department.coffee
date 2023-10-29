import { EntitySchema, BaseEntity } from "@mikro-orm/core"

export class Department extends BaseEntity

  constructor: (@name) ->
    super()

  toString: ->
    "{ Department { Id: #{@id}, Name: #{@name} } }"

export departmentSchema = new EntitySchema {
  class: Department
  tableName: "departments"
  properties: {
    id: {
      primary: yes
      type: "number"
    }
    name: { type: "string" }
  }
}

export entity = Department
export schema = departmentSchema
