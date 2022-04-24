--- @class DpRemoteFileLinux : Dependency
--- @field href string
--- @field path string
DpRemoteFileLinux = {}

--- @param href string
--- @param path string
--- @return DpRemoteFileLinux
function DpRemoteFileLinux:new(href, path)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.href = href
    o.path = path
    return o
end

function DpRemoteFileLinux:load()
    os.execute("wget " .. self.href .. " --output-document=" .. self.path)
end
