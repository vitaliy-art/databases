use crate::schema::people;
use core::fmt;
use diesel::prelude::*;
use diesel::sqlite::Sqlite;

#[derive(Queryable, Selectable)]
#[diesel(table_name = people)]
#[diesel(check_for_backend(Sqlite))]
pub struct Person {
    pub id: String,
    pub name: String,
    pub address: String,
    pub birth_date: String,
}

impl fmt::Display for Person {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{{ Person: {{ Id: {}, Name: {}, Address: {}, BirthDate: {} }} }}",
            self.id, self.name, self.address, self.birth_date
        )
    }
}

#[derive(Insertable)]
#[diesel(table_name = people)]
#[diesel(check_for_backend(Sqlite))]
pub struct NewPerson<'a> {
    pub id: &'a str,
    pub name: &'a str,
    pub address: &'a str,
    pub birth_date: &'a str,
}
