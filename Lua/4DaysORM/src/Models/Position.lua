local string_values = {
    "Boss",
    "Manager",
    "Staffer"
}

local Position = {
    Boss = 1,
    Manager = 2,
    Staffer = 3,

    to_string = function (position)
        return string_values[position]
    end
}

return Position
