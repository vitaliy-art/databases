import { EntityManager, EntityName } from '@mikro-orm/core';
import { Department } from '../models/Department';
import { Person } from '../models/Person';
import { Position, Employee } from '../models/Employee';

export class StorageService {
    constructor(
        private em: EntityManager,
    ) {}

    async addDepartment(params: { name: string }): Promise<Department> {
        const dep = new Department();
        dep.name = params.name;
        await this.em.persistAndFlush(dep);
        return dep;
    }

    async addPerson(params: { name: string, address: string, birthDate: Date }): Promise<Person> {
        const per = new Person();
        per.name = params.name;
        per.address = params.address;
        per.birthDate = params.birthDate;
        await this.em.persistAndFlush(per);
        return per;
    }

    async addEmployee(params: { person: Person, department: Department, position: Position }): Promise<Employee> {
        const emp = new Employee();
        emp.department = params.department;
        emp.person = params.person;
        emp.position = params.position;
        await this.em.persistAndFlush(emp);
        return emp;
    }

    async getAll<T extends object>(entityName: EntityName<T>): Promise<T[]> {
        return this.em.find(entityName, {});
    }

    async addEmployeeWithPerson(params: { name: string, address: string, birthDate: Date, department: Department, position: Position }): Promise<Employee> {
        const per = await this.addPerson(params);
        return this.addEmployee({ person: per, department: params.department, position: params.position });
    }

    update = (entity: object) => this.em.persistAndFlush(entity);

    remove(entities: object | object[]): Promise<void> {
        return this.em.removeAndFlush(entities);
    }
}
