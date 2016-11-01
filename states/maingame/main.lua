tlm       = require "states/maingame/tools/tlm"

gameLoop  = require "states/maingame/tools/gameLoop"
renderer  = require "states/maingame/tools/renderer"
obm       = require "states/maingame/tools/obm"
asm       = require "states/maingame/tools/asm"

Width     = love.graphics.getWidth()
Height    = love.graphics.getHeight()

require "states/maingame/tools/camera"

GAMETIME = 0
TILESIZE = 70

function load()
  print("wewlad")
  asm:load()
  gameLoop:load()
  renderer:load()
  tlm:load()
  obm:load()
  
  gen_quads(355,70,71,71,1)
  tlm:loadmap("map_test")


  love.timer.sleep( 0.25 ) --Hotfix to make sure things load properly. will redo sooooon(tm)

  obm:add(require("states/maingame/objects/player"):new(500,1800))
  obm:add(require("states/maingame/objects/zombie"):new(1000,1800))
end

function love.update(dt)
  gameLoop:update(dt)
  GAMETIME = GAMETIME + dt
  DELTA = dt
  MX = love.mouse.getX()
  MY = love.mouse.getY()

  camera.pos.x = camera.pos.x + math.cos(GAMETIME / 5)
end

function love.draw()
  camera:set()
  renderer:draw()
  camera:unset()
  love.graphics.print("tracter.love in-dev build // x = " .. MX .. "/" .. Width .. " y = " .. MY .. "/" .. Height)
  love.graphics.print("FPS: ".. love.timer.getFPS(), Width - 50)
end
