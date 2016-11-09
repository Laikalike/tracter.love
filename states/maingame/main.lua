tlm       = require "states/maingame/tools/tlm"

gameLoop  = require "states/maingame/tools/gameloop"
renderer  = require "states/maingame/tools/renderer"
obm       = require "states/maingame/tools/obm"
asm       = require "states/maingame/tools/asm"

Width     = love.graphics.getWidth()
Height    = love.graphics.getHeight()

require "states/maingame/tools/camera"

GAMETIME = 0
TILESIZE = 70
MAP_SIZE = 64

local delta_time = {}
local av_dt      = 0.016
local sample     = 10

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

local pop, push = table.remove,
                  table.insert

function love.update(dt)

  push(delta_time,dt)
  if #delta_time > sample then
    local av  = 0
    local num = #delta_time
    for i = #delta_time,1,-1 do
      av = av + delta_time[i]
      pop(delta_time,i)
    end

    av_dt = av / num
  end

  gameLoop:update(av_dt)
  GAMETIME = GAMETIME + av_dt
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
