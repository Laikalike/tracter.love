require "states/maingame/world_physics/physics"

local Zombie = {}
local tiles = tlm.tiles[1]

function Zombie:new(x,y)
  local zombie = require("states/maingame/objects/entity"):new(x,y,70,70,nil,nil,"zombie")

  function zombie:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)

    physics_init(self,500)
  end

  function zombie:tick(dt)
    physics_gravity(self,dt)


    local player = obm:get_obj_by_id(self, "player")
    if self.on_ground then
      if self.pos.x < player.pos.x then
        self.vel.x = 210
      else
        self.vel.x = -210
      end
    end

    physics_update(self,tiles,dt)

    self.pos.y = self.pos.y + self.vel.y * dt
    self.pos.x = self.pos.x + self.vel.x * dt
  end

  function zombie:draw()
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill",self.pos.x,self.pos.y,self.size.x,self.size.y)
    love.graphics.setColor(255,255,255)
  end

  return zombie
end

return Zombie
