State_Title = {}
local TitleFriend = Object:extend()

function TitleFriend:new(x,y,color,w)
    self.x,self.y = x,y
    self.startx,self.starty = x,y
    self.img = Media:getImage("friend.png")
    self:setScale(w)

    self.color = color
end
function TitleFriend:setScale(w)
    self.w = w
    local iw,ih = self.img:getWidth( )

    self.scale = self.w/iw
end
function TitleFriend:draw()
    love.graphics.setColor(unpack(self.color))
    love.graphics.draw(self.img,self.x-self.w/2,self.y-self.w/2,0,self.scale,self.scale)
end


State_Title.friends = {}

function State_Title.enter(ps)
    State_Title.friendtween = flux.group()
    flux.to(Background,6,{lightness=0.8,huemult=0.6})
    local a = 100
    local colors = {{BLUECOLOR[1],BLUECOLOR[2],BLUECOLOR[3],a},{REDCOLOR[1],REDCOLOR[2],REDCOLOR[3],a}}
    local radius = 260
    local centerx,centery = love.graphics.getWidth()/2,love.graphics.getHeight()/2
    local fcount = 100
    for i=1,fcount do
        local x = math.cos(math.pi/fcount*i*2)*radius
        local y = math.sin(math.pi/fcount*i*2)*radius
        local f = TitleFriend(x+centerx,y+centery,colors[i%2+1],15+i%5)

        local function stween()
            State_Title.friendtween:to(f,5,{x=love.mouse.getX(),y=love.mouse.getY()}):after(f,5,{x=f.x,y=f.y}):oncomplete(stween)
        end
        stween()

        table.insert(State_Title.friends,f)
    end
end

function State_Title.update(dt)
    State_Title.friendtween:update(dt)
end

function State_Title.draw()
    for _,f in pairs(State_Title.friends) do
        f:draw()
    end

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
