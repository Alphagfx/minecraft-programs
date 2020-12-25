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
        if not self then
            log.warn("self is false where self is", self)
        end
        if not type(obj) == "table" then
            log.warn("type(obj) == \"table\" is false where type is", type(obj))
        end
        if not #self == #obj then
            log.warn("#self == #obj is false where #self=", #self, "and #obj=", #obj)
        end
        if not self.damage == obj.damage then
            log.warn("self.damage == obj.damage is false where self.damage=", self.damage, "and obj.damage=", obj.damage)
        end
        if not self.hasTag == obj.hasTag then
            log.warn("self.hasTag == obj.hasTag is false where self.hasTag=", self.hasTag, "and obj.hasTag=", obj.hasTag)
        end
        if not self.label == obj.label then
            log.warn("self.label == obj.label is false where self.label=", self.label, "and obj.label=", obj.label)
        end
        if not self.maxDamage == obj.maxDamage then
            log.warn("self.maxDamage == obj.maxDamage is false where self.maxDamage=", self.maxDamage, "and obj.maxDamage=", obj.maxDamage)
        end
        if not self.name == obj.name then
            log.warn("self.name == obj.name is false where self.name=", self.name, "and obj.name=", obj.name)
        end

        return false
    end
end

function Item:__tostring()
    return string.format(
            "{name=%s, label=%s, damage=%s, maxDamage=%s, hasTag=%s}",
            self.name,
            self.label,
            self.damage,
            self.maxDamage,
            self.hasTag
    )
end
