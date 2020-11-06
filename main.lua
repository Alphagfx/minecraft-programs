require("Transposer")
require("Util")

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local result = Util.printTable(inventories)
print(result)

print(inventories[2]:items())
print(inventories[1]:items())

print("Can fit" .. inventories[1]:canFit(inventories[2]:items()))

return transposer
