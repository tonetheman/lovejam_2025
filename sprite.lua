
local Sprite = Object:extend()
function Sprite:new(key,xpos,ypos)
    self.image = img_loader.imgs[key]
    self.xpos = xpos
    self.ypos = ypos
end
function Sprite:draw()
    love.graphics.draw(self.image,self.xpos,self.ypos)
end



return Sprite
