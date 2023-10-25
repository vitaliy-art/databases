import { SqliteDriver } from '@mikro-orm/sqlite';
import { MikroORM } from '@mikro-orm/core';
import { Department } from './models/Department';
import { Person } from './models/Person';
import { Employee, Position } from './models/Employee';
import dbConfig from './db.config';
import { StorageService } from './services/storage.service';

const print = (msg: string = '') => console.log(msg);

const orm = await MikroORM.init<SqliteDriver>(dbConfig);
await orm.schema.updateSchema();
const storage = new StorageService(orm.em.fork());

print();
print('Clean up database...');
let departments = await storage.getAll(Department);
let people = await storage.getAll(Person);
let employees = await storage.getAll(Employee);
await storage.remove([...departments, ...employees, ...people]);
print('done');
print();

print('Add departments...');
const dep1 = await storage.addDepartment({ name: 'Department One' });
const dep2 = await storage.addDepartment({ name: 'Department Two' });
print('done');
print();

print('Added departments:');
departments = await storage.getAll(Department);
departments.forEach(d => {
    print(d.string());
});
print();

print('Add people...');
const per1 = await storage.addPerson({ name: 'Ivan', address: 'Moscow', birthDate: new Date(1990, 9, 2) });
const per2 = await storage.addPerson({ name: 'John', address: 'London', birthDate: new Date(1998, 0, 14) });
print('done');
print();

print('Added people:');
people = await storage.getAll(Person);
people.forEach(p => {
    print(p.string());
});
print();

print('Add employees...');
await storage.addEmployee({ person: per1, department: dep1, position: Position.STAFFER });
await storage.addEmployee({ person: per2, department: dep1, position: Position.STAFFER });
await storage.addEmployeeWithPerson({ name: 'Nick', address: 'Berlin', department: dep2, position: Position.MANAGER, birthDate: new Date(1995, 1, 23) });
await storage.addEmployeeWithPerson({ name: 'Stan', address: 'Oslo', department: dep2, position: Position.BOSS, birthDate: new Date(1988, 3, 21) });
print('done');
print();

print('Added employees:');
employees = await storage.getAll(Employee);
employees.forEach(e => {
    print(e.string());
});
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
departments.forEach(d => {
    print(d.string());
});
print();

print('Remain people:');
people = await storage.getAll(Person);
people.forEach(p => {
    print(p.string());
});
print();

print('Remain employees:');
employees = await storage.getAll(Employee);
employees.forEach(e => {
    print(e.string());
});
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

await orm.close();
