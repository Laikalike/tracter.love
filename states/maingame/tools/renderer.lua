-- Renderer Class, deals with rendering frames in order thier layer position. Renders each layer, then the one on top.
local Renderer = {}

local numOfLayers = 5
local insert = table.insert
local remove = table.remvoe

function Renderer:create()
  local renderer = {}

  renderer.drawers = {}
  for i = 0,numOfLayers do
    renderer.drawers[i] = {}
  end

  function renderer:addRenderer(obj,layer)
    local l = layer or 0
    insert(self.drawers[l],obj)
  end

  function renderer:draw()

    for layer = 0,#self.drawers do
      for draw = 0,#self.drawers[layer] do
        local obj = self.drawers[layer][draw]
        if obj ~= nil then
          obj:draw()
        end
      end
    end
  end

  return renderer
end

return Renderer
