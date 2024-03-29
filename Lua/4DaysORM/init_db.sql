CREATE TABLE IF NOT EXISTS departments (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS people (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    birthDate INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    position INTEGER NOT NULL,
    departmentId INTEGER,
    personId INTEGER,
    FOREIGN KEY(departmentId) REFERENCES departments(id) ON DELETE CASCADE,
    FOREIGN KEY(personId) REFERENCES people(id) ON DELETE CASCADE
);
