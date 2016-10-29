-- Objects manager module, to manage classes which are objects.
local OBM = {}

function OBM:load()
  self.objects = {}
  gameLoop:addLoop(self)
end

function OBM:tick(dt)
  for i = #self.objects,1,-1 do
    local obj = self.objects[i]
    if obj.remove then
      table.remove(self.objects,i)
    end
  end
end

function OBM:add(obj)
  obj:load()
  table.insert(self.objects,obj)
end

return OBM
