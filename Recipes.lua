require("Item")

local minecraft = {
    glowstone_block = Item:new { damage=0, hasTag=false, label="", maxDamage=0, name = "minecraft:glowstone_block" }
}
local enderio = {
    double_capacitor = { name = "enderio:item_basic_capacitor", damage = 1 },
    octadic_capacitor = { name = "enderio:item_basic_capacitor", damage = 2 }
}

local recipes = {
    {
        name = "<recipe name>",
        items = {
            [minecraft.glowstone_block]=1,
            [enderio.double_capacitor]=2
        },
        result = {
            [enderio.octadic_capacitor] = 1
        }
    }
}

return recipes
