import { EntitySchema } from "typeorm";
import { Position } from "./Position.js";
import { Department } from "./Department.js";
import { Person } from "./Person.js";

export class Employee{
    static schemaName = "Employee";
    static tableName = "employees";

    id;

    /**
     *
     * @param {Department} department
     * @param {Person} person
     * @param {int} position
     */
    constructor(department, person, position) {
        this.department = department;
        this.person = person;
        this.position = position;
    }

    /**
     *
     * @returns string
     */
    toString() {
        return `Employee { Id: ${this.id}, Person: ${this.person}, Department: ${this.department}, Position: ${Position.toString(this.position)} }`;
    }
}

export const EmployeeSchema = new EntitySchema({
    name: Employee.schemaName,
    tableName: Employee.tableName,
    columns: {
        id: {
            primary: true,
            type: "varchar",
            generated: "uuid",
        },
        position: {
            type: "int",
            enum: Position,
        },
    },
    relations: {
        department: {
            target: "Department",
            type: "many-to-one",
            eager: true,
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        },
        person: {
            target: "Person",
            type: "many-to-one",
            eager: true,
            onDelete: "CASCADE",
            onUpdate: "CASCADE",
        },
    },
});
