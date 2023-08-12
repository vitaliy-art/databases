import SQLite
import Foundation

enum RepositoryError: Error {
    case notFoundError(String)
    case castException
}

class Repository {
    let conn: Connection

    private let departments = Table("departments")
    private let departmentsId = Expression<Int>("id")
    private let departmentsName = Expression<String>("name")

    private let people = Table("people")
    private let peopleId = Expression<String>("id")
    private let peopleName = Expression<String>("name")
    private let peopleAddress = Expression<String>("address")
    private let peopleBirthDate = Expression<Date>("birth_date")

    private let employees = Table("employees")
    private let employeesId = Expression<String>("id")
    private let employeesDepartmentId = Expression<Int>("department_id")
    private let employeesPersonId = Expression<String>("person_id")
    private let employeesPosition = Expression<String>("position")

    init(connection: Connection) throws {
        conn = connection
        try initDb()
    }

    private func initDb() throws {
        _ = try conn.prepare("PRAGMA foreign_keys = ON;").scalar()

        try conn.run(departments.create(ifNotExists: true) {t in
            t.column(departmentsId, primaryKey: true)
            t.column(departmentsName)
        })

        try conn.run(people.create(ifNotExists: true) {t in
            t.column(peopleId, primaryKey: true)
            t.column(peopleName)
            t.column(peopleAddress)
            t.column(peopleBirthDate)
        })

        try conn.run(employees.create(ifNotExists: true) {t in
            t.column(employeesId, primaryKey: true)
            t.column(employeesDepartmentId)
            t.column(employeesPersonId)
            t.column(employeesPosition)
            t.foreignKey(employeesDepartmentId, references: departments, departmentsId, delete: .cascade)
            t.foreignKey(employeesPersonId, references: people, peopleId, delete: .cascade)
        })
    }

    func addDepartment(name: String) throws -> Department {
        let rowId = try conn.run(departments.insert(departmentsName <- name))
        return Department(id: Int(rowId), name: name)
    }

    func addPerson(name: String, address: String, birthDate: Date) throws -> Person {
        let id = NSUUID().uuidString
        try conn.run(people.insert(
            peopleId <- id,
            peopleName <- name,
            peopleAddress <- address,
            peopleBirthDate <- birthDate
        ))

        return Person(id: id, name: name, address: address, birthDate: birthDate)
    }

    func addEmployee(per: Person, dep: Department, position: Position) throws -> Employee {
        let id = NSUUID().uuidString
        try conn.run(employees.insert(
            employeesId <- id,
            employeesDepartmentId <- dep.id,
            employeesPersonId <- per.id,
            employeesPosition <- position.rawValue
        ))

        return Employee(id: id, department: dep, person: per, position: position)
    }

    func addEmployeeAndPerson(dep: Department, name: String, address: String, birthDate: Date, position: Position) throws -> Employee {
        let per = try addPerson(name: name, address: address, birthDate: birthDate)
        return try addEmployee(per: per, dep: dep, position: position)
    }

    func getDepartmentById(id: Int) throws -> Department? {
        if let row = try conn.pluck(departments.where(departmentsId == id)) {
            return Department(id: row[departmentsId], name: row[departmentsName])
        }

        return nil
    }

    func getPersonById(id: String) throws -> Person? {
        if let row = try conn.pluck(people.where(peopleId == id)) {
            return Person(id: row[peopleId], name: row[peopleName], address: row[peopleAddress], birthDate: row[peopleBirthDate])
        }

        return nil
    }

    func getEmployeeById(id: String) throws -> Employee? {
        if let row = try conn.pluck(employees.where(employeesId == id)) {
            if let per = try getPersonById(id: row[employeesPersonId]),
                let dep = try getDepartmentById(id: row[employeesDepartmentId]) {
                return Employee(id: row[employeesId], department: dep, person: per, position: Position(rawValue: row[employeesPosition]))
            }
        }

        return nil
    }

    func getAllDepartments() throws -> [Department] {
        var allDepartments: [Department] = []
        for row in try conn.prepare(departments) {
            allDepartments.append(Department(id: row[departmentsId], name: row[departmentsName]))
        }

        return allDepartments
    }

    func getAllPeople() throws -> [Person] {
        var allPeople: [Person] = []
        for row in try conn.prepare(people) {
            allPeople.append(Person(
                id: row[peopleId],
                name: row[peopleName],
                address: row[peopleAddress],
                birthDate: row[peopleBirthDate]
            ))
        }

        return allPeople
    }

    func getAllEmployees() throws -> [Employee] {
        var allEmployees: [Employee] = []
        for row in try conn.prepare(employees) {
            if let per = try getPersonById(id: row[employeesPersonId]),
                let dep = try getDepartmentById(id: row[employeesDepartmentId]) {
                allEmployees.append(Employee(id: row[employeesId], department: dep, person: per, position: Position(rawValue: row[employeesPosition])))
            } else {
                throw RepositoryError.notFoundError("one of employees foreign keys error")
            }
        }

        return allEmployees
    }

    func updateDepartment(dep: Department) throws {
        try conn.run(departments.where(departmentsId == dep.id).update(departmentsName <- dep.name))
    }

    func updatePerson(per: Person) throws {
        try conn.run(people.where(peopleId == per.id).update(
            peopleName <- per.name,
            peopleAddress <- per.address,
            peopleBirthDate <- per.birthDate
        ))
    }

    func updateEmployee(emp: Employee) throws {
        try conn.run(employees.where(employeesId == emp.id).update(
            employeesDepartmentId <- emp.department!.id,
            employeesPersonId <- emp.person!.id,
            employeesPosition <- emp.position!.rawValue
        ))
    }

    func delete<T>(entities: [T]) throws {
        if entities.count == 0 {
            return
        }

        if let collection = entities as? [Department] {
            try conn.run(departments.where(collection.map{d in d.id}.contains(departmentsId)).delete())
        } else if let collection = entities as? [Person] {
            try conn.run(people.where(collection.map{p in p.id}.contains(peopleId)).delete())
        } else if let collection = entities as? [Employee] {
            try conn.run(employees.where(collection.map{e in e.id}.contains(employeesId)).delete())
        } else {
            throw RepositoryError.castException
        }
    }
}
