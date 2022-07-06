import uuid
from types.guid import GUID

from base import Base

from sqlalchemy import Column, String
from sqlalchemy.dialects.sqlite import DATE


class Person(Base):
    __tablename__ = 'people'

    id = Column(GUID(), primary_key=True, default=str(uuid.uuid4()))
    name = Column(String)
    address = Column(String)
    birth_date = Column(DATE)
