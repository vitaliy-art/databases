#pragma once
#include <models/department.hpp>
#include <models/person.hpp>
#include <models/employee.hpp>
#include <sqlite_orm/sqlite_orm.h>

using namespace sqlite_orm;
using std::vector;


auto make_storage(string file_name = "bd.db") {
    auto storage = make_storage(file_name,
        make_table("departments",
            make_column("id", &Department::id, primary_key().autoincrement()),
            make_column("name", &Department::name, unique())
        ),

        make_table("people",
            make_column("id", &Person::id, primary_key()),
            make_column("name", &Person::name),
            make_column("address", &Person::address),
            make_column("birth_date", &Person::birthDate)
        ),

        make_table("employees",
            make_column("id", &Employee::id, primary_key()),
            make_column("person_id", &Employee::personId),
            make_column("department_id", &Employee::departmentId),
            make_column("position", &Employee::position)
        )
    );

    return storage;
};

class Storage{
private:
    decltype(make_storage()) storage;

public:
    Storage() : storage(make_storage()) {
        this->storage.sync_schema(true);
    }

    auto add_new_department(string name) {
        auto dep = Department(name);
        auto id = this->storage.insert(dep);
        return this->get_department(id);
    }

    auto add_new_person(string name, string address, int birth_year, int birth_mon, int birth_day) {
        auto per = Person(name, address, birth_year, birth_mon, birth_day);
        this->storage.replace(per);
        auto id = per.id;
        return this->get_person(id);
    }

    auto add_new_employee(string person_id, int department_id, Position position) {
        auto per = this->storage.get_pointer<Person>(person_id);
        if (!per) {
            throw fmt::format("person with id {} not found", person_id);
        }

        auto dep = this->storage.get_pointer<Department>(department_id);
        if (!dep) {
            throw fmt::format("department with id {} not found", department_id);
        }

        auto emp = Employee(person_id, department_id, position);
        this->storage.replace(emp);
        auto id = emp.id;
        return this->get_employee(id);
    }

    auto add_new_employee(Department dep, string name, string address, int birth_year, int birth_mon, int birth_day, Position position) {
        auto _dep = this->storage.get_pointer<Department>(dep.id);
        if (!_dep) {
            throw fmt::format("department with id {} not found", dep.id);
        }

        auto per = this->add_new_person(name, address, birth_year, birth_mon, birth_day);
        auto emp = Employee(per.id, dep.id, position);
        this->storage.replace(emp);
        auto id = emp.id;
        return this->get_employee(id);
    }

    Department get_department(int id) {
        return this->storage.get<Department>(id);
    }

    Person get_person(string id) {
        return this->storage.get<Person>(id);
    }

    Employee get_employee(string id) {
        auto emp = this->storage.get<Employee>(id);
        auto dep = this->get_department(emp.departmentId);
        auto per = this->get_person(emp.personId);
        emp.department = dep;
        emp.person = per;
        return emp;
    }

    auto get_all_departments() {
        return this->storage.get_all<Department>();
    }

    auto get_all_people() {
        return this->storage.get_all<Person>();
    }

    auto get_all_employees() {
        auto employees = this->storage.get_all<Employee>();
        for (int i = 0; i < employees.size(); i++) {
            auto emp = &employees[i];
            auto dep = this->get_department(emp->departmentId);
            auto per = this->get_person(emp->personId);
            emp->department = dep;
            emp->person = per;
        }

        return employees;
    }

    auto update_department(Department dep) {
        this->storage.update(dep);
        auto id = dep.id;
        return this->get_department(id);
    }

    auto update_person(Person per) {
        this->storage.update(per);
        auto id = per.id;
        return this->get_person(id);
    }

    auto update_employee(Employee emp) {
        this->storage.update(emp);
        auto id = emp.id;
        return this->get_employee(id);
    }

    void delete_department(int id) {
        this->storage.remove<Department>(id);
        auto employees = this->storage.get_all<Employee>(where(c(&Employee::departmentId) == id));
        for (auto &emp : employees) {
            this->delete_employee(emp.id);
        }
    }

    void delete_person(string id) {
        this->storage.remove<Person>(id);
        auto employees = this->storage.get_all<Employee>(where(c(&Employee::personId) == id));
        for (auto &emp : employees) {
            this->delete_employee(emp.id);
        }
    }

    void delete_employee(string id) {
        this->storage.remove<Employee>(id);
    }

    void delete_departments(vector<Department> departments) {
        for (auto dep : departments) {
            this->delete_department(dep.id);
        }
    }

    void delete_people(vector<Person> people) {
        for (auto per : people) {
            this->delete_person(per.id);
        }
    }

    void delete_employees(vector<Employee> employees) {
        for (auto emp : employees) {
            this->delete_employee(emp.id);
        }
    }
};
