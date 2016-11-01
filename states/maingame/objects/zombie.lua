require "states/maingame/world_physics/physics"

local Zombie = {}
local tiles = tlm.tiles[1]
local floor = math.floor

function Zombie:new(x,y)
  local zombie = require("states/maingame/objects/entity"):new(x,y,70,70,nil,nil,"zombie")

  function zombie:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)

    physics_init(self,250)
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

    local x_pos = floor(self.pos.x / TILESIZE)
    local y_pos = floor(self.pos.y / TILESIZE)+1
    if tlm:is_solid_at_pos(x_pos,y_pos) then
      physics_jump(self)
    end

    if tlm:is_solid_at_pos(x_pos+1,y_pos) then
      physics_jump(self)
    end

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
