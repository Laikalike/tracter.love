--Tile Manager class, deals with multi-dimensional arrays. Manages tiles with incredible glamour.
local Tlm = {}

local quad = love.graphics.newQuad
local quads =
{
--  quad(0, 0, 70, 70, 355, 70),
--  quad(71, 0, 70, 70, 355, 70),
--  quad(142, 0, 70, 70, 355, 70),
--  quad(213, 0, 70, 70, 355, 70),
--  quad(284, 0, 70, 70, 355, 70)
}

function gen_quads() --Tilesheet x/y, tilex/y + gap, gap
  for i = 1, 5 do
    table.insert(quads,quad(71*i-71,1,71,71,355,70))
  end
end

function tile(x,y,w,h,quad)
  local tile = {}

  tile.pos = require("states/maingame/tools/vec2"):new(x,y)
  tile.size = require("states/maingame/tools/vec2"):new(w,h)
  tile.quad = quad

  return tile
end

function Tlm:load()
  self.tiles = {}
  self.img = love.graphics.newImage("assets/tile1_ss.png")
  self.img:setFilter("nearest", "nearest")

  renderer:addRenderer(self)
end

function Tlm:draw()

  for layer = 1,#self.tiles do
    for i = 1,MAPWIDTH do
      for j = 1,MAPHEIGHT do

        if self.tiles[layer][i][j] ~= nil then
          local tile = self.tiles[layer][i][j]
          love.graphics.draw(self.img,tile.quad,tile.pos.x,tile.pos.y)
        end

      end
    end
  end
end

function Tlm:is_solid_at_pos(x,y)
  local solids = self.tiles[1]
  if solids[y][x] ~= nil then
    return true
  end
  return false
end

function Tlm:loadmap(mapname)
  local map = require("states/maingame/maps/"..mapname)
  MAPHEIGHT = map.height
  MAPWIDTH = map.width

  for layer = 1,#map.layers do
    self.tiles[layer] = {}
    for i = 1,map.height do
      self.tiles[layer][i] = {}
    end
  end

  for layer = 1,#map.layers do
    local data = map.layers[layer].data
    local prop = map.layers[layer].properties

    for y = 1,map.height do
      for x = 1, map.height do

        local index = ( y * map.height + ( x - 1 ) - map.width ) + 1

        if data[index] ~= 0 then

          local q = quads[data[index]]
          self.tiles[layer][y][x] = tile ( TILESIZE * x - TILESIZE, TILESIZE * y - TILESIZE, TILESIZE, TILESIZE, q)

        end

      end
    end
  end

end

function Tlm:destroy()

end

return Tlm
