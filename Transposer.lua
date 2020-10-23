local component = require("component")

--- @class Transposer
--- @param address string
Transposer = {address = ""}

--- @return Transposer
function Transposer:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--- @param side integer
--- @return table
function Transposer:items(side)
    component.invoke(self.address, "getAllStacks", side)
end
