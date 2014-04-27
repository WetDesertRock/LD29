State_GameOver = {}
State_GameOver.text = "I don't know why I did it, but I couldn't take it anymore. After that day they carted me away, and here I am with you. The people here don't believe me, they say she never existed. You are the only one willing to listen to me."
State_GameOver.helptext = "Sorry, I pulled a Cohen Brothers, this isn't a true story. Every character and event is fictional."

function State_GameOver.enter(ps,fs)
    State_GameOver.tr = 0
    State_GameOver.tb = 0
    State_GameOver.bonus = 0

    flux.to(State_GameOver,2,{tb=fs.totalb*10})
    flux.to(State_GameOver,2,{tr=fs.totalr*10})
    flux.to(State_GameOver,3,{bonus=fs.bonus})
    flux.to(Background,3,{lightness=0.7,huemult=0.6})
end

function State_GameOver.mousepressed(x,y,button)
    if button == "l" or button == "r" then
        states.switchState(State_Title)
    end
end

function State_GameOver.draw()
    love.graphics.setColor(20,20,20,200)

    local tw = love.graphics.getWidth()/1.5
    local toff = (love.graphics.getWidth()-tw)/2

    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",20))
    love.graphics.printf(State_GameOver.text,toff,100,tw,"center")


    local w = love.graphics.getWidth()/4
    local off = (love.graphics.getWidth()-w)/2

    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",30))
    local self = State_GameOver
    love.graphics.setColor(BLUECOLOR[1],BLUECOLOR[2],BLUECOLOR[3],200)
    love.graphics.printf(tostring(math.floor(self.tb)),off,205,w,"right")
    love.graphics.setColor(REDCOLOR[1],REDCOLOR[2],REDCOLOR[3],200)
    love.graphics.printf(tostring(math.floor(self.tr)),off,240,w,"right")
    love.graphics.setColor(60,60,60,200)
    love.graphics.printf(tostring(math.floor(self.bonus)),off,275,w,"right")
    love.graphics.printf("+",off,257,w,"left")
    love.graphics.printf("------------",off,295,w,"right")
    love.graphics.printf(tostring(math.floor(self.tr+self.tb+self.bonus)),off,320,w,"right")


    love.graphics.setColor(60,60,60,180)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",16))
    love.graphics.printf(State_GameOver.helptext,toff,360,tw,"center")


    love.graphics.setColor(60,60,60,200)
    love.graphics.printf("Click the mouse to go back to the title.",toff,400,tw,"center")
end
