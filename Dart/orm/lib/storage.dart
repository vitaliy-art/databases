import 'package:example/position.dart';

import 'src/generated/prisma/prisma_client.dart';

class Storage {
  PrismaClient? client;

  Storage(String dbName) {
    client = PrismaClient(datasources: Datasources(db: dbName));
  }

  Future<Department?> getDepartmentById(int id) async =>
      await client!.department
          .findUnique(where: DepartmentWhereUniqueInput(id: id));

  Future<Person?> getPersonById(String id) async =>
      await client!.person.findUnique(where: PersonWhereUniqueInput(id: id));

  Future<Employee?> getEmployeeById(String id) async => await client!.employee
      .findUnique(where: EmployeeWhereUniqueInput(id: id));

  Future<List<Department>> getAllDepartments() async {
    final departments = await client!.department.findMany();
    return departments.toList(growable: true);
  }

  Future<List<Person>> getAllPeople() async {
    final people = await client!.person.findMany();
    return people.toList(growable: true);
  }

  Future<List<Employee>> getAllEmployees() async {
    final employees = await client!.employee.findMany();
    return employees.toList(growable: true);
  }

  Future<Department> addDepartment(String name) async {
    return await client!.department
        .create(data: DepartmentCreateInput(name: name));
  }

  Future<Person> addPerson(
      String name, String address, DateTime birthDate) async {
    return await client!.person.create(
        data: PersonCreateInput(
            name: name, address: address, birthDate: birthDate));
  }

  Future<Employee> addEmployee(
      Person person, Department department, Position position) async {
    return await client!.employee.create(
        data: EmployeeCreateInput(
            position: position.index,
            department: DepartmentCreateNestedOneWithoutEmployeesInput(
                connect: DepartmentWhereUniqueInput(id: department.id)),
            person: PersonCreateNestedOneWithoutEmployeesInput(
                connect: PersonWhereUniqueInput(id: person.id))));
  }

  Future<Employee> addEmployeeAndPerson(Department department, String name,
      String address, DateTime birthDate, Position position) async {
    return await client!.employee.create(
        data: EmployeeCreateInput(
            position: position.index,
            department: DepartmentCreateNestedOneWithoutEmployeesInput(
                connect: DepartmentWhereUniqueInput(id: department.id)),
            person: PersonCreateNestedOneWithoutEmployeesInput(
                create: PersonCreateWithoutEmployeesInput(
                    name: name, address: address, birthDate: birthDate))));
  }

  Future<Department?> updateDepartment(id, {String? name}) async {
    StringFieldUpdateOperationsInput? nameInput;
    if (name != null) {
      nameInput = StringFieldUpdateOperationsInput(set: name);
    }

    return await client!.department.update(
        data: DepartmentUpdateInput(name: nameInput),
        where: DepartmentWhereUniqueInput(id: id));
  }

  Future<Person?> updatePerson(id,
      {String? name, String? address, DateTime? birthDate}) async {
    StringFieldUpdateOperationsInput? nameInput;
    StringFieldUpdateOperationsInput? addressInput;
    DateTimeFieldUpdateOperationsInput? birthDateInput;
    if (name != null) {
      nameInput = StringFieldUpdateOperationsInput(set: name);
    }

    if (address != null) {
      addressInput = StringFieldUpdateOperationsInput(set: address);
    }

    if (birthDate != null) {
      birthDateInput = DateTimeFieldUpdateOperationsInput(set: birthDate);
    }

    return await client!.person.update(
        data: PersonUpdateInput(
            name: nameInput, address: addressInput, birthDate: birthDateInput),
        where: PersonWhereUniqueInput(id: id));
  }

  Future<Employee?> updateEmployee(id, {Position? position}) async {
    IntFieldUpdateOperationsInput? positionInput;
    if (position != null) {
      positionInput = IntFieldUpdateOperationsInput(set: position.index);
    }

    return await client!.employee.update(
        data: EmployeeUpdateInput(position: positionInput),
        where: EmployeeWhereUniqueInput(id: id));
  }

  Future<Department?> deleteDepartment(Department department) async {
    return await client!.department
        .delete(where: DepartmentWhereUniqueInput(id: department.id));
  }

  Future<Person?> deletePerson(Person person) async {
    return await client!.person
        .delete(where: PersonWhereUniqueInput(id: person.id));
  }

  Future<Employee?> deleteEmployee(Employee employee) async {
    return await client!.employee
        .delete(where: EmployeeWhereUniqueInput(id: employee.id));
  }

  Future<int?> deleteDepartments(List<Department> departments) async {
    if (departments.isEmpty) {
      return 0;
    }

    var affected = await client!.department.deleteMany(
        where: DepartmentWhereInput(
            id: IntFilter($in: departments.map((e) => e.id))));

    return affected.count;
  }

  Future<int?> deletePeople(List<Person> people) async {
    if (people.isEmpty) {
      return 0;
    }

    var affected = await client!.person.deleteMany(
        where:
            PersonWhereInput(id: StringFilter($in: people.map((e) => e.id))));

    return affected.count;
  }

  Future<int?> deleteEmployees(List<Employee> employees) async {
    if (employees.isEmpty) {
      return 0;
    }

    var affected = await client!.employee.deleteMany(
        where: EmployeeWhereInput(
            id: StringFilter($in: employees.map((e) => e.id))));

    return affected.count;
  }
}
