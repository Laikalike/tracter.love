local tlm = require "states/maingame/tools/tlm"

renderer = require "states/maingame/tools/renderer"
gameLoop = require "states/maingame/tools/gameLoop"

function load()
  gameLoop:load()
  renderer:load()
  tlm:load()

  tlm:loadmap("map_test")
end

function love.update(dt)
  gameLoop:update(dt)
end

function love.draw()
  renderer:draw()
end
