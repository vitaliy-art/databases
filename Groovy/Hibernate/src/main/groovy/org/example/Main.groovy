import EntityManagers.DepartmentEntityManager
import EntityManagers.EmployeeEntityManager
import EntityManagers.PersonEntityManager
import Enums.Position
import Models.Department
import Models.Employee
import Models.Person
import Services.EntityService

static void main(String[] args) {
    def service = new EntityService(
        new DepartmentEntityManager(),
        new PersonEntityManager(),
        new EmployeeEntityManager()
    )

    print "\nClean up database... "
    def departments = service.getAll Department.class
    service.deleteRange departments
    def people = service.getAll Person.class
    service.deleteRange people
    def employees = service.getAll Employee.class
    service.deleteRange employees
    println "done"

    print "\nAdd departments... "
    def dep1 = service.addNewDepartment "Department One"
    def dep2 = service.addNewDepartment "Department Two"
    println "done"

    println "\nAdded departments:"
    departments = service.getAll Department.class
    departments.each { println it }

    print "\nAdd people... "
    def per1 = service.addNewPerson "Ivan", "Moscow", 1990, 10, 2
    def per2 = service.addNewPerson "John", "London", 1998, 1, 14
    println "done"

    println "\nAdded people:"
    people = service.getAll Person.class
    people.each { println it }

    print "\nAdd employees... "
    service.addNewEmployee per1.id, dep1.id, Position.Staffer
    service.addNewEmployee per2.id, dep1.id, Position.Staffer
    service.addNewEmployee dep2, "Nick", "Berlin", 1995, 2, 23, Position.Manager
    service.addNewEmployee dep2, "Stan", "Oslo", 1988, 4, 21, Position.Boss
    println "done"

    println "\nAdded employees:"
    employees = service.getAll Employee.class
    employees.each { println it }

    print "\nDelete Department One... "
    service.delete dep1
    println "done"

    print "\nUpdate Department Two... "
    dep2.name = "Department"
    service.update dep2
    println "done"

    print "\nUpdate Ivan... "
    per1.address = "Tula"
    service.update per1
    println "done"

    println "\nRemain departments:"
    departments = service.getAll Department.class
    departments.each { println it }

    println "\nRemain people:"
    people = service.getAll Person.class
    people.each { println it }

    println "\nRemain employees:"
    employees = service.getAll Employee.class
    employees.each { println it }

    print "\nDelete Department Two... "
    service.delete dep2
    println "done"

    print "\nRemain departments count: "
    departments = service.getAll Department.class
    println departments.size()

    print "\nRemain people count: "
    people = service.getAll Person.class
    println people.size()

    print "\nRemain employees count: "
    employees = service.getAll Employee.class
    println employees.size()

    print "\nDelete people... "
    service.deleteRange(people)
    println "done"

    print "\nRemain people count: "
    people = service.getAll Person.class
    println people.size()
}
