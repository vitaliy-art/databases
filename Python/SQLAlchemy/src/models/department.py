from .base import Base

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship


class Department(Base):
    __tablename__ = 'departments'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    employees = relationship(
        'Employee',
        back_populates='department',
        cascade="all, delete"
    )

    def __str__(self):
        return (
            "Department { "
            f"Id: {self.id}, "
            f"Name: {self.name} "
            "}"
        )
