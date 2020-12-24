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
    log.info("Create new Transposer with address", address)
    return o
end

--- @return Inventory[]
function Transposer:inventories()
    local result = {}
    for side = 0, 5 do
        local _, error = component.invoke(self.address, "getAllStacks", side)
        if not error then
            local inventory = Inventory:new(self, side)
            table.insert(result, inventory)
        end
    end
    return result
end
