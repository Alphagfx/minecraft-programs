require("Item")
local component = require("component")
local log = require("lib.log")

--- @class Inventory
--- @field transposer Transposer
--- @field side number
Inventory = {
    __mtItemsList = {
        __index = Util.objectIndex,
        __newindex = Util.objectNewIndex,
        __tostring = Util.printTable
    }
}

--- @param transposer Transposer
--- @param side number
--- @return Inventory
function Inventory:new(transposer, side)
    --- @type Inventory
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.transposer = transposer
    o.side = side
    return o
end

--- @return Item[]
function Inventory:items()
    log.debug("Getting all items on side", self.side)
    local slots, error = component.invoke(self.transposer.address, "getAllStacks", self.side)
    if not error then
        local itemSlots = slots.getAll()
        local result = {}
        setmetatable(result, self.__mtItemsList)
        for i = 1, #itemSlots do
            local slot = itemSlots[i]
            local countOfItems, itemType = slot.size, Item:new(slot)
            result[itemType] = (result[itemType] or 0) + countOfItems
        end
        return result
    else
        log.error("Failed to get items for", self)
    end
end

function Inventory:canFit(items)
    -- body
end

function Inventory:__tostring()
    return string.format("Inventory{address=%s, side=%s}", self.transposer.address, self.side)
end
