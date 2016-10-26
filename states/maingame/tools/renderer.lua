-- Renderer Class, deals with rendering frames in order thier layer position. Renders each layer, then the one on top.
local Renderer = {}

local numLayers = 5

function Renderer:load()
  self.tickers = {}
  for i = 1,numLayers do
    self.renderers[i] = {}
  end
end

function Renderer:addRenderer(obj, layer)
  local l = layer or 3
  table.insert(self.renderers,obj)
end

function Renderer:update(dt)
  for layer = 1,#self.renderers do
    for i = 1,#self.renderers[layer] do
      local obj = self.renderers[layer][i]
      obj:tick(dt)
    end
  end
end

return GameLoop
