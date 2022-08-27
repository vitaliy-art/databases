local Table = require "orm.model"
local fields = require "orm.tools.fields"
local Person = require "Models.Person"
local Department = require "Models.Department"
local Position = require "Models.Position"

local Employee = Table{
    __tablename__ = "employees",
    position = fields.IntegerField(),
    departmentId = fields.ForeignKey{ to = Department },
    personId = fields.ForeignKey{ to = Person }
}

Employee.to_string = function (emp)
    local dep = Department.get:where { id = emp.departmentId }:first()
    local per = Person.get:where { id = emp.personId }:first()
    return "Employee { Id: " .. emp.id .. ", Person: " .. Person.to_string(per) .. ", Department: " .. Department.to_string(dep) .. ", Position: " .. Position.to_string(emp.position) .. " }"
end

return Employee
