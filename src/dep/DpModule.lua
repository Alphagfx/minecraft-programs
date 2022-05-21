--- @class DpModule : Dependency
--- @field public name string
--- @field private _loader function
local DpModule = {}

--- @param name string
--- @return DpModule
function DpModule:new(name, loader)
    local o = {
        name = name,
        _loader = loader
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function DpModule:load()
    self._loader(self)
end

return DpModule
