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
    -- TODO: draw grid

    for k,v in pairs(self.sprites) do
        v:draw()
    end
end

function Scene:mousepressed(x,y)
    for k,v in pairs(self.sprites) do
        local xpos = v.xpos
        local ypos = v.ypos
        local w = v.w
        local h = v.h
        if x>=xpos and x <=xpos+w then
            if y>=ypos and y<ypos+h then
                v.is_being_dragged = true
            end
        end
    end
end

function Scene:mousereleased()
    for k,v in pairs(self.sprites) do
        if v.is_being_dragged then
            v.is_being_dragged = false
        end
    end
end

function Scene:mousemoved(x,y,dx,dy,istouch)
    for k,v in pairs(self.sprites) do
        if v.is_being_dragged then
            v:move(x,y)
        end
    end
end

return Scene