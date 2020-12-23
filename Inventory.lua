require("Util")
require("Item")
require("Slot")
local component = require("component")
local log = require("lib.log")

--- @class Inventory
--- @field transposer Transposer
--- @field side number
Inventory = {
    __mtItemsList = {
        __index = Util.equalIndex,
        __newindex = Util.equalNewIndex,
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
    local resultItems = {}
    setmetatable(resultItems, self.__mtItemsList)
    for _, slot in ipairs(self:slots()) do
        local countOfItems, item = slot.size, slot.item
        if item.name ~= "minecraft:air" then
            resultItems[item] = (resultItems[item] or 0) + countOfItems
            log.debug("Added", countOfItems, item.name)
        end
    end
    return resultItems
end

--- @return table<number,Slot> array of inventory slots, where key is index and value is slot
function Inventory:slots()
    local slots, error = component.invoke(self.transposer.address, "getAllStacks", self.side)
    if error then
        log.error("Failed to get slots of", self, "because of", error)
        return false
    end
    --- @type table<number, Slot>
    local resultSlots = {}
    setmetatable(resultSlots, self.__mtItemsList)
    for _, value in ipairs(slots.getAll()) do
        table.insert(resultSlots, Slot:new(value))
    end
    return resultSlots
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
    for item, count in pairs(items) do
        for i = 1, count do
            local tIdx, tSlot = target.findSlot(target:slots(), item)
            local sIdx, sSlot = self:findItem(item)
            component.invoke(self.transposer.address, "transferItem", self.side, target.side, 1, sIdx, tIdx)
        end
    end
end

--- @param items table<Item,number>
--- @return boolean
function Inventory:canFit(items)
    local tracker = Util.shallowCopy(items)
    --- @type table<number, Slot>
    local itemSlots = self:slots()
    while next(tracker) ~= nil do
        for item, count in pairs(tracker) do
            local _, slot = Inventory.findSlot(itemSlots, item)
            if slot ~= nil then
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

--- @param slots table<number,Slot>
--- @param item Item
--- @return number,Slot next slot to put this item
function Inventory.findSlot(slots, item)
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

function Inventory:__tostring()
    return string.format("Inventory{address=%s, side=%s}", self.transposer.address, self.side)
end
