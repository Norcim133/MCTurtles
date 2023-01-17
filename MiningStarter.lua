require("OreSearch")
local returnSteps=0

local torch=0

for i=1, 100 do

    if forward() then
        print("Here")
        returnSteps = returnSteps + 1
        checkChildren(targetOres)
        while turtle.digUp() do
            print("Digging")
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
    forward()
end

args = {...}
targetOres = (args[1])