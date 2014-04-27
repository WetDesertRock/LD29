State_Title = {}

function State_Title.enter(ps)
    flux.to(Background,6,{lightness=0.8,huemult=0.6})
end

function State_Title.draw()
    love.graphics.setColor(60,60,60,200)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",96))
    love.graphics.printf("Paranoia",0,100,love.graphics.getWidth(),"center")

    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",48))
    love.graphics.printf("Click the mouse to start",0,300,love.graphics.getWidth(),"center")
end

function State_Title.mousepressed(x,y,button)
    if button == "l" or button == "r" then
        states.switchState(State_Splash)
    end
end
