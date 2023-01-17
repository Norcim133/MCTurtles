function forward()
    while not turtle.forward() do
        turtle.dig()
    end
end

function up()
    while not turtle.Up() do
        turtle.digUp()
    end
end

function down()
    while not turtle.Down() do
        turtle.digDown()
    end
end

function turnRight()
    turtle.turnRight()
end

function turnLeft()
    turtle.turnLeft()
end

function turnaround()
    turtle.turnRight()
    turtle.turnRight()
end

function back()
    turnaround()
    forward()
    turnaround()
end

function checkPlanar(ore)
    local success, data = turtle.inspect()
    if success then
        if data.name == ore then
            forward()
            checkChildren(ore)
            back()
        end
    end
end

function checkChildren(ore)

    children = {"forward", "right", "left", "up", "down"}

    for child in children do
        if child == "forward" then
            checkPlanar(ore)
        end

        if child == "right" then
            turnRight()
            checkPlanar(ore)
            turnLeft()
        end

        if child == "left" then
            turnLeft()
            checkPlanar(ore)
            turnRight()
        end

        if child == "up" then
            local success, data = turtle.inspectUp()
            if success then
                if data.name == ore then
                    up()
                    checkChildren(ore)
                    down()
                end
            end
        end

        if child == "down" then
            local success, data = turtle.inspectDown()
            if success then
                if data.name == ore then
                    down()
                    checkChildren(ore)
                    up()
                end
            end
        end


    end

end