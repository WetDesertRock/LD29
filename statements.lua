local currentstate = nil

local function callMethod(m,...)
    if currentstate == nil then return end
    if currentstate[m] then
        return currentstate[m](...)
    end
end

function switchState(s,...)
    callMethod("leave",s,...)
    currentstate = s
    callMethod("enter",s,...)
end

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
