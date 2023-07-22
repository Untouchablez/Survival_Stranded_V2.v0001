--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')

function SpawnRandomBossThread()
    
    local JammerBoss1 = false
    local JammerBoss2 = false
    local JammerBoss3 = false

    local Utilities = import('/lua/utilities.lua')
    local armies = ListArmies()
    UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua').newInstance(armies)

    --LOG"HI")
    while not (JammerBoss1 and JammerBoss2 and JammerBoss3) do 
        local remainingMinutes, remainingSeconds = DefenceObject.GametimegoalFunction()
        local gameTime = remainingMinutes 
        
        if not JammerBoss1 then 
            if gameTime == 43  then
 
                --PrintText(" WARNING BOSS DETECTED AND IS INCOMMING ON YOUR POSITION ", 40, '00bfff', 9, 'center')
            
                ScenarioFramework.Dialogue(import('/maps/X1CA_004/X1CA_004_strings.lua').X04_M03_090, nil, true)
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
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
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
                    
                    ENEMYBOSS:SetMaxHealth((200000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
                    ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())
                    IssueAggressiveMove({ENEMYBOSS}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
                    ---- Reveal the Boss to all players
                    UnitRevealer.revealUnit(ENEMYBOSS, 42)     
                JammerBoss1 = true
            end
        end

        if not JammerBoss2 then 
            if gameTime == 42 then

                --PrintText(" WARNING BOSS DETECTED AND IS INCOMMING ON YOUR POSITION ", 40, '00bfff', 9, 'center')

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
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                 ENEMYBOSS:CreateShield({
                    ImpactEffects = 'SeraphimShieldHit01',
                    ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
                    Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
                    MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
                    RegenAssistMult = 60,
                    ShieldEnergyDrainRechargeTime = 5,
                    ShieldMaxHealth = 40000,
                    ShieldRechargeTime = 24,
                    ShieldRegenRate = 150,
                    ShieldRegenStartTime = 3,
                    ShieldSize = 35,
                    ShieldVerticalOffset = -5,
                    })
             
    
                    ENEMYBOSS:SetProductionPerSecondEnergy(1000)
                    ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
                    ENEMYBOSS:SetRegenRate(100)
                    ENEMYBOSS:SetCustomName("JammerZoid V2")
                    
                    ENEMYBOSS:SetMaxHealth((600000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
                    ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())
                    IssueAggressiveMove({ENEMYBOSS}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
                    ---- Reveal the Boss to all players
                    UnitRevealer.revealUnit(ENEMYBOSS, 42)     
                JammerBoss2 = true 
            end
        end

        if not JammerBoss3 then 
            if gameTime == 41 then

                --PrintText(" WARNING BOSS DETECTED AND IS INCOMMING ON YOUR POSITION ", 40, '00bfff', 9, 'center')

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
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                    ENEMYBOSS:SetVeterancy(1)
                 ENEMYBOSS:CreateShield({
                    ImpactEffects = 'SeraphimShieldHit01',
                    ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
                    Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
                    MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
                    RegenAssistMult = 60,
                    ShieldEnergyDrainRechargeTime = 5,
                    ShieldMaxHealth = 100000,
                    ShieldRechargeTime = 24,
                    ShieldRegenRate = 150,
                    ShieldRegenStartTime = 3,
                    ShieldSize = 35,
                    ShieldVerticalOffset = -5,
                    })
             
    
                    ENEMYBOSS:SetProductionPerSecondEnergy(1000)
                    ENEMYBOSS:SetConsumptionPerSecondEnergy(0)
                    ENEMYBOSS:SetRegenRate(100)
                    ENEMYBOSS:SetCustomName("JammerZoid V3")
                    
                    ENEMYBOSS:SetMaxHealth((1000000) * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
                    ENEMYBOSS:SetHealth(ENEMYBOSS,ENEMYBOSS:GetMaxHealth())
                    IssueAggressiveMove({ENEMYBOSS}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
                    ---- Reveal the Boss to all players
                    UnitRevealer.revealUnit(ENEMYBOSS, 42)     
                JammerBoss3 = true
            end
        end

        WaitSeconds(10)
    end


    
end