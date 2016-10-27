camera =
{
  pos = require("states/maingame/tools/vec2"):new(0,400),
  size = require("states/maingame/tools/vec2"):new(0,0),
  scale = require("states/maingame/tools/vec2"):new(2,2),
  rot = 0
}

local lg     = love.graphics
local pop    = lg.pop
local trans  = lg.translate
local rotate = lg.rotate
local scale  = lg.scale
local push   = lg.push

function camera:set()
  push()
  trans(-self.pos.x, -self.pos.y)
  rotate(-self.rot)
  scale(1 / self.scale.x,1 / self.scale.y)
end

function camera:unset()
  pop()
end

return camera
