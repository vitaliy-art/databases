local Department = require "Models.Department"
local Person = require "Models.Person"
local Employee = require "Models.Employee"

local function get_by_id (entity_type)
    return function (id) return entity_type.get:where { id = id }:first() end
end

local function save (entity)
    entity:save ()
end

local function new (entity_type, fields)
    if type(fields) ~= "table" then error ("fields should be table, not " .. type (fields)) end
    local entity = entity_type(fields)
    save (entity)
end

local function all (entity_type)
    return function () return entity_type.get:all() end
end

local EntityService = {
    get_department = get_by_id (Department),
    get_person = get_by_id (Person),
    get_employee = get_by_id (Employee),

    add_new_department = function (name)
        new (Department, { name = name })
    end,

    add_new_person = function (name, address, birth_date)
        new (
            Person,
            {
                name = name,
                address = address,
                birthDate = birth_date
            }
        )
    end,

    add_new_employee = function (person, department, position)
        new (
            Employee,
            {
                personId = person.id,
                departmentId = department.id,
                position = position
            }
        )
    end,

    save = save,
    get_all_departments = all (Department),
    get_all_persons = all (Person),
    get_all_employees = all (Employee),

    remove_department = function (department)
        Employee.get:where { departmentId = department.id }:delete()
        department:delete()
    end,

    remove_person = function (person)
        Employee.get:where {personId = person.id }:delete()
        person:delete()
    end,

    remove_employee = function (employee)
        employee:delete()
    end,
}

function EntityService:add_new_employee_and_person(department, name, address, birth_date, position)
    if not self.add_new_person then error "use EntityService:add_new_employee_and_person(department, name, address, birth_date, position)" end
    self.add_new_person (name, address, birth_date)
    local per = Person.get:where{ name=name, address=address, birthDate=birth_date }:first()
    self.add_new_employee (per, department, position)
end

function EntityService:remove_departments (departments)
    for _, v in pairs (departments) do
        self.remove_department (v)
    end
end

function EntityService:remove_persons (persons)
    for _, v in pairs (persons) do
        self.remove_person (v)
    end
end

function EntityService:remove_employees (employees)
    for _, v in pairs (employees) do
        self.remove_employee (v)
    end
end

return EntityService
