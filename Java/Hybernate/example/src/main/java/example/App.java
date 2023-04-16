package example;

import java.util.List;

import example.EntityManager.DepartmentEntityManager;
import example.EntityManager.EmployeeEntityManager;
import example.EntityManager.PersonEntityManager;
import example.Enums.Position;
import example.Models.Department;
import example.Models.Employee;
import example.Models.Person;
import example.Service.EntityService;

public class App
{
    public static void main( String[] args )
    {
        EntityService service = new EntityService(
            new DepartmentEntityManager(),
            new PersonEntityManager(),
            new EmployeeEntityManager()
        );

        System.out.print("\nClean up database... ");
        List<Department> departments = service.getAll(Department.class);
        service.deleteRange(departments);
        List<Person> people = service.getAll(Person.class);
        service.deleteRange(people);
        List<Employee> employees = service.getAll(Employee.class);
        service.deleteRange(employees);
        System.out.println("done");

        System.out.print("\nAdd departments... ");
        Department dep1 = service.addNewDepartment("Department One");
        Department dep2 = service.addNewDepartment("Department Two");
        System.out.println("done");

        System.out.println("\nAdded departments:");
        departments = service.getAll(Department.class);
        for (Department department : departments) {
            System.out.println(department);
        }

        System.out.print("\nAdd people... ");
        Person per1 = service.addNewPerson("Ivan", "Moscow", 1990, 10, 02);
        Person per2 = service.addNewPerson("John", "London", 1998, 01, 14);
        System.out.println("done");

        System.out.println("\nAdded people:");
        people = service.getAll(Person.class);
        for (Person person : people) {
            System.out.println(person);
        }

        System.out.print("\nAdd employees... ");
        service.addNewEmployee(per1.getId(), dep1.getId(), Position.Staffer);
        service.addNewEmployee(per2.getId(), dep1.getId(), Position.Staffer);
        service.addNewEmployee(dep2, "Nick", "Berlin", 1995, 02, 23, Position.Manager);
        service.addNewEmployee(dep2, "Stan", "Oslo", 1988, 04, 21, Position.Boss);
        System.out.println("done");

        System.out.println("\nAdded employees:");
        employees = service.getAll(Employee.class);
        for (Employee employee : employees) {
            System.out.println(employee);
        }

        System.out.print("\nDelete Department One... ");
        service.delete(dep1);
        System.out.println("done");

        System.out.print("\nUpdate Department Two... ");
        dep2.setName("Department");
        service.update(dep2);
        System.out.println("done");

        System.out.print("\nUpdate Ivan... ");
        per1.setAddress("Tula");
        service.update(per1);
        System.out.println("done");

        System.out.println("\nRemain departments:");
        departments = service.getAll(Department.class);
        for (Department department : departments) {
            System.out.println(department);
        }

        System.out.println("\nRemain people:");
        people = service.getAll(Person.class);
        for (Person person : people) {
            System.out.println(person);
        }

        System.out.println("\nRemain employees:");
        employees = service.getAll(Employee.class);
        for (Employee employee : employees) {
            System.out.println(employee);
        }

        System.out.print("\nDelete Department Two... ");
        service.delete(dep2);
        System.out.println("done");

        System.out.print("\nRemain departments count: ");
        departments = service.getAll(Department.class);
        System.out.println(departments.size());

        System.out.print("\nRemain people count: ");
        people = service.getAll(Person.class);
        System.out.println(people.size());

        System.out.print("\nRemain employees count: ");
        employees = service.getAll(Employee.class);
        System.out.println(employees.size());

        System.out.print("\nDelete persons... ");
        service.deleteRange(people);
        System.out.println("done");

        System.out.print("\nRemain people count: ");
        people = service.getAll(Person.class);
        System.out.println(people.size());
    }
}
