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
    if love.keyboard.isDown('d') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed * dt)
        end
    elseif love.keyboard.isDown('a') then
        if player.x > 0 then
            player.x = player.x - (player.speed * dt)
        end
    end

    -- Vertical Movement (Jumping)
    if love.keyboard.isDown('space') then
        if player.y + player.img:getHeight() >= player.ground then
            player.y_velocity = player.jump_height
        end
    end

    -- Apply Physics
    if player.y + player.img:getHeight() < player.ground or player.y_velocity < 0 then
        player.y_velocity = player.y_velocity + (player.gravity * dt)
        player.y = player.y + (player.y_velocity * dt)
    end

    if player.y + player.img:getHeight() > player.ground then
        player.y_velocity = 0
        player.y = player.ground - player.img:getHeight()
    end
end

function love.draw()
    -- Draw Platform
    love.graphics.setColor(1, 1, 1) 
    love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

    -- Draw Player
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(player.img, player.x, player.y)
end