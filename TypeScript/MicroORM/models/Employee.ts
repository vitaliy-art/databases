import { Entity, Enum, ManyToOne, PrimaryKey } from '@mikro-orm/core';
import { v4 } from 'uuid';
import { Department } from './Department';
import { Person } from './Person';

export enum Position {
    STAFFER = 'Staffer',
    MANAGER = 'Manager',
    BOSS = 'Boss',
}

@Entity({ tableName: 'employees' })
export class Employee {
    @PrimaryKey()
    public id = v4();

    @Enum({ items: () => Position, type: 'string' })
    public position!: Position;

    @ManyToOne({ onDelete: 'cascade' })
    public department!: Department;

    @ManyToOne({ onDelete: 'cascade' })
    public person!: Person;

    string(): string {
        return `{ Employee { Id: ${this.id}, Department: ${this.department.string()}, Person: ${this.person.string()}, Position: ${this.position} } }`;
    }
}
