local log = require("lib.log")
local component = require("component")

--- @class Transposer
--- @param address string
Transposer = {address = ""}

--- @return Transposer
function Transposer:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    log.info("Created new Transposer with address", o.address)
    return o
end

--- @param side integer
--- @return table
function Transposer:items(side)
    log.debug("Getting all items on side", side)
    local slots = component.invoke(self.address, "getAllStacks", side)
    return Util.convertSlotsToItems(slots.getAll())
end