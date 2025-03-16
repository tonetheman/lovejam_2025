

local SceneManager = Object:extend()
function SceneManager:new()
    self.scene_list = {}
    self.current_scene = nil
end

function SceneManager:add(s)
    self.scene_list[s.key]=s
    -- table.insert(self.scene_list,s)
end

function SceneManager:set(key)
    -- set this scene to be the current scene
    for k,v in pairs(self.scene_list) do
        print("key",k)
        if k==key then
            -- TODO let the current_scene
            -- have a chance to close things
            -- first
            -- self.current_scene.stop()
            self.current_scene = v
        end
    end
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

function SceneManager:mousepressed(x,y)
    if self.current_scene ~= nil then
        self.current_scene:mousepressed(x,y)
    end
end

function SceneManager:mousereleased()
    self.current_scene:mousereleased()
end

function SceneManager:mousemoved(x,y,dx,dy,istouch)
    self.current_scene:mousemoved(x,y,dx,dy,istouch)
end

return SceneManager