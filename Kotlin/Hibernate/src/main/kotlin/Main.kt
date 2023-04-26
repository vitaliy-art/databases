import EntityManagers.DepartmentEntityManager
import EntityManagers.EmployeeEntityManager
import EntityManagers.PersonEntityManager
import Enums.Position
import Models.Department
import Models.Employee
import Models.Person
import Services.EntityService

fun main() {
    val service = EntityService(
        DepartmentEntityManager(),
        PersonEntityManager(),
        EmployeeEntityManager()
    )

    print("\nClean up database... ")
    var departments = service.getAll(Department::class.java)
    service.deleteRange(departments)
    var people = service.getAll(Person::class.java)
    service.deleteRange(people)
    var employees = service.getAll(Employee::class.java)
    service.deleteRange(employees)
    println("done")

    print("\nAdd departments... ")
    val dep1 = service.addNewDepartment("Department One")
    val dep2 = service.addNewDepartment("Department Two")
    println("done")

    println("\nAdded departments:")
    departments = service.getAll(Department::class.java)
    departments.forEach { println(it) }

    print("\nAdd people... ")
    val per1 = service.addNewPerson("Ivan", "Moscow", 1990, 10, 2)
    val per2 = service.addNewPerson("John", "London", 1998, 1, 14)
    println("done")

    println("\nAdded people:")
    people = service.getAll(Person::class.java)
    people.forEach { println(it) }

    print("\nAdd employees... ")
    service.addNewEmployee(per1.id!!, dep1.id!!, Position.Staffer)
    service.addNewEmployee(per2.id!!, dep1.id!!, Position.Staffer)
    service.addNewEmployee(dep2, "Nick", "Berlin", 1995, 2, 23, Position.Manager)
    service.addNewEmployee(dep2, "Stan", "Oslo", 1988, 4, 21, Position.Boss)
    println("done")

    println("\nAdded employees:")
    employees = service.getAll(Employee::class.java)
    employees.forEach { println(it) }

    print("\nDelete Department One... ")
    service.delete(dep1)
    println("done")

    print("\nUpdate Department Two... ")
    dep2.name = "Department"
    service.update(dep2)
    println("done")

    print("\nUpdate Ivan... ")
    per1.address = "Tula"
    service.update(per1)
    println("done")

    println("\nRemain departments:")
    departments = service.getAll(Department::class.java)
    departments.forEach { println(it) }

    println("\nRemain people:")
    people = service.getAll(Person::class.java)
    people.forEach { println(it) }

    println("\nRemain employees:")
    employees = service.getAll(Employee::class.java)
    employees.forEach { println(it) }

    print("\nDelete Department Two... ")
    service.delete(dep2)
    println("done")

    print("\nRemain departments count: ")
    departments = service.getAll(Department::class.java)
    println(departments.size)

    print("\nRemain people count: ")
    people = service.getAll(Person::class.java)
    println(people.size)

    print("\nRemain employees count: ")
    employees = service.getAll(Employee::class.java)
    println(employees.size)

    print("\nDelete people... ")
    service.deleteRange(people)
    println("delete")

    print("\nRemain people count: ")
    people = service.getAll(Person::class.java)
    println(people.size)
}
