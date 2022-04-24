--- @class DpList : Dependency
--- @field deps table<number,Dependency>
DpList = {}

--- @param deps table<number,Dependency>
--- @return DpList
function DpList:new(deps)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.deps = deps
    return o
end

function DpList:load()
    for _, dep in pairs(self.deps) do
        dep:load()
    end
end
