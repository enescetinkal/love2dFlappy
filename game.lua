function loadGame()
    gameLost = false
    text = ""

    counter = 0

    world = love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64, true)

    love.audio.setVolume(1)
    bounceSound = love.audio.newSource("bounce.wav", "static")

    bg = love.graphics.newImage("bg.jpg")

    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function counterUpdate(dt)
    counter = counter + 1

    if (counter == 100) then
        -- Do something
    end

    if (counter % 100 == 0) then
        -- Do something every 100 frames
    end
end