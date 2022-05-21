--- @class DpPackage : Dependency
--- @field public name string
--- @field public deps table<number,Dependency>
local DpPackage = {}

--- @param name string
--- @param deps table<number,Dependency>
--- @return DpPackage
function DpPackage:new(name, deps)
    local o = {
        name = name,
        deps = deps
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function DpPackage:load()
    for _, dep in pairs(self.deps) do
        dep:load()
    end
end

return DpPackage
