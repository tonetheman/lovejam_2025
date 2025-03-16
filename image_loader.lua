

local ImageLoader = Object:extend()
function ImageLoader:new()
    self.imgs = {}
    self.imgs["gf"] = love.graphics.newImage("assets/runeGrey_rectangle_001_64x64.png")
    self.imgs["bf"] = love.graphics.newImage("assets/runeBlue_rectangle_001_64x64.png")
    self.imgs["bg_box"] = love.graphics.newImage("assets/white_grid_outline_64x64.png")
end


return ImageLoader