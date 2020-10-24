require("Transposer")
require("Util")

local addr = Util.find("transposer")
local transposer = Transposer:new {address = addr}

Util.printTransposer(transposer)

return transposer
