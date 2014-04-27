Friend = Object:extend()

function Friend:new(path,color,k)
    self.x,self.y = path[1]:getCenter()
    self.w = 30
    self.k = k
    self.img = Media:getImage("friend.png")
    local iw,ih = self.img:getWidth( )

    self.scale = self.w/iw
    self.pindex = 1
    self.curnode = path[1]
    self.path = path
    self.dead = false
    self:gotoNextNode()

    self.color = color
end

function Friend:gotoNextNode()
    flux.to(self.curnode,0.3,{scalemod=0.08}):after(self.curnode, 0.5, {scalemod=0})
    self.curnode:onFriendCollide(self)
    local function oncomplete()
        if self.curnode ~= self.path[#self.path] then
            self:gotoNextNode()
            local snd
            if self.k == 1 then
                snd = Media:getSound("hitnodeb.ogg")
            else
                snd = Media:getSound("hitnoder.ogg")
            end
            snd:play():setVolume(0.6)
        else
            flux.to(self.curnode,0.25,{scalemod=0.08}):after(self.curnode, 0.3, {scalemod=0})
            game.currentlevel:killFriend(self,self.k)
        end
    end

    local nn = self.path[self.pindex+1]
    local e = game.currentlevel:findEdge(self.curnode,nn)
    if e then
        e.canremove = false
        local gx,gy = nn:getCenter()
        game.friendflux:to(self,1,{x=gx,y=gy}):ease('linear'):oncomplete(oncomplete)
        self.curnode = nn
        self.pindex = self.pindex+1
    else
        game.currentlevel:killFriend(self,self.k)
    end
end

function Friend:draw()
    love.graphics.setColor(unpack(self.color))
    love.graphics.draw(self.img,self.x-self.w/2,self.y-self.w/2,0,self.scale,self.scale)
end
