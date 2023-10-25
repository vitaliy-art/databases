import { Entity, Property, PrimaryKey, DateType } from '@mikro-orm/core';
import { v4 } from 'uuid';

@Entity({ tableName: 'people' })
export class Person {
    @PrimaryKey()
    public id = v4();

    @Property()
    public name!: string;

    @Property()
    public address!: string;

    @Property({ type: DateType })
    public birthDate!: Date;

    string(): string {
        return `{ Person: { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${this.birthDate.toISOString().split('T')[0]} } }`;
    }
}
