local Renderer = require "states/maingame/tools/renderer"
local GameLoop = require "states/maingame/tools/gameLoop"

local rect     = require "states/maingame/objects/eRect"
local entity   = require "states/maingame/objects/entity"

function load()
  GameLoop:load()
end

function love.update(dt)
  GameLoop:update(dt)
end

function love.draw()

end
