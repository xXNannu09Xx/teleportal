function  love.load()
    screenWidth = 800
    screenHeight = 600
    tableColor = {0, 0.5, 0.1}
end

function love.draw()
    love.graphics.clear(tableColor)
    love.graphics.printf( "Blackjack", 0, 300, 800, "center")
end 