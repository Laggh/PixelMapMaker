love.graphics.setDefaultFilter('nearest', 'nearest')
json = require "json"
global = require "globals"
files = require "functions/file" 
tileMap = require "functions/map" 

function love.load()
    window = {}
    cam = {
        offX = 0,
        offY = 0,
        scale = 100
    }
    sprites = {}
    GUI_SCALE = 100
    map = tileMap.newMap(6,10,2)

    selectedTile = {
        x = 0,
        y = 0,
        onMap = false,
    }

    tileChoice = 0

    require("onLoad")

    files.createFile("novo",json.encode(window))

    sideBar = require("gui/sideBar")
    optionBar = require("gui/optionBar")
    print(#sprites.tiles)
end

function love.mousepressed(mx, my, bnt)
    if mx < sideBar.width then
        print("Clicou em:","SideBar")
        if sideBar.hoveredTile == 0  then return end

        tileChoice = sideBar.hoveredTile

        return
    end
    
    if my > (window.height - optionBar.height) then
        print("Clicou em:","OptionBar")
        return
    end

    print("Clicou em:","Principal")

    if not selectedTile.onMap or tileChoice == 0 then return end

    local x,y = selectedTile.x , selectedTile.y
    print(json.encode(selectedTile))
    print(x,y)
    map[y][x] = tileChoice
end

function love.wheelmoved(x, y)
    local mx,my = love.mouse.getPosition()
    if mx < sideBar.width then
        sideBar.scroll = sideBar.scroll + y*20
        return
    end

    if my > (window.height - optionBar.height) then
        return
    end

    if isDown("lctrl") then
        cam.scale = cam.scale * (10+y)/10
    end

end

function love.resize(w, h)
    
end

function love.keypressed(key)
    if key == "e" then
        if sideBar.active then
            sideBar.active = false
            sideBar.width = 0
        else
            sideBar.active = true
            sideBar.width = 200
        end
        return
    end

    if key == "q" then
        if optionBar.active then
            optionBar.active = false
            optionBar.height = 0
        else
            optionBar.active = true
            optionBar.height = 200
        end
        return
    end
end

function love.update(dt)
    _,_,window = love.window.getMode()
    window.width , window.height = love.window.getMode()

    local camMoveSpeed = 0.2
    if isDown("lshift") then
        camMoveSpeed = 0.6
    end
    if isDown("w") then
        cam.offY = cam.offY + camMoveSpeed
    end

    if isDown("s") then
        cam.offY = cam.offY - camMoveSpeed
    end

    if isDown("a") then
        cam.offX = cam.offX + camMoveSpeed
    end

    if isDown("d") then
        cam.offX = cam.offX - camMoveSpeed
    end

    
end 

function love.draw()
    

    local mapStartX,mapStartY = toScreen(0,0)
    love.graphics.rectangle("line", mapStartX, mapStartY, map.width*cam.scale, map.height*cam.scale)

    selectedTile = {x=0,y=0,onMap=false}
    local mx,my = love.mouse.getPosition()

    for iy = 1,map.height do
        for ix = 1,map.width do
            local thisX,thisY = toScreen(ix-1,iy-1)
            local thisTile = map[iy][ix]
            local thisSprite = sprites.tiles[thisTile]

            love.graphics.rectangle("line", thisX, thisY,cam.scale-1,cam.scale-1)
            love.graphics.draw(thisSprite, thisX, thisY, 0, cam.scale/thisSprite:getWidth(), cam.scale/thisSprite:getWidth())
            love.graphics.print(tostring(ix).." "..tostring(iy).." "..tostring(thisTile),x,y)

            if mx > thisX and mx < thisX + cam.scale and my > thisY and my < thisY + cam.scale then
                selectedTile = {
                    x = ix,
                    y = iy,
                    onMap = true,
                }
                love.graphics.setColor(1,0,0,1)
                love.graphics.rectangle("line", thisX, thisY, cam.scale-1, cam.scale-1)
                love.graphics.setColor(1,1,1,1)
            end
        end
    end



    sideBar.update()
    sideBar.draw(0,0)

    optionBar.update()
    optionBar.draw(sideBar.width,window.height-optionBar.height)

    love.graphics.print("Selecionado: "..tostring(tileChoice),sideBar.width)
end

