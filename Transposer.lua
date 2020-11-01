require("Inventory")
local log = require("lib.log")
local component = require("component")

--- @class Transposer
--- @field address string
Transposer = {}

--- @return Transposer
function Transposer:new(address)
    --- @type Transposer
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.address = address
    log.info("Created new Transposer with address", address)
    return o
end

--- @return table
function Transposer:inventories()
    local result = {}
    for side = 0, 5 do
        local slots, error = component.invoke(self.address, "getAllStacks", side)
        if not error then
            local inventory = Inventory:new(self, side)
            table.insert(result, inventory)
        end
    end
    return result
end
