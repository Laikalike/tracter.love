camera =
{
  pos = require("states/maingame/tools/vec2"):new(0,000),
  size = require("states/maingame/tools/vec2"):new(0,0),
  scale = require("states/maingame/tools/vec2"):new(1,1),
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

function camera:goto_point(pos)
  self.pos.x = pos.x - ( Width / 2 ) * self.scale.x
  self.pos.y = pos.y - ( Height / 2 ) * self.scale.y
end

function camera:unset()
  pop()
end

return camera
