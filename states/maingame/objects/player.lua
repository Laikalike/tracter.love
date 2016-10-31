-- Player class, inherits off entity, camera is centered on it.
local Player = {}

require "states/maingame/tools/camera"
require "states/maingame/tools/physics_helper"
local rect = require "states/maingame/objects/eRect"

local floor = math.floor

local tiles = tlm.tiles[1]

function Player:new(x,y)


  local player = require("states/maingame/objects/entity"):new(x, y, 70, 70, nil, nil, "player")

  function player:load()
    gameLoop:addLoop(self)
    renderer:addRenderer(self)

    self.on_ground = false
    self.gravity = 500
  end

  local key = love.keyboard.isDown

  function player:tick(dt)
    camera:goto_point(self.pos)

    self.vel.y = self.vel.y + (self.gravity * dt * 10)
    self.dir.y = 1

    local x = floor(self.pos.x / 70) - 1
    local y = floor(self.pos.y / 70) - 1
    local w = 3
    local h = 3

    if x < 1 then x = 1 end
    if y < 1 then y = 1 end

    for i = y,y+h do
      for j = x,x+w do
        local tile = tiles[i][j]
        if tile == nil then goto cont end

        local box = rect:new(self.pos.x, self.pos.y + self.vel.y * dt, self.size.x, self.size.y)

        local coll, rect = rect_collision(box,tile)
        if coll then
          self.vel.y = 0
          self.dir.y = 0

          if self.pos.y + self.size.y > rect.pos.y then
            self.pos.y = rect.pos.y - self.size.y
          end
        end

        ::cont::
      end
    end

    if key("a") then
      self.dir.x = -1
      self.vel.x = 500
    end

    if key("d") then
      self.dir.x = 1
      self.vel.x = 500
    end

    if key("space") then
      if self.vel.y < 10 and self.vel.y > -10 then
        self.vel.y =  -self.gravity * 3
      end
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
