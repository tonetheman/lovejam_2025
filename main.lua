
--global
Object = require("classic")
img_loader = nil

local SceneManager = require("scene_manager")
local ImageLoader = require("image_loader")
local Sprite = require("sprite")
local Scene = require("scene")





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

