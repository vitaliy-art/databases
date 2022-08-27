local Table = require "orm.model"
local fields = require "orm.tools.fields"

local function birth_date_to_string (birth_date)
    return string.format("%02d.%02d.%04d", birth_date.day, birth_date.month, birth_date.year)
end

local Person = Table{
    __tablename__ = "people",
    name = fields.CharField{ max_length = 50 },
    address = fields.CharField{ max_length = 50 },
    birthDate = fields.DateTimeField{ null = false },
}

Person.to_string = function (per)
    return "Person { Id: " .. per.id .. ", Name: " .. per.name .. ", Address: " .. per.address .. ", BirthDate: " .. birth_date_to_string (per.birthDate) .. " }"
end

return Person
