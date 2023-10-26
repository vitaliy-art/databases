import { EntitySchema, BaseEntity } from '@mikro-orm/core';

/**
 * @property {number} id
 * @property {string} name
 */
export class Department extends BaseEntity {

    /**
     * @param {string} name
     */
    constructor(name) {
        super();
        this.name = name;
    }

    toString() {
        return `{ Department { Id: ${this.id}, Name: ${this.name} } }`;
    }
}

export const departmentSchema = new EntitySchema({
    class: Department,
    tableName: 'departments',
    properties: {
        id: {
            primary: true,
            type: 'number',
        },
        name: { type: 'string' },
    },
});

export const entity = Department;
export const schema = departmentSchema;
