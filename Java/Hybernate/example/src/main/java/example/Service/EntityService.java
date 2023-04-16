package example.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import example.EntityManager.EntityManager;
import example.Enums.Position;
import example.Models.Department;
import example.Models.Employee;
import example.Models.Person;

public class EntityService {

    private EntityManager<Department> departmentEManager;
    private EntityManager<Person> personEManager;
    private EntityManager<Employee> employeeEManager;

    public EntityService(
        EntityManager<Department> departmentEManager,
        EntityManager<Person> personEManager,
        EntityManager<Employee> employeeEManager
    ) {
        this.departmentEManager = departmentEManager;
        this.personEManager = personEManager;
        this.employeeEManager = employeeEManager;
    }

    public Department addNewDepartment(String name) {
        Department department = new Department(name);
        departmentEManager.addNew(department);
        return department;
    }

    public Person addNewPerson(String name, String address, int birthYear, int birthMon, int birthDay) {
        Calendar calendar = new GregorianCalendar(birthYear, birthMon-1, birthDay, 0, 0);
        Date date = calendar.getTime();
        Person person = new Person(name, address, date);
        personEManager.addNew(person);
        return person;
    }

    public Employee addNewEmployee(String personId, Long departmentId, Position position) {
        Person person = personEManager.getById(personId);
        Department department = departmentEManager.getById(departmentId);
        Employee employee = new Employee(person, department, position);
        employeeEManager.addNew(employee);
        return employee;
    }

    public Employee addNewEmployee(Department department, String name, String address, int birthYear, int birthMon, int birthDay, Position position) {
        Person person = addNewPerson(name, address, birthYear, birthMon, birthDay);
        Employee employee = addNewEmployee(person.getId(), department.getId(), position);
        return employee;
    }

    @SuppressWarnings("unchecked")
    public <T> T getById(Class<T> entityClass, Object id) throws ClassCastException {
        if (entityClass == Department.class) {
            return (T) departmentEManager.getById(id);
        }
        else if (entityClass == Person.class) {
            return (T) personEManager.getById(id);
        }
        else if (entityClass == Employee.class) {
            return (T) employeeEManager.getById(id);
        }

        throw new ClassCastException(entityClass.toString());
    }

    @SuppressWarnings("unchecked")
    public <T> List<T> getAll(Class<T> entityClass) throws ClassCastException {
        if (entityClass == Department.class) {
            return (List<T>) departmentEManager.getAll();
        }
        else if (entityClass == Person.class) {
            return (List<T>) personEManager.getAll();
        }
        else if (entityClass == Employee.class) {
            return (List<T>) employeeEManager.getAll();
        }

        throw new ClassCastException(entityClass.toString());
    }

    public <T> void update(T entity) throws ClassCastException {
        if (entity instanceof Department) {
            departmentEManager.saveChanges((Department) entity);
        }
        else if (entity instanceof Person) {
            personEManager.saveChanges((Person) entity);
        }
        else if (entity instanceof Employee) {
            employeeEManager.saveChanges((Employee) entity);
        }
        else
            throw new ClassCastException(entity.getClass().toString());
    }

    public <T> void delete(T entity) throws ClassCastException {
        if (entity instanceof Department) {
            departmentEManager.delete((Department) entity);
        }
        else if (entity instanceof Person) {
            personEManager.delete((Person) entity);
        }
        else if (entity instanceof Employee) {
            employeeEManager.delete((Employee) entity);
        }
        else
            throw new ClassCastException(entity.getClass().toString());
    }

    public <T> void deleteRange(List<T> entities) throws ClassCastException {
        for (Object entity : entities) {
            delete(entity);
        }
    }
}
