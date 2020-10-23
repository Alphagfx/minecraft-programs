local component = require("component")

local transposerAddr

for address, type in component.list("transposer") do
    transposerAddr = address
    break
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
