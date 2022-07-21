import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Department } from "./Department";
import { Person } from "./Person";
import { Position } from "./Position";

@Entity()
export class Employee {

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @ManyToOne(() => Department, (department) => department.employees)
    department: Department

    @ManyToOne(() => Person, (person) => person.employees)
    person: Person

    @Column("enum")
    position: Position

    toString = (): string => {
        return `Employee { Id: ${this.id}, Person: ${this.person}, Department: ${this.department}, Position: ${this.position} }`;
    }

}
