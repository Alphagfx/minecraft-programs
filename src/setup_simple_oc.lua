local base_url = "https://raw.githubusercontent.com/Alphagfx/minecraft-programs/main/src/"

local function fetch(path)
	os.execute("wget -f " .. base_url .. href .. " " .. path)
end


fetch("dep/Dependency.lua")
fetch("dep/DpModule.lua")
fetch("dep/DpPackage.lua")
fetch("dep/DpRemoteFile.lua")
fetch("dep/DpWrapper.lua")
fetch("dep/util.lua")

fetch("setup.lua")
fetch("setup_simple_oc.lua")
