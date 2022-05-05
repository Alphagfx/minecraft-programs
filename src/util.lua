local util = {}

--- @param module string
--- @return nil
function util.unload(module)
	package.loaded[module] = nil
end

function util.osName()
	local status, result
	status, result = pcall(util.osNameOC)
	if status then
		return result
	end
	status, result = pcall(util.osNameLinux)
	if status then
		return result
	end
	return nil
end

function util.osNameLinux()
	os.execute("uname")
	return "Linux"
end

function util.osNameOC()
	require("shell")
	return "OpenOS"
end

return util
