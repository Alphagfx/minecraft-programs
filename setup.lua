local shell = require("shell")

local data = {"main.lua", "Transposer.lua", "Util.lua"}
for file in pairs(data) do
    shell.execute("wget -f https://tinyurl.com/y4ahygow/raw/" .. file .. " " .. file)
end
