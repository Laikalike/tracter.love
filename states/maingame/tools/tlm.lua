--Tile Manager class, deals with multi-dimensional arrays. Manages tiles with incredible glamour.
local Tlm = {}

local quad = love.graphics.newQuad
local quads =
{
  quad(0, 0, 70, 70, 355, 70),
  quad(71, 0, 70, 70, 355, 70),
  quad(142, 0, 70, 70, 355, 70),
  quad(213, 0, 70, 70, 355, 70),
  quad(284, 0, 70, 70, 355, 70)
}

function tile(x,y,w,h,quad)
  local tile = {}

  tile.pos = require("states/maingame/tools/vec2"):new(x,y)
  tile.size = require("states/maingame/tools/vec2"):new(w,h)
  tile.quad = quad

  return tile
end

function Tlm:load()
  self.tiles = {}
  self.img = love.graphics.newImage("states/maingame/assets/tileset_placeholder.png")
  self.img:setFilter("nearest", "nearest")

  renderer:addRenderer(self)
end

function Tlm:draw()
  for i = 1,#self.tiles do
    for j = 1,#self.tiles do

      if self.tiles[i][j] ~= nil then
        local tile = self.tiles[i][j]
        love.graphics.draw(self.img,tile.quad,tile.pos.x,tile.pos.y)
      end

    end
  end
end

function Tlm:loadmap(mapname)
  local map = require("states/maingame/assets/maps/"..mapname)

  for i = 1,map.height do self.tiles[i] = {} end

  for layer = 1,#map.layers do
    local data = map.layers[layer].data
--    local prop = map.layers[prop].data

    for y = 1,map.height do
      for x = 1,map.width do

        local index = (y * map.height + (x + 1) - map.width) - 1

        if data[index] ~= 0 then
          local q = quads[data[index]]
          self.tiles[y][x] = tile(70 * x - 70, 70 * y - 70, 70, 70, q)

        end

      end
    end
  end
end

function Tlm:destroy()

end

return Tlm
