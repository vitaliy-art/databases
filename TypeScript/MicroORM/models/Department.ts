import { Entity, Property, PrimaryKey } from '@mikro-orm/core';

@Entity({ tableName: 'departments' })
export class Department {
    @PrimaryKey()
    public id!: number;

    @Property()
    public name!: string;

    string(): string {
        return `{ Department { Id: ${this.id}, Name: ${this.name} } }`;
    }
}
