require("game")
require("utils")

bird = {
    x = 100,
    y = 100,
    jumpPower = 50,
    xsize = 20,
    ysize = 20,
}

function bird:update(dt)
    self.x, self.y = self.body:getPosition()
    
    local dx, dy = self.body:getLinearVelocity()
    if math.abs(dy) > 300 then
        dy = dy +- 300
    end

    if gameLost == false then
        bird.x = 100
    end
end

function bird:draw()
    setColor({255, 255, 0})
    love.graphics.rectangle("fill", self.x, self.y, self.xsize, self.ysize)
end

function bird:jump(key)
    if key == "space" then
        self.body:applyLinearImpulse(0, -self.jumpPower)
        local clone_sfx = bounceSound:clone()
	    clone_sfx:play()
    end
end
