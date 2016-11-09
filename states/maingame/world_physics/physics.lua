local floor = math.floor
require "states/maingame/tools/camera"
require "states/maingame/tools/physics_helper"
local rect = require "states/maingame/objects/eRect"

function physics_init(obj,gravity)
  obj.on_ground = false
  obj.gravity   = gravity or 500
end

function physics_gravity(obj,dt)
  obj.vel.y = obj.vel.y + (obj.gravity * dt * 10)
  obj.dir.y = 1
end

function physics_jump(obj)
  if obj.vel.y < 10 and obj.vel.y > -10 and obj.on_ground then
    obj.vel.y =  -obj.gravity * 3
    obj.on_ground = false
  end
end

function physics_update(obj,tiles,dt)
  if dt >= 0.2 then return end
  local x = floor(obj.pos.x / 70) - 1
  local y = floor(obj.pos.y / 70) - 1
  local w = 4
  local h = 4

  if x < 1 then x = 1 end
  if y < 1 then y = 1 end

  for i = y,y+h do
    for j = x,x+w do

      if i > MAPHEIGHT then i = MAPHEIGHT end
      if j > MAPWIDTH then i = MAPHEIGHT end

      local tile = tiles[i][j]
      if tile == nil then goto cont end


      local box = rect:new(obj.pos.x + ( obj.vel.x * dt * obj.dir.x ) , obj.pos.y + ( obj.vel.y * dt ) , obj.size.x , obj.size.y )

      local coll, rect = rect_collision(box,tile)
      if coll then
        obj.vel.y = 0
        obj.dir.y = 0


        if obj.pos.y + obj.size.y / 2 < rect.pos.y + rect.size.y / 2 then

          if box.pos.y + box.size.y > rect.pos.y and
             obj.pos.y + obj.size.y < rect.pos.y + 35 then

            obj.on_ground = true
            obj.pos.y = rect.pos.y - obj.size.y
          end

        else
          if obj.pos.y > rect.pos.y + rect.size.y - 35 then
            obj.vel.y = 0
            obj.pos.y = rect.pos.y + rect.size.y + 1

            goto skip_x
          end
        end



        if obj.pos.x + obj.size.x / 2 < rect.pos.x + rect.size.x  / 2 then

          if box.pos.x + box.size.x > rect.pos.x and
             obj.pos.y + obj.size.y > rect.pos.y then

            obj.vel.x = 0
            obj.dir.x = 0

            obj.pos.x = rect.pos.x - obj.size.x
          end


        else

          if box.pos.x < rect.pos.x + rect.size.x and
             obj.pos.y + obj.size.y > rect.pos.y then

            obj.vel.x = 0
            obj.dir.x = 0

            obj.pos.x = rect.pos.x + rect.size.x
          end

        end


        ::skip_x::
      end

      ::cont::
    end
  end
end
