import uuid
from types.guid import GUID

from base import Base
from department import Department
from person import Person

from sqlalchemy import Column, ForeignKey, Integer
from sqlalchemy.orm import relationship


class Employee(Base):
    __tablename__ = 'employees'

    id = Column(GUID(), primary_key=True, default=str(uuid.uuid4()))

    department_id = Column(
        Integer,
        ForeignKey(f'{Department.__tablename__}.id'),
        index=True
    )
    department = relationship(Department.__name__, back_populates='employees')

    person_id = Column(
        GUID(),
        ForeignKey(f'{Person.__tablename__}.id')
    )
    person = relationship(Person.__name__)
