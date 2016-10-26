-- Vec2 class, creates tables with an x and a y value, and a function for moving them.

local Vec2 = {}

function Vec2:new(x,y)
  local vec2 = {}

  vec2.x = x or 0
  vec2.y = y or 0

  function vec2:move(nx, ny, dt)
    local delta = dt or 1
    self.x = self.x + nx * delta
    self.y = self.y + ny * delta
  end

  return vec2
end

return Vec2
