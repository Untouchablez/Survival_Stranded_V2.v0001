--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')

function UpdateGameTimeObjective()
    local previousTextID = nil
    while true do
        -- Get the remaining time
        local remainingMinutes, remainingSeconds = DefenceObject.GametimegoalFunction()
        local remainingTimeFormatted = string.format("%02d:%02d", remainingMinutes, remainingSeconds)
        
        local text = 'Goal: ' .. remainingTimeFormatted .. ' Left!'
               

        -- Clear the previous text if it exists
        if previousTextID then
            KillThread(previousTextID)
            previousTextID = nil
        end

        -- Display the new text
        previousTextID = ForkThread(function()
            -- Print new text
            PrintText("", 30, 'ffffffff', -0, 'centertop')
            PrintText("", 30, 'ffffffff', -0, 'centertop')
            PrintText(text, 30, 'ffffffff', 0, 'centertop')
            WaitSeconds(3.0)

            -- Clear the text by printing empty lines or overwriting with spaces
            for i = 1, 5 do
                PrintText("", 30, 'ffffffff', 0, 'centertop') -- Print empty lines
            end

            previousTextID = nil
        end)

        WaitSeconds(60)
    end
end






