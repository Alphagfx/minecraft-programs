require("Transposer")
require("Util")

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local result = Util.printTable(inventories)
print(result)

return transposer
