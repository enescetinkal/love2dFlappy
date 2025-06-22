require("utils")
require("bird")
require("ground")
require("game")
local pipes = require("newPipe")

function love.load()
    loadGame()
    
    if not bird.body then
        bird.body = love.physics.newBody(world, bird.x, bird.y, "dynamic")
        bird.shape = love.physics.newRectangleShape(bird.xsize / 2, bird.ysize / 2, bird.xsize, bird.ysize)
        bird.fixture = love.physics.newFixture(bird.body, bird.shape)
        bird.fixture:setUserData("bird")
    end

    pipes:init(1000)
end

function love.update(dt)
    world:update(dt)
    bird:update(dt)
    pipes:update(dt)
    
    if checkCollision(bird, ground) then
        gameLost = true
    end

    for i = 1, #pipes do
        local pipe = pipes[i]
        
        if checkCollision(bird, pipe[1]) or checkCollision(bird, pipe[2]) then
            gameLost = true
        end
    end

    if gameLost == true then
        bird.x = -math.huge
        love.audio.setVolume(0)
    end

end

function love.draw()
    setColor({255, 255, 255})
    love.graphics.draw(bg, 0, 0)

    bird:draw()
    pipes:draw()
    ground:draw()
end

function love.keypressed(key)
    bird:jump(key)
    
    if key == "escape" then
        love.event.quit()
    end
end
