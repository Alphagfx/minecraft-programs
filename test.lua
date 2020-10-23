local component = require("component")

---# Util
Util = {}

--- @param type string
--- @return string
function Util:find(type)
    for address, _ in component.list(type) do
        return address
    end
end

function Util:printNewTransposer()
    local addr = Util.find("transposer")
    local tp = Transposer:new({address = addr})
    tp:printItemsOnAllSides()
end
---# Util

---# Transposer
Transposer = {address = nil}

--- @param address string
--- @return any
function Transposer:new(o)
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

function Transposer:printItemsOnAllSides()
    for i = 0, 5 do
        print("Items on side " .. i .. " =" .. self:items(i))
    end
end
---# Transposer
