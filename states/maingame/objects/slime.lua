require "states/maingame/world_physics/physics"

local Slime = {}
local tiles = tlm.tiles[1]
local floor = math.floor

local quad = love.graphics.newQuad
local anim_data = {
  quad(0, 0, 50, 28, 153, 28), --Walk Cycle
  quad(51, 0, 50, 28, 153, 28),

  quad(102, 0, 50, 28, 153, 28) -- UNUSED
  }

function Slime:new(x,y)
  local slime = require("states/maingame/objects/entity"):new(x,y,50,28,nil,nil,"slime")

  function slime:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)
    asm:add("assets/slime_ss.png", "slime")
    image = love.graphics.newImage("assets/slime_ss.png")

    physics_init(self,250)

    self.animation = require("states/maingame/tools/animation"):new(image,{{anim_data[1],anim_data[2]}},0.1)
    self.animation:play()
  end

  function slime:tick(dt)
    physics_gravity(self,dt)
    self.animation:update(dt)


    local player = obm:get_obj_by_id(self, "player")
    if self.on_ground then
      if self.pos.x < player.pos.x + 10 then
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

    if tlm:is_solid_at_pos(x_pos+3,y_pos) then
      physics_jump(self)
    end

    self.pos.y = self.pos.y + self.vel.y * dt
    self.pos.x = self.pos.x + self.vel.x * dt
  end

  function slime:draw()
    self.animation:draw({self.pos.x,self.pos.y})
  end

  return slime
end

return Slime
