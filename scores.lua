Scores = Object:extend()

local function combinearrays(a1,a2)
    retarray = {}
    for i,v in ipairs(a1) do
        retarray[i] = v+a2[i]
    end
    return retarray
end

function Scores:new()
    self.totalscore = {0,0} -- blue,red
    self.currentscore = {0,0} -- blue,red
    self.currentbonus = 0
    self.displaybonus = 0
    self.totalbonus = 0
    self.maxscore = 10
    self.fillamt = 2
    self.dimrate = 3
    self.w = 400
end

function Scores:addPoint(kind)
    self.currentscore[kind] = self.currentscore[kind]+1
    if self.currentscore[1]+self.currentscore[2] == self.maxscore then
        self.fillamt = 2
    else
        -- local fa = ((self.currentscore[1]+self.currentscore[2])/self.maxscore)*self.w
        -- flux.to(self,0.5,{fillamt=fa})
    end
    -- self.fillamt = fa
end

function Scores:getPrevalence()
    if math.max(unpack(self.totalscore)) == self.totalscore[1] then
        return 1
    else
        return 2
    end
end

function Scores:getFinal()
    self.totalscore = combinearrays(self.currentscore,self.totalscore)
    self.totalbonus = self.totalbonus+self.currentbonus

    local retdict = {}
    retdict.totalb = self.totalscore[1]
    retdict.totalr = self.totalscore[2]
    retdict.bonus = self.totalbonus
    return retdict
end

function Scores:addBonus(kind)
    local bonus
    if kind == self:getPrevalence() then
        bonus = 5
    else
        bonus = 15
    end

    self.currentbonus = self.currentbonus+bonus
    flux.to(self,0.5,{displaybonus=self.currentbonus})
end

function Scores:getCurrentScore()
    return self.currentscore[1]+self.currentscore[2]
end

function Scores:startNewLevel(maxscore,reset)
    if not reset then
        self.totalscore = combinearrays(self.currentscore,self.totalscore)
        self.totalbonus = self.totalbonus+self.currentbonus
    end
    flux.to(self,0.6,{fillamt=2})
    self.currentscore = {0,0} -- blue,red
end

function Scores:update(dt)
    self.currentscore[1] = math.max(0,self.currentscore[1]-dt/self.dimrate)
    self.currentscore[2] = math.max(0,self.currentscore[2]-dt/self.dimrate)
end

function Scores:draw(x,y)
    love.graphics.setColor(20,20,20,200)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",14))
    love.graphics.print("Progress:",x,y-20)

    self.fillamt = ((self.currentscore[1]+self.currentscore[2])/self.maxscore)*self.w
    love.graphics.setLineWidth(2)
    love.graphics.setColor(100,100,100)
    love.graphics.rectangle("fill",x,y,self.w,15)
    love.graphics.setColor(100,160,100)
    love.graphics.rectangle("fill",x,y,self.fillamt,15)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line",x,y,self.w,15)

    love.graphics.setColor(60,60,60,200)
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",24))
    love.graphics.print("Bonus: "..tostring(math.floor(self.displaybonus)),x+self.w+10,y-11)
end
