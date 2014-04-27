Node = Object:extend()

function Node:new(x,y,w)
    self.x,self.y,self.w = x,y,w
    self.img = Media:getImage("basicnode.png")
    self.iw = self.img:getWidth( )
    self.scale = w/self.iw
    self.scalemod = 0
    self.edgecount = 0
    self.maxedges = 3
end

function Node:update(dt)
end

function Node:draw(color)
    if not color then
        love.graphics.setColor(255,255,255,255)
    else
        love.graphics.setColor(unpack(color))
    end
    local woff = self.w-((self.scale+self.scalemod)*self.iw)
    love.graphics.draw(self.img,self.x+woff/2,self.y+woff/2,0,self.scale+self.scalemod,self.scale+self.scalemod)
end

function Node:onFriendCollide(f)
end

function Node:getCenter()
    return self.x+self.w/2,self.y+self.w/2
end

function Node:canAddEdge()
    return self.maxedges>self.edgecount
end

BonusNode = Node:extend()
function BonusNode:new(x,y,w,k)
    Node.new(self,x,y,w)
    self.img = Media:getImage("bonusnode.png")
    self.k = k
end

function BonusNode:draw()
    local c = {BLUECOLOR,REDCOLOR,{100,100,100,255}}
    c = c[self.k]
    Node.draw(self,c)
end

function BonusNode:onFriendCollide(f)
    if self.k ~= 3 then
        game:addBonus(self.k)
        self.k = 3
    end
end


GoalNode = Node:extend()

function GoalNode:new(x,y,w)
    Node.new(self,x,y,w)
    self.img = Media:getImage("goalnode.png")
    self.maxedges = 1
end

StartNode = Node:extend()
function StartNode:new(x,y,w,color,k)
    Node.new(self,x,y,w)
    self.color = color
    self.k = k
    self.img = Media:getImage("basicnode.png")
    self.psys = love.graphics.newParticleSystem( Media:getImage("particle.png"), 200 )
    self.psys:setAreaSpread("uniform",0,0)
    self.psys:setEmissionRate(100)
    self.psys:setSpread(5)
    self.psys:setParticleLifetime(0.2,0.8)
    self.psys:setColors(unpack(self.color))
    self.psys:setSpread(360)
    self.psys:setSpeed(40)
    self.psys:setSizes(0.1,0.4)
    self.psys:setPosition(self:getCenter())
    self.path = nil

    self.pulserate = 1.5
    self.nextpulse = 0

    self.maxedges = 2
end

function StartNode:update(dt)
    Node.update(self,dt)
    self.psys:update(dt)

    self.nextpulse = self.nextpulse - dt
    if self.nextpulse <= 0 then
        self:emitFriend()
        self.nextpulse = self.pulserate
    end
end

function StartNode:emitFriend()
    self.psys:emit(100)
    if self.path then
        game.currentlevel:makeFriend(self,self.color,self.k)
        Media:getSound("makefriend.ogg"):play()
    end
end

function StartNode:draw()
    love.graphics.draw(self.psys,0,0)
    Node.draw(self)
end
