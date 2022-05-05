local package = require("dep.DpPackage")
local module = require("dep.DpModule")
local file = require("dep.DpRemoteFile")
local wrap = require("dep.DpWrapper")
local util = require("dep.util")

local tools = {
	url = "https://raw.githubusercontent.com/Alphagfx/minecraft-programs/main/src/"
}

--- @param name string
--- @param deps table<number,Dependency>
--- @return Dependency
function tools.pckg(name, deps)
	return wrap:new(
			name,
			package:new(
					name,
					deps
			),
			function(item)
				util.mkdir(item.name)
			end,
			function(item)
			end
	)
end

--- @param name string
--- @param url string
--- @return Dependency
function tools.mdl(name, url)
	url = url or tools.url .. name
	return file:new(url, name, function(item)
		util.wget(item.url, item.path)
	end)
end

local setup = {
	url = tools.url,
	install = package:new(
			"setup",
			{
				tools.pckg(
						"dep",
						{
							tools.mdl("dep/Dependency.lua"),
							tools.mdl("dep/DpModule.lua"),
							tools.mdl("dep/DpPackage.lua"),
							tools.mdl("dep/DpRemoteFile.lua"),
							tools.mdl("dep/DpWrapper.lua"),
							tools.mdl("dep/util.lua")
						}
				),
				tools.pckg(
						"lib",
						{
							tools.mdl("lib/log.lua", "https://raw.githubusercontent.com/rxi/log.lua/master/log.lua")
						}
				)
			}
	)
}

setup.install:load()

return setup