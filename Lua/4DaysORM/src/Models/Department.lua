local Table = require "orm.model"
local fields = require "orm.tools.fields"

local Department = Table{
    __tablename__ = "departments",
    name = fields.CharField{ max_length = 50, unique = false },
}

Department.to_string = function (dep)
    return "Department { Id: " .. dep.id .. ", Name: " .. dep.name .. " }"
end

return Department
