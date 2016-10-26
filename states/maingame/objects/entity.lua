-- Half-Baked entity class to redo later
local rect = require "states/maingame/objects/erect"
local vec2 = require "states/maingame/tools/vec2"

local Entity = {}

function Entity:new(x,y,w,h,img,quad,id)
  local entity = rect:new(x,y,w,h)

  entity.vel   = rect:new(0,0)
  entity.dir   = rect:new(0,0)
  entity.spd = rect:new(0,0)

  ent.id    = id or "object"

  function ent:load()   end
  function ent:tick(dt) end
  function ent:draw()   end

  return ent
end

return Entity
