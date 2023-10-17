from models.base_model import BaseModel

from peewee import AutoField, CharField


class Department(BaseModel):
    id: int = AutoField()
    name: str = CharField()

    class Meta:
        table_name = 'departments'
        model_name = 'Department'

    def __str__(self):
        return f'{{ Department: {{ Id: {self.id}, Name: {self.name} }} }}'
