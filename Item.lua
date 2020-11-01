--- @class Item
--- @field damage number
--- @field hasTag boolean
--- @field label string
--- @field maxDamage number
--- @field name string
Item = {
    damage = 0,
    hasTag = false,
    label = "",
    maxDamage = 0,
    name = ""
}

--- @return Item
function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Item:__eq(obj)
    if self and obj and #self == #obj then
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
