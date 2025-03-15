--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

function CheckIdleEnemyUnits()
    while true do
        WaitSeconds(60) -- Wait for 1 minute (adjust as needed)

        local units = GetUnitsInRect(Rect(0, 0, 1000, 1000)) -- Adjust the rectangle as per your map size
        local currentTime = GetGameTimeSeconds()

        for _, unit in units do
            local army = unit:GetArmy()
            if army == 1 then -- Assuming ARMY_ENEMY has the army index 1
                local lastCommandTime = unit:GetLastCommandTime()
                if currentTime - lastCommandTime > 300 then -- 300 seconds = 5 minutes
                    unit:Kill()
                end
            end
        end
    end
end
