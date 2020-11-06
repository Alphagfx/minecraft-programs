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

--- @return table<Item,number>
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
            for key, value in pairs(result) do
                if key.name == "minecraft:air" then
                    result[key] = nil
                end
            end
        end
        return result
    else
        log.error("Failed to get items for", self, "because of", error)
    end
end

--- @param items table<Item,number>
--- @return boolean
function Inventory:canFit(items)
    local slots, error = component.invoke(self.transposer.address, "getAllStacks", self.side)
    if error then
        log.error("Failed to find spot for items for", self, "because of", error)
        return false
    end

    local tracker = Util.shallowCopy(items)
    --- @type table<number, Slot>
    local itemSlots = {}
    for idx, value in ipairs(slots.getAll()) do
        itemSlots[idx] = Slot:new(value)
    end
    while next(tracker) ~= nil do
        for item, count in pairs(tracker) do
            local spot = Inventory.findSpot(itemSlots, item)
            if spot ~= nil then
                local slot = itemSlots[spot]
                local toPut = math.min(count, (64 - slot.size))
                slot.item = item
                slot.size = slot.size + toPut
                tracker[item] = tracker[item] - toPut
            else
                log.warn("Not enough space to fit items in", self)
                return false
            end
        end
        for key, value in pairs(tracker) do
            if value == 0 then
                tracker[key] = nil
            end
        end
    end
end


--- @param itemSlots table<number,Slot>
--- @param item Item
--- @return integer @returns valid  item slot to place item
function Inventory.findSpot(itemSlots, item)
    for idx, slot in ipairs(itemSlots) do
        if slot.item == item and slot.size < slot.maxSize then
            return idx
        elseif slot.item.name == "minecraft:air" then
            return idx
        end
    end
end

function Inventory:__tostring()
    return string.format("Inventory{address=%s, side=%s}", self.transposer.address, self.side)
end

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
