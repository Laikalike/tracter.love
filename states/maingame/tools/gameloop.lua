-- GameLoop class, deals with creating tick loops for objects individually, instead of all as a whole.
local GameLoop = {}

function GameLoop:load()
  self.tickers = {}
end

function GameLoop:addLoop(obj)
  table.insert(self.tickers,obj)
end

function GameLoop:update(dt)
  for i = 1,#self.tickers do
    local obj = self.tickers[i]
    obj:tick(dt)
  end
end

return GameLoop
