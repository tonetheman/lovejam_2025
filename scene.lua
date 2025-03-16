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

function Scene:check_for_sprites(x,y)
    print("check for sprites in scene!",x,y)
    for k,v in pairs(self.sprites) do
        local xpos = v.xpos
        local ypos = v.ypos
        local w = v.w
        local h = v.h
        if x>=xpos and x <=xpos+w then
            if y>=ypos and y<ypos+h then
                print("hit")
                v.is_being_dragged = true
            end
        end
    end
end

return Scene