--- @class Ticket
--- @field item Item
--- @field Inventory Inventory
--- @field slot number
--- @field count number
Ticket = {}

--- @return Slot
function Ticket:new(item, inventory, slot, count)
    --- @type Ticket
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.item = item
    o.inventory = inventory
    o.slot = slot
    o.count = count
    return o
end
