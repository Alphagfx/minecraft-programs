require("Item")
require("Util")

local mt = { __tostring = Util.printTable }

local minecraft = {
    glowstone_block = Item:new { damage = 0, hasTag = false, label = "Glowstone", maxDamage = 0, name = "minecraft:glowstone" },
    wooden_sword = Item:new { damage = 0, hasTag = false, label = "Wooden Sword", maxDamage = 59, name = "minecraft:wooden_sword" },

    dye_red = Item:new { name = "minecraft:dye", label = "Rose Red", damage = 1, maxDamage = 0, hasTag = false },
    redstone = Item:new { name = "minecraft:redstone", label = "Redstone", damage = 0, maxDamage = 0, hasTag = false },
    brick = Item:new { name = "minecraft:brick", label = "Brick", damage = 0, maxDamage = 0, hasTag = false },
    netherbrick = Item:new { name = "minecraft:netherbrick", label = "Nether Brick", damage = 0, maxDamage = 0, hasTag = false },

    dye_cyan = Item:new { name = "minecraft:dye", label = "Cyan Dye", damage = 6, maxDamage = 0, hasTag = false },
    prismarine_shard = Item:new { name = "minecraft:prismarine_shard", label = "Prismarine Shard", damage = 0, maxDamage = 0, hasTag = false },

    dye_black = Item:new { name = "minecraft:dye", label = "Ink Sac", damage = 0, maxDamage = 0, hasTag = false },
    flint = Item:new { name = "minecraft:flint", label = "Flint", damage = 0, maxDamage = 0, hasTag = false },
    charcoal = Item:new { name = "minecraft:coal", label = "Charcoal", damage = 1, maxDamage = 0, hasTag = false },
    stone = Item:new { name = "minecraft:stone", label = "Stone", damage = 0, maxDamage = 0, hasTag = false },

    dye_gray = Item:new { name = "minecraft:dye", label = "Gray Dye", damage = 8, maxDamage = 0, hasTag = false },
    cobblestone = Item:new { name = "minecraft:cobblestone", label = "Cobblestone", damage = 0, maxDamage = 0, hasTag = false },
    stone_button = Item:new { name = "minecraft:stone_button", label = "Button", damage = 0, maxDamage = 0, hasTag = false },
    snowball = Item:new { name = "minecraft:snowball", label = "Snowball", damage = 0, maxDamage = 0, hasTag = false },

    vine = Item:new { name = "minecraft:vine", label = "Vines", damage = 0, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local actuallyadditions = {
    restonia_block = Item:new { name = "actuallyadditions:block_crystal", label = "Restonia Crystal Block", damage = 0, maxDamage = 0, hasTag = false },
    palis_block = Item:new { name = "actuallyadditions:block_crystal", label = "Palis Crystal Block", damage = 1, maxDamage = 0, hasTag = false },
    void_block = Item:new { name = "actuallyadditions:block_crystal", label = "Void Crystal Block", damage = 3, maxDamage = 0, hasTag = false },
    enori_block = Item:new { name = "actuallyadditions:block_crystal", label = "Enori Crystal Block", damage = 5, maxDamage = 0, hasTag = false },
    diamatine_block = Item:new { name = "actuallyadditions:block_crystal", label = "Diamatine Crystal Block", damage = 2, maxDamage = 0, hasTag = false },
    emeradic_block = Item:new { name = "actuallyadditions:block_crystal", label = "Emeradic Crystal Block", damage = 4, maxDamage = 0, hasTag = false },

    empowered_restonia_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Restonia Crystal Block", damage = 0, maxDamage = 0, hasTag = false },
    empowered_palis_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Palis Crystal Block", damage = 1, maxDamage = 0, hasTag = false },
    empowered_void_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Void Crystal Block", damage = 3, maxDamage = 0, hasTag = false },
    empowered_enori_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Enori Crystal Block", damage = 5, maxDamage = 0, hasTag = false },
    empowered_diamatine_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Diamatine Crystal Block", damage = 2, maxDamage = 0, hasTag = false },
    empowered_emeradic_block = Item:new { name = "actuallyadditions:block_crystal_empowered", label = "Empowered Emeradic Crystal Block", damage = 4, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local projectred = {
    electrotine_ingot = Item:new { name = "projectred-core:resource_item", label = "Electrotine Alloy Ingot", damage = 104, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local thermalfoundation = {
    steel_ingot = Item:new { name = "thermalfoundation:material", label = "Steel Ingot", damage = 160, maxDamage = 0, hasTag = false },
    pulverized_coal = Item:new { name = "thermalfoundation:material", label = "Pulverized Coal", damage = 768, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local tconstruct = {
    grout = Item:new { name = "tconstruct:soil", label = "Grout", damage = 0, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local nuclearcraft = {
    rhodochrosite = Item:new { name = "nuclearcraft:gem", label = "Rhodochrosite", damage = 0, maxDamage = 0, hasTag = false },
    fluorite = Item:new { name = "nuclearcraft:gem", label = "Fluorite", damage = 2, maxDamage = 0, hasTag = false },
    berrylium_ingot = Item:new { name = "nuclearcraft:ingot", label = "Berrylium Ingot", damage = 9, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local natura = {
    thorn_vines = Item:new { name = "natura:nether_thorn_vines", label = "Thornvines", damage = 0, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local enderio = {
    basic_capacitor = Item:new { name = "enderio:item_basic_capacitor", label = "Basic Capacitor", damage = 0, maxDamage = 0, hasTag = false },
    double_capacitor = Item:new { name = "enderio:item_basic_capacitor", label = "Double-Layer", damage = 1, maxDamage = 0, hasTag = false },
    octadic_capacitor = Item:new { name = "enderio:item_basic_capacitor", label = "Octadic Capacitor", damage = 2, maxDamage = 0, hasTag = false },

    silver_capacitor = Item:new { name = "enderio:item_capacitor_silver", label = "Silver Capacitor", damage = 0, maxDamage = 0, hasTag = false },
    energetic_silver_capacitor = Item:new { name = "enderio:item_capacitor_energetic_silver", label = "Endergetic Silver Capacitor", damage = 0, maxDamage = 0, hasTag = false },
    vivid_capacitor = Item:new { name = "enderio:item_capacitor_vivid", label = "Endergised Capacitor", damage = 0, maxDamage = 0, hasTag = false },

    energetic_alloy = Item:new { name = "enderio:item_alloy_ingot", label = "Energetic Alloy Ingot", damage = 1, maxDamage = 0, hasTag = false },
    vibrant_alloy = Item:new { name = "enderio:item_alloy_ingot", label = "Vibrant Alloy Ingot", damage = 2, maxDamage = 0, hasTag = false },

    energetic_silver = Item:new { name = "enderio:item_alloy_endergy_ingot", label = "Energetic Silver Ingot", damage = 5, maxDamage = 0, hasTag = false },
    vivid_alloy = Item:new { name = "enderio:item_alloy_endergy_ingot", label = "Vivid Alloy Ingot", damage = 6, maxDamage = 0, hasTag = false },

    __metatable = mt
}

local recipes = {
    {
        name = "Restonia Crystal Block",
        items = {
            [minecraft.dye_red] = 1,
            [minecraft.redstone] = 1,
            [minecraft.brick] = 1,
            [minecraft.netherbrick] = 1,
            [actuallyadditions.restonia_block] = 1
        },
        result = { [actuallyadditions.empowered_restonia_block] = 1 }
    },
    {
        name = "Palis Crystal Block",
        items = {
            [minecraft.dye_cyan] = 1,
            [minecraft.prismarine_shard] = 3,
            [actuallyadditions.palis_block] = 1
        },
        result = { [actuallyadditions.empowered_palis_block] = 1 }
    },
    {
        name = "Void Crystal Block",
        items = {
            [minecraft.dye_black] = 1,
            [minecraft.flint] = 1,
            [minecraft.charcoal] = 1,
            [minecraft.stone] = 1,
            [actuallyadditions.void_block] = 1
        },
        result = { [actuallyadditions.empowered_void_block] = 1 }
    },
    {
        name = "Enori Crystal Block",
        items = {
            [minecraft.dye_gray] = 1,
            [minecraft.cobblestone] = 1,
            [minecraft.stone_button] = 1,
            [minecraft.snowball] = 1,
            [actuallyadditions.enori_block] = 1
        },
        result = { [actuallyadditions.empowered_enori_block] = 1 }
    },
    {
        name = "Diamatine Crystal Block",
        items = {
            [tconstruct.grout] = 1,
            [thermalfoundation.steel_ingot] = 1,
            [projectred.electrotine_ingot] = 1,
            [nuclearcraft.rhodochrosite] = 1,
            [actuallyadditions.diamatine_block] = 1
        },
        result = { [actuallyadditions.empowered_diamatine_block] = 1 }
    },
    {
        name = "Emeradic Crystal Block",
        items = {
            [minecraft.vine] = 1,
            [nuclearcraft.berrylium_ingot] = 1,
            [nuclearcraft.fluorite] = 1,
            [natura.thorn_vines] = 1,
            [actuallyadditions.emeradic_block] = 1
        },
        result = { [actuallyadditions.empowered_emeradic_block] = 1 }
    },
    {
        name = "Double Capacitor",
        items = {
            [enderio.basic_capacitor] = 2,
            [enderio.energetic_alloy] = 2,
            [thermalfoundation.pulverized_coal] = 1
        },
        result = { [enderio.double_capacitor] = 1 }
    },
    {
        name = "Octadic Capacitor",
        items = {
            [enderio.double_capacitor] = 2,
            [enderio.vibrant_alloy] = 2,
            [minecraft.glowstone_block] = 1
        },
        result = { [enderio.octadic_capacitor] = 1 }
    },
    {
        name = "Energetic Silver Capacitor",
        items = {
            [enderio.silver_capacitor] = 2,
            [enderio.energetic_silver] = 2,
            [thermalfoundation.pulverized_coal] = 1
        },
        result = { [enderio.energetic_silver_capacitor] = 1 }
    },
    {
        name = "Vivid Capacitor",
        items = {
            [enderio.energetic_silver_capacitor] = 2,
            [enderio.vivid_alloy] = 2,
            [minecraft.glowstone_block] = 1
        },
        result = { [enderio.vivid_capacitor] = 1 }
    }
}

setmetatable(recipes, mt)
for _, recipe in pairs(recipes) do
    setmetatable(recipe, mt)
    setmetatable(recipe.items, mt)
    setmetatable(recipe.result, mt)
end

return recipes
