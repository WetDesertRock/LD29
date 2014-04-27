Game = Object:extend()

function Game:new(levelset)
    self.levels = levelset
    self.leveli = 1
    self.scores = Scores()
    self.fade = 0
    self.friendflux = flux.group()
    -- self:resetLevel()
end

function Game:update(dt)
    self.currentlevel:update(dt)
    self.scores:update(dt)
    self.friendflux:update(dt)
end

function Game:draw(levelset)
    self.currentlevel:draw()
    self.scores:draw(10,love.graphics.getHeight()-20)
    if self.fade ~= 0 then
        love.graphics.setColor(60,60,60,self.fade)
        love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
    end
end

function Game:winLevel()
    self.leveli = self.leveli +1
    if self.levels[self.leveli] == nil then
        local finalscores = self.scores:getFinal()
        states.switchState(State_GameOver,finalscores)
        return
    end
    self.scores:startNewLevel(self.levels[self.leveli].maxscore)
    self.currentlevel = Level(self.levels[self.leveli],self.scores:getPrevalence(),self.levels.text[self.leveli])
    Media:getSound("win.ogg"):play()
    self:flash()
end

function Game:flash()
    flux.to(self,0.25,{fade=255}):after(self,0.25,{fade=0})
end

function Game:resetLevel()
    self.currentlevel = Level(self.levels[self.leveli],self.scores:getPrevalence(),self.levels.text[self.leveli])
    self.scores:startNewLevel(self.currentlevel.maxscore,true)
end

function Game:addPoint(k)
    self.scores:addPoint(k)
    if self.scores:getCurrentScore() >= self.currentlevel.maxscore then
        self:winLevel()
    end
end
function Game:addBonus(k)
    self.scores:addBonus(k)
    local snd
    if k == 1 then
        snd = Media:getSound("bonusb.ogg")
    else
        snd = Media:getSound("bonusr.ogg")
    end
    snd:play():setVolume(0.6)
end
