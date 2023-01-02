#include <fmt/format.h>
#include <fmt/chrono.h>
#include <models/department.hpp>
#include <models/person.hpp>
#include <models/employee.hpp>
#include <storage.hpp>
#include <ctime>

using namespace std;
using namespace sqlite_orm;


int main(int argc, char const *argv[])
{
    auto storage = Storage();

    fmt::print("Clean up database... ");
    auto departments = storage.get_all_departments();
    storage.delete_departments(departments);
    auto people = storage.get_all_people();
    storage.delete_people(people);
    auto employees = storage.get_all_employees();
    storage.delete_employees(employees);
    fmt::print("done\n");

    fmt::print("\nAdd departments... ");
    auto dep1 = storage.add_new_department("Department One");
    auto dep2 = storage.add_new_department("Department Two");
    fmt::print("done\n");

    fmt::print("\nAdded departments:\n");
    departments = storage.get_all_departments();
    for (auto dep : departments) {
        fmt::print("{}\n", dep);
    }

    fmt::print("\nAdd people... ");
    auto per1 = storage.add_new_person("Ivan", "Moscow", 1990, 10, 02);
    auto per2 = storage.add_new_person("John", "London", 1998, 01, 14);
    fmt::print("done\n");

    fmt::print("\nAdded people:\n");
    people = storage.get_all_people();
    for (auto per : people) {
        fmt::print("{}\n", per);
    }

    fmt::print("\nAdd employees... ");
    storage.add_new_employee(per1.id, dep1.id, Position::Staffer);
    storage.add_new_employee(per2.id, dep1.id, Position::Staffer);
    storage.add_new_employee(dep2, "Nick", "Berlin", 1995, 02, 23, Position::Manager);
    storage.add_new_employee(dep2, "Stan", "Oslo", 1988, 04, 21, Position::Boss);
    fmt::print("done\n");

    fmt::print("\nAdded employees:\n");
    employees = storage.get_all_employees();
    for (auto emp : employees) {
        fmt::print("{}\n", emp);
    }

    fmt::print("\nDelete Department One... ");
    storage.delete_department(dep1.id);
    fmt::print("done\n");

    fmt::print("\nUpdate Department Two... ");
    dep2.name = "Department";
    dep2 = storage.update_department(dep2);
    fmt::print("done\n");

    fmt::print("\nUpdate Ivan... ");
    per1.address = "Tula";
    per1 = storage.update_person(per1);
    fmt::print("done\n");

    fmt::print("\nRemain departments:\n");
    departments = storage.get_all_departments();
    for (auto dep : departments) {
        fmt::print("{}\n", dep);
    }

    fmt::print("\nRemain people:\n");
    people = storage.get_all_people();
    for (auto per : people) {
        fmt::print("{}\n", per);
    }

    fmt::print("\nRemain employees:\n");
    employees = storage.get_all_employees();
    for (auto emp : employees) {
        fmt::print("{}\n", emp);
    }

    fmt::print("\nDelete Department Two... ");
    storage.delete_department(dep2.id);
    fmt::print("done\n");

    fmt::print("\nRemain departments count: ");
    departments = storage.get_all_departments();
    fmt::print("{:d}\n", departments.size());

    fmt::print("\nRemain people: ");
    people = storage.get_all_people();
    fmt::print("{:d}\n", people.size());

    fmt::print("\nRemain employees: ");
    employees = storage.get_all_employees();
    fmt::print("{:d}\n", employees.size());

    fmt::print("\nDelete persons... ");
    storage.delete_people(people);
    fmt::print("done\n");

    fmt::print("\nRemain people count: ");
    people = storage.get_all_people();
    fmt::print("{:d}\n", people.size());
}
