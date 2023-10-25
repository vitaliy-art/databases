import { Sequelize } from 'sequelize';

const seq = new Sequelize({
    dialect: 'sqlite',
    storage: 'db.bd',
    define: {
        underscored: true,
    },
    logging: false,
});

await seq.query(`
    CREATE TABLE IF NOT EXISTS departments (
        id INTEGER PRIMARY KEY,
        name VARCHAR
    );
`);

await seq.query(`
    CREATE TABLE IF NOT EXISTS people (
        id VARCHAR PRIMARY KEY,
        name VARCHAR,
        address VARCHAR,
        birth_date VARCHAR
    );
`);

await seq.query(`
    CREATE TABLE IF NOT EXISTS employees (
        id VARCHAR PRIMARY KEY,
        person_id VARCHAR,
        department_id INTEGER,
        position VARCHAR,
        FOREIGN KEY (person_id) REFERENCES people(id) ON DELETE CASCADE,
        FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
    );
`);

await seq.validate();

export default seq;
