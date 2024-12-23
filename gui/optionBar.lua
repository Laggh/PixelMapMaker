local this = {
    width = 600,
    height = 200,
    active = true,
}

function this.update()
    if not this.active then return end
    this.width = window.width - sideBar.width
    this.height = GUI_SCALE * 2

end

function this.draw(x,y)
    if not this.active then return end
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", x, y, this.width, this.height)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Options: ",x,y)
    love.graphics.rectangle("line", x, y, this.width, this.height)
    --love.graphics.line(x, y, x + this.width, y + this.height)


end

return this