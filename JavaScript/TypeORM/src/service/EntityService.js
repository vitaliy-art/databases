import { Department } from "../entity/Department.js";
import { Person } from "../entity/Person.js";
import { Employee } from "../entity/Employee.js";
import { DataSource } from "typeorm/data-source/DataSource.js";

export class EntityService{
    /**
     *
     * @param {DataSource} connection
     */
    constructor(connection) {
        this.connection = connection
    }

    /**
     *
     * @param {number} id
     * @returns {Department | null}
     */
    async getDepartment(id) {
        const rep = this.connection.getRepository(Department.schemaName);
        /** @type {Department} */
        const dep = await rep.findOneBy({id: id});
        return new Department(dep.name)
    }

    /**
     *
     * @param {string} id
     * @returns {Person | null}
     */
    async getPerson(id) {
        const rep = this.connection.getRepository(Person.schemaName);
        /** @type {Person} */
        const per = await rep.findOneBy({id: id});
        return new Person(per.name, per.address, new Date(per.birthDate));
    }

    /**
     *
     * @param {string} id
     * @returns {Employee | null}
     */
    async getEmployee(id) {
        const rep = this.connection.getRepository(Employee.schemaName);
        /** @type {Employee} */
        const emp = await rep.findOne({
            where: {id: id},
            relations: {
                person: true,
                department: true,
            },
            relationLoadStrategy: "join",
        });
        return new Employee(emp.department, emp.person, emp.position);
    }

    /**
     *
     * @param {any} entity
     * @returns {Promise<any>}
     */
    #save(entity, schemaName) {
        let rep = this.connection.getRepository(schemaName);
        return rep.save(entity);
    }

    /**
     *
     * @param {int} name
     * @returns {Promise<Department>}
     */
    addNewDepartment(name) {
        let dep = new Department(name);
        return this.#save(dep, Department.schemaName);
    }

    /**
     *
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     * @returns {Promise<Person>}
     */
    addNewPerson(name, address, birthDate) {
        let per = new Person(name, address, birthDate);
        return this.#save(per, Person.schemaName);
    }

    /**
     *
     * @param {Person} person
     * @param {Department} department
     * @param {int} position
     * @returns {Promise<Employee>}
     */
    addNewEmployee(person, department, position) {
        let emp = new Employee(department, person, position);
        return this.#save(emp, Employee.schemaName);
    }

    /**
     *
     * @param {Department} department
     * @returns {Promise<Department>}
     */
    saveDepartment(department) {
        return this.#save(department, Department.schemaName);
    }

    /**
     *
     * @param {Person} person
     * @returns {Promise<Person>}
     */
    savePerson(person) {
        return this.#save(person, Person.schemaName);
    }

    /**
     *
     * @param {Employee} employee
     * @returns {Person<Employee>}
     */
    saveEmployee(employee) {
        return this.#save(employee, Employee.schemaName);
    }

    /**
     *
     * @param {Department} department
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     * @param {int} position
     * @returns
     */
    async addNewEmployeeAndPerson(department, name, address, birthDate, position) {
        let person = await this.addNewPerson(name, address, birthDate);
        return this.addNewEmployee(person, department, position);
    }

    /**
     *
     * @param {string} schemaName
     * @returns {Promise<any>}
     */
    #getAll(schemaName) {
        let rep = this.connection.getRepository(schemaName);
        return rep.find();
    }

    /**
     *
     * @returns {Department[]}
     */
    async getAllDepartments() {
        let entities = await this.#getAll(Department.schemaName);
        let departments = [];
        entities.forEach(e => {
           let dep = new Department(e.name);
           dep.id = e.id;
           departments.push(dep);
        });
        return departments;
    }

    /**
     *
     * @returns {Person[]}
     */
    async getAllPersons() {
        let entities = await this.#getAll(Person.schemaName);
        let persons = [];
        entities.forEach(e => {
            let per = new Person(e.name, e.address, new Date(e.birthDate));
            per.id = e.id;
            persons.push(per);
        });
        return persons;
    }

    /**
     *
     * @returns {Employee[]}
     */
    async getAllEmployees() {
        let rep = this.connection.getRepository(Employee.schemaName);
        let entities = await rep.find({
            relations: {
                person: true,
                department: true,
            },
            relationLoadStrategy: "join",
        });
        let employees = [];
        entities.forEach(e => {
            let dep = new Department(e.department.name);
            dep.id = e.department.id;
            let per = new Person(e.person.name, e.person.address, new Date(e.person.birthDate));
            per.id = e.person.id;
            let emp = new Employee(dep, per, e.position);
            emp.id = e.id;
            employees.push(emp);
        });
        return employees;
    }

    /**
     *
     * @param {any} entity
     * @returns {Promise<any>}
     */
    #remove(entity, schemaName) {
        let rep = this.connection.getRepository(schemaName);
        return rep.remove(entity);
    }

    /**
     *
     * @param {Department | Department[]} departments
     * @returns {Promise<Department | Departments[]>}
     */
    removeDepartments(departments) {
        return this.#remove(departments, Department.schemaName);
    }

    /**
     *
     * @param {Person | Person[]} persons
     * @returns {Promise<Person | Person[]>}
     */
    removePersons(persons) {
        return this.#remove(persons, Person.schemaName);
    }

    /**
     *
     * @param {Employee | Employee[]} employees
     * @returns {Promise<Employee | Employee[]>}
     */
    removeEmployees(employees) {
        return this.#remove(employees, Employee.schemaName);
    }
}
