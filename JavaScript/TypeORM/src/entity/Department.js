import { EntitySchema } from "typeorm";

export class Department{
    static schemaName = "Department";
    static tableName = "departments";

    id;

    /**
     *
     * @param {string} name
     */
    constructor(name) {
        this.name = name
    }

    /**
     *
     * @returns {string}
     */
    toString() {
        return `Department { Id: ${this.id}, Name: ${this.name} }`;
    }
}

export const DepartmentSchema = new EntitySchema({
    name: Department.schemaName,
    tableName: Department.tableName,
    columns: {
        id: {
            primary: true,
            type: "int",
            generated: "increment",
        },
        name: {
            type: "varchar",
        },
    },
});
