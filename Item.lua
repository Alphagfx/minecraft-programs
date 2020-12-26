--- @class Item
--- @field damage number
--- @field hasTag boolean
--- @field label string
--- @field maxDamage number
--- @field name string
Item = {}

--- @param item Item
--- @return Item
function Item:new(item)
    --- @type Item
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.damage = item.damage
    o.hasTag = item.hasTag
    o.label = item.label
    o.maxDamage = item.maxDamage
    o.name = item.name
    return o
end

function Item:__eq(obj)
    if self and type(obj) == "table" and #self == #obj
            and self.damage == obj.damage
            and self.hasTag == obj.hasTag
            and self.label == obj.label
            and self.maxDamage == obj.maxDamage
            and self.name == obj.name then
        return true
    else
        return false
    end
end

function Item:__tostring()
    return string.format(
            "Item{name=%s, label=%s, damage=%s, maxDamage=%s, hasTag=%s}",
            self.name,
            self.label,
            self.damage,
            self.maxDamage,
            self.hasTag
    )
end

return Item