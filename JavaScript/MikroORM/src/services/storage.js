import { Person } from '../models/Person.js';
import { Department } from '../models/Department.js';
import { Employee } from '../models/Employee.js';

export class StorageService {
    #em;

    /**
     * @param {import('@mikro-orm/core').EntityManager} entityManager
     */
    constructor(entityManager) {
        this.#em = entityManager;
    }

    /**
     * @param {string} name
     */
    async addDepartment(name) {
        const dep = new Department(name);
        await this.#em.persistAndFlush(dep);
        return dep;
    }

    /**
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     */
    async addPerson(name, address, birthDate) {
        const per = new Person(name, address, birthDate);
        await this.#em.persistAndFlush(per);
        return per;
    }

    /**
     * @param {Person} person
     * @param {Department} department
     * @param {import("../models/Employee").PositionType} position
     */
    async addEmployee(person, department, position) {
        const emp = new Employee(department, person, position);
        await this.#em.persistAndFlush(emp);
        return emp;
    }

    /**
     *
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     * @param {Department} department
     * @param {import("../models/Employee").PositionType} position
     */
    async addEmployeeWithPErson(name, address, birthDate, department, position) {
        const per = await this.addPerson(name, address, birthDate);
        return this.addEmployee(per, department, position);
    }

    /**
     * @param {import("@mikro-orm/core").EntityName<any>} entityName
     */
    getAll = (entityName) => this.#em.find(entityName, {});

    /**
     * @param {object} entity
     */
    update = (entity) => this.#em.persistAndFlush(entity);

    /**
     * @param {(object|object[])} entities
     */
    remove = (entities) => this.#em.removeAndFlush(entities);
}
