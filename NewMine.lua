local returnSteps=0

local torch=0

for i=1, 100 do

    while turtle.dig() do
        print("Digging forward")
    end

    if turtle.forward() then
        returnSteps = returnSteps + 1
        while turtle.digUp() do
            print("Digging")
        end
        if torch == 6 then
            turtle.turnLeft()
            turtle.placeUp() --Need to check for torch
            turtle.turnRight()
            torch=0
        end
    end

    torch = torch + 1
end

turtle.turnLeft()
turtle.turnLeft()

for j=1, returnSteps do
    turtle.forward()
end