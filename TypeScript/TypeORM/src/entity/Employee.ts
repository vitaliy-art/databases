import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Department } from "./Department";
import { Person } from "./Person";
import { Position } from "./Position";

@Entity()
export class Employee {

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @ManyToOne(() => Department, (department) => department.employees)
    department: Department;

    @ManyToOne(() => Person, (person) => person.employees)
    person: Person;

    @Column({
        enum: Position,
    })
    position: number;

    constructor(department: Department, person: Person, position: Position) {
        this.department = department;
        this.person = person;
        this.position = position;
    }

    string(): string {
        return `Employee { Id: ${this.id}, Person: ${this.person.string()}, Department: ${this.department.string()}, Position: ${this.position as Position} }`;
    }

}
