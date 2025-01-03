isDown = love.keyboard.isDown
love.window.setTitle("Reno's Tile Editor")

local loadImg = love.graphics.newImage
local JsonConfigTiles = json.decode(files.loadFile("tiles/tiles.json"))
print(json.encode(JsonConfigTiles))
sprites.tiles = {}



love.window.setMode(800, 600, {resizable=true})
_,_,window = love.window.getMode()
window.width , window.height = love.window.getMode()