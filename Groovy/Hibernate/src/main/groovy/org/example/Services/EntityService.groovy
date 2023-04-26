package Services

import EntityManagers.EntityManager
import Enums.Position
import Models.Department
import Models.Employee
import Models.Person

class EntityService {
    private EntityManager<Department> departmentEntityManager
    private EntityManager<Person> personEntityManager
    private EntityManager<Employee> employeeEntityManager

    public EntityService(
        EntityManager<Department> departmentEntityManager,
        EntityManager<Person> personEntityManager,
        EntityManager<Employee> employeeEntityManager
    ) {
        this.departmentEntityManager = departmentEntityManager
        this.personEntityManager = personEntityManager
        this.employeeEntityManager = employeeEntityManager
    }

    Department addNewDepartment(String name) {
        def department = new Department(name)
        departmentEntityManager.addNew(department)
        return department
    }

    Person addNewPerson(String name, String address, int birthYear, int birthMon, int birthDay) {
        def calendar = new GregorianCalendar(birthYear, birthMon-1, birthDay)
        def birthDate = calendar.getTime()
        def person = new Person(name, address, birthDate)
        personEntityManager.addNew(person)
        return person
    }

    Employee addNewEmployee(String personId, long departmentId, Position position) {
        def person = personEntityManager.getById(personId)
        def department = departmentEntityManager.getById(departmentId)
        def employee = new Employee(person, department, position)
        employeeEntityManager.addNew(employee)
        return employee
    }

    Employee addNewEmployee(Department department, String name, String address, int birthYear, int birthMon, int birthDay, Position position) {
        def person = addNewPerson(name, address, birthYear, birthMon, birthDay)
        return addNewEmployee(person.id, department.id, position)
    }

    <T> T getById(Class<T> entityClass, id) {
        if (entityClass == Department.class) {
            return departmentEntityManager.getById(id)
        }
        else if (entityClass == Person.class) {
            return personEntityManager.getById(id)
        }
        else if (entityClass == Employee.class) {
            return employeeEntityManager.getById(id)
        }
        else throw new ClassCastException("${entityClass}")
    }

    <T> List<T> getAll(Class<T> entityClass) {
        if (entityClass == Department.class) {
          return departmentEntityManager.getAll()
        }
        else if (entityClass == Person.class) {
          return personEntityManager.getAll()
        }
        else if (entityClass == Employee.class) {
          return employeeEntityManager.getAll()
        }
        else throw new ClassCastException("${entityClass}")
    }

    <T> T update(T entity) {
        if (entity instanceof  Department) {
            departmentEntityManager.saveChanges(entity)
        }
        else if (entity instanceof Person) {
            personEntityManager.saveChanges(entity)
        }
        else if (entity instanceof Employee) {
            employeeEntityManager.saveChanges(entity)
        }
        else throw new ClassCastException("${entity.getClass()}")
    }

    <T> T delete(T entity) {
        if (entity instanceof Department) {
            departmentEntityManager.delete(entity)
        }
        else if (entity instanceof Person) {
            personEntityManager.delete(entity)
        }
        else if (entity instanceof Employee) {
            employeeEntityManager.delete(entity)
        }
        else throw new ClassCastException("${entity.getClass()}")
    }

    <T> void deleteRange(List<T> entities) {
        for (entity in entities) {
            delete(entity)
        }
    }
}
