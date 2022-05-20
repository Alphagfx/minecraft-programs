local settings = require("settings")

local util = {}

--- @param href string
--- @param path string
function util.wget(href, path)
	local osName = settings.OS()
	if osName == "Linux" then
		util.fetchLinux(href, path)
	elseif osName == "OpenOS" then
		util.fetchOC(href, path)
	else
		error("OS " .. osName .. " is not supported as remote file")
	end
end

--- @param href string
--- @param path string
function util.fetchOC(href, path)
	os.execute("wget -f " .. href .. " " .. path)
end

--- @param href string
--- @param path string
function util.fetchLinux(href, path)
	os.execute("wget " .. href .. " --output-document=" .. path)
end

function util.mkdir(name)
	os.execute("mkdir -p " .. name)
end

function util.cd(name)
	os.execute("cd " .. name)
end

function util.pwd()
	os.execute("pwd")
end

return util
