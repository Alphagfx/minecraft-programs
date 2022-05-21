local base_url = "https://raw.githubusercontent.com/Alphagfx/minecraft-programs/main/src/"

local function fetch(path)
    os.execute("wget -f " .. base_url .. path .. " " .. path)
end

os.execute("rm -rf dep")
os.execute("mkdir dep")
fetch("dep/Dependency.lua")
fetch("dep/DpModule.lua")
fetch("dep/DpPackage.lua")
fetch("dep/DpRemoteFile.lua")
fetch("dep/DpWrapper.lua")
fetch("dep/util.lua")

fetch("settings.lua")
fetch("setup.lua")
fetch("setup_simple_oc.lua")
