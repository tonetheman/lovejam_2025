
local Sprite = Object:extend()

function Sprite:new(key,xpos,ypos,w,h)
    self.image = img_loader.imgs[key]
    self.xpos = xpos
    self.ypos = ypos
    self.w = w
    self.h = h
    self.is_being_dragged = false
end


function Sprite:move(xpos,ypos)
    self.xpos = xpos
    self.ypos = ypos
end

function Sprite:draw()
    love.graphics.draw(self.image,self.xpos,self.ypos)
end

return Sprite
