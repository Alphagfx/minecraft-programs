--- @param module string
--- @return nil
function unload(module)
    package.loaded[module] = nil
end

function osName()
    local status, result
    status, result = pcall(osNameOC)
    if status then
        return result
    end
    status, result = pcall(osNameLinux)
    if status then
        return result
    end
    return nil
end

function osNameLinux()
    local _, _ = os.execute("uname")
    return "Linux"
end

function osNameOC()
    require("shell")
    return "OpenOS"
end
