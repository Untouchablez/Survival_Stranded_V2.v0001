--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')
local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')

local gcSpawned = false  -- Flag variable to track if the GC unit has been spawned
local gcSpawned2 = false  -- Flag variable to track if the GC unit has been spawned
local gcSpawned3 = false  -- Flag variable to track if the GC unit has been spawned
local gcSpawned4 = false  -- Flag variable to track if the GC unit has been spawned
local salvospawned1= false  -- Flag variable to track if the GC unit has been spawned
local salvospawned2 = false  -- Flag variable to track if the GC unit has been spawned
local mavor1 = false  -- Flag variable to track if the GC unit has been spawned
local mavor2 = false  -- Flag variable to track if the GC unit has been spawned
local yolo1 = false  -- Flag variable to track if the GC unit has been spawned
local yolo2 = false  -- Flag variable to track if the GC unit has been spawned
local arty1 = false  -- Flag variable to track if the GC unit has been spawned
local arty2 = false  -- Flag variable to track if the GC unit has been spawned
local arty3 = false  -- Flag variable to track if the GC unit has been spawned
local arty4 = false  -- Flag variable to track if the GC unit has been spawned

function OnTick()

    local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
        
    while true do
        -- Calculate remaining time inside the loop
        remainingMinutes = DefenceObject.GametimegoalFunction()
        LOG("Remaining Minutes: " .. tostring(remainingMinutes))

        if not gcSpawned then
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

        if not gcSpawned2 then
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
        if not gcSpawned3 then
            -------------- GC 2 START PATROL -------------
            local markerPath = { "patrolg1", "patrolg2", "patrolg3" }  -- Replace with the names of your markers in the desired patrol path
            local markerName = "landgate-3"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not gcSpawned3 then
                local gcType = "ual0401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local gc = CreateUnitHPR(gcType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                if gc then
                    -- Issue individual patrol orders to the GC for each position in the marker path
                    for _, marker in ipairs(markerPath) do
                        local pos = ScenarioUtils.MarkerToPosition(marker)
                        IssuePatrol({gc}, pos)
                    end

                    gcSpawned3 = true  -- Set the flag to indicate that the GC has been spawned
                end
            end
        end
        if not gcSpawned4 then
            -------------- GC 2 START PATROL -------------
            local markerPath = { "patrolg1", "patrolg2", "patrolg3" }  -- Replace with the names of your markers in the desired patrol path
            local markerName = "landgate-3"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not gcSpawned4 then
                local gcType = "ual0401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local gc = CreateUnitHPR(gcType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                if gc then
                    -- Issue individual patrol orders to the GC for each position in the marker path
                    for _, marker in ipairs(markerPath) do
                        local pos = ScenarioUtils.MarkerToPosition(marker)
                        IssuePatrol({gc}, pos)
                    end

                    gcSpawned4 = true  -- Set the flag to indicate that the GC has been spawned
                end
            end
        end

        if remainingMinutes == 44 then
            -------------- GC 2 START PATROL -------------
            local markerName = "salvo1"  -- Replace with the name of the marker where you want to spawn the unit
            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not salvospawned1 then
                local unitType = "xab2307"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local salvo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                if salvo then
                    salvospawned1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end
      
        if remainingMinutes == 44 then
            -------------- GC 2 START PATROL -------------
            local markerName = "salvo2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not salvospawned2 then
                local unitType = "xab2307"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local salvo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if salvo then
                    salvospawned2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase1"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not mavor1 then
                local unitType = "ueb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local mavor = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if mavor then
                    mavor1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase2"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not mavor2 then
                local unitType = "ueb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local mavor = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if mavor then
                    mavor2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 40 then
            --LOG("Executing nuke launch code...")
            local markerName = "enemybase3"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not yolo1 then
                local unitType = "xsb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local yolo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

                local area = Areas.PickRandomArea(Areas.enemynukearea)
                local attack = Areas.PickRandomPointInArea(area)            
                local army = "ARMY_ENEMY"
    
                if yolo then
                    yolo1 = true  -- Set the flag to indicate that the GC has been spawned
                    
                    ForkThread(function()
                        for i = 1, 20 do
                            local area = Areas.PickRandomArea(Areas.enemynukearea)
                            local attack = Areas.PickRandomPointInArea(area)          
                            yolo:GiveNukeSiloAmmo(1)
                            IssueNuke({yolo}, attack)
                            --LOG("Nuke command issued.")
                            WaitSeconds(5) -- Add a delay between nuke launches (optional)
                        end
                    end)
                end
            end
        end

        if remainingMinutes == 40 then
            local markerName = "enemybase4"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not yolo2 then
                local unitType = "xsb2401"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local yolo = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)

         
                local army = "ARMY_ENEMY"
    
                if yolo then
                    yolo2 = true  -- Set the flag to indicate that the GC has been spawned 
                    
                    ForkThread(function()
                        for i = 1, 20 do
                            local area = Areas.PickRandomArea(Areas.enemynukearea)
                            local attack = Areas.PickRandomPointInArea(area)          
                            yolo:GiveNukeSiloAmmo(1)
                            IssueNuke({yolo}, attack)
                            --LOG("Nuke command issued.")
                            WaitSeconds(5) -- Add a delay between nuke launches (optional)
                        end
                    end)
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase5"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty1 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if arty then
                    arty1 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase6"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty2 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if arty then
                    arty2 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase7"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty3 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if arty then
                    arty3 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        if remainingMinutes == 44 then
            local markerName = "enemybase8"  -- Replace with the name of the marker where you want to spawn the unit

            -- Get the position of the marker
            local spawnPos = ScenarioUtils.MarkerToPosition(markerName)

            -- Spawn the GC at the marker position if it hasn't been spawned already
            if not arty4 then
                local unitType = "uab2302"  -- Replace with the desired GC blueprint ID
                local armyIndex = "ARMY_ENEMY"  -- Replace with the desired army index (1 for player army)
                local arty = CreateUnitHPR(unitType, armyIndex, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
    
                if arty then
                    arty4 = true  -- Set the flag to indicate that the GC has been spawned 
                end
            end
        end

        WaitSeconds(1)
    end
end




