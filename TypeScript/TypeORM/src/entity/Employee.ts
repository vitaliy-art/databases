import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Department } from "./Department";
import { Person } from "./Person";
import { Position, positionString } from "./Position";

interface IEmployee {
    department: Department;
    person: Person;
    position: Position;
}

@Entity()
export class Employee {

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @ManyToOne(() => Department, (department) => department.employees, { onDelete: "CASCADE", onUpdate: "CASCADE" })
    department: Department;

    @ManyToOne(() => Person, (person) => person.employees, { onDelete: "CASCADE", onUpdate: "CASCADE" })
    person: Person;

    @Column({
        enum: Position,
    })
    position: number;

    constructor(obj?: IEmployee) {
        this.department = obj?.department;
        this.person = obj?.person;
        this.position = obj?.position ?? Position.Staffer;
    }

    string(): string {
        return `Employee { Id: ${this.id}, Person: ${this.person.string()}, Department: ${this.department.string()}, Position: ${positionString(this.position)} }`;
    }

}
