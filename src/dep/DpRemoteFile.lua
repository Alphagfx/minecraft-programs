require("util")
require("dep.DpRemoteFileOC")
require("dep.DpRemoteFileLinux")

--- @class DpRemoteFile : Dependency
--- @field href string
--- @field path string
DpRemoteFile = {}

--- @param href string
--- @param path string
--- @return DpRemoteFile
function DpRemoteFile:new(href, path)
    local osName = osName()
    if osName == "Linux" then
        return DpRemoteFileLinux:new(href, path)
    elseif osName == "OpenOS" then
        return DpRemoteFileOC:new(href, path)
    else
        error("OS " .. osName .. " is not supported as remote file")
    end
end
