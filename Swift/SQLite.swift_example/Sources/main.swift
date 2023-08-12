// The Swift Programming Language
// https://docs.swift.org/swift-book

import SQLite
import Foundation

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"

do {
    let db = try Connection("db.bd")
    let repo = try Repository(connection: db)

    print("Clean up database... ", terminator: "")
    var departments = try repo.getAllDepartments()
    var people = try repo.getAllPeople()
    var employees = try repo.getAllEmployees()
    try repo.delete(entities: departments)
    try repo.delete(entities: people)
    try repo.delete(entities: employees)
    print("done")

    print("\nAdd departments... ", terminator: "")
    let dep1 = try repo.addDepartment(name: "Department One")
    var dep2 = try repo.addDepartment(name: "Department Two")
    print("done")

    print("\nAdded departments:")
    departments = try repo.getAllDepartments()
    for dep in departments {
        print(dep.description)
    }

    print("\nAdd people... ", terminator: "")
    var per1 = try repo.addPerson(name: "Ivan", address: "Moscow", birthDate: formatter.date(from: "1990-10-02")!)
    let per2 = try repo.addPerson(name: "John", address: "London", birthDate: formatter.date(from: "1998-01-14")!)
    print("done")

    print("\nAdded people:")
    people = try repo.getAllPeople()
    for per in people {
        print(per.description)
    }

    print("\nAdd employees... ", terminator: "")
    _ = try repo.addEmployee(per: per1, dep: dep1, position: Position.staffer)
    _ = try repo.addEmployee(per: per2, dep: dep1, position: Position.staffer)
    _ = try repo.addEmployeeAndPerson(dep: dep2, name: "Nick", address: "Berlin", birthDate: formatter.date(from: "1995-02-23")!, position: Position.manager)
    _ = try repo.addEmployeeAndPerson(dep: dep2, name: "Stan", address: "Oslo", birthDate: formatter.date(from: "1988-04-21")!, position: Position.boss)
    print("done")

    print("\nAdded employees:")
    employees = try repo.getAllEmployees()
    for emp in employees {
        print(emp.description)
    }

    print("\nDelete Department One... ", terminator: "")
    try repo.delete(entities: [dep1])
    print("done")

    print("\nUpdate Department Two... ", terminator: "")
    dep2.name = "Department"
    try repo.updateDepartment(dep: dep2)
    print("done")

    print("\nUpdate Ivan... ", terminator: "")
    per1.address = "Tula"
    try repo.updatePerson(per: per1)
    print("done")

    print("\nRemain departments:")
    departments = try repo.getAllDepartments()
    for dep in departments {
        print(dep.description)
    }

    print("\nRemain people:")
    people = try repo.getAllPeople()
    for per in people {
        print(per.description)
    }

    print("\nRemain employees:")
    employees = try repo.getAllEmployees()
    for emp in employees {
        print(emp.description)
    }

    print("\nDelete Department Two... ", terminator: "")
    try repo.delete(entities: [dep2])
    print("done")

    print("\nRemain departments count: ", terminator: "")
    departments = try repo.getAllDepartments()
    print(departments.count)

    print("\nRemain people count: ", terminator: "")
    people = try repo.getAllPeople()
    print(people.count)

    print("\nRemain employees count: ", terminator: "")
    employees = try repo.getAllEmployees()
    print(employees.count)

    print("\nDelete people... ", terminator: "")
    try repo.delete(entities: people)
    print("done")

    print("\nRemain people count: ", terminator: "")
    people = try repo.getAllPeople()
    print(people.count)
}
