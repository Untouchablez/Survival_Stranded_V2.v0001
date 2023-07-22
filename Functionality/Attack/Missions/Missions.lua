--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')

local gcSpawned = false  -- Flag variable to track if the GC unit has been spawned
local gcSpawned2 = false  -- Flag variable to track if the GC unit has been spawned

function OnTick()
    local unitSpawned = false  -- Flag variable to track if the unit has been spawned
    local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
 

    while true do
        -- Calculate remaining time inside the loop
        local remainingMinutes, remainingSeconds = DefenceObject.GametimegoalFunction()
        remainingSeconds = math.floor(remainingSeconds + 0.5) -- Round the remainingSeconds

        if remainingSeconds >= 60 then
            remainingMinutes = remainingMinutes + 1
            remainingSeconds = remainingSeconds - 60
        end

        if remainingMinutes == 42 and not gcSpawned then
            -------------- GC 2 START PATROL -------------
            local markerPath = { "patrol1", "patrol2", "patrol3" }  -- Replace with the names of your markers in the desired patrol path
            local markerName = "landgate-4"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not gcSpawned then
                local gcType = "ual0401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local gc = CreateUnitHPR(gcType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                if gc then
                    -- Issue individual patrol orders to the GC for each position in the marker path
                    for _, marker in ipairs(markerPath) do
                        local pos = ScenarioUtils.MarkerToPosition(marker)
                        IssuePatrol({gc}, pos)
                    end

                    gcSpawned = true  -- Set the flag to indicate that the GC has been spawned
                end
            end
        end

        if remainingMinutes == 43 and not gcSpawned2 then
            -------------- GC 2 START PATROL -------------
            local markerPath = { "patrol1", "patrol2", "patrol3" }  -- Replace with the names of your markers in the desired patrol path
            local markerName = "landgate-4"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not gcSpawned2 then
                local gcType = "ual0401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local gc = CreateUnitHPR(gcType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                if gc then
                    -- Issue individual patrol orders to the GC for each position in the marker path
                    for _, marker in ipairs(markerPath) do
                        local pos = ScenarioUtils.MarkerToPosition(marker)
                        IssuePatrol({gc}, pos)
                    end

                    gcSpawned2 = true  -- Set the flag to indicate that the GC has been spawned
                end
            end
        end
        WaitSeconds(1)
    end
end




