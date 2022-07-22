import { AppDataSource } from "./data-source"
import { Position } from "./entity/Position";
import { EntityService } from "./service/EntityService";

let entityService = new EntityService(AppDataSource);
entityService.initialize().then(
    async () => {
        let log = console.log;

        log("Clean up database... ");
        let departments = await entityService.getAllDepartments();
        let persons = await entityService.getAllPersons();
        let employees = await entityService.getAllEmployees();
        await entityService.remove(departments);
        await entityService.remove(persons);
        await entityService.remove(employees);
        log("done");
        log("\n");

        log("Add departments... ");
        let dep1 = await entityService.addNewDepartment("Department One");
        let dep2 = await entityService.addNewDepartment("Department Two");
        log("done");
        log("\n");

        log("Added departments:");
        departments = await entityService.getAllDepartments();
        departments.forEach(dep => {
            log(`${dep.string()}`);
        });
        log("\n");

        log("Add persons... ");
        let per1 = await entityService.addNewPerson("Ivan", "Moscow", new Date(1990, 10, 2));
        let per2 = await entityService.addNewPerson("John", "London", new Date(1998, 1, 14))
        log("done");
        log("\n");

        log("Added persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });
        log("\n");

        log("Add employees... ");
        await entityService.addNewEmployee(per1, dep1, Position.Staffer);
        await entityService.addNewEmployee(per2, dep1, Position.Staffer);
        await entityService.addNewEmployeeAndPerson(dep2, "Nick", "Berlin", new Date(1995, 2, 23), Position.Manager);
        await entityService.addNewEmployeeAndPerson(dep2, "Stan", "Oslo", new Date(1998, 4, 21), Position.Boss);
        log("done");
        log("\n");

        log("Added employees:");
        employees = await entityService.getAllEmployees();
        employees.forEach(emp => {
            log(`${emp.string()}`);
        });
        log("\n");

        log("Delete Department One... ");
        await entityService.remove(dep1);
        log("done");
        log("\n");

        log("Update Department Two... ");
        dep2.name = "Department";
        await entityService.save(dep2);
        log("done");
        log("\n");

        log("Update Ivan... ");
        per1.address = "Tula";
        await entityService.save(per1);
        log("done");
        log("\n");

        log("Remain departments:");
        departments = await entityService.getAllDepartments();
        departments.forEach(dep => {
            log(`${dep.string()}`);
        });
        log("\n");

        log("Remain persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });
        log("\n");

        log("Remain employees:");
        employees = await entityService.getAllEmployees();
        employees.forEach(emp => {
            log(`${emp.string()}`);
        });
        log("\n");

        log("Delete Department Two... ");
        await entityService.remove(dep2);
        log("done");
        log("\n");

        log("Remain departments count: ")
        departments = await entityService.getAllDepartments();
        log(`${departments.length}`);
        log("\n");

        log("Remain persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });
        log("\n");

        log("Remain employees count: ");
        employees = await entityService.getAllEmployees();
        log(`${employees.length}`);
        log("\n");

        log("Delete persons... ");
        await entityService.remove(persons);
        log("done");
        log("\n");

        log("\Remain persons count: ");
        persons = await entityService.getAllPersons();
        log(`${persons.length}`);
        log("\n");
    }
)
