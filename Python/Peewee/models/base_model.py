from peewee import Model, SqliteDatabase

DB = SqliteDatabase('db.bd', pragmas={
    'foreign_keys': 'ON',
})


class BaseModel(Model):
    class Meta:
        database = DB
