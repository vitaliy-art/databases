import "package:example/position.dart";

import "src/generated/prisma/prisma_client.dart"
    show Department, Person, Employee;

extension DepartmentFormatter on Department {
  String format() {
    return "{ Department: { Id: $id, Name: $name } }";
  }
}

extension PersonFormatter on Person {
  String format() {
    return "{ Person: { Id: $id, Name: $name, Address: $address, BirthDate: ${birthDate.year}-${birthDate.month}-${birthDate.day} } }";
  }
}

extension EmployeeFormatter on Employee {
  String format(Person person, Department department) {
    Position pos;
    switch (position) {
      case 0:
        pos = Position.staffer;
        break;
      case 1:
        pos = Position.manager;
        break;
      case 2:
        pos = Position.boss;
        break;
      default:
        throw (ArgumentError("wrong position $position"));
    }

    return "{ Employee: { Id: $id, Person: ${person.format()}, Department: ${department.format()}, Position: $pos } }";
  }
}
