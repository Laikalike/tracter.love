--Tile Manager class, deals with multi-dimensional arrays. Manages tiles with incredible glamour.
local tlm = {}

local width  = 128
local height = 128

local size = 16

function tlm:load()
  renderer:addRenderer(self)
  gameLoop:addLoop(self)

  self.tiles = {}
  for i = 1, height do
    self.tiles[i] = {}
  end
end

function tlm:tick(dt)

end

function tlm:draw()
  for i = 1, #self.tiles do
    for j = 1, #self.tiles[i] do
      local t = self.tiles[i][j]
      love.graphics.rectangle("fill",size * t.x - size, size * t.y - size, t.w, t.h)
    end
  end
end

function tlm:add(t)
  self.tiles[t.y][t.x] = t
end

return tlm
