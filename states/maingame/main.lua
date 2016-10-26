function love.load()
  days = 0
end

function love.update(dt)
  delta = dt * 69
  days = days + delta
end

function love.draw()
  love.graphics.print("Retrace.love placeholder build-thing")
  love.graphics.print(days .. " days until game is complete", 0, 32)
end
