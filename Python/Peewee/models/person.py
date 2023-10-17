from datetime import date
from uuid import uuid4

from models.base_model import BaseModel

from peewee import CharField, DateField


class Person(BaseModel):
    id: str = CharField(primary_key=True, default=uuid4)
    name: str = CharField()
    address: str = CharField()
    birth_date: date = DateField(formats=DateField.formats[0])

    class Meta:
        table_name = 'people'
        model_name = 'Person'

    def __str__(self):
        return (f'{{ Person: {{ Id: {self.id}, Name: {self.name}, '
                f'Address: {self.address}, '
                f'BirthDate: {self.birth_date} }} }}')
