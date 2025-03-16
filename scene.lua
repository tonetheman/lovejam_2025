local Scene = Object:extend()
function Scene:new(key)
    self.key = key
    self.data = {
        {1,1,0,0,1,1,},
        {0,0,0,0,1,1},
    }
    self.sprites = {}
end
function Scene:add_sprite(s)
    table.insert(self.sprites,s)
end
function Scene:update(dt)
end
function Scene:draw()
    for k,v in pairs(self.sprites) do
        v:draw()
    end
end


return Scene