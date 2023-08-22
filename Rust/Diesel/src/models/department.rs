use core::fmt;
use crate::schema::departments;
use diesel::prelude::*;
use diesel::sqlite::Sqlite;

#[derive(Queryable, Selectable)]
#[diesel(table_name = departments)]
#[diesel(check_for_backend(Sqlite))]
pub struct Department {
    pub id: i32,
    pub name: String,
}

impl fmt::Display for Department {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{{ Department: {{ Id: {}, Name: {} }} }}", self.id, self.name)
    }
}

#[derive(Insertable)]
#[diesel(table_name = departments)]
#[diesel(check_for_backend(Sqlite))]
pub struct NewDepartment<'a> {
    pub name: &'a str,
}
