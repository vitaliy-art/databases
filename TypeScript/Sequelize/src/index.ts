import dbInit from './dbInit';
import { Department } from './models/department.model';
import { Employee, Position } from './models/employee.model';
import { Person } from './models/person.model';

main().catch(err => console.error(err));

const print = (msg: object | string = '') => console.log(msg);

async function main() {
    const seq = await dbInit();

    print('Clean up database...');
    let departments = await Department.findAll();
    let people = await Person.findAll();
    let employees = await Employee.findAll();
    await Department.destroy({ where: { id: departments.map(d => d.id) }});
    await Person.destroy({ where: { id: people.map(p => p.id) }});
    await Employee.destroy({ where: { id: employees.map(e => e.id)}});
    print('done');
    print();

    print('Add departments...');
    const dep1 = await Department.create({ name: 'Department One' });
    const dep2 = await Department.create({ name: 'Department Two' });
    print('done');
    print();

    print('Added departments:');
    departments = await Department.findAll();
    departments.forEach(d => print(d.toString()));
    print();

    print('Add people...');
    const per1 = await Person.create({ name: 'Ivan', address: 'Moscow', birthDate: new Date(1990, 9, 2)});
    const per2 = await Person.create({ name: 'John', address: 'London', birthDate: new Date(1998, 0, 14)});
    print('done');
    print();

    print('Added people:');
    people = await Person.findAll();
    people.forEach(p => print(p.toString()));
    print();

    print('Add employees...');
    await Employee.create({ position: Position.STAFFER, departmentId: dep1.id, personId: per1.id });
    await Employee.create({ position: Position.STAFFER, departmentId: dep1.id, personId: per2.id });
    await Employee.create({ position: Position.MANAGER, departmentId: dep2.id, personId: (await Person.create({
        name: 'Nick', address: 'Berlin', birthDate: new Date(1995, 1, 23) })).id });
    await Employee.create({ position: Position.BOSS, departmentId: dep2.id, personId: (await Person.create({
        name: 'Stan', address: 'Oslo', birthDate: new Date(1988, 3, 21) })).id });
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
    employees = await Employee.findAll({ include: [Department, Person] });
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
    await Person.destroy({ where: { id: people.map(p => p.id) }});
    print('done');
    print();

    people = await Person.findAll();
    print(`Remain people count: ${people.length}`);
    print();

    await seq.close();
}
