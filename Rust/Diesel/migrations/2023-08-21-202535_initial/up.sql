-- Your SQL goes here

Create Table If Not Exists departments (
    id Integer Primary Key Not Null,
    name Varchar Not Null
);

Create Table If Not Exists people (
    id Varchar Primary Key Not Null,
    name Varchar Not Null,
    address Varchar Not Null,
    birth_date Varchar Not Null
);

Create Table If Not Exists employees (
    id Varchar Primary Key Not Null,
    person_id Varchar Not Null,
    department_id Integer Not Null,
    position Integer Not Null,
    Foreign Key (person_id) References people(id) ON DELETE CASCADE,
    Foreign Key (department_id) References departments(id) ON DELETE CASCADE
);
