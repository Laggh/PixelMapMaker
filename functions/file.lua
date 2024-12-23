love.filesystem.setIdentity("RenoTileEditor")
local files = {}
function files.createFile(filename,data)
    local file = love.filesystem.newFile(filename)
    file:open("w")
    file:write(data)
    file:close()
end



return files