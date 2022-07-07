import datetime
from entity import Entity
from models.enums.position import Position

with Entity("bd.db") as entity:
    print("Clean up database... ", end="")
    departments = entity.get_all_departments()
    persons = entity.get_all_persons()
    employees = entity.get_all_employees()
    entity.remove_departments(departments)
    entity.remove_persons(persons)
    entity.remove_employees(employees)
    print("done")

    print()
    print("Add departments... ", end="")
    dep_1 = entity.add_new_department("Department One")
    dep_2 = entity.add_new_department("Department Two")
    print("done")

    print()
    print("Added departments:")
    departments = entity.get_all_departments()
    for dep in departments:
        print(dep)

    print()
    print("Add persons... ", end="")
    per_1 = entity.add_new_person("Ivan", "Moscow", datetime.date(1990, 10, 2))
    per_2 = entity.add_new_person("John", "London", datetime.date(1998, 1, 14))
    print("done")

    print()
    print("Added persons:")
    persons = entity.get_all_persons()
    for per in persons:
        print(per)

    print()
    print("Add employees... ", end="")
    entity.add_new_employee(per_1.id, dep_1.id, Position.Staffer)
    entity.add_new_employee(per_2.id, dep_1.id, Position.Staffer)
    entity.add_new_employee_and_person(
        dep_2.id,
        "Nick",
        "Berlin",
        datetime.date(1995, 2, 23),
        Position.Manager
    )
    entity.add_new_employee_and_person(
        dep_2.id,
        "Stan",
        "Oslo",
        datetime.date(1998, 4, 21),
        Position.Boss
    )
    print("done")

    print()
    print("Added employees:")
    employees = entity.get_all_employees()
    for emp in employees:
        full_emp = entity.get_employee(emp.id)
        print(full_emp)

    print()
    print("Delete Department One... ", end="")
    entity.remove(dep_1)
    print("done")

    print()
    print("Update Department Two... ", end="")
    dep_2.name = "Department"
    entity.update_department(dep_2)
    print("done")

    print()
    print("Update Ivan... ", end="")
    per_1.address = "Tula"
    entity.update_person(per_1)
    print("done")

    print()
    print("Remain departments:")
    departments = entity.get_all_departments()
    for dep in departments:
        print(dep)

    print()
    print("Remain persons:")
    persons = entity.get_all_persons()
    for per in persons:
        print(per)

    print()
    print("Remain employees:")
    employees = entity.get_all_employees()
    for emp in employees:
        full_emp = entity.get_employee(emp.id)
        print(full_emp)

    print()
    print("Delete Department Two... ", end="")
    entity.remove(dep_2)
    print("done")

    print()
    print("Remain departments count: ", end="")
    departments = entity.get_all_departments()
    print(len(departments))

    print()
    print("Remain persons:")
    persons = entity.get_all_persons()
    for per in persons:
        print(per)

    print()
    print("Remain employees count: ", end="")
    employees = entity.get_all_employees()
    print(len(employees))

    print()
    print("Delete persons... ", end="")
    entity.remove_persons(persons)
    print("done")

    print()
    print("Remain persons count: ", end="")
    persons = entity.get_all_persons()
    print(len(persons))
