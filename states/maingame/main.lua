local Renderer = require "states/maingame/tools/renderer"
local GameLoop = require "states/maingame/tools/gameLoop"

renderer = Renderer:create()
gameLoop = GameLoop:create()

g_Width  = love.graphics.getWidth()
g_Height = love.graphics.getHeight()

g_GameTime = 0

function love.load()

end

function love.update(dt)
  g_GameTime = g_GameTime + dt

--  gameLoop:update(dt)
end

function love.draw()
  love.graphics.print(g_GameTime)
  renderer:draw()
end
