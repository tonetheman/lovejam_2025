
local Object = require("classic")

local SceneManager = Object:extend()
function SceneManager:new()
    self.scene_list = {}
    self.current_scene = nil
end

function SceneManager:add(s)
    table.insert(self.scene_list,s)
end
function SceneManager:set(key)
    -- set this scene to be the current scene

end
function SceneManager:update(dt)
    if self.current_scene ~= nil then
        self.current_scene:update(dt)
    end
end
function SceneManager:draw()
    if self.current_scene ~= nil then
        self.current_scene:draw()
    end
end

local Scene = Object:extend()
function Scene:new(key)
    self.key = key
end
function Scene:update(dt)
end
function Scene:draw()
end


local sm = nil
local main_scene = nil


function love.load()
    sm = SceneManager()
    main_scene = Scene("main")
    sm:add(main_scene)
    sm:set("main")
    
end


function love.update(dt)
    sm:update(dt)
end


function love.draw()
    sm:draw()
end

