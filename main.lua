require("Transposer")
require("Util")

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local result = Util.printTable(inventories)
print(result)

print("Inventory1:", inventories[1]:items())
print("Inventory2:", inventories[2]:items())

print("Can fit inv1 in inv2", inventories[1]:canFit(inventories[2]:items()))

return transposer
