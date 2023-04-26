package Services

import EntityManagers.EntityManager
import Enums.Position
import Models.Department
import Models.Employee
import Models.Person
import java.util.Calendar
import java.util.GregorianCalendar
import kotlin.ClassCastException

class EntityService(
    private val departmentEntityManager: EntityManager<Department>,
    private val personEntityManager: EntityManager<Person>,
    private val employeeEntityManager: EntityManager<Employee>
) {
    fun addNewDepartment(name: String): Department {
        val department = Department(name)
        departmentEntityManager.addNew(department)
        return department
    }

    fun addNewPerson(name: String, address: String, birthYear: Int, birthMonth: Int, birthDay: Int): Person {
        val calendar = GregorianCalendar(birthYear, birthMonth-1, birthDay)
        val date = "${calendar.get(Calendar.YEAR)}-${calendar.get(Calendar.MONTH)+1}-${calendar.get(Calendar.DAY_OF_MONTH)}"
        val person = Person(name, address, date)
        personEntityManager.addNew(person)
        return person
    }

    fun addNewEmployee(personId: String, departmentId: Long, position: Position): Employee {
        val person = personEntityManager.getById(personId)
        val department = departmentEntityManager.getById(departmentId)
        val employee = Employee(person, department, position)
        employeeEntityManager.addNew(employee)
        return employee
    }

    fun addNewEmployee(department: Department, name: String, address: String, birthYear: Int, birthMonth: Int, birthDay: Int, position: Position): Employee {
        val person = addNewPerson(name, address, birthYear, birthMonth, birthDay)
        val employee = addNewEmployee(
            person.id ?: throw NullPointerException("person.id"),
            department.id ?: throw NullPointerException("department.id"),
            position
        )

        return employee
    }

    fun <T> getById(entityClass: Class<T>, id: Any): T = when (entityClass) {
        Department::class.java -> departmentEntityManager.getById(id) as T
        Person::class.java -> personEntityManager.getById(id) as T
        Employee::class.java -> employeeEntityManager.getById(id) as T
        else -> throw ClassCastException(entityClass.toString())
    }

    fun <T> getAll(entityClass: Class<T>): List<T> = when (entityClass) {
        Department::class.java -> departmentEntityManager.getAll() as List<T>
        Person::class.java -> personEntityManager.getAll() as List<T>
        Employee::class.java -> employeeEntityManager.getAll() as List<T>
        else -> throw ClassCastException(entityClass.toString())
    }

    fun <T> update(entity: T) = when (entity) {
        is Department -> departmentEntityManager.saveChanges(entity)
        is Person -> personEntityManager.saveChanges(entity)
        is Employee -> employeeEntityManager.saveChanges(entity)
        else -> throw ClassCastException(entity!!::class.java.toString())
    }

    fun <T> delete(entity: T) = when (entity) {
        is Department -> departmentEntityManager.delete(entity)
        is Person -> personEntityManager.delete(entity)
        is Employee -> employeeEntityManager.delete(entity)
        else -> throw ClassCastException(entity!!::class.java.toString())
    }

    fun <T> deleteRange(entities: List<T>) = entities.forEach { delete(it) }
}
