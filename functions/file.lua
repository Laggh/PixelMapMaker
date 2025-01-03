love.filesystem.setIdentity("RenoTileEditor")
local files = {}
function files.createFile(filename,data)
    local file = love.filesystem.newFile(filename)
    file:open("w")
    file:write(data)
    file:close()
end

function files.loadFIle(filename)
    local file = love.filesystem.newFile(filename)
    file:open("r")
    local data = file:read()
    file:close()
    return data
end


return files