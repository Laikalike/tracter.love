local tlm = require "states/maingame/tools/tlm"

renderer = require "states/maingame/tools/renderer"
gameLoop = require "states/maingame/tools/gameLoop"

require "states/maingame/tools/camera"

GAMETIME = 0

function load()
  gameLoop:load()
  renderer:load()
  tlm:load()

  tlm:loadmap("map_test")
end

function love.update(dt)
  gameLoop:update(dt)
  GAMETIME = GAMETIME + dt

  camera.pos.x = camera.pos.x + math.cos(GAMETIME / 5)
end

function love.draw()
  camera:set()
  renderer:draw()
  camera:unset()
end
