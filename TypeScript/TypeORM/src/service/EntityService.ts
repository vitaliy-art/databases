import { DataSource } from "typeorm";
import { Department } from "../entity/Department";
import { Employee } from "../entity/Employee";
import { Person } from "../entity/Person";
import { Position } from "../entity/Position";

export class EntityService {

    constructor(private dataSource: DataSource) {
        if (!this.dataSource.isInitialized) {}
    }

    isInitialized = () => this.dataSource.isInitialized;

    initialize = () => this.dataSource.initialize();

    async getDepartment(id: number): Promise<Department | null> {
        const rep = this.dataSource.getRepository(Department);
        const dep = await rep.findOneBy({id: id});
        return dep;
    }

    async getPerson(id: string): Promise<Person | null> {
        const rep = this.dataSource.getRepository(Person);
        const per = await rep.findOneBy({id: id});
        return per;
    }

    async getEmployee(id: string): Promise<Employee | null> {
        const rep = this.dataSource.getRepository(Employee);
        const emp = await rep.findOne({
            where: {id: id},
            relations: {
                person: true,
                department: true,
            },
            relationLoadStrategy: "join",
        });
        return emp;
    }

    save<T>(entity: T): Promise<T> {
        return this.dataSource.manager.save(entity);
    }

    addNewDepartment(name: string): Promise<Department> {
        let dep = new Department({name: name});
        return this.save(dep);
    }

    addNewPerson(name: string, address: string, birthDate: Date): Promise<Person> {
        let per = new Person({name: name, address: address, birthDate: birthDate});
        return this.save(per);
    }

    addNewEmployee(person: Person, department: Department, position: Position): Promise<Employee> {
        let emp = new Employee({department: department, person: person, position: position});
        return this.save(emp);
    }

    async addNewEmployeeAndPerson(department: Department, name: string, address: string, birthDate: Date, position: Position): Promise<Employee> {
        let person = await this.addNewPerson(name, address, birthDate);
        return this.addNewEmployee(person, department, position);
    }

    getAllDepartments(): Promise<Department[]> {
        return this.dataSource.manager.find(Department);
    }

    getAllPersons(): Promise<Person[]> {
        return this.dataSource.manager.find(Person);
    }

    getAllEmployees(): Promise<Employee[]> {
        return this.dataSource.manager.find(
            Employee,
            {
                relations: {
                    person: true,
                    department: true,
                },
                relationLoadStrategy: "join",
            }
        )
    }

    remove<T>(entity: T): Promise<T> {
        return this.dataSource.manager.remove(entity)
    }
}

