local mineSize = 10
local stepSize = 3

function branch(side,touch)
    turtle.dig()
    
    turtle.up()
    turtle.dig()
    
    turtle.up()
    turtle.dig()
    
    turtle.up()
    turtle.dig()
    if touch == true then
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.back()
        turtle.select(2)
        turtle.place()
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.forward()
    else
    
    end
    
    turtle.down()
    turtle.down()
    if touch == false then
        turtle.forward()
    end
    if side == "left" then    
        turtle.turnLeft()
    else
        turtle.turnRight()
    end
    turtle.dig()
    turtle.forward()
    turtle.dig()
    
    turtle.back()
    if side == "left" then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end
    turtle.down() 
end
function path(size)
    local pathSize = 4
    local count = 1
    local turns = 1
    local side = "left"
    while count <= (size * pathSize) do
        local t = false
        if (count-1) % size == 0 then
            t = true
        end
        branch(side,t)
        if count % size == 0 then
            if turns == 1 then
                turtle.turnRight()
            elseif (turns == 2) or (turns == 3) then
                turtle.turnLeft()
                side = "right"
            else
                turtle.turnRight()
                turns = 0
                side = "left"
            end
            turns = turns + 1
        end        
        count = count + 1
    end
end

turtle.refuel()

for i=1,mineSize do
    path(stepSize)
end