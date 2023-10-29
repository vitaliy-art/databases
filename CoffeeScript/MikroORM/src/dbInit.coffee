import { employeeSchema } from "./models/Employee.js"
import { departmentSchema } from "./models/Department.js"
import { personSchema } from "./models/Person.js"
import { MikroORM } from "@mikro-orm/sqlite"

export default ->
  return MikroORM.init {
    entities: [departmentSchema, personSchema, employeeSchema]
    dbName: "db.bd"
    type: "sqlite"
    allowGlobalContext: on
  }
