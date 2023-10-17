from enum import Enum
from uuid import uuid4

from models.base_model import BaseModel
from models.department import Department
from models.person import Person

from peewee import CharField, Field, ForeignKeyField


class Position(Enum):
    STAFFER = 'Staffer'
    MANAGER = 'Manager'
    BOSS = 'Boss'

    def __str__(self):
        return self.value


class PositionField(Field):
    field_type = CharField.field_type

    def db_value(self, value: Position):
        return value.value

    def python_value(self, value: str):
        return Position(value)


class Employee(BaseModel):
    id: str = CharField(primary_key=True, default=uuid4)
    position: Position = PositionField()
    person: Person = ForeignKeyField(Person, on_delete='CASCADE')
    department: Department = ForeignKeyField(Department, on_delete='CASCADE')

    class Meta:
        table_name = 'employees'
        model_name = 'Employee'

    def __str__(self):
        return (f'{{ Employee: {{ Id: {self.id}, Person: {self.person}, '
                f'Department: {self.department}, '
                f'Position: {self.position} }} }}')
