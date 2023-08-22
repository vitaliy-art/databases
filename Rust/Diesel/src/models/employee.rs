use core::fmt;
use crate::schema::employees;
use diesel::prelude::*;
use diesel::sqlite::Sqlite;
use crate::models::department::Department;
use crate::models::person::Person;

#[derive(Queryable, Selectable, Identifiable, Associations)]
#[diesel(table_name = employees)]
#[diesel(belongs_to(Person))]
#[diesel(belongs_to(Department))]
#[diesel(check_for_backend(Sqlite))]
pub struct Employee {
    pub id: String,
    pub department_id: i32,
    pub person_id: String,
    pub position: i32,
}

#[derive(Clone, Copy)]
pub enum Position {
    Staffer,
    Manager,
    Boss,
}

impl Position {
    pub fn from_i32(value: i32) -> Position {
        match value {
            0 => Position::Staffer,
            1 => Position::Manager,
            2 => Position::Boss,
            _ => panic!("Unknown Position value: {}", value)
        }
    }

    pub fn to_i32(&self) -> i32 {
        match self {
            Position::Staffer => 0,
            Position::Manager => 1,
            Position::Boss => 2,
        }
    }
}

impl fmt::Display for Position {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", match self {
            Position::Staffer => "Staffer",
            Position::Manager => "Manager",
            Position::Boss => "Boss",
        })
    }
}

impl Employee {
    pub fn to_string(&self, dep: Department, per: Person) -> String {
        format!("{{ Employee: {{ Id: {}, Person: {}, Department: {}, Position: {} }} }}", self.id, per, dep, Position::from_i32(self.position))
    }
}

#[derive(Insertable)]
#[diesel(table_name = employees)]
#[diesel(check_for_backend(Sqlite))]
pub struct NewEmployee<'a> {
    pub id: &'a str,
    pub department_id: i32,
    pub person_id: &'a str,
    pub position: i32,
}
