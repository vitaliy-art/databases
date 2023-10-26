import { EntitySchema, BaseEntity } from '@mikro-orm/core';
import { v4 } from 'uuid';

/**
 * @property {string} id
 * @property {string} name
 * @property {string} address
 * @property {Date} birthDate
 */
export class Person extends BaseEntity {

    /**
     *
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     */
    constructor(name, address, birthDate) {
        super();
        this.id = v4();
        this.name = name;
        this.address = address;
        this.birthDate = birthDate;
    }

    toString() {
        let birthDate = this.birthDate;
        if (birthDate instanceof Date) {
            birthDate = birthDate.toISOString().split('T')[0];
        }

        return `{ Person: { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${birthDate} } }`;
    }
}

export const personSchema = new EntitySchema({
    class: Person,
    tableName: 'people',
    properties: {
        id: {
            primary: true,
            type: 'string',
        },
        name: { type: 'string' },
        address: { type: 'string' },
        birthDate: { type: 'Date' },
    },
});

export const entity = Person;
export const schema = personSchema;
