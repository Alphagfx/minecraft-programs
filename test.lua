local component = require("component")

Util = {}

--- @param type string
--- @return string
function Util:find(type)
    for address, _ in component.list(type) do
        return address
    end
end

-- Meta class
Transposer = {address = nil}

--- @param address string
--- @return any
function Transposer:new(o, address)
    o = o or {} -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
end

--- @param side number
--- @return table
function Transposer:items(side)
    component.invoke(self.address, "getAllStacks", side)
end

function Transposer:items()
    for i = 0, 5 do
        print("Items on side " .. i .. " =" .. self:items(i))
    end
end
