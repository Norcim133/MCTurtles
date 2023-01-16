function left()
    if turtle.turnLeft() then
        x = facing["x"]
        z = facing["z"]
        facing["x"] = -z
        facing["z"] = x
    end
end

function right()
    if turtle.turnRight() then
        x = facing["x"]
        z = facing["z"]
        facing["x"] = z
        facing["z"] = -x
    end
end

function forward()
    if turtle.forward() then
        newPos = position + facing
        position["x"] = newPos["x"]
        position["y"] = newPos["y"]
        position["z"] = newPos["z"]
    end
end

function back()
    if turtle.back() then
        newPos = position + facing
        postion["x"] = newPos["x"]
        position["y"] = newPos["y"]
        position["z"] = newPos["z"]

    end
end

facing = vector.new(1,0,0)
position = vector.new(0, 0, 0)

forward()