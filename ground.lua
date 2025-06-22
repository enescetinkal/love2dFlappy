require("utils")

ground = {
    x = 0,
    y = 560,
    xsize = 800,
    ysize = 40,
}

function ground:draw()
    setColor({102, 51, 0})
    love.graphics.rectangle("fill", self.x, self.y, self.xsize, self.ysize)
end
