from datetime import date
from typing import Literal

from models.base_model import DB
from models.department import Department
from models.employee import Employee, Position
from models.person import Person

Model = Department | Person | Employee
ModelName = Literal['Department', 'Person', 'Employee']


class Storage:
    def __init__(self):
        DB.create_tables([
            Department, Person, Employee,
        ])

    def add_department(self, name: str) -> Department:
        department = Department(name=name)
        department.save()
        return department

    def add_person(self, name: str, address: str, birth_date: date) -> Person:
        person = Person(name=name, address=address, birth_date=birth_date)
        person.save(force_insert=True)
        return person

    def add_employee(
        self,
        person: Person,
        department: Department,
        position: Position,
    ) -> Employee:
        employee = Employee(
            position=position,
            person=person,
            department=department,
        )
        employee.save(force_insert=True)
        return employee

    def add_employee_with_person(
        self,
        department: Department,
        name: str,
        address: str,
        birth_date: date,
        position: Position,
    ) -> Employee:
        person = self.add_person(
            name=name,
            address=address,
            birth_date=birth_date,
        )
        employee = self.add_employee(
            person=person,
            department=department,
            position=position,
        )
        return employee

    def update(self, model: Model):
        model.save()

    def get_all(self, type_name: ModelName) -> list[Model]:
        match type_name:
            case 'Department':
                query = Department.select()
            case 'Person':
                query = Person.select()
            case 'Employee':
                query = Employee.select()
            case _:
                raise ValueError(f'Unexpected type name: "{type_name}"')

        return [obj for obj in query]

    def get_all_departments(self) -> list[Department]:
        return self.get_all('Department')

    def get_all_people(self) -> list[Person]:
        return self.get_all('Person')

    def get_all_employees(self) -> list[Employee]:
        return self.get_all('Employee')

    def delete(self, obj: Model):
        obj.delete_instance()

    def delete_many(self, objects: list[Model]):
        if len(objects) == 0:
            return

        ids = [obj.id for obj in objects]
        obj = objects[0]
        if isinstance(obj, Department):
            schema = Department
        elif isinstance(obj, Person):
            schema = Person
        elif isinstance(obj, Employee):
            schema = Employee
        else:
            raise ValueError(f'Unexpected objects type: {obj}')

        schema.delete().where(schema.id.in_(ids)).execute()
