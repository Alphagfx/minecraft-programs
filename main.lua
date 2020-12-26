require("Transposer")
require("Util")
local log = require("lib.log")
local recipes = require("Recipes")

function craft(recipe, source, buffer, target)
    log.debug("Check recipe", recipe.name, "can be crafted")
    if not source:contains(recipe.items) then
        log.debug("Recipe", recipe.name, ": source does not contain", recipe.items)
        return
    end
    if not buffer:canFit(recipe.items) then
        log.debug("Recipe", recipe.name, ": buffer can not fit", recipe.items)
        return
    end
    if not target:canFit(recipe.result) then
        log.debug("Recipe", recipe.name, ": source can not fit result", recipe.result)
        return
    end

    log.info("Crafting", recipe.name)
    source:transferItemsTo(recipe.items, buffer)
    log.info("Waiting for result...")
    while not target:contains(recipe.result) do
        log.trace("No result yet, sleeping for", 10, "seconds")
        os.sleep(10)
    end
    log.info(recipe.name, "crafting complete")
end

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local source = inventories[1]
local buffer = inventories[2]
local target = inventories[3]
while true do
    log.info("Source", source, "\n", source:items())
    log.info("Buffer", buffer, "\n", buffer:items())
    log.info("Target", target, "\n", target:items())
    for _, recipe in ipairs(recipes) do
        craft(recipe, source, buffer, target)
    end
    log.debug("Sleeping...")
    os.sleep(10)
end
