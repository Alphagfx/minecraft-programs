local shell = require("shell")

local gistUrl = "https://gist.githubusercontent.com/Alphagfx/590d71cfd89c62dff7d455d59fded680"
local data = {
    {file = "main.lua", url = gistUrl .. "/raw/main.lua"},
    {file = "Transposer.lua", url = gistUrl .. "/raw/Transposer.lua"},
    {file = "Util.lua", url = gistUrl .. "/raw/Util.lua"},
    {file = "lib/log.lua", url = "https://raw.githubusercontent.com/rxi/log.lua/master/log.lua"}
}
for _, entry in data do
    for file, url in pairs(entry) do
        shell.execute("rm " .. file)
        shell.execute("wget -f " .. url .. " " .. file)
    end
end
