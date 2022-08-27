package.path = package.path .. ";/lib/4DaysORM/?.lua;/workspaces/database/Lua/4DaysORM/src/?.lua;/workspaces/database/Lua/4DaysORM/lua_modules/share/lua/5.4/?.lua"
package.cpath = package.cpath .. ";/workspaces/database/Lua/4DaysORM/lua_modules/lib/lua/5.4/?.so"

DB = {
    name = "bd.db",
    new = false,
}

local entityService = require "Services.EntityService"
local Department = require "Models.Department"
local Person = require "Models.Person"
local Employee = require "Models.Employee"
local Position = require "Models.Position"

local function log (msg)
    io.write(msg)
    io.flush()
end

log "Clean up database... "
local departments = entityService.get_all_departments ()
local persons = entityService.get_all_persons ()
local employees = entityService.get_all_employees ()
entityService:remove_departments (departments)
entityService:remove_persons (persons)
entityService:remove_employees (employees)
log "done\n"

log "\nAdd departments... "
entityService.add_new_department "Department One"
entityService.add_new_department "Department Two"
log "done\n"

print "\nAdded departments:"
departments = entityService.get_all_departments ()
for _, v in pairs (departments) do
    print (Department.to_string (v))
end
local dep1, dep2 = departments[1], departments[2]

log "\nAdd persons... "
entityService.add_new_person ("Ivan", "Moscow", os.time{ year=1990, month=10, day=2 })
entityService.add_new_person ("John", "London", os.time{ year=1998, month=1, day=14 })
log "done\n"

print "\nAdded persons:"
persons = entityService.get_all_persons ()
for _, v in pairs (persons) do
    print (Person.to_string (v))
end
local per1, per2 = persons[1], persons[2]

log "\nAdd employees... "
entityService.add_new_employee (per1, dep1, Position.Staffer)
entityService.add_new_employee (per2, dep1, Position.Staffer)
entityService:add_new_employee_and_person (dep2, "Nick", "Berlin", os.time{ year=1995, month=2, day=23 }, Position.Manager)
entityService:add_new_employee_and_person (dep2, "Stan", "Oslo", os.time{ year=1998, month=4, day=21 }, Position.Boss)
log "done\n"

print "\nAdded employees:"
employees = entityService.get_all_employees ()
for _, v in pairs (employees) do
    print (Employee.to_string (v))
end

log "\nDelete Department One... "
entityService.remove_department (dep1)
log "done\n"

log "\nUpdate Department Two... "
dep2.name = "Department"
entityService.save (dep2)
log "done\n"

log "\nUpdate Ivan... "
per1.address = "Tula"
entityService.save (per1)
log "done\n"

print "\nRemain departments:"
departments = entityService.get_all_departments ()
for _, v in pairs (departments) do
    print (Department.to_string (v))
end

print "\nRemain persons:"
persons = entityService.get_all_persons ()
for _, v in pairs (persons) do
    print (Person.to_string (v))
end

print "\nRemain employees:"
employees = entityService.get_all_employees ()
for _, v in pairs (employees) do
    print (Employee.to_string (v))
end

log "\nDelete Department Two... "
entityService.remove_department (dep2)
log "done\n"

log "\nRemain departments count: "
departments = entityService.get_all_departments ()
print (departments:count ())

print "\nRemain persons:"
persons = entityService.get_all_persons ()
for _, v in pairs (persons) do
    print (Person.to_string (v))
end

log "\nRemain employees count: "
employees = entityService.get_all_employees ()
print (employees:count ())

log "\nDelete persons... "
entityService:remove_persons (persons)
log "done\n"

log "\nRemain persons count: "
persons = entityService.get_all_persons ()
print (persons:count ())
