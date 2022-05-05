--- @class DpRemoteFile : Dependency
--- @field url string
--- @field path string
local DpRemoteFile = {}

--- @param url string
--- @param path string
--- @param fetch function
--- @return DpRemoteFile
function DpRemoteFile:new(url, path, fetch)
	local o = {
		url = url,
		path = path,
		_fetch = fetch
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

function DpRemoteFile:load()
	self._fetch(self)
end

return DpRemoteFile
