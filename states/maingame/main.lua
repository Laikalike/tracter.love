local tlm = require "states/maingame/tools/tlm"

gameLoop  = require "states/maingame/tools/gameLoop"
renderer  = require "states/maingame/tools/renderer"
obm       = require "states/maingame/tools/obm"
asm       = require "states/maingame/tools/asm"

Width     = love.graphics.getWidth()
Height    = love.graphics.getHeight()

require "states/maingame/tools/camera"

GAMETIME = 0

function load()
  asm:load()
  gameLoop:load()
  renderer:load()
  tlm:load()
  obm:load()

  tlm:loadmap("map_test")

  obm:add(require("states/maingame/objects/player"):new(500,1800))
end

function love.update(dt)
  gameLoop:update(dt)
  GAMETIME = GAMETIME + dt
  MX = love.mouse.getX()
  MY = love.mouse.getY()

  camera.pos.x = camera.pos.x + math.cos(GAMETIME / 5)
end

function love.draw()
  camera:set()
  renderer:draw()
  camera:unset()
  love.graphics.print("x = " .. MX .. "/" .. Width .. " y = " .. MY .. "/" .. Height)
end
