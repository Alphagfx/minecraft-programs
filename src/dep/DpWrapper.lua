--- @class DpWrapper : Dependency
--- @field public name string
--- @field public dep Dependency
--- @field private _fbefore function
--- @field private _fafter function
local DpWrapper = {}

--- @param name string
--- @param dep Dependency
--- @param fbefore function
--- @param fafter function
--- @return DpWrapper
function DpWrapper:new(name, dep, fbefore, fafter)
    local o = {
        name = name,
        dep = dep,
        _fbefore = fbefore,
        _fafter = fafter
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function DpWrapper:load()
    self._fbefore(self)
    local status, err = pcall(self.dep.load, self.dep)
    self._fafter(self)
    if not status then
        error(err)
    end
end

return DpWrapper
