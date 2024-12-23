local this = {
    width = 200,
    height = 600,
    active = true,
    scroll = 20,
    hoveredTile = 0,
}

function this.update()
    if not this.active then return end
    this.width = GUI_SCALE * 2
    sideBar.height = window.height

end

function this.draw(x,y)
    if not this.active then return end
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", x, y, this.width, this.height)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Tiles: ",x,y)

    love.graphics.rectangle("line", x, y, this.width, this.height)
    --love.graphics.line(x, y, x + this.width, y + this.height)

    --love.graphics.print("scroll: "..tostring(this.scroll),x, y + this.scroll)
    
    local qntTiles = 9
    local TILES_PER_ROW = 2
    
    this.hoveredTile = 0
    for iy = 0,(qntTiles/TILES_PER_ROW)-1 do
        for ix = 0,TILES_PER_ROW-1 do
            local i = 1 + ix + (iy * TILES_PER_ROW)
            local thisX,thisY = x + ix*GUI_SCALE, y + iy*GUI_SCALE + this.scroll
            local mx,my = love.mouse.getPosition()

            if mx > thisX and mx < thisX + GUI_SCALE and my > thisY and my < thisY + GUI_SCALE then
                this.hoveredTile = i
                
                love.graphics.setColor(1, 1, 1, 0.5)
                love.graphics.rectangle("fill", thisX,thisY, GUI_SCALE, GUI_SCALE)
                love.graphics.setColor(1,1,1,1)

            end
            
            love.graphics.print(i,thisX,thisY)
            if i == tileChoice then
                love.graphics.setColor(1, 0, 0, 1)
            end

            local thisSprite = sprites.tiles[i]
            love.graphics.draw(thisSprite, thisX, thisY, 0, cam.scale/thisSprite:getWidth(), cam.scale/thisSprite:getWidth())
            love.graphics.rectangle("line", thisX,thisY, GUI_SCALE, GUI_SCALE)
            love.graphics.setColor(1, 1, 1,1)
        end
    end
end

return this
