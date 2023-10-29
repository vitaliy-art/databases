import { Person } from "./Person.js"
import { Department } from "./Department.js"
import { EntitySchema, BaseEntity, ReferenceType } from "@mikro-orm/core"
import { v4 } from "uuid"

export Position = {
  STAFFER: "Staffer"
  MANAGER: "Manager"
  BOSS: "Boss"
}

export class Employee extends BaseEntity

  constructor: (@department, @person, @position) ->
    super()
    @id = v4()

  toString: ->
    "{ Employee { Id: #{@id}, Department: #{@department}, " +
    "Person: #{@person}, Position: #{@position} } }"

export employeeSchema = new EntitySchema {
  class: Employee
  tableName: "employees"
  properties: {
    id: {
      primary: yes
      type: "string"
    }
    position: { type: "string" }
    department: {
      reference: ReferenceType.MANY_TO_ONE
      onDelete: "cascade"
      type: Department
    }
    person: {
      reference: ReferenceType.MANY_TO_ONE
      onDelete: "cascade"
      type: Person
    }
  }
}

export entity = Employee
export schema = employeeSchema
