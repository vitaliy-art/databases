import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Employee } from "./Employee";

@Entity("people")
export class Person {

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    name: string;

    @Column()
    address: string;

    @Column("date")
    birthDate: string;

    @OneToMany(() => Employee, (employee) => employee.person)
    employees: Employee[]

    toString = (): string => {
        return `Person { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${this.birthDate} }`;
    }

}
