State_Game = {}

function State_Game.enter()
    game = Game(require("levelset"))
    game:resetLevel()
    game:flash()
end

function State_Game.update(dt)
    require("libraries/lovebird").update(dt)
    game:update(dt)
end

function State_Game.keypressed(key,isrepeat)
    if key == "m" then
        local v = music:getVolume()
        if v == 0 then
            music:setVolume(0.7)
        else
            music:setVolume(0)
        end
    elseif key == "r" then
        game:resetLevel()
        game:flash()
    end
end

function State_Game.mousepressed(x,y,button)
    if button == "l" then
        game.currentlevel.dragsnode = game.currentlevel:findNode(x,y)
    end
end
function State_Game.mousereleased(x,y,button)
    if button == "l" then
        if game.currentlevel.dragsnode then
            local act = nil
            local onode = game.currentlevel:findNode(x,y,35)
            if onode then
                act = game.currentlevel:toggleEdge(game.currentlevel.dragsnode,onode)
            end
            if act == "connect" then
                Media:getSound("connect.ogg"):play():setVolume(0.7)
            elseif act == "disconnect" then
                Media:getSound("disconnect.ogg"):play():setVolume(0.7)
            else
                Media:getSound("failconnect.ogg"):play():setVolume(0.7)
            end
        end
        game.currentlevel.dragsnode = nil
    end
end

function State_Game.draw()
    game:draw()

    if makescreenshot == true then
        love.graphics.newScreenshot():encode(string.format("%d_auto.png",os.time()))
        makescreenshot = false
    end
end
