local accelerate = {}

function accelerate:left(obj, vel, max)
  if obj.vel.x <= max then
     obj.vel.x = max
  else
     obj.vel.x = obj.vel.x - vel
  end
end

function accelerate:right(obj, vel, max)
  if obj.vel.x <= (max - (2 * max)) then
     obj.vel.x = (max - (2 * max))
  else
     obj.vel.x = obj.vel.x + vel
  end
end

return accelerate
