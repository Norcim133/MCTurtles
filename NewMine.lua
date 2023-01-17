require("CheckLists")

function forward()
    while not turtle.forward() do
        dig()
    end
    return true
end

function up()
    while not turtle.Up() do
        digUp()
    end
    return true
end

function down()
    while not turtle.down() do
        digDown()
    end
    return true
end

function turnRight()
    if turtle.turnRight() then
        return true
    else
        return false
    end
end

function turnLeft()
    if turtle.turnLeft() then
        return true
    else
        return false
    end
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

function canDig(blockData)
    if blockData.name == "forbidden_arcanus:stella_arcanum" then
        return false
    end
end

function dig()
    blockPresent, blockData = turtle.inspect()
    if canDig(blockData) then
        turtle.dig()
    else
        print("I am not supposed to dig here")
    end
end

function digUp()
    blockPresent, blockData = turtle.inspectUp()
    if canDig(blockData) then
        turtle.digUp()
    else
        print("I am not supposed to dig here")
    end
end

function digDown()
    blockPresent, blockData = turtle.inspectDown()
    if canDig(blockData) then
        turtle.digDown()
    else
        print("I am not supposed to dig here")
    end
end

function checkPlanar(targetOres)
    local success, data = turtle.inspect()
    blockName = data.name
    if success then
        if setContains(targetOres, blockName) then
            forward()
            checkChildren(targetOres)
            back()
        end
    end
end

function checkChildren(targetOres)

    children = {"forward", "right", "left", "up", "down"}

    for key, child in pairs(children) do
        if child == "forward" then
            checkPlanar(targetOres)
        end

        if child == "right" then
            turnRight()
            checkPlanar(targetOres)
            turnLeft()
        end

        if child == "left" then
            turnLeft()
            checkPlanar(targetOres)
            turnRight()
        end

        if child == "up" then
            local success, data = turtle.inspectUp()
            blockName = data.name
            if success then
                if setContains(targetOres, blockName) then
                    up()
                    checkChildren(targetOres)
                    down()
                end
            end
        end

        if child == "down" then
            local success, data = turtle.inspectDown()
            blockName = data.name
            if success then
                if setContains(targetOres, blockName) then
                    down()
                    checkChildren(targetOres)
                    up()
                end
            end
        end


    end

end

return {forward=forward, up=up, turnLeft=turnLeft, turnRight=turnRight, turnaround=turnaround, down=down, checkChildren=checkChildren, checkPlanar=checkPlanar, digUp=digUp, digDown=digDown, dig=dig, canDig=canDig}