import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Employee } from "./Employee";

@Entity()
export class Department {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(() => Employee, (employee) => employee.department)
    employees: Employee[]

    toString = (): string => {
        return `Department { Id: ${this.id}, Name: ${this.name} }`;
    }

}
