local entity_factory = {}

local ec = require "states/maingame/objects/entity_container"
local r  = require "states/maingame/objects/components/c_erect"

function entity_factory:new_rectangle(x,y,w,h)
  local ent = ec:new("erect")

  ent:add_component("erect",r:new(),{x,y,w,h})

  return ent
end

return entity_factory
