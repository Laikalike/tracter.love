local accelerate = {}

function accelerate:left(dt, obj, vel, max)
  if obj.vel.x >= max then
    obj.vel.x = obj.vel.x - vel * dt
  else
    obj.vel.x = max
  end
end

function accelerate:right(dt, obj, vel, max)
  if obj.vel.x <= max then
    obj.vel.x = obj.vel.x + vel * dt
  else
    obj.vel.x = max
  end
end

return accelerate
