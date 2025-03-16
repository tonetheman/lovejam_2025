
--global
Object = require("classic")
img_loader = nil

local SceneManager = require("scene_manager")
local ImageLoader = require("image_loader")
local Sprite = require("sprite")
local Scene = require("scene")

local sm = nil
local main_scene = nil

function love.mousepressed(x,y,button,istouch,presses)
    print("pressed",x,y,button,istouch,presses)
    sm:check_for_sprites(x,y)
end

function love.mousereleased(x, y, button, istouch, presses)
    print("released",x,y)
    sm:clear_sprite_drags()
end

function love.mousemoved(x, y, dx, dy, istouch)
    sm:mousemoved(x,y,dx,dy,istouch)
end

function love.load()
    img_loader = ImageLoader()
    sm = SceneManager()
    main_scene = Scene("main")
    main_scene:add_sprite(Sprite("f",100,100,64,64))
    sm:add(main_scene)
    sm:set("main")
end

function love.update(dt)
    sm:update(dt)
end

function love.draw()
    sm:draw()
end

