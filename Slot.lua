require("Item")

--- @class Slot
--- @field item Item
--- @field size number
--- @field maxSize number
Slot = {}

--- @param ocSlot table Original Minecraft inventory slot
--- @return Slot
function Slot:new(ocSlot)
    --- @type Slot
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.item = Item:new(ocSlot)
    o.size = ocSlot.size
    o.maxSize = ocSlot.maxSize
    return o
end

function Slot:__tostring()
    return string.format("Slot{size=%s, maxSize=%s, item=%s}", self.size, self.maxSize, self.item)
end
