--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local Utilities = import('/lua/utilities.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')
local GatePlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/GatePlatoons.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local NavyPlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/NavyPlatoons.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')

function OnStart()
    local r = Utilities.GetRandomInt(1, 4)
    local gateFaction
    local armies = ListArmies()
    UnitRevealer = import('/maps/survival_stranded_v2.v0001/Src/UnitRevealer.lua').newInstance(armies)
    local players = {}
  
    -- Use the gateFaction variable for further processing

        local pos = ScenarioUtils.MarkerToPosition("landgate-1")
        --spawn gate 1
        EnemyGate1 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate1:SetMaxHealth(110000)
		EnemyGate1:SetHealth(nil,110000)
		EnemyGate1:SetReclaimable(false)
		EnemyGate1:SetCapturable(false)
		EnemyGate1:SetProductionPerSecondEnergy(9999)
		EnemyGate1:SetProductionPerSecondMass(9999)
		EnemyGate1:SetCustomName("Enemy Gate 1")
        -- Example usage: Highlight the "EnemyGate1" structure with a specific color

        local pos = ScenarioUtils.MarkerToPosition("landgate-2")
        --spawn gate 2
        EnemyGate2 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate2:SetMaxHealth(110000)
		EnemyGate2:SetHealth(nil,110000)
		EnemyGate2:SetReclaimable(false)
		EnemyGate2:SetCapturable(false)
		EnemyGate2:SetProductionPerSecondEnergy(9999)
		EnemyGate2:SetProductionPerSecondMass(9999)
		EnemyGate2:SetCustomName("Enemy Gate 2")

        local pos = ScenarioUtils.MarkerToPosition("landgate-3")
        --spawn gate 2
        EnemyGate3 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate3:SetMaxHealth(110000)
		EnemyGate3:SetHealth(nil,110000)
		EnemyGate3:SetReclaimable(false)
		EnemyGate3:SetCapturable(false)
		EnemyGate3:SetProductionPerSecondEnergy(9999)
		EnemyGate3:SetProductionPerSecondMass(9999)
		EnemyGate3:SetCustomName("Enemy Gate 3")

        local pos = ScenarioUtils.MarkerToPosition("landgate-4")
        --spawn gate 2
        EnemyGate4 = CreateUnitHPR( 'UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate4:SetMaxHealth(110000)
		EnemyGate4:SetHealth(nil,110000)
		EnemyGate4:SetReclaimable(false)
		EnemyGate4:SetCapturable(false)
		EnemyGate4:SetProductionPerSecondEnergy(9999)
		EnemyGate4:SetProductionPerSecondMass(9999)
		EnemyGate4:SetCustomName("Enemy Gate 4")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-1")
        --spawn gate 1
        EnemyGate5 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate5:SetMaxHealth(110000)
		EnemyGate5:SetHealth(nil,110000)
		EnemyGate5:SetReclaimable(false)
		EnemyGate5:SetCapturable(false)
		EnemyGate5:SetProductionPerSecondEnergy(9999)
		EnemyGate5:SetProductionPerSecondMass(9999)
		EnemyGate5:SetCustomName("Enemy Gate 5")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-2")
        --spawn gate 2
        EnemyGate6 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate6:SetMaxHealth(110000)
		EnemyGate6:SetHealth(nil,110000)
		EnemyGate6:SetReclaimable(false)
		EnemyGate6:SetCapturable(false)
		EnemyGate6:SetProductionPerSecondEnergy(9999)
		EnemyGate6:SetProductionPerSecondMass(9999)
		EnemyGate6:SetCustomName("Enemy Gate 6")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-3")
        --spawn gate 2
        EnemyGate7 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate7:SetMaxHealth(110000)
		EnemyGate7:SetHealth(nil,110000)
		EnemyGate7:SetReclaimable(false)
		EnemyGate7:SetCapturable(false)
		EnemyGate7:SetProductionPerSecondEnergy(9999)
		EnemyGate7:SetProductionPerSecondMass(9999)
		EnemyGate7:SetCustomName("Enemy Gate 7")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-4")
        --spawn gate 2
        EnemyGate8 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate8:SetMaxHealth(110000)
		EnemyGate8:SetHealth(nil,110000)
		EnemyGate8:SetReclaimable(false)
		EnemyGate8:SetCapturable(false)
		EnemyGate8:SetProductionPerSecondEnergy(9999)
		EnemyGate8:SetProductionPerSecondMass(9999)
		EnemyGate8:SetCustomName("Enemy Gate 8")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-5")
        --spawn gate 2
        EnemyGate9 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate9:SetMaxHealth(110000)
		EnemyGate9:SetHealth(nil,110000)
		EnemyGate9:SetReclaimable(false)
		EnemyGate9:SetCapturable(false)
		EnemyGate9:SetProductionPerSecondEnergy(9999)
		EnemyGate9:SetProductionPerSecondMass(9999)
		EnemyGate9:SetCustomName("Enemy Gate 9")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-6")
        --spawn gate 2
        EnemyGate10 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate10:SetMaxHealth(110000)
		EnemyGate10:SetHealth(nil,110000)
		EnemyGate10:SetReclaimable(false)
		EnemyGate10:SetCapturable(false)
		EnemyGate10:SetProductionPerSecondEnergy(9999)
		EnemyGate10:SetProductionPerSecondMass(9999)
		EnemyGate10:SetCustomName("Enemy Gate 10")

        local pos = ScenarioUtils.MarkerToPosition("navalgate-7")
        --spawn gate 2
        EnemyGate11 = CreateUnitHPR( 'UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
		EnemyGate11:SetMaxHealth(110000)
		EnemyGate11:SetHealth(nil,110000)
		EnemyGate11:SetReclaimable(false)
		EnemyGate11:SetCapturable(false)
		EnemyGate11:SetProductionPerSecondEnergy(9999)
		EnemyGate11:SetProductionPerSecondMass(9999)
		EnemyGate11:SetCustomName("Enemy Gate 11")
        
        --- make the gates visable to all human allied armys in the game
        for v, army in armies do
            if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4"  or army == "ARMY_5"  or army == "ARMY_6") then
                table.insert(players, army)
             end
        end
        for k, player in players do   
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate1, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate2, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate3, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate4, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate5, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate6, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate7, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate8, 0, GetArmyBrain(player))      
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate9, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate10, 0, GetArmyBrain(player))
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate11, 0, GetArmyBrain(player))  
        end

