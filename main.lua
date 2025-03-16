
--global
Object = require("classic")
img_loader = nil

local sm = nil
local main_scene = nil

local SceneManager = require("scene_manager")
local ImageLoader = require("image_loader")
local Sprite = require("sprite")
local Scene = require("scene")


function love.mousepressed(x,y,button,istouch,presses)
    sm:mousepressed(x,y)
end

function love.mousereleased(x, y, button, istouch, presses)
    sm:mousereleased()
end

function love.mousemoved(x, y, dx, dy, istouch)
    sm:mousemoved(x,y,dx,dy,istouch)
end

function love.load()
    -- global only once
    img_loader = ImageLoader()
    sm = SceneManager()

    -- not global
    main_scene = Scene("main")
    main_scene:add_sprite(Sprite("gf",100,100,64,64))
    main_scene:add_sprite(Sprite("bf",150,100,64,64))

    -- setup scene
    sm:add(main_scene)
    sm:set("main")
end

function love.update(dt)
    sm:update(dt)
end

function love.draw()
    sm:draw()
end

