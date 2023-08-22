use crate::models::department::*;
use crate::models::person::*;
use crate::models::employee::*;
use diesel::SelectableHelper;
use diesel::sqlite::SqliteConnection;
use diesel::{Connection, RunQueryDsl, QueryDsl, ExpressionMethods};
use uuid::Uuid;

pub struct Storage {
    pub filename: String
}

impl Storage {
    fn get_connection(&self) -> SqliteConnection {
        SqliteConnection::establish(&self.filename)
            .unwrap_or_else(|_| panic!("Error connecting to {}", self.filename))
    }

    pub fn add_department(&self, department_name: &str) -> Department {
        use crate::schema::departments::table;
        use crate::schema::departments::dsl::*;

        let dep = NewDepartment { name: department_name };

        let conn = &mut self.get_connection();
        let _ = diesel::insert_into(table)
            .values(dep)
            .execute(conn)
            .unwrap();

        let dep_id = departments.select(id)
            .order(id.desc())
            .first::<i32>(conn)
            .unwrap();

        Department { id: dep_id, name: String::from(department_name) }
    }

    pub fn add_person (&self, person_name: String, person_address: String, person_birth_date: chrono::NaiveDate) -> Person {
        use crate::schema::people::table;

        let per_id = Uuid::new_v4().to_string();
        let date = format!("{}", person_birth_date.format("%Y-%m-%d"));
        let per = NewPerson { id: &per_id, name: &person_name, address: &person_address, birth_date: &date };

        let conn = &mut self.get_connection();
        let _ = diesel::insert_into(table)
            .values(per)
            .execute(conn)
            .unwrap();

        Person { id: per_id, name: person_name, address: person_address, birth_date: date }
    }

    pub fn add_employee (&self, per: &Person, dep: &Department, employee_position: Position) -> Employee {
        use crate::schema::employees::table;

        let emp_id = Uuid::new_v4().to_string();
        let emp = NewEmployee { id: &emp_id, department_id: dep.id, person_id: &per.id, position: employee_position.to_i32() };

        let conn = &mut self.get_connection();
        let _ = diesel::insert_into(table)
            .values(emp)
            .execute(conn)
            .unwrap();

        Employee { id: emp_id, department_id: dep.id, person_id: per.id.to_owned(), position: employee_position.to_i32() }
    }

    pub fn get_department_by_id(&self, department_id: i32) -> Department {
        use crate::schema::departments::dsl::*;

        let conn = &mut self.get_connection();
        departments.filter(id.eq(department_id))
            .select(Department::as_select())
            .first::<Department>(conn)
            .unwrap()
    }

    pub fn get_person_by_id(&self, person_id: String) -> Person {
        use crate::schema::people::dsl::*;

        let conn = &mut self.get_connection();
        people.filter(id.eq(person_id))
            .select(Person::as_select())
            .first::<Person>(conn)
            .unwrap()
    }

    #[allow(dead_code)]
    pub fn get_employee_by_id(&self, employee_id: String) -> Employee {
        use crate::schema::employees::dsl::*;

        let conn = &mut self.get_connection();
        employees.filter(id.eq(employee_id))
            .select(Employee::as_select())
            .first::<Employee>(conn)
            .unwrap()
    }

    pub fn get_all_departments(&self) -> Vec<Department> {
        use crate::schema::departments::dsl::*;

        let conn = &mut self.get_connection();
        departments.select(Department::as_select())
            .load(conn)
            .unwrap()
    }

    pub fn get_all_people(&self) -> Vec<Person> {
        use crate::schema::people::dsl::*;

        let conn = &mut self.get_connection();
        people.select(Person::as_select())
            .load(conn)
            .unwrap()
    }

    pub fn get_all_employees(&self) -> Vec<Employee> {
        use crate::schema::employees::dsl::*;

        let conn = &mut self.get_connection();
        employees.select(Employee::as_select())
            .load(conn)
            .unwrap()
    }

    pub fn update_department(&self, dep: Department) {
        use crate::schema::departments::dsl::*;

        let conn = &mut self.get_connection();
        diesel::update(departments)
            .filter(id.eq(dep.id))
            .set(name.eq(dep.name))
            .execute(conn)
            .unwrap();
    }

    pub fn update_person(&self, per: Person) {
        use crate::schema::people::dsl::*;

        let conn = &mut self.get_connection();
        diesel::update(people)
            .filter(id.eq(per.id))
            .set((
                name.eq(per.name),
                address.eq(per.address),
                birth_date.eq(per.birth_date),
            ))
            .execute(conn)
            .unwrap();
    }

    #[allow(dead_code)]
    pub fn update_employee(&self, emp: Employee) {
        use crate::schema::employees::dsl::*;

        let conn = &mut self.get_connection();
        diesel::update(employees)
            .filter(id.eq(emp.id))
            .set((
                department_id.eq(emp.department_id),
                person_id.eq(emp.person_id.as_str()),
                position.eq(emp.position),
            ))
            .execute(conn)
            .unwrap();
    }

    pub fn delete_departments(&self, entities: Vec<Department>) {
        if entities.len() == 0 {
            return
        }

        use crate::schema::departments::dsl::*;
        use diesel::result::Error;

        let ids: &Vec<i32> = &entities.into_iter().map(|d| d.id).collect();

        let conn = &mut self.get_connection();

        conn.transaction::<_, Error, _>(|conn| {
            diesel::delete(crate::schema::employees::dsl::employees)
                .filter(crate::schema::employees::dsl::department_id.eq_any(ids))
                .execute(conn)
                .unwrap();

            diesel::delete(departments)
                .filter(id.eq_any(ids))
                .execute(conn)
                .unwrap();

            Ok(())
        }).unwrap();
    }

    pub fn delete_people(&self, entities: Vec<Person>) {
        if entities.len() == 0 {
            return
        }

        use crate::schema::people::dsl::*;
        use diesel::result::Error;

        let ids: &Vec<String> = &entities.into_iter().map(|p| p.id).collect();

        let conn = &mut self.get_connection();
        conn.transaction::<_, Error, _>(|conn| {
            diesel::delete(crate::schema::employees::dsl::employees)
                .filter(crate::schema::employees::dsl::person_id.eq_any(ids))
                .execute(conn)
                .unwrap();

            diesel::delete(people)
                .filter(id.eq_any(ids))
                .execute(conn)
                .unwrap();

            Ok(())
        }).unwrap();
    }

    pub fn delete_employees(&self, entities: Vec<Employee>) {
        if entities.len() == 0 {
            return
        }

        use crate::schema::employees::dsl::*;

        let ids: Vec<String> = entities.into_iter().map(|e| e.id).collect();

        let conn = &mut self.get_connection();
        diesel::delete(employees)
            .filter(id.eq_any(ids))
            .execute(conn)
            .unwrap();
    }
}
