-- Player class, inherits off entity, camera is centered on it.
local Player = {}
require "states/maingame/world_physics/physics"
local accelerate = require "states/maingame/tools/accelerate"

local tiles = tlm.tiles[1]

local quad = love.graphics.newQuad
local anim_data = {
  quad(0, 0, 70, 94, 494, 292), --Walk Cycle
  quad(71, 0, 70, 94, 494, 292),
  quad(142, 0, 70, 94, 494, 292),
  quad(0, 95, 70, 94, 494, 292),
  quad(71, 95, 70, 94, 494, 292),
  quad(142, 95, 70, 94, 494, 292),
  quad(213, 0, 70, 94, 494, 292),
  quad(284, 0, 70, 94, 494, 292),
  quad(213, 95, 70, 94, 494, 292),
  quad(355, 0, 70, 94, 494, 292),
  quad(284, 95, 70, 94, 494, 292),

  quad(423, 95, 66, 94, 494, 292) -- Jump
}

function Player:new(x,y)
  local player = require("states/maingame/objects/entity"):new(x, y, 70, 94, nil, nil, "player")

  function player:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)
    asm:add("assets/player_ss.png","player")
    image = love.graphics.newImage("assets/player_ss.png")
    image:setFilter("nearest","nearest")
    physics_init(self,500)

    self.animation = require("states/maingame/tools/animation"):new(
      image,
      {
        {
          anim_data[1] --Idle
        },
        {
          anim_data[1],
          anim_data[2],
          anim_data[3],
          anim_data[4],
          anim_data[5],
          anim_data[6],
          anim_data[7],
          anim_data[8],
          anim_data[9],
          anim_data[10],
          anim_data[11] -- Walk
        },
        {
          anim_data[12] -- Jump
        },
      },
      0.028
    )
    self.animation:play()

  end

  local key = love.keyboard.isDown

  function player:tick(dt)
    camera:goto_point(self.pos)

    self.animation:set_animation(1)

    physics_gravity(self, dt)

    if key("a") then
      self.animation:set_animation(2)
      self.dir.x = -1
      accelerate:left(dt, self, 50, 500)
    end

    if key("d") then
      self.animation:set_animation(2)
      self.dir.x = 1
      accelerate:right(dt, self, 50, 500)
    end

    physics_update(self,tiles,dt)

    if key("space") then
      physics_jump(self)
    end

    if self.on_ground == false then
      self.animation:set_animation(3)
    end

    self.pos.x = self.pos.x + (self.vel.x * dt) * self.dir.x
    self.pos.y = self.pos.y + (self.vel.y * dt) * self.dir.y

    self.vel.x = self.vel.x * (1 - ( dt * 10 ) )

    self.animation:update(dt)
  end

  function player:draw()
    self.animation:draw({self.pos.x,self.pos.y})
  end

  return player
end

return Player
