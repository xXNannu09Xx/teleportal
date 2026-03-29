function love.load()
    -- Platform setup
    platform = {
        {x = 50, y = 400, width = 200, height = 20},
        {x = 300, y = 300, width = 200, height = 20},
        --ground
        {x = 0, y = 550, width = 800, height = 20}, 
    }
    -- Player setup
    player = {
        x = 100,
        y = 300,
        width = 32,
        height = 32,
        speed = 300,
        jumpSpeed = -600,
        velocityY = 0,
        onGround = false
    }

    gravity = 1500

end 

function love.update(dt)
    -- Horizontal Movement
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        player.x = player.x + (player.speed * dt)
    elseif love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        player.x = player.x - (player.speed * dt)
    end

    -- Vertical Movement (Jumping)
    player.velocityY = player.velocityY + gravity * dt
    player.y = player.y + player.velocityY * dt
    player.onGround = false

    for _, platform in ipairs(platform) do
        if checkCollision(player, platform) then
            if player.velocityY > 0 and player.y + player.height - player.velocityY * dt <= platform.y then
                player.y = platform.y - player.height
                player.velocityY = 0
                player.onGround = true
            end
        end
    end

    if (love.keyboard.isDown('space') or love.keyboard.isDown('w') or love.keyboard.isDown('up')) and player.onGround then
        player.velocityY = player.jumpSpeed
        player.onGround = false
    end

    if player.y > 600 then
        player.y = 300
        player.velocityY = 0
    end

end

function love.draw()
    love.graphics.setColor(1,1,1)
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    for _, platform in ipairs(platform) do
        love.graphics.rectangle("fill", platform.x, platform.y, platform.width, platform.height)
    end
end

function checkCollision(a, b)
    return a.x < b.x + b.width and
           a.x + a.width > b.x and
           a.y < b.y + b.height and
           a.y + a.height > b.y
end