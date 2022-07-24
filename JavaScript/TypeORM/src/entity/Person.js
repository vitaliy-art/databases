import { EntitySchema } from "typeorm";

export class Person{
    static schemaName = "Person";
    static tableName = "people";

    id;

    /**
     *
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     */
    constructor(name, address, birthDate) {
        this.name = name;
        this.address = address;
        this.birthDate = birthDate.toDateString();
    }

    /**
     *
     * @returns {string}
     */
    toString() {
        return `Person { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${new Date(this.birthDate).toISOString().split("T")[0]} }`;
    }
}

export const PersonSchema = new EntitySchema({
    name: Person.schemaName,
    tableName: Person.tableName,
    columns: {
        id: {
            primary: true,
            type: "varchar",
            generated: "uuid",
        },
        name: {
            type: "varchar",
        },
        address: {
            type: "varchar",
        },
        birthDate: {
            type: "date",
        }
    }
});
