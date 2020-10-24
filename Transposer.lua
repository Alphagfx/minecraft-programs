local component = require("component")

--- @class Transposer
--- @param address string
Transposer = {address = ""}

--- @return Transposer
function Transposer:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    print("Created new Transposer with address", self.address)
    return o
end

--- @param side integer
--- @return table
function Transposer:items(side)
    print("Getting all item on side ", side)
    return component.invoke(self.address, "getAllStacks", side)
end
