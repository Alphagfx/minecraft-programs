local component = require("component")

--- @type string
local transposerAddr = nil

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

tp = Transposer:new {address = transposerAddr}
for i = 0, 5 do
    print("Items on side " .. i .. " =" .. tp:items(i))
end
