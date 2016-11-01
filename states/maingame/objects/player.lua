-- Player class, inherits off entity, camera is centered on it.
local Player = {}
require "states/maingame/world_physics/physics"

local tiles = tlm.tiles[1]

function Player:new(x,y)

  local player = require("states/maingame/objects/entity"):new(x, y, 70, 70, nil, nil, "player")

  function player:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)
    physics_init(self,500)
  end

  local key = love.keyboard.isDown

  function player:tick(dt)
    camera:goto_point(self.pos)

    physics_gravity(self, dt)

    if key("a") then
      self.dir.x = -1
      self.vel.x = 500
    end

    if key("d") then
      self.dir.x = 1
      self.vel.x = 500
    end

    physics_update(self,tiles,dt)

    if key("space") then
      physics_jump(self)
    end

    self.pos.x = self.pos.x + (self.vel.x * dt) * self.dir.x
    self.pos.y = self.pos.y + (self.vel.y * dt) * self.dir.y

    self.vel.x = self.vel.x * (1 - ( dt * 10 ) )
  end

  function player:draw()

    love.graphics.rectangle("fill", self.pos.x, self.pos.y, self.size.x, self.size.y)
  end

  return player
end

return Player
