
local position = {}
local facing = {}

function setOrigin(position)
    position = {0, 0, 0}
    facing = {1, 0, 0}
    position = origin
    return position
end


function right()
    facing = {-facing[3], 0, facing[1]}
end

function left()
    local currentDirection = position.facing
    local newDirectionValue = currentDirection - 1
    if newDirectionValue == -1 then
        local direction = 3
    else
        local direction = newDirectionValue
    end
    position.facing = direction

end

function foward()

    if not turtle.detect() then
        turtle.forward()

    end
end