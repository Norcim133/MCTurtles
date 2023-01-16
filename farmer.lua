function harvest()
    a, plant = turtle.inspectDown()

    if a then

        plantAge = plant.state.age

        matureAge = 7

        if plant.name == "minecraft:beetroots" then
            matureAge = 3

        end

        if plantAge == matureAge then
            print("It's ready!")
            turtle.digDown()
            turtle.placeDown()
        else
            print("Not ready")
        end
    else
       turtle.placeDown()
    end
end

function newRow()
    if lastTurn == "left" then
        turtle.turnRight()
        free = turtle.forward()
        if free == true then
            turtle.turnRight()
            lastTurn = "right"
        else
            turtle.turnRight()
            lastTurn="left"
        end
    else
        turtle.turnLeft()
        free = turtle.forward()
        if free == true then
            turtle.turnLeft()
            lastTurn = "left"
        else
            turtle.turnLeft()
            lastTurn = "right"
        end
    end
end


function checkAndMove()
    if turtle.detect() then
        newRow()
    end
end

function doMove()
    harvest()
    checkAndMove()
    harvest()
    checkAndMove()
    turtle.forward()

end

--Above is for reference
lastTurn = "right"

while true do
    doMove()
end
