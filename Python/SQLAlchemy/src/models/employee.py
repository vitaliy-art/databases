import uuid

from .base import Base
from .department import Department
from .enums.position import Position
from .person import Person

from sqlalchemy import Column, Enum, ForeignKey, Integer, String
from sqlalchemy.orm import relationship


class Employee(Base):
    __tablename__ = 'employees'

    _id = Column(
        String,
        name='id',
        primary_key=True,
        default=lambda: str(uuid.uuid4())
    )

    department_id = Column(
        Integer,
        ForeignKey(f'{Department.__tablename__}.id'),
        index=True
    )
    department = relationship(Department.__name__, back_populates='employees')

    person_id = Column(
        String,
        ForeignKey(f'{Person.__tablename__}.id')
    )
    person = relationship(Person.__name__)

    position = Column(Enum(Position))

    @property
    def id(self):
        return self._id

    def __str__(self):
        return (
            "Employee { "
            f"Id: {self.id}, "
            f"Person: {self.person}, "
            f"Department: {self.department}, "
            f"Position: {self.position} "
            "}"
        )
