State_Splash = {textfade=0}

State_Splash.text = [[This is a true story.

The events depicted in this game
took place in Minnesoata in 1987]]

local function switchtogame()
    states.switchState(State_Game)
end

function State_Splash.enter(ps)
    flux.to(State_Splash,2,{textfade=200}):after(State_Splash,2,{textfade=0}):delay(2):oncomplete(switchtogame)
end

function State_Splash.draw()
    love.graphics.setColor(60,60,60,State_Splash.textfade)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP-Semibold.ttf",30))
    love.graphics.printf(State_Splash.text,0,200,love.graphics.getWidth(),"center")
end
