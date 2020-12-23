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
    if self and type(obj) == "table" and #self == #obj then
        for key, value in pairs(self) do
            if obj[key] ~= value then
                return false
            end
        end
        return true
    end
end

function Item:__tostring()
    return string.format(
            "{damage=%s, hasTag=%s, label=%s, maxDamage=%s, name=%s}",
            self.damage,
            self.hasTag,
            self.label,
            self.maxDamage,
            self.name
    )
end
