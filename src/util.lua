local util = {}

--- @param module string
--- @return nil
function util.unload(module)
    package.loaded[module] = nil
end

return util
