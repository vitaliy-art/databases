from datetime import date

from models.employee import Position
from storage import Storage


def main():
    storage = Storage()

    print('Clean up database... ', end='')
    departments = storage.get_all_departments()
    people = storage.get_all_people()
    employees = storage.get_all_employees()
    storage.delete_many(departments)
    storage.delete_many(people)
    storage.delete_many(employees)
    print('done')
    print()

    print('Add departments... ', end='')
    dep_1 = storage.add_department('Department One')
    dep_2 = storage.add_department('Department Two')
    print('done')
    print()

    print('Added departments:')
    departments = storage.get_all_departments()
    [print(d) for d in departments]
    print()

    print('Add people... ', end='')
    per_1 = storage.add_person('Ivan', 'Moscow', date(1990, 10, 2))
    per_2 = storage.add_person('John', 'London', date(1998, 1, 14))
    print('done')
    print()

    print('Added people:')
    people = storage.get_all_people()
    [print(p) for p in people]
    print()

    print('Add employees... ', end='')
    storage.add_employee(per_1, dep_1, Position.STAFFER)
    storage.add_employee(per_2, dep_1, Position.STAFFER)
    storage.add_employee_with_person(dep_2, 'Nick', 'Berlin',
                                     date(1995, 2, 23), Position.MANAGER)
    storage.add_employee_with_person(dep_2, 'Stan', 'Oslo',
                                     date(1988, 4, 21), Position.BOSS)
    print('done')
    print()

    print('Added employees:')
    employees = storage.get_all_employees()
    [print(e) for e in employees]
    print()

    print('Delete Department One... ', end='')
    storage.delete(dep_1)
    print('done')
    print()

    print('Update Department Two... ', end='')
    dep_2.name = 'Department'
    storage.update(dep_2)
    print('done')
    print()

    print('Update Ivan... ', end='')
    per_1.address = 'Tula'
    storage.update(per_1)
    print('done')
    print()

    print('Remain departments:')
    departments = storage.get_all_departments()
    [print(d) for d in departments]
    print()

    print('Remain people:')
    people = storage.get_all_people()
    [print(p) for p in people]
    print()

    print('Remain employees:')
    employees = storage.get_all_employees()
    [print(e) for e in employees]
    print()

    print('Delete Department Two... ', end='')
    storage.delete(dep_2)
    print('done')
    print()

    print(f'Remain departments count: {len(storage.get_all_departments())}')
    print()

    print(f'Remain people count: {len(storage.get_all_people())}')
    print()

    print(f'Remain employees count: {len(storage.get_all_employees())}')
    print()

    print('Delete people... ', end='')
    storage.delete_many(people)
    print('done')
    print()

    print(f'Remain people count: {len(storage.get_all_people())}')
    print()


if __name__ == '__main__':
    main()
