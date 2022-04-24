require("craft.Transposer")
require("craft.Util")
local log = require("lib.log")
local recipes = require("craft.Recipes")

function craft(recipe, source, buffer, target, output)
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
        log.debug("Recipe", recipe.name, ": target can not fit result", recipe.result)
        return
    end
    if not target:canFit(recipe.result) then
        log.debug("Recipe", recipe.name, ": output can not fit result", recipe.result)
        return
    end

    log.info("Crafting", recipe.name)
    source:transferItemsTo(recipe.items, buffer)
    log.info("Waiting for result...")
    while not target:contains(recipe.result) do
        log.trace("No result yet, sleeping for", 10, "seconds")
        os.sleep(10)
    end
    log.info(recipe.name, "crafting complete, transferring to output")
    target:transferItemsTo(recipe.result, output)
end

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local source = inventories[1]
local buffer = inventories[2]
local target = inventories[3]
local output = inventories[4]
while true do
    log.info("Source", source, "\n", source:items())
    log.info("Buffer", buffer, "\n", buffer:items())
    log.info("Target", target, "\n", target:items())
    log.info("Output", output, "\n", output:items())
    for _, recipe in ipairs(recipes) do
        craft(recipe, source, buffer, target, output)
    end
    log.debug("Sleeping...")
    os.sleep(10)
end
