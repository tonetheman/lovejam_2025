

local ImageLoader = Object:extend()
function ImageLoader:new()
    self.imgs = {}
    self.imgs["f"] = love.graphics.newImage("assets/runeGrey_rectangle_001.png")
end


return ImageLoader