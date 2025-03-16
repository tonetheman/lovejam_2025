local Scene = Object:extend()
function Scene:new(key)
    self.key = key
    self.data = {
        {1,1,0,0,1,1,},
        {0,0,0,0,1,1},
    }
    self.sprites = {}
    self.grid = {}
    for i=1,9 do
        self.grid[i] = {0,0,0,0,0,0,0,0,0,0}
    end

    -- get refernce to grid background
    self.gbimg = img_loader.imgs["bg_box"]
end

function Scene:add_sprite(s)
    -- snap to grid
    local xpos = s.xpos
    local ypos = s.ypos
    s.xpos = xpos-(xpos%64)
    s.ypos = ypos-(ypos%64)
    table.insert(self.sprites,s)
end

function Scene:update(dt)
end

function Scene:draw()
    -- draw grid
    for i=1,9 do
        for j=1,9 do
            local gval = self.grid[i][j]
            love.graphics.draw(self.gbimg,(i-1)*64,(j-1)*64)
        end
    end

    -- draw sprites
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
            
            -- TODO handle snap to grid here
            local xpos = v.xpos
            local ypos = v.ypos

            v:move(x,y)
        end
    end
end

return Scene