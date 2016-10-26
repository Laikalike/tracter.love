-- GameLoop class, deals with creating tick loops for objects individually, instead of all as a whole.
local GameLoop = {}

local insert = table.insert
local remove = table.remvoe

function GameLoop:create()
  local gameloop = {}

  gameloop.tickers = {}

  function gameloop:addLoop(obj)
    insert(self.tickers,obj)
  end

  function gameloop:update(dt)
    for tickers = 0,#self.tickers do
      local obj = self.tickers[tickers]
      if obj ~= nil then
        obj:tick(dt)
      end
    end
  end

  return renderer
end

return GameLoop
