require("Transposer")
require("Util")
local log = require("lib.log")
local recipes = require("Recipes")

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local result = Util.printTable(inventories)
print(result)

print("Inventory1:", inventories[1]:items())
print("Inventory2:", inventories[2]:items())

print("Can fit inv1 in inv2", inventories[1]:canFit(inventories[2]:items()))


local source = inventories[1]
local target = inventories[2]
while true do
    for _, recipe in ipairs(recipes) do
        if source:contains(recipe.items) and target:canFit(recipe) then
            source:transferItemsTo(recipe.items, target)
            while not target:contains(recipe.result) do
                os.sleep(10)
                log.info("Waiting for result", recipe.result)
            end
            target:transferItemsTo(recipe.result, source)
        end
    end
    log.debug("Sleeping...")
    os.sleep(60)
end
