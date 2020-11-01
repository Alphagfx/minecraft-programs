local log = require("lib.log")
local component = require("component")

--- @class Util
Util = {}

--- Finds and returns the first component of given type
--- @param type string
--- @return string
function Util.find(type)
    for address, cType in component.list(type) do
        log.info("Found", cType, "=", address)
        return address
    end
end

function Util.objectNewIndex(table, key, value)
    rawset(table, tostring(key), value)
end

function Util.objectIndex(table, key)
    rawget(table, tostring(key))
end

--- @param table table
--- @return string
function Util.printTable(table)
    local result = "{\n"
    for key, value in pairs(table) do
        result = result .. string.format("%s=%s\n", key, value)
    end
    return result .. "}"
end

--- @param tp Transposer
function Util.printTransposer(tp)
    for side = 0, 5 do
        local tableStr = Util.printTable(tp:items(side))
        log.info("Side ", side, tableStr)
    end
end
