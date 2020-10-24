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
