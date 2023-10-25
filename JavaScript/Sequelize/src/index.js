import { Department } from './models/department.model.js';
import { Person } from './models/person.model.js';
import { Employee, Position } from './models/employee.model.js';
import seq from './dbInit.js';

const print = (msg /** @type {string} */ = '') => console.log(msg);

print('Clean up database...');
let departments = await Department.findAll();
await Department.destroy({ where: { id: departments.map(d => d.id) } });
let people = await Person.findAll();
await Person.destroy({ where: { id: people.map(p => p.id) } });
let employees = await Employee.findAll();
await Employee.destroy({ where: { id: employees.map(e => e.id) } });
print('done');
print();

print('Add departments...');
const dep1 = await Department.create(Department.getCreationAttributes('Department One'));
const dep2 = await Department.create(Department.getCreationAttributes('Department Two'));
print('done');
print();

print('Added departments:');
departments = await Department.findAll();
departments.forEach(d => print(d.toString()));
print();

print('Add people...');
const per1 = await Person.create(Person.getCreationAttributes('Ivan', 'Moscow', new Date(1990, 9, 2)));
const per2 = await Person.create(Person.getCreationAttributes('John', 'London', new Date(1998, 0, 14)));
print('done');
print();

print('Added people:');
people = await Person.findAll();
people.forEach(p => print(p.toString()));
print();

print('Add employees...');
await Employee.create(Employee.getCreationAttributes(dep1, per1, Position.STAFFER));
await Employee.create(Employee.getCreationAttributes(dep1, per2, Position.STAFFER));
await Employee.create(Employee.getCreationAttributes(
    dep2,
    (await Person.create(Person.getCreationAttributes(
        'Nick',
        'Berlin',
        new Date(1995, 1, 23),
    ))),
    Position.MANAGER,
));
await Employee.create(Employee.getCreationAttributes(
    dep2,
    (await Person.create(Person.getCreationAttributes(
        'Stan',
        'Oslo',
        new Date(1988, 3, 21),
    ))),
    Position.BOSS,
));
print('done');
print();

print('Added employees:');
employees = await Employee.findAll({ include: [Department, Person] });
employees.forEach(e => print(e.toString()));
print();

print('Delete Department One...');
await dep1.destroy();
print('done');
print();

print('Update Department Two...');
dep2.name = 'Department';
await dep2.save();
print('done');
print();

print('Update Ivan...');
per1.address = 'Tula';
await per1.save();
print('done');
print();

print('Remain departments:');
departments = await Department.findAll();
departments.forEach(d => print(d.toString()));
print();

print('Remain people:');
people = await Person.findAll();
people.forEach(p => print(p.toString()));
print();

print('Remain employees:');
employees = await Employee.findAll({ include: [Department, Person ]});
employees.forEach(e => print(e.toString()));
print();

print('Delete Department Two...');
await dep2.destroy();
print('done');
print();

departments = await Department.findAll();
print(`Remain departments count: ${departments.length}`);
print();

people = await Person.findAll();
print(`Remain people count: ${people.length}`);
print();

employees = await Employee.findAll();
print(`Remain employees count: ${employees.length}`);
print();

print('Delete people...');
await Person.destroy({ where: { id: people.map(p => p.id) } });
print('done');
print();

people = await Person.findAll();
print(`Remain people count: ${people.length}`);
print();

await seq.close();
