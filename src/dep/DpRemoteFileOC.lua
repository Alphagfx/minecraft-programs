--- @class DpRemoteFileOC : Dependency
--- @field href string
--- @field path string
DpRemoteFileOC = {}

--- @param href string
--- @param path string
--- @return DpRemoteFileOC
function DpRemoteFileOC:new(href, path)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.href = href
    o.path = path
    return o
end

function DpRemoteFileOC:load()
    local shell = require("shell")
    shell.execute("wget -f " .. entry.url .. " " .. entry.file)
end
