MediaManager = Object:extend()

function MediaManager:new()
    self.graphics = {}
    self.fonts = {}
    self.sounds = {}
end

function MediaManager:getImage(imagepath)
    local ipath = "media/graphics/" .. imagepath
    if self.graphics[ipath] == nil then
        self.graphics[ipath] = love.graphics.newImage(ipath)
    end
    return self.graphics[ipath]
end

function MediaManager:getFont(path,size)
    local path = "media/fonts/"..path
    local fpath = tostring(size)..path
    if self.fonts[fpath] == nil then
        self.fonts[fpath] = love.graphics.newFont( path,size )
    end
    return self.fonts[fpath]
end

function MediaManager:getSound(path,k)
    k = k or "stream"
    local path = "media/sounds/"..path
    local sid = path..tostring(k)
    if self.sounds[sid] == nil then
        self.sounds[sid] = love.audio.newSource( path,k )
    end
    return self.sounds[sid]
end
