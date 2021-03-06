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
    return rawget(table, tostring(key))
end

function Util.equalIndex(table, key)
    for presentKey, _ in pairs(table) do
        if presentKey == key then
            key = presentKey
        end
    end
    return rawget(table, key)
end

function Util.equalNewIndex(table, key, value)
    for presentKey, _ in pairs(table) do
        if presentKey == key then
            key = presentKey
        end
    end
    return rawset(table, key, value)
end

--- @param table table
--- @return string
function Util.printTable(table)
    local result = "{\n"
    for key, value in pairs(table) do
        result = result .. string.format("\t%s=%s\n", key, value)
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

--- Creates shallow copy of input table
--- @param table table
--- @return table
function Util.shallowCopy(table)
    local copy = {}
    for key, value in pairs(table) do
        copy[key] = value
    end
    return copy
end
