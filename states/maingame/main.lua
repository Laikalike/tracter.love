local tlm = require "states/maingame/tools/tlm"

gameLoop  = require "states/maingame/tools/gameLoop"
renderer  = require "states/maingame/tools/renderer"
obm       = require "states/maingame/tools/obm"
asm       = require "states/maingame/tools/asm"

require "states/maingame/tools/camera"

GAMETIME = 0

function load()
  asm:load()
  gameLoop:load()
  renderer:load()
  tlm:load()
  obm:load()

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
