require("libraries/slam")
require("libraries/a-star")
Object = require("libraries/classic")
lume = require("libraries/lume")
Triangles = require("libraries/triangles")
flux = require("libraries/flux")

states = require("statements")
require("mediamanager")
require("nodes")
require("edges")
require("level")
require("friends")
require("scores")
require("game")
require("state_game")
require("state_over")
require("state_title")
require("state_splash")

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

    states.switchState(State_Title)
    states.setGlobalState(State_Global)

    makescreenshot = not love.filesystem.isFused( ) -- Lets try a timelapse for this whole LD, shall we?
    music = Media:getSound("music.ogg")
    music:setLooping(true)
    music:setVolume(0.7)
    music:play()
end

State_Global = {}

function State_Global.keypressed(key,isrepeat)
    if key == "m" then
        local v = music:getVolume()
        if v == 0 then
            music:setVolume(0.7)
        else
            music:setVolume(0)
        end
    end
end

function State_Global.update(dt)
    Background.hueoff = Background.hueoff+dt/20
    Background:colorize()
    flux.update(dt)
end
function State_Global.draw()
    Background:draw()
end
