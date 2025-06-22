require("bird")
require("game")
require("utils")

local pipes = {}
pipeSpeed = 100

function pipes:add(farx)
    local newPipe = {
        {
            x = farx,
            y = 0,
            xsize = 70,
            ysize = math.random(1, 400),
        },
        {
            x = farx,
            y = 400,
            xsize = 70,
            ysize = 0,
        },
    }
    newPipe[2].ysize = newPipe[1].ysize + 200
    newPipe[2].ysize = 600 - newPipe[2].ysize
    newPipe[2].y = 560 - newPipe[2].ysize

    pipes[#pipes + 1] = newPipe
end

function pipes:update(dt)
    for i = 1, #pipes do
        local pipe = pipes[i]
        
        pipe[1].x = pipe[1].x - pipeSpeed * dt
        pipe[2].x = pipe[2].x - pipeSpeed * dt
    end
end

function pipes:draw()
    setColor({51, 201, 51})
    for i = 1, #pipes do
        local pipe = pipes[i]
        
        love.graphics.rectangle("fill", pipe[1].x, pipe[1].y, pipe[1].xsize, pipe[1].ysize)
        love.graphics.rectangle("fill", pipe[2].x, pipe[2].y, pipe[2].xsize, pipe[2].ysize)
    end
end

function pipes:init(pipesN)
    for i = 1, pipesN do
        pipes:add(i * 500)
    end
end

return pipes