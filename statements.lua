local states = {}

states.currentstate = nil
states.globalstate = nil

local function callMethod(m,...)
    if states.globalstate and states.globalstate[m] then
        states.globalstate[m](...)
    end
    if states.currentstate == nil then return end
    if states.currentstate[m] then
        states.currentstate[m](...)
    end
end

local function switchState(s,...)
    callMethod("leave",s,...)
    states.currentstate = s
    callMethod("enter",s,...)
end

local function setGlobalState(s)
    states.globalstate = s
end

states.setGlobalState = setGlobalState
states.switchState = switchState

function love.update(...)
    callMethod("update",...)
end

function love.mousepressed(...)
    callMethod("mousepressed",...)
end
function love.mousereleased(...)
    callMethod("mousereleased",...)
end
function love.keypressed(...)
    callMethod("keypressed",...)
end

function love.draw(...)
    callMethod("draw",...)
end

return states
