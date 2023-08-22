use chrono::NaiveDate;
use dotenvy::dotenv;
use std::env;
use storage::Storage;

pub mod models {
    pub mod department;
    pub mod employee;
    pub mod person;
}

pub mod schema;
mod storage;

use crate::models::department::Department;
use crate::models::person::Person;
use models::employee::Position;

fn main() {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let stor = Storage {
        filename: database_url,
    };

    print!("Clean up database... ");
    let departments = stor.get_all_departments();
    let people = stor.get_all_people();
    let employees = stor.get_all_employees();
    stor.delete_departments(departments);
    stor.delete_people(people);
    stor.delete_employees(employees);
    println!("done");

    println!();
    print!("Add departments... ");
    let dep1 = stor.add_department("Department One");
    let dep2 = &mut stor.add_department("Department Two");
    println!("done");

    println!();
    println!("Added departments:");
    let departments = stor.get_all_departments();
    for dep in departments {
        println!("{}", dep);
    }

    println!();
    print!("Add people... ");
    let per1 = &mut stor.add_person(
        "Ivan".to_string(),
        "Moscow".to_string(),
        NaiveDate::from_ymd_opt(1990, 10, 02).unwrap(),
    );
    let per2 = stor.add_person(
        "John".to_string(),
        "London".to_string(),
        NaiveDate::from_ymd_opt(1998, 01, 14).unwrap(),
    );
    println!("done");

    println!();
    println!("Added people:");
    let people = stor.get_all_people();
    for per in people {
        println!("{}", per);
    }

    println!();
    print!("Add employees... ");
    stor.add_employee(&per1, &dep1, Position::Staffer);
    stor.add_employee(&per2, &dep1, Position::Staffer);
    stor.add_employee(
        &stor.add_person(
            "Nick".to_string(),
            "Berlin".to_string(),
            NaiveDate::from_ymd_opt(1995, 02, 23).unwrap(),
        ),
        &dep2,
        Position::Manager,
    );
    stor.add_employee(
        &stor.add_person(
            "Stan".to_string(),
            "Oslo".to_string(),
            NaiveDate::from_ymd_opt(1988, 04, 21).unwrap(),
        ),
        &dep2,
        Position::Boss,
    );
    println!("done");

    println!();
    println!("Added employees:");
    let employees = stor.get_all_employees();
    for emp in employees {
        let department_id = &emp.department_id;
        let person_id = &emp.person_id;
        println!(
            "{}",
            emp.to_string(
                stor.get_department_by_id(department_id.to_owned()),
                stor.get_person_by_id(person_id.to_owned())
            )
        );
    }

    println!();
    print!("Delete Department One... ");
    stor.delete_departments(vec![dep1]);
    println!("done");

    println!();
    print!("Update Department Two... ");
    dep2.name = "Department".to_string();
    stor.update_department(Department {
        id: dep2.id,
        name: dep2.name.to_string(),
    });
    println!("done");

    println!();
    print!("Update Ivan... ");
    per1.address = "Tula".to_string();
    stor.update_person(Person {
        id: per1.id.to_string(),
        name: per1.name.to_string(),
        address: per1.address.to_string(),
        birth_date: per1.birth_date.to_string(),
    });
    println!("done");

    println!();
    println!("Remain departments:");
    let departments = stor.get_all_departments();
    for dep in departments {
        println!("{}", dep);
    }

    println!();
    println!("Remain people:");
    let people = stor.get_all_people();
    for per in people {
        println!("{}", per);
    }

    println!();
    println!("Remain employees:");
    let employees = stor.get_all_employees();
    for emp in employees {
        let department_id = &emp.department_id;
        let person_id = &emp.person_id;
        println!(
            "{}",
            emp.to_string(
                stor.get_department_by_id(department_id.to_owned()),
                stor.get_person_by_id(person_id.to_owned())
            )
        );
    }

    println!();
    print!("Delete Department Two... ");
    stor.delete_departments(vec![Department {
        id: dep2.id,
        name: dep2.name.to_string(),
    }]);
    println!("done");

    println!();
    print!("Remain departments count: ");
    let departments = stor.get_all_departments();
    println!("{}", departments.len());

    println!();
    print!("Remain people count: ");
    let people = stor.get_all_people();
    println!("{}", people.len());

    println!();
    print!("Remain employees count: ");
    let employees = stor.get_all_employees();
    println!("{}", employees.len());

    println!();
    print!("Delete people... ");
    stor.delete_people(people);
    println!("done");

    println!();
    print!("Remain people count: ");
    let people = stor.get_all_people();
    println!("{}", people.len());
}
