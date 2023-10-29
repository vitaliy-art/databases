import { EntitySchema, BaseEntity } from "@mikro-orm/core"
import { v4 } from "uuid"

export class Person extends BaseEntity

  constructor: (@name, @address, @birthDate) ->
    super()
    @id = v4()

  toString: ->
    birthDate = if @birthDate instanceof Date
    then @birthDate.toISOString().split('T')[0]
    else @birthDate

    "{ Person { Id: #{@id}, Name: #{@name} Address: #{@address}, BirthDate: #{birthDate} } }"

export personSchema = new EntitySchema {
  class: Person
  tableName: "people"
  properties: {
    id: {
      primary: yes
      type: "string"
    }
    name: { type: "string" }
    address: { type: "string" }
    birthDate: { type: "Date" }
  }
}

export entity = Person
export schema = personSchema
