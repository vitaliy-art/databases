import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Employee } from "./Employee";

interface IDepartment {
    name: string;
}

@Entity()
export class Department {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(() => Employee, (employee) => employee.department, { cascade: true })
    employees: Employee[];

    constructor(obj?: IDepartment) {
        this.name = obj?.name ?? "";
    }

    string() {
        return `Department { Id: ${this.id}, Name: ${this.name} }`;
    }

}
