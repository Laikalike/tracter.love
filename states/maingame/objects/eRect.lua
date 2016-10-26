-- Rectangle object, piggubacks off vec2 to construct a rectangle. Contains position and 2 dimensions of size.
local vec2 = require "states/maingame/tools/vec2"

local Rect = {}

function Rect:new(x,y,w,h)
  local rect = {}

  rect.pos = vec2:new(x or 0, y or 0)
  rect.size = vec2:new(w or 0, h or 0)

  function rect:midX()
    return self.pos.x + self.size.x/2
  end

  function rect:midY()
    return self.pos.y + self.size.y/2
  end

  function rect:midXY()
    return self:midX(),self:midY()
  end

  return rect
end

return Rect
