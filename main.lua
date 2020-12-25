require("Transposer")
require("Util")
local log = require("lib.log")
local recipes = require("Recipes")

local addr = Util.find("transposer")
local transposer = Transposer:new(addr)

local inventories = transposer:inventories()

local source = inventories[1]
local target = inventories[2]
while true do
    log.info("Source", source, "\n", source:items())
    log.target("Target", target, "\n", target:items())
    for _, recipe in ipairs(recipes) do
        if source:contains(recipe.items) and target:canFit(recipe.items) then
            log.info("Crafting", recipe.name)
            source:transferItemsTo(recipe.items, target)
            log.info("Waiting for result...")
            while not target:contains(recipe.result) do
                log.trace("No result yet, sleeping for", 10, "seconds")
                os.sleep(10)
            end
            target:transferItemsTo(recipe.result, source)
            log.info(recipe.name, "crafting complete")
        else
            if not source:contains(recipe.items) then
                log.debug("Recipe", recipe.name, ": source does not contain", recipe.items)
            end
            if not target:canFit(recipe.items) then
                log.debug("Recipe", recipe.name, ": target can not fit", recipe.items)
            end
        end
    end
    log.debug("Sleeping...")
    os.sleep(10)
end
