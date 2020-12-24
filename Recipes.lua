require("Item")
require("Util")

local minecraft = {
    glowstone_block = Item:new { damage = 0, hasTag = false, label = "Glowstone", maxDamage = 0, name = "minecraft:glowstone" },
    wooden_sword = Item:new { damage = 0, hasTag = false, label = "Wooden Sword", maxDamage = 59, name = "minecraft:wooden_sword" }
}
local enderio = {
    double_capacitor = { name = "enderio:item_basic_capacitor", damage = 1 },
    octadic_capacitor = { name = "enderio:item_basic_capacitor", damage = 2 }
}

local recipes = {
    {
        name = "Test",
        items = { [minecraft.glowstone_block] = 1 },
        result = { [minecraft.wooden_sword] = 1 }
    },
    {
        name = "<recipe name>",
        items = {
            [minecraft.glowstone_block] = 1,
            [enderio.double_capacitor] = 2
        },
        result = {
            [enderio.octadic_capacitor] = 1
        }
    }
}

local mt = { __tostring = Util.printTable }

setmetatable(recipes, mt)
for _, recipe in ipairs(recipes) do
    setmetatable(recipe, mt)
end

return recipes
