import uuid

from sqlalchemy import Column, String
from sqlalchemy.dialects.sqlite import DATE
from sqlalchemy.orm import relationship

from .base import Base


class Person(Base):
    __tablename__ = 'people'

    _id = Column(
        String,
        name='id',
        primary_key=True,
        default=lambda: str(uuid.uuid4())
    )

    name = Column(String)
    address = Column(String)
    birth_date = Column(DATE)
    _employees = relationship('Employee', cascade="all, delete")

    @property
    def id(self):
        return self._id

    def __str__(self):
        return (
            "Person { "
            f"Id: {self.id}, "
            f"Name: {self.name}, "
            f"Address: {self.address}, "
            f"BirthDate: {self.birth_date.strftime('%d.%m.%Y')} "
            "}"
        )
