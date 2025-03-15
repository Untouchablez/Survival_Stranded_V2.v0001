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
    UnitRevealer = import('/maps/survival_stranded_v2.v0002/Src/UnitRevealer.lua').newInstance(armies)
    local players = {}
  
    -- Spawn all gates
    local pos = ScenarioUtils.MarkerToPosition("landgate-1")
    EnemyGate1 = CreateUnitHPR('UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate1:SetMaxHealth(110000)
    EnemyGate1:SetHealth(nil,110000)
    EnemyGate1:SetReclaimable(false)
    EnemyGate1:SetCapturable(false)
    EnemyGate1:SetProductionPerSecondEnergy(9999)
    EnemyGate1:SetProductionPerSecondMass(9999)
    EnemyGate1:SetCustomName("Enemy Gate 1")

    pos = ScenarioUtils.MarkerToPosition("landgate-2")
    EnemyGate2 = CreateUnitHPR('UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate2:SetMaxHealth(110000)
    EnemyGate2:SetHealth(nil,110000)
    EnemyGate2:SetReclaimable(false)
    EnemyGate2:SetCapturable(false)
    EnemyGate2:SetProductionPerSecondEnergy(9999)
    EnemyGate2:SetProductionPerSecondMass(9999)
    EnemyGate2:SetCustomName("Enemy Gate 2")

    pos = ScenarioUtils.MarkerToPosition("landgate-3")
    EnemyGate3 = CreateUnitHPR('UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate3:SetMaxHealth(110000)
    EnemyGate3:SetHealth(nil,110000)
    EnemyGate3:SetReclaimable(false)
    EnemyGate3:SetCapturable(false)
    EnemyGate3:SetProductionPerSecondEnergy(9999)
    EnemyGate3:SetProductionPerSecondMass(9999)
    EnemyGate3:SetCustomName("Enemy Gate 3")

    pos = ScenarioUtils.MarkerToPosition("landgate-4")
    EnemyGate4 = CreateUnitHPR('UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate4:SetMaxHealth(110000)
    EnemyGate4:SetHealth(nil,110000)
    EnemyGate4:SetReclaimable(false)
    EnemyGate4:SetCapturable(false)
    EnemyGate4:SetProductionPerSecondEnergy(9999)
    EnemyGate4:SetProductionPerSecondMass(9999)
    EnemyGate4:SetCustomName("Enemy Gate 4")

    pos = ScenarioUtils.MarkerToPosition("landgate-5")
    EnemyGate5 = CreateUnitHPR('UAB0304', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate5:SetMaxHealth(110000)
    EnemyGate5:SetHealth(nil,110000)
    EnemyGate5:SetReclaimable(false)
    EnemyGate5:SetCapturable(false)
    EnemyGate5:SetProductionPerSecondEnergy(9999)
    EnemyGate5:SetProductionPerSecondMass(9999)
    EnemyGate5:SetCustomName("Enemy Gate 5")

    pos = ScenarioUtils.MarkerToPosition("navalgate-1")
    EnemyGate6 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate6:SetMaxHealth(110000)
    EnemyGate6:SetHealth(nil,110000)
    EnemyGate6:SetReclaimable(false)
    EnemyGate6:SetCapturable(false)
    EnemyGate6:SetProductionPerSecondEnergy(9999)
    EnemyGate6:SetProductionPerSecondMass(9999)
    EnemyGate6:SetCustomName("Enemy Gate 6")

    pos = ScenarioUtils.MarkerToPosition("navalgate-2")
    EnemyGate7 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate7:SetMaxHealth(110000)
    EnemyGate7:SetHealth(nil,110000)
    EnemyGate7:SetReclaimable(false)
    EnemyGate7:SetCapturable(false)
    EnemyGate7:SetProductionPerSecondEnergy(9999)
    EnemyGate7:SetProductionPerSecondMass(9999)
    EnemyGate7:SetCustomName("Enemy Gate 7")

    pos = ScenarioUtils.MarkerToPosition("navalgate-3")
    EnemyGate8 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate8:SetMaxHealth(110000)
    EnemyGate8:SetHealth(nil,110000)
    EnemyGate8:SetReclaimable(false)
    EnemyGate8:SetCapturable(false)
    EnemyGate8:SetProductionPerSecondEnergy(9999)
    EnemyGate8:SetProductionPerSecondMass(9999)
    EnemyGate8:SetCustomName("Enemy Gate 8")

    pos = ScenarioUtils.MarkerToPosition("navalgate-4")
    EnemyGate9 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate9:SetMaxHealth(110000)
    EnemyGate9:SetHealth(nil,110000)
    EnemyGate9:SetReclaimable(false)
    EnemyGate9:SetCapturable(false)
    EnemyGate9:SetProductionPerSecondEnergy(9999)
    EnemyGate9:SetProductionPerSecondMass(9999)
    EnemyGate9:SetCustomName("Enemy Gate 9")

    pos = ScenarioUtils.MarkerToPosition("navalgate-5")
    EnemyGate10 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate10:SetMaxHealth(110000)
    EnemyGate10:SetHealth(nil,110000)
    EnemyGate10:SetReclaimable(false)
    EnemyGate10:SetCapturable(false)
    EnemyGate10:SetProductionPerSecondEnergy(9999)
    EnemyGate10:SetProductionPerSecondMass(9999)
    EnemyGate10:SetCustomName("Enemy Gate 10")

    pos = ScenarioUtils.MarkerToPosition("navalgate-6")
    EnemyGate11 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate11:SetMaxHealth(110000)
    EnemyGate11:SetHealth(nil,110000)
    EnemyGate11:SetReclaimable(false)
    EnemyGate11:SetCapturable(false)
    EnemyGate11:SetProductionPerSecondEnergy(9999)
    EnemyGate11:SetProductionPerSecondMass(9999)
    EnemyGate11:SetCustomName("Enemy Gate 11")

    pos = ScenarioUtils.MarkerToPosition("navalgate-7")
    EnemyGate12 = CreateUnitHPR('UAB0303', "ARMY_ENEMY", pos[1], pos[2], pos[3], 0,0,0)
    EnemyGate12:SetMaxHealth(110000)
    EnemyGate12:SetHealth(nil,110000)
    EnemyGate12:SetReclaimable(false)
    EnemyGate12:SetCapturable(false)
    EnemyGate12:SetProductionPerSecondEnergy(9999)
    EnemyGate12:SetProductionPerSecondMass(9999)
    EnemyGate12:SetCustomName("Enemy Gate 12")

    --- Make gates visible to all human allied armies
    for v, army in armies do
        if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4" or army == "ARMY_5" or army == "ARMY_6") then
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
        ScenarioFramework.CreateVisibleAreaAtUnit(15, EnemyGate12, 0, GetArmyBrain(player))  
    end
end

-- Updated function to spawn an ENEMYBOSS with increasing health
function SpawnEnemyBoss(bossNumber)
    WaitSeconds(5)
    ScenarioFramework.Dialogue(import('/maps/X1CA_001/X1CA_001_strings.lua').TAUNT33, nil, true)
    
    local area = Areas.PickRandomArea(Areas.spawnLandArea)
    local spawn = Areas.PickRandomPointInArea(area)
    local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
    local army = "ARMY_ENEMY"
    local rand = Utilities.GetRandomInt(1,4)
    
    local boss
    if (rand == 1) then
        boss = CreateUnitHPR('ual0401', army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
    elseif (rand == 2) then
        boss = CreateUnitHPR('xsl0401', army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
    elseif (rand == 3) then
        boss = CreateUnitHPR('xrl0403', army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
    elseif (rand == 4) then
        boss = CreateUnitHPR('uel0401', army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
    end
    
   
    
   -- Add a functional attachment (UEF point defense turret)
 
    
    -- Existing shield and stats
    boss:CreateShield({
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
    
    local baseHealth = 400000
    local healthMultiplier = 1 + (0.05 * (bossNumber - 1))
    local maxHealth = baseHealth * healthMultiplier * ScenarioInfo.Options.opt_Survival_HealthMultiplier
    
    boss:SetProductionPerSecondEnergy(1000)
    boss:SetConsumptionPerSecondEnergy(0)
    boss:SetRegenRate(100)
    boss:SetCustomName("JammerZoid V" .. bossNumber)
    boss:SetMaxHealth(maxHealth)
    boss:SetHealth(boss, maxHealth)
    boss:SetMaxHealth(maxHealth)
    boss:SetHealth(boss, maxHealth)
    ForkThread(function()
        WaitSeconds(0.1)  -- Wait 0.1 seconds
        boss:SetMesh(boss:GetBlueprint().Display.MeshBlueprint, true)
        boss:SetScale(1.25)
    end)
    IssueAggressiveMove({boss}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
    UnitRevealer.revealUnit(boss, 42)
    
    return boss
end

function Spawntheunitsthread()
    local seconds = 35 + ScenarioInfo.Options.opt_Survival_BuildTime
    WaitSeconds(seconds)
    
    -- Create a table of all 12 gates
    local allGates = {
        EnemyGate1, EnemyGate2, EnemyGate3, EnemyGate4, EnemyGate5,
        EnemyGate6, EnemyGate7, EnemyGate8, EnemyGate9, EnemyGate10,
        EnemyGate11, EnemyGate12
    }
    
    local bossCount = 0 -- Track number of bosses spawned
    local lastDeadGateCount = 0 -- Track the last count to detect increments of 2
    
    while true do
        WaitSeconds(ScenarioInfo.Options.opt_Survival_GateSpawnInterval)

        -- Count dead gates
        local deadGateCount = 0
        for _, gate in allGates do
            if gate.Dead then
                deadGateCount = deadGateCount + 1
            end
        end

        -- Spawn a boss every time dead gates increase by 2
        if deadGateCount >= 2 and math.floor(deadGateCount / 2) * 2 == deadGateCount and deadGateCount > lastDeadGateCount then
            bossCount = bossCount + 1
            SpawnEnemyBoss(bossCount)
            lastDeadGateCount = deadGateCount -- Update the last count
        end

        -- Break if all gates are dead
        if deadGateCount == 12 then
            break
        end

        -- Rest of your spawning logic
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
        local army = "ARMY_ENEMY"
        local group = GatePlatoons.RandomArmyGroup()
        
        local ok, msg = pcall(function()
            local units = GatePlatoons.SpawnArmyGroup(group, army, spawn)
            
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
                local random_index = math.floor(Random() * table.getn(f_tbl)) + 1
                f_tbl[random_index]()
            end

            local funcs = {a, b}
            execute_random(funcs)
            IssueFormAggressiveMove(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        end)
        
        if not ok then
            LOG(msg)
        end
    end
end

function Spawntheunitsthread2()
    local seconds = 10 + ScenarioInfo.Options.opt_Survival_BuildTime
    WaitSeconds(seconds)
    while true do
        WaitSeconds(ScenarioInfo.Options.opt_Survival_GateSpawnInterval) 
       
        if EnemyGate3.Dead and EnemyGate4.Dead and EnemyGate5.Dead then
           break
        end

        local r = Utilities.GetRandomInt(1,3)
        if (r == 1) then
            if EnemyGate3.Dead then
                if EnemyGate4.Dead then
                    spawn = ScenarioUtils.MarkerToPosition("landgate-5")
                else
                    spawn = ScenarioUtils.MarkerToPosition("landgate-4")
                end
            else
                spawn = ScenarioUtils.MarkerToPosition("landgate-3")
            end
        elseif (r == 2) then
            if EnemyGate4.Dead then
                if EnemyGate3.Dead then
                    spawn = ScenarioUtils.MarkerToPosition("landgate-5")
                else
                    spawn = ScenarioUtils.MarkerToPosition("landgate-3")
                end
            else
                spawn = ScenarioUtils.MarkerToPosition("landgate-4")
            end
        elseif (r == 3) then
            if EnemyGate5.Dead then
                if EnemyGate3.Dead then
                    spawn = ScenarioUtils.MarkerToPosition("landgate-4")
                else
                    spawn = ScenarioUtils.MarkerToPosition("landgate-3")
                end
            else
                spawn = ScenarioUtils.MarkerToPosition("landgate-5")
            end
        end    

        local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
        local army = "ARMY_ENEMY"
        local group = GatePlatoons.RandomArmyGroup()   
        
        local ok, msg = pcall(function()
            local units = GatePlatoons.SpawnArmyGroup(group, army, spawn)
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
                local random_index = math.floor(Random() * table.getn(f_tbl)) + 1
                f_tbl[random_index]()
            end

            local funcs = {a, b}
            execute_random(funcs)
        end)

        if not ok then
            LOG(msg) 
        end
    end
end

function Spawntheunitsthread3()
    local seconds = 600 + ScenarioInfo.Options.opt_Survival_BuildTime
    WaitSeconds(seconds)
    while true do
        WaitSeconds(ScenarioInfo.Options.opt_Survival_GateSpawnInterval) 

        if EnemyGate5.Dead and EnemyGate6.Dead and EnemyGate7.Dead and EnemyGate8.Dead and EnemyGate9.Dead and EnemyGate10.Dead and EnemyGate11.Dead then
            break
        end
        
        local attack = Markers.PickRandomPosition(Markers.destenemynavyMarkers)
        local spawn = Markers.PickRandomPosition(Markers.navyspawnMarkers)
        local army = "ARMY_ENEMY"
        local group = NavyPlatoons.RandomArmyGroup() 

        local ok, msg = pcall(function()
            local units = NavyPlatoons.SpawnArmyGroup(group, army, spawn)
            IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
            IssueFormAggressiveMove(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        end)
        
        if not ok then
            LOG(msg) 
        end
    end
end