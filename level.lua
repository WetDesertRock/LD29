Level = Object:extend()

function Level:new(lt,prev)
    self.name = lt.name

    self.goaln = GoalNode(lt.goalnode[1],lt.goalnode[2],70)
    self.redn = StartNode(lt.rednode[1],lt.rednode[2],50,REDCOLOR,2)
    self.bluen = StartNode(lt.bluenode[1],lt.bluenode[2],50,BLUECOLOR,1)

    self.nodes = {self.goaln,self.redn,self.bluen}
    self.edges = {}
    self.friends = {}

    for _,p in ipairs(lt.nodes) do
        local n
        if p[3] ~= nil then
            n = BonusNode(p[1],p[2],50,p[3])
        else
            n = Node(p[1],p[2],50)
        end
        table.insert(self.nodes,n)
    end

    self.maxedgedist = lt.maxedgelen
    self.maxedges = lt.maxedges
    self.maxscore = lt.maxscore
    game.scores.maxscore = lt.maxscore
    game.scores.dimrate = lt.dimrate

    self.text = lt.text[prev]
    self.textbox = lt.textbox
    local font = Media:getFont("SegoeWP/SegoeWP.ttf",20)
    local _,lines = font:getWrap(self.text, lt.textbox[3])
    lt.textbox[4] = lines*font:getHeight()

    self.helptext = lt.helptext

    if lt.background ~= nil then
        local fluxmods = {}
        local cs = nil
        local cp = nil
        for k,v in pairs(lt.background) do
            if k == "cs" then
                cs = v
            elseif k == "cp" then
                cp = v
            else
                fluxmods[k] = v
            end
        end
        flux.to(Background,5,fluxmods)
        if cp~=nil or cs~=nil then
            Background:generate(love.graphics.getWidth(),love.graphics.getHeight(),cs,cp)
        end
    end
end

function Level:update(dt)
    for i,n in ipairs(self.nodes) do
        n:update(dt)
    end
end


function Level:draw()
    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",20))
    love.graphics.setColor(60,60,60,180)
    love.graphics.printf(self.text,self.textbox[1],self.textbox[2],self.textbox[3])
    if self.helptext then
        love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",18))
        love.graphics.setColor(100,100,100,180)
        love.graphics.printf(self.helptext,self.textbox[1],self.textbox[2]+self.textbox[4],self.textbox[3])
    end

    if self.dragsnode then
        local sx,sy = self.dragsnode:getCenter()
        local mx,my = love.mouse.getPosition( )
        local ex,ey = mx,my
        local d = lume.distance(sx,sy,mx,my)
        if d > self.maxedgedist then
            local angle = math.atan2(my-sy,mx-sx)
            ex,ey = math.cos(angle)*self.maxedgedist+sx,math.sin(angle)*self.maxedgedist+sy
        end
        love.graphics.setColor(60,80,60)
        love.graphics.setLineWidth(4)
        love.graphics.line(sx,sy,ex,ey)
    end
    for i,e in ipairs(self.edges) do
        e:draw()
    end
    for i,f in ipairs(self.friends) do
        f:draw()
    end
    for i,n in ipairs(self.nodes) do
        n:draw()
    end

    love.graphics.setFont(Media:getFont("SegoeWP/SegoeWP.ttf",24))
    love.graphics.setColor(60,60,60,150)
    love.graphics.print("\""..self.name.."\"",5,5)
end

function Level:findEdge(na,nb)
    if not na or not nb then
        return nil
    end
    for i,e in ipairs(self.edges) do
        if e.nodea ~= e.nodeb and ((e.nodea == na or e.nodeb == na) and (e.nodea == nb or e.nodeb == nb)) then
            return e,i
        end
    end
    return nil
end

function Level:addEdge(na,nb)
    local e = Edge(na,nb)
    table.insert(self.edges,e)
    return e
end

function Level:toggleEdge(na,nb)
    local retval = nil
    local e,i = self:findEdge(na,nb,25)
    if na == nb or na == nil or nb == nil then
        return nil
    end
    if e then
        if e.canremove then
            e:destroy()
            table.remove(self.edges,i)
            retval = "disconnect"
        end
    else
        if #self.edges >= self.maxedges then
            return nil
        end
        if lume.distance(na.x,na.y,nb.x,nb.y) > self.maxedgedist then
            return nil
        end
        if na:canAddEdge() and nb:canAddEdge() then
            self:addEdge(na,nb)
            retval = "connect"
        end
    end

    self:checkPaths()
    return retval
end

function Level:checkPaths()
    function valid_edge(node,neighbor)
        if self:findEdge(node,neighbor) then return true end
        return false
    end
    self.redn.path = astar.path(self.redn, self.goaln, self.nodes, true, valid_edge)
    self.bluen.path = astar.path(self.bluen, self.goaln, self.nodes, true, valid_edge)
end

function Level:killFriend(f,k)
    if f.curnode == self.goaln then
        game:addPoint(k)
    end
    for i,of in ipairs(self.friends) do
        if of == f then
            table.remove(self.friends,i)
        end
    end
end

function Level:makeFriend(n,c)
    local f = Friend(n.path,c,n.k)
    table.insert(self.friends,f)
end

function Level:findNode(x,y,maxdist)
    maxdist = maxdist or 50/2
    local closest = nil
    local closestdist = 0
    for _,n in ipairs(self.nodes) do
        local nx,ny = n:getCenter()
        local dist = lume.distance(nx,ny,x,y)
        if dist <= maxdist then
            if dist < closestdist or closest == nil then
                closest = n
                closestdist = dist
            end
        end
    end

    return closest,closestdist
end
