Edge = Object:extend()

function Edge:new(na,nb)
    self.nodea,self.nodeb = na,nb
    self.nodea.edgecount = self.nodea.edgecount+1
    self.nodeb.edgecount = self.nodeb.edgecount+1
    self.canremove = true
end

function Edge:destroy()
    self.nodea.edgecount = self.nodea.edgecount-1
    self.nodeb.edgecount = self.nodeb.edgecount-1
end

function Edge:draw()
    local cax,cay = self.nodea:getCenter()
    local cbx,cby = self.nodeb:getCenter()
    if self.canremove then
        love.graphics.setColor(20,70,20,170)
    else
        love.graphics.setColor(20,20,20,190)
    end
    love.graphics.setLineWidth(7)
    love.graphics.line(cax,cay,cbx,cby)
end
