-- Vec2 class, creates tables with an x and a y value, and a function for moving them.

local Vec2 = {}

function Vec2:new(x,y)
  local vec2 = {}

  vec2.x = x or 0
  vec2.y = y or 0

  function vec2:move(nx, ny)
    local delta = dt or 1
    self.x = self.x + nx
    self.y = self.y + ny
  end

  function vec2:unpack()
  	return self.x, self.y
  end

  function vec2:tostring()
  	return "("..tonumber(self.x)..","..tonumber(self.y)..")"
  end

  return vec2
end

return Vec2
