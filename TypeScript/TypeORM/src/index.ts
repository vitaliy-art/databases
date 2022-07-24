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

        log("\nAdd departments... ");
        let dep1 = await entityService.addNewDepartment("Department One");
        let dep2 = await entityService.addNewDepartment("Department Two");
        log("done");

        log("\nAdded departments:");
        departments = await entityService.getAllDepartments();
        departments.forEach(dep => {
            log(`${dep.string()}`);
        });

        log("\nAdd persons... ");
        let per1 = await entityService.addNewPerson("Ivan", "Moscow", new Date(1990, 10, 2));
        let per2 = await entityService.addNewPerson("John", "London", new Date(1998, 1, 14))
        log("done");

        log("\nAdded persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });

        log("\nAdd employees... ");
        await entityService.addNewEmployee(per1, dep1, Position.Staffer);
        await entityService.addNewEmployee(per2, dep1, Position.Staffer);
        await entityService.addNewEmployeeAndPerson(dep2, "Nick", "Berlin", new Date(1995, 2, 23), Position.Manager);
        await entityService.addNewEmployeeAndPerson(dep2, "Stan", "Oslo", new Date(1998, 4, 21), Position.Boss);
        log("done");

        log("\nAdded employees:");
        employees = await entityService.getAllEmployees();
        employees.forEach(emp => {
            log(`${emp.string()}`);
        });

        log("\nDelete Department One... ");
        await entityService.remove(dep1);
        log("done");

        log("\nUpdate Department Two... ");
        dep2.name = "Department";
        await entityService.save(dep2);
        log("done");

        log("\nUpdate Ivan... ");
        per1.address = "Tula";
        await entityService.save(per1);
        log("done");

        log("\nRemain departments:");
        departments = await entityService.getAllDepartments();
        departments.forEach(dep => {
            log(`${dep.string()}`);
        });

        log("\nRemain persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });

        log("\nRemain employees:");
        employees = await entityService.getAllEmployees();
        employees.forEach(emp => {
            log(`${emp.string()}`);
        });

        log("\nDelete Department Two... ");
        await entityService.remove(dep2);
        log("done");

        log("\nRemain departments count: ")
        departments = await entityService.getAllDepartments();
        log(`${departments.length}`);

        log("\nRemain persons:");
        persons = await entityService.getAllPersons();
        persons.forEach(per => {
            log(`${per.string()}`);
        });

        log("\nRemain employees count: ");
        employees = await entityService.getAllEmployees();
        log(`${employees.length}`);

        log("\nDelete persons... ");
        await entityService.remove(persons);
        log("done");

        log("\nRemain persons count: ");
        persons = await entityService.getAllPersons();
        log(`${persons.length}`);

    }
)
