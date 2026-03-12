function love.load()
    player = {}
    player.x = 100
    player.y = 100
    player.width = 30
    player.height = 30
    player.speed = 200

    player.yVelocity = 0
    player.jumpHeight = -500
    player.gravity = 1500
    player.isGrounded = false

    floorY = 500
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + (player.speed * dt)
    elseif love.keyboard.isDown("left") then
        player.x = player.x - (player.speed * dt)
    end

    player.yVelocity = player.yVelocity + (player.gravity * dt)
    player.y = player.y + (player.yVelocity * dt)

    if player.y + player.height > floorY then
        player.y = floorY - player.height
        player.yVelocity = 0
        player.isGrounded = true
    else
        player.isGrounded = false
    end
end

function love.keypressed(key)
    if key == "space" or key == "up" then
        if player.isGrounded then
            player.yVelocity = player.jumpHeight
        end
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(0, floorY, love.graphics.getWidth(), floorY)

    love.graphics.setColor(0, 0.7, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end