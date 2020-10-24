local component = require("component")

--- @class Util
Util = {}

--- Finds and returns the first component of given type
--- @param type string
--- @return string
function Util.find(type)
    for address, cType in component.list(type) do
        print("Found ", cType, "=", address)
        return address
    end
end

--- @param tp Transposer
function Util.printTransposer(tp)
    for side = 0, 5 do
        print(tp:items(side))
    end
end
