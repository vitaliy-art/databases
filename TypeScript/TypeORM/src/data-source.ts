import "reflect-metadata"
import { DataSource } from "typeorm"
import { Department } from "./entity/Department"
import { Employee } from "./entity/Employee"
import { Person } from "./entity/Person"
import { Init1658413718334 } from "./migration/1658413718334-Init"

export const AppDataSource = new DataSource({
    type: "sqlite",
    database: "db.bd",
    synchronize: true,
    logging: false,
    entities: [
        Department,
        Person,
        Employee,
    ],
    migrations: [
        Init1658413718334
    ],
    subscribers: [],
})
