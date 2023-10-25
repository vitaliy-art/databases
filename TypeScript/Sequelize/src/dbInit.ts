import { Sequelize } from 'sequelize-typescript';
import { Department } from './models/department.model';
import { Person } from './models/person.model';
import { Employee } from './models/employee.model';

export default async () => {
    const sequelize = new Sequelize({
        dialect: 'sqlite',
        storage: 'db.bd',
        models: [Department, Person, Employee],
        logging: false,
        define: {
            underscored: true,
        },
    });

    await sequelize.query(`
        CREATE TABLE IF NOT EXISTS departments (
            id INTEGER PRIMARY KEY,
            name VARCHAR
        );
    `);

    await sequelize.query(`
        CREATE TABLE IF NOT EXISTS people (
            id VARCHAR PRIMARY KEY,
            name VARCHAR,
            address VARCHAR,
            birth_date VARCHAR
        );
    `);

    await sequelize.query(`
        CREATE TABLE IF NOT EXISTS employees (
            id VARCHAR PRIMARY KEY,
            person_id VARCHAR,
            department_id INTEGER,
            position VARCHAR,
            FOREIGN KEY (person_id) REFERENCES people(id) ON DELETE CASCADE,
            FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
        );
    `);

    await sequelize.validate();
    return sequelize;
};
