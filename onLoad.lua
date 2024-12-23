isDown = love.keyboard.isDown
love.window.setTitle("Reno's Tile Editor")

local loadImg = love.graphics.newImage
sprites.tiles = {}

table.insert(sprites.tiles,loadImg("tiles/grama_01.png"))
table.insert(sprites.tiles,loadImg("tiles/grama_02.png"))
table.insert(sprites.tiles,loadImg("tiles/grama_03.png"))
table.insert(sprites.tiles,loadImg("tiles/arvore_01.png"))
table.insert(sprites.tiles,loadImg("tiles/arvore_01.png"))
table.insert(sprites.tiles,loadImg("tiles/chao_01.png"))
table.insert(sprites.tiles,loadImg("tiles/chao_02.png"))
table.insert(sprites.tiles,loadImg("tiles/parede_b.png"))
table.insert(sprites.tiles,loadImg("tiles/4k.png"))





love.window.setMode(800, 600, {resizable=true})
_,_,window = love.window.getMode()
window.width , window.height = love.window.getMode()