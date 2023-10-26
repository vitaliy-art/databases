import orm from './dbInit.js';
import { Department } from './models/Department.js';
import { Employee, Position } from './models/Employee.js';
import { Person } from './models/Person.js';
import { StorageService } from './services/storage.js';

const print = (msg /** @type {string} */ = '') => console.log(msg);

await orm.schema.updateSchema();
const storage = new StorageService(orm.em.fork());
main().then(() => orm.close());

async function main() {
    print('Clean up database...');
    /** @type {Department[]} */
    let departments = await storage.getAll(Department);
    /** @type {Person[]} */
    let people = await storage.getAll(Person);
    /** @type {Employee[]} */
    let employees = await storage.getAll(Employee);
    await storage.remove([...employees, ...departments, ...people]);
    print('done');
    print();

    print('Add departments...');
    const dep1 = await storage.addDepartment('Department One');
    const dep2 = await storage.addDepartment('Department Two');
    print('done');
    print();

    print('Added departments:');
    departments = await storage.getAll(Department);
    departments.forEach(d => print(d.toString()));
    print();

    print('Add people...');
    const per1 = await storage.addPerson('Ivan', 'Moscow', new Date(1990, 9, 2));
    const per2 = await storage.addPerson('John', 'London', new Date(1998, 0, 14));
    print('done');
    print();

    print('Added people:');
    people = await storage.getAll(Person);
    people.forEach(p => print(p.toString()));
    print();

    print('Add employees...');
    await storage.addEmployee(per1, dep1, Position.STAFFER);
    await storage.addEmployee(per2, dep1, Position.STAFFER);
    await storage.addEmployeeWithPErson('Nick', 'Berlin', new Date(1995, 1, 23), dep2, Position.MANAGER);
    await storage.addEmployeeWithPErson('Stan', 'Oslo', new Date(1988, 3, 21), dep2, Position.BOSS);
    print('done');
    print();

    print('Added employees:');
    employees = await storage.getAll(Employee);
    employees.forEach(e => print(e.toString()));
    print();

    print('Delete Department One...');
    await storage.remove(dep1);
    print('done');
    print();

    print('Update Department Two...');
    dep2.name = 'Department';
    await storage.update(dep2);
    print('done');
    print();

    print('Update Ivan...');
    per1.address = 'Tula';
    await storage.update(per1);
    print('done');
    print();

    print('Remain departments:');
    departments = await storage.getAll(Department);
    departments.forEach(d => print(d.toString()));
    print();

    print('Remain people:');
    people = await storage.getAll(Person);
    people.forEach(p => print(p.toString()));
    print();

    print('Remain employees:');
    employees = await storage.getAll(Employee);
    employees.forEach(e => print(e.toString()));
    print();

    print('Delete Department Two...');
    await storage.remove(dep2);
    print('done');
    print();

    departments = await storage.getAll(Department);
    print(`Remain departments count: ${departments.length}`);
    print();

    people = await storage.getAll(Person);
    print(`Remain people count: ${people.length}`);
    print();

    employees = await storage.getAll(Employee);
    print(`Remain employees count: ${employees.length}`);
    print();

    print('Delete people...');
    await storage.remove(people);
    print('done');
    print();

    people = await storage.getAll(Person);
    print(`Remain people count: ${people.length}`);
    print();
}
