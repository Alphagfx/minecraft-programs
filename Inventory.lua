require("Item")
require("Ticket")
require("Slot")
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

--- @return table<number,Slot> array of inventory slots, where key is index and value is slot
function Inventory:slots()
    local slots, error = component.invoke(self.transposer.address, "getAllStacks", self.side)
    if error then
        log.error("Failed to find spot for items for", self, "because of", error)
        return false
    end
    --- @type table<number, Slot>
    local itemSlots = {}
    for idx, value in ipairs(slots.getAll()) do
        itemSlots[idx] = Slot:new(value)
    end
    return itemSlots
end

--- @param items table<Item,number>
--- @return boolean
function Inventory:contains(items)
    local invItems = self:items()
    for item, count in pairs(items) do
        local invItem = invItems[item]
        if invItem == nil or invItem < count then
            return false
        end
    end
    return true
end

--- @param items table<Item,number>
--- @param target Inventory
function Inventory:transferItemsTo(items, target)
    assert(self.transposer.address == target.transposer.address, "Inventories do not have common transposer")
    assert(self:contains(items), "" .. self .. " does not contain " .. tostring(items))
    assert(target:canFit(items), "" .. tostring(target) .. " can not fit " .. tostring(items))
    --local sources = self:send(items)
    --local targets = target:receive(items)
    for item, count in pairs(items) do
        for i = 1, count do
            local tIdx, tSlot = target:findSlotToPut(item)
            local sIdx, sSlot = self:findItem(item)
            component.invoke(self.transposer.address, "transferItem", self.side, target.side, 1, sIdx, tIdx)
        end
    end
end

--- @param items table<Item,number>
--- @return Ticket[]
function Inventory:send(items)
    assert(self:contains(items), "" .. self .. " does not contain " .. tostring(items))
    local currentSlots = self:slots()
    for item, count in pairs(items) do
        for idx, v in ipairs() do

        end
    end
end

--- @param items table<Item,number>
--- @return Ticket[]
function Inventory:receive(items)
    -- body
end

--- @param items table<Item,number>
--- @return boolean
function Inventory:canFit(items)
    local tracker = Util.shallowCopy(items)
    --- @type table<number, Slot>
    local itemSlots = self:slots()
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
    return true
end


--- @param item Item
--- @return number,Slot returns next slot with this item
function Inventory:findItem(item)
    local slots = self:slots()
    for idx, slot in ipairs(slots) do
        if slot.item == item then
            return idx, slot
        end
    end
end

--- @param item Item
--- @return number,Slot next slot to put this item
function Inventory:findSlotToPut(item)
    local slots = self:slots()
    for idx, slot in ipairs(slots) do
        if slot.item == item and slot.size < slot.maxSize then
            return idx, slot
        end
    end
    for idx, slot in ipairs(slots) do
        if slot.item.name == "minecraft:air" then
            return idx, slot
        end
    end
end

--- @param itemSlots table<number,Slot>
--- @param item Item
--- @return number @returns valid  item slot to place item
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
