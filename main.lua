require("libraries/slam")
require("libraries/a-star")
Object = require("libraries/classic")
lume = require("libraries/lume")
Triangles = require("libraries/triangles")
flux = require("libraries/flux")

require("mediamanager")
require("nodes")
require("edges")
require("level")
require("friends")
require("scores")
require("game")
require("statements")

REDCOLOR = {200,100,600}
BLUECOLOR = {60,100,200}

currentstate = nil

function love.load()
    for i=0,10 do
        love.math.random();love.math.random();love.math.random();love.math.random()
    end

    Media = MediaManager()

    Background = Triangles:new():generate(love.graphics.getWidth(),love.graphics.getHeight(),30,10)
    Background.lightness = 1
    Background.saturation = 0.5
    Background.hueoff = love.math.random()
    Background.huemult = 0.4

    switchState(State_Game)

    makescreenshot = not love.filesystem.isFused( ) -- Lets try a timelapse for this whole LD, shall we?
    music = Media:getSound("music.ogg")
    music:setLooping(true)
    music:setVolume(0.7)
    -- music:play()
end

State_GameOver = {}

function State_GameOver.enter(ps,fs)
    State_GameOver.tr = 0
    State_GameOver.tb = 0
    State_GameOver.bonus = 0

    flux.to(State_GameOver,1,{tb=fs.totalb})
    flux.to(State_GameOver,1,{tr=fs.totalr})
    flux.to(State_GameOver,1.4,{bonus=fs.bonus})
end

function State_GameOver.update(dt)
    Background.hueoff = Background.hueoff+dt/20
    Background:colorize()
    flux.update(dt)
end

function State_GameOver.draw()
    Background:draw()
    love.graphics.setColor(60,60,60,200)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",96))
    love.graphics.printf("Game",0,100,love.graphics.getWidth(),"center")

    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",48))
    local w = love.graphics.getWidth()/4
    local off = (love.graphics.getWidth()-w)/2
    local self = State_GameOver
    love.graphics.setColor(unpack(BLUECOLOR),200)
    love.graphics.printf(tostring(math.floor(self.tb)),off,200,w,"right")
    love.graphics.setColor(unpack(REDCOLOR),200)
    love.graphics.printf(tostring(math.floor(self.tr)),off,240,w,"right")
    love.graphics.setColor(60,60,60,200)
    love.graphics.printf(tostring(math.floor(self.bonus)),off,280,w,"right")
    love.graphics.printf("+",off,280,w,"left")
    love.graphics.printf("------------",off,300,w,"right")
    love.graphics.printf(tostring(math.floor(self.bonus,self.tr+self.tb+self.bonus)),off,320,w,"right")
end

State_Game = {}

function State_Game.enter()
    game = Game(require("levelset"))
    game:resetLevel()
end

function State_Game.update(dt)
    require("libraries/lovebird").update(dt)
    Background.hueoff = Background.hueoff+dt/20
    Background:colorize()

    flux.update(dt)
    game:update(dt)
end

function State_Game.keypressed(key,isrepeat)
    -- if key == " " then
    --     game:flash()
    -- end
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
            local onode = game.currentlevel:findNode(x,y)
            if onode then
                act = game.currentlevel:toggleEdge(game.currentlevel.dragsnode,onode)
            end
            if act == "connect" then
                Media:getSound("connect.ogg"):play()
            elseif act == "disconnect" then
                Media:getSound("disconnect.ogg"):play()
            else
                Media:getSound("failconnect.ogg"):play()
            end
        end
        game.currentlevel.dragsnode = nil
    end
end

function State_Game.draw()
    Background:draw()

    game:draw()

    if makescreenshot == true then
        love.graphics.newScreenshot():encode(string.format("%d_auto.png",os.time()))
        makescreenshot = false
    end
end
