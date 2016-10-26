local Renderer = require "states/maingame/tools/renderer"
local GameLoop = require "states/maingame/tools/gameLoop"

local rect     = require "states/maingame/objects/eRect"
local entity   = require "states/maingame/objects/entity"

renderer = Renderer:create()
gameLoop = GameLoop:create()

g_Width  = love.graphics.getWidth()
g_Height = love.graphics.getHeight()

g_GameTime = 0

local obj
function load()
  obj = rect:new(32,32,64,64)
end

function love.update(dt)
  g_GameTime = g_GameTime + dt
end

function love.draw()
  love.graphics.print(g_GameTime)
  renderer:draw()

  love.graphics.rectangle("line", obj.pos.x, obj.pos.y, obj.size.x, obj.size.y)
end
