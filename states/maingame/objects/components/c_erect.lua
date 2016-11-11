local c_erect = {}

function c_erect:new()
  local erect = {}

  function erect:init(args)
    self.x = args[1] or 0
    self.y = args[2] or 0
    self.w = args[3] or 0
    self.h = args[4] or 0
  end

  function erect:tick()end
  function erect:draw()
    love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
  end

  return erect
end
return c_erect
