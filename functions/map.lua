local tileMap = {}

function tileMap.newMap(_Width,_Height,_Placeholder)
    local newMap = {}
    newMap.width = _Width
    newMap.height = _Height

    for iy = 1,_Height do
        newMap[iy] = {}
        for ix = 1,_Width do
            newMap[iy][ix] = _Placeholder or 1
        end
    end
    return newMap
end

function toScreen(_X,_Y,_X2,_Y2)
    if _X2 and _Y2 then
        return (_X+cam.offX)*cam.scale , (_Y+cam.offY)*cam.scale , (_X2+cam.offX)*cam.scale , (_Y2+cam.offY)*cam.scale
    end
    return (_X+cam.offX)*cam.scale , (_Y+cam.offY)*cam.scale
end

return tileMap