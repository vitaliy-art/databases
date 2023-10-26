import { EntitySchema, BaseEntity, ReferenceType } from '@mikro-orm/core';
import { v4 } from 'uuid';
import { Department } from './Department.js';
import { Person } from './Person.js';

/**
 * @typedef {string} PositionType
 */
/**
 * @enum {PositionType}
 */
export const Position = {
    STAFFER: 'Staffer',
    MANAGER: 'Manager',
    BOSS: 'Boss',
};

/**
 *  @property {string} id
 *  @property {PositionType} position
 *  @property {Department} department
 *  @property {Person} person
 */
export class Employee extends BaseEntity {

    /**
     * @param {Department} department
     * @param {Person} person
     * @param {PositionType} position
     */
    constructor(department, person, position) {
        super();
        this.id = v4();
        this.department = department;
        this.person = person;
        this.position = position;
    }

    toString() {
        return `{ Employee { Id: ${this.id}, Department: ${this.department?.toString()}, Person: ${this.person?.toString()}, Position: ${this.position} } }`;
    }
}

export const employeeSchema = new EntitySchema({
    class: Employee,
    tableName: 'employees',
    properties: {
        id: {
            primary: true,
            type: 'string',
        },
        position: { type: 'string' },
        department: {
            reference: ReferenceType.MANY_TO_ONE,
            onDelete: 'cascade',
            type: Department,
        },
        person: {
            reference: ReferenceType.MANY_TO_ONE,
            onDelete: 'cascade',
            type: Person,
        }
    }
});

export const entity = Department;
export const schema = employeeSchema;
