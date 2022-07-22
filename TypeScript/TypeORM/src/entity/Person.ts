import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Employee } from "./Employee";

interface IPerson {
    name: string;
    address: string;
    birthDate: Date;
}

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

    @OneToMany(() => Employee, (employee) => employee.person, { cascade: true })
    employees: Employee[];

    constructor(obj?: IPerson) {
        this.name = obj?.name;
        this.address = obj?.address;
        this.birthDate = obj?.birthDate.toDateString();
    }

    string(): string {
        return `Person { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${new Date(this.birthDate).toISOString().split("T")[0]} }`;
    }

}
