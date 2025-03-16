

local Object = require("classic")
local SceneManager = require("scene_manager")

--globals
img_loader = nil


local ImageLoader = Object:extend()
function ImageLoader:new()
    self.imgs = {}
    self.imgs["f"] = love.graphics.newImage("assets/runeGrey_rectangle_001.png")
end

local Sprite = Object:extend()
function Sprite:new(key,xpos,ypos)
    self.image = img_loader.imgs[key]
    self.xpos = xpos
    self.ypos = ypos
end
function Sprite:draw()
    love.graphics.draw(self.image,self.xpos,self.ypos)
end

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


local sm = nil
local main_scene = nil

function love.load()
    img_loader = ImageLoader()
    sm = SceneManager()
    main_scene = Scene("main")
    main_scene:add_sprite(Sprite("f",100,100))
    sm:add(main_scene)
    sm:set("main")
end


function love.update(dt)
    sm:update(dt)
end


function love.draw()
    sm:draw()
end

