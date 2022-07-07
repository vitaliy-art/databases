import enum


@enum.unique
class Position(enum.Enum):
    Boss = 0
    Manager = 1
    Staffer = 2

    def __str__(self):
        return self.name
