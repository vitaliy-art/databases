import EntityManagers.DepartmentEntityManager
import EntityManagers.EmployeeEntityManager
import EntityManagers.PersonEntityManager
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
    def departments = service.getAll(Department.class)
    service.deleteRange(departments)
    def people = service.getAll(Person.class)
    service.deleteRange(people)
    def employees = service.getAll(Employee.class)
    service.deleteRange(employees)
}
