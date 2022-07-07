from datetime import datetime
import uuid
from typing import Any, Dict, List, Type

from exceptions import EntryNotFoundError
from models.base import Base
from models.department import Department
from models.employee import Employee
from models.enums.position import Position
from models.person import Person

from sqlalchemy import create_engine, delete
from sqlalchemy.orm import Query, Session, sessionmaker


class Entity(object):
    def __init__(self, bd_name: str):
        self.engine = create_engine(f'sqlite:///./{bd_name}')
        self.session: Session = None
        Base.metadata.create_all(self.engine)

    def __enter__(self):
        session = sessionmaker(bind=self.engine)
        self.session = session()
        return self

    def __exit__(self, *_):
        self.session.close()

    def get_department(self, id: int) -> Department | None:
        query: Query = self.session.query(Department) \
            .filter(Department.id == id)
        return query.first()

    def get_person(self, id: str) -> Person | None:
        query: Query = self.session.query(Person).filter(Person._id == id)
        return query.first()

    def get_employee(self, id: str) -> Employee | None:
        query: Query = self.session.query(Employee).join(Person) \
            .filter(Employee._id == id)
        return query.first()

    def __add_new(self, entry: Any) -> Any:
        self.session.add(entry)
        self.session.commit()
        return entry

    def add_new_department(self, name: str) -> Department:
        department = Department(name=name)
        return self.__add_new(department)

    def add_new_person(
        self,
        name: str,
        address: str,
        birth_date: datetime.date
    ) -> Person:
        person = Person(name=name, address=address, birth_date=birth_date)
        return self.__add_new(person)

    def add_new_employee(
        self,
        person_id: uuid.UUID,
        department_id: int,
        position: Position
    ) -> Employee:
        person = self.get_person(person_id)
        if person is None:
            raise EntryNotFoundError(f"person {person_id} not found")

        department = self.get_department(department_id)
        if department is None:
            raise EntryNotFoundError(f"department {department_id} not found")

        employee = Employee(
            department_id=department_id,
            person_id=person_id,
            position=position
        )
        return self.__add_new(employee)

    def add_new_employee_and_person(
        self,
        department_id: int,
        name: str,
        address: str,
        birth_date: datetime.date,
        position: Position
    ) -> Employee:
        department = self.get_department(department_id)
        if department is None:
            raise EntryNotFoundError(f"department {department_id} not found")

        person = self.add_new_person(name, address, birth_date)
        return self.add_new_employee(person.id, department_id, position)

    def __update(
        self,
        entry_type: Type,
        entry_type_id: Any,
        id: Any,
        mapped_values: Dict[str, Any]
    ) -> None:
        self.session.query(entry_type).filter(entry_type_id == id) \
            .update(mapped_values)
        self.session.commit()

    def update_department(self, department: Department) -> None:
        return self.__update(
            Department,
            Department.id,
            department.id,
            {
                'name': department.name
            }
        )

    def update_person(self, person: Person) -> None:
        return self.__update(
            Person,
            Person.id,
            person.id,
            {
                'name': person.name,
                'address': person.address,
                'birth_date': person.birth_date
            }
        )

    def update_employee(self, employee: Employee) -> None:
        return self.__update(
            Employee,
            Employee.id,
            employee.id,
            {
                'department_id': employee.department_id,
                'person_id': employee.person_id,
                'position': employee.position
            }
        )

    def __get_all(self, entry_type: Type) -> List[Any]:
        return self.session.query(entry_type).all()

    def get_all_departments(self) -> List[Department]:
        return self.__get_all(Department)

    def get_all_persons(self) -> List[Person]:
        return self.__get_all(Person)

    def get_all_employees(self) -> List[Employee]:
        return self.__get_all(Employee)

    def remove(self, entry: Any) -> None:
        self.session.delete(entry)
        self.session.commit()

    def remove_departments(self, departments: List[Department]) -> None:
        if departments is None or len(departments) == 0:
            return

        expr = delete(Department) \
            .where(Department.id.in_(d.id for d in departments))
        self.session.execute(expr)
        self.session.commit()

    def remove_persons(self, persons: List[Person]) -> None:
        if persons is None or len(persons) == 0:
            return

        expr = delete(Person) \
            .where(Person._id.in_(p.id for p in persons))
        self.session.execute(expr)
        self.session.commit()

    def remove_employees(self, employees: List[Employee]) -> None:
        if employees is None or len(employees) == 0:
            return

        expr = delete(Employee) \
            .where(Employee._id.in_(e.id for e in employees))
        self.session.execute(expr)
        self.session.commit()