end

function Spawntheunitsthread()

    -- wait time before Land starts to spawn default 35 + )
    local seconds = 10 + ScenarioInfo.Options.opt_Survival_BuildTime
 
    --- seconds before Land starts to attack
    WaitSeconds (seconds)
    while true do
        -- seconds in between each Land group spawn  
        WaitSeconds (ScenarioInfo.Options.opt_Survival_GateSpawnInterval) 

       --     break
        if EnemyGate1.Dead and EnemyGate2.Dead then
            WaitSeconds (5)
            ScenarioFramework.Dialogue(import('/maps/X1CA_001/X1CA_001_strings.lua').TAUNT33, nil, true) --Sera Taunt4

            local area = Areas.PickRandomArea(Areas.spawnLandArea)
            local spawn = Areas.PickRandomPointInArea(area)
            local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
            local army = "ARMY_ENEMY"
            local rand = Utilities.GetRandomInt(1,4)
                if (rand == 1) then
                    ENEMYBOSS = CreateUnitHPR('ual0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
                    
                    elseif (rand == 2) then
                    ENEMYBOSS = CreateUnitHPR('xsl0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
                    
                    elseif (rand == 3) then
                    ENEMYBOSS = CreateUnitHPR('xrl0403',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
                    
                    elseif (rand == 4) then
                    ENEMYBOSS = CreateUnitHPR('uel0401',army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
                    
                end
             ENEMYBOSS:CreateShield({
                ImpactEffects = 'SeraphimShieldHit01',
                ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
                Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
                MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
                RegenAssistMult = 60,
                ShieldEnergyDrainRechargeTime = 5,
                ShieldMaxHealth = 18000,
                ShieldRechargeTime = 24,
                ShieldRegenRate = 150,
                ShieldRegenStartTime = 3,
                ShieldSize = 35,
                ShieldVerticalOffset = -5,
                })
         

                ENEMYBOSS:SetProductionPerSecondEnergy(1000)
                ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
                ENEMYBOSS:SetRegenRate(100)
                ENEMYBOSS:SetCustomName("JammerZoid V1")
                
                ENEMYBOSS:SetMaxHealth((400000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
                ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())
                IssueAggressiveMove({ENEMYBOSS}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
                ---- Reveal the Boss to all players
                UnitRevealer.revealUnit(ENEMYBOSS, 42)                        

            break
        end

       -- if unit.Dead then
       --     break
       --   end

       
        local r = Utilities.GetRandomInt(1,2)
        if (r == 1) then
		    if EnemyGate1.Dead then
                spawn = ScenarioUtils.MarkerToPosition("landgate-2")
             else
                spawn = ScenarioUtils.MarkerToPosition("landgate-1")
            end
	    elseif (r == 2) then
            if EnemyGate2.Dead then
                spawn = ScenarioUtils.MarkerToPosition("landgate-1")
             else
		        spawn = ScenarioUtils.MarkerToPosition("landgate-2")
            end
        end    

        


        local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
        -- identify the AI 
        local army = "ARMY_ENEMY"
        -- Call LandPlatoons lua and pick a random army group
        local group = GatePlatoons.RandomArmyGroup()    
        local units = GatePlatoons.SpawnArmyGroup(group, army, spawn)
 
            -- Randomizer pick a random function - In this case a radmon attack move for groups of units and random path to tyarget. 
            function a()
                local rand = Utilities.GetRandomInt(1,3)
                if (rand == 1) then
                    if spawn == ScenarioUtils.MarkerToPosition("landgate-1") then
                            
                        local rand2 = Utilities.GetRandomInt(1,2)
                        if (rand2 == 1) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand3")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                            elseif (rand2 == 2) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand4")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                        end
                        
                        elseif spawn == ScenarioUtils.MarkerToPosition("landgate-2") then
                            
                        local rand3 = Utilities.GetRandomInt(1,2)
                        if (rand3 == 1) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand5")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                            elseif (rand3 == 2) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand6")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                        end    

                    end

                    position = ScenarioUtils.MarkerToPosition("attackpointrand1")
                    IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)

                    elseif (rand == 2) then
                    IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
                    elseif (rand == 3) then
                    IssueFormMove(units, attack, 'AttackFormation', 0)    
                end
            end

            function b()
                local rand = Utilities.GetRandomInt(1,3)
                if (rand == 1) then

                    if spawn == ScenarioUtils.MarkerToPosition("landgate-1") then
                            
                        local rand2 = Utilities.GetRandomInt(1,2)
                        if (rand2 == 1) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand3")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                            elseif (rand2 == 2) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand4")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                        end
                        
                        elseif spawn == ScenarioUtils.MarkerToPosition("landgate-2") then
                            
                        local rand3 = Utilities.GetRandomInt(1,2)
                        if (rand3 == 1) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand5")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                            elseif (rand3 == 2) then
                            position = ScenarioUtils.MarkerToPosition("attackpointrand6")
                            IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                        end    
                          
                    end

                    position = ScenarioUtils.MarkerToPosition("attackpointrand2")
                    IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                elseif (rand == 2) then
                    IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
                elseif (rand == 3) then
                    IssueFormMove(units, attack, 'AttackFormation', 0)
                end
                
            end

            function execute_random(f_tbl)
                local random_index = math.floor(Random() * table.getn(f_tbl)) + 1 --pick random index from 1 to #f_tbl
                f_tbl[random_index]() --execute function at the random_index we've picked
            end

            -- prepare/fill our function table 
            local funcs = {a, b}

            --for i = 0, 20 do
            execute_random(funcs)
            --end
            IssueFormAggressiveMove(units,ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"),'GrowthFormation', 0)

            --- local formationTable = {
           -- 'AttackFormation',
           -- 'GrowthFormation',
           -- 'SixWideFormation',
           -- 'TravellingFormation',
           -- }

    end
---- break here
end

function Spawntheunitsthread2()
    -- wait time before Land starts to spawn default 35 + )
    local seconds = 10 + ScenarioInfo.Options.opt_Survival_BuildTime
   --- seconds before Land starts to attack
    WaitSeconds (seconds)
    while true do
        WaitSeconds (ScenarioInfo.Options.opt_Survival_GateSpawnInterval) 
       -- count = count + 1
       
        --if count > maximum then
        --    break
        if EnemyGate3.Dead and EnemyGate4.Dead then
        
            break
        end

          -- if unit.Dead then
          --     break
          --   end

            --function OnStart()
        local r = Utilities.GetRandomInt(1,2)
        if (r == 1) then
		    if EnemyGate3.Dead then
             spawn = ScenarioUtils.MarkerToPosition("landgate-4")
             else
             spawn = ScenarioUtils.MarkerToPosition("landgate-3")
            end
	        elseif (r == 2) then
            if EnemyGate4.Dead then
                spawn = ScenarioUtils.MarkerToPosition("landgate-3")
                else
	    		spawn = ScenarioUtils.MarkerToPosition("landgate-4")
            end
        end    

        local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
        -- identify the AI 
        local army = "ARMY_ENEMY"
        -- Call LandPlatoons lua and pick a random army group
        local group = GatePlatoons.RandomArmyGroup()    
        local units = GatePlatoons.SpawnArmyGroup(group, army, spawn)
 
            -- Randomizer pick a random function - In this case a radmon attack more for groups of units. 
            function a()
                local rand = Utilities.GetRandomInt(1,3)
                if (rand == 1) then
                    position = ScenarioUtils.MarkerToPosition("attackpointrand1")
                    IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                elseif (rand == 2) then
                    IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
                elseif (rand == 3) then
                    IssueFormMove(units, attack, 'AttackFormation', 0)    
                end
            end

            function b()
                local rand = Utilities.GetRandomInt(1,3)
                if (rand == 1) then
                    position = ScenarioUtils.MarkerToPosition("attackpointrand2")
                    IssueFormAggressiveMove(units, position, 'GrowthFormation', 0)
                elseif (rand == 2) then
                    IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
                elseif (rand == 3) then
                    IssueFormMove(units, attack, 'AttackFormation', 0)
                end
                
            end

            function execute_random(f_tbl)
                local random_index = math.floor(Random() * table.getn(f_tbl)) + 1 --pick random index from 1 to #f_tbl
                f_tbl[random_index]() --execute function at the random_index we've picked
            end

            -- prepare/fill our function table
            local funcs = {a, b}

            for i = 0, 20 do
                execute_random(funcs)
            end


            --- local formationTable = {
           -- 'AttackFormation',
           -- 'GrowthFormation',
           -- 'SixWideFormation',
           -- 'TravellingFormation',
           -- }

    end
    ---- break here
end

function Spawntheunitsthread3()

    -- wait time before navy starts to spawn default 35 + )
    local seconds = 10 + ScenarioInfo.Options.opt_Survival_BuildTime
 
    --- seconds before navy starts to attack
    WaitSeconds (seconds)
    while true do

        WaitSeconds (ScenarioInfo.Options.opt_Survival_GateSpawnInterval) 

            if EnemyGate5.Dead and EnemyGate6.Dead and EnemyGate7.Dead and EnemyGate8.Dead and EnemyGate9.Dead and EnemyGate10.Dead and EnemyGate11.Dead then
            break
            end
        

        local attack = Markers.PickRandomPosition(Markers.destenemynavyMarkers)
        local spawn = Markers.PickRandomPosition(Markers.navyspawnMarkers)
        local army = "ARMY_ENEMY"
        local group = NavyPlatoons.RandomArmyGroup()    
        local units = NavyPlatoons.SpawnArmyGroup(group, army, spawn)
 
        IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)

    end
    ---- break here
end

