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
    