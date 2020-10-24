local log = require("lib.log")
local component = require("component")

--- @class Util
Util = {}

--- Finds and returns the first component of given type
--- @param type string
--- @return string
function Util.find(type)
    for address, cType in component.list(type) do
        log.info("Found ", cType, "=", address)
        return address
    end
end

--- @param tp Transposer
function Util.printTransposer(tp)
    for side = 0, 5 do
        log.info(tp:items(side))
    end
end

--- @param itemSlots table
function Util.convertSlotsToItems(itemSlots)
    local result = {}
    for i = 1, itemSlots.count do
        local slot = itemSlots[i]
        local countOfItems, itemType =
            slot.size,
            {
                damage = slot.damage,
                hasTag = slot.hasTag,
                label = slot.label,
                maxDamage = slot.maxDamage,
                name = slot.name
            }
        result[itemType] = (result[itemType] or 0) + countOfItems
    end
    return result
end