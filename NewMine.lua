require("OreSearch")
local returnSteps=0

local torch=0

for i=1, 100 do

    if forward() then
        print("Here")
        returnSteps = returnSteps + 1
        checkChildren(targetOres)
        while digUp() do
            print("Digging up")
        end
        if torch == 6 then
            turnLeft()
            turtle.placeUp() --Need to check for torch
            turnRight()
            torch=0
        end
    end

    torch = torch + 1
end

turnLeft()
turnLeft()

for j=1, returnSteps do
    if forward() then
        checkChildren(targetOres)
    end
    if torch == 6 then
        turnRight()
        turtle.placeDown() --Need to check for torch
        turnLeft()
        torch=0
    end
end

args = {...}
targetOres = (args[1])