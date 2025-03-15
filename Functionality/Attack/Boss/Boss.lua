--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')

-- Define unit blueprints for the Galactic Colossus to spawn
local landUnitBlueprints = {'ual0105', 'ual0106', 'ual0202', 'ual0111'}
local seaUnitBlueprints = {'uas0103'}
local airUnitBlueprints = {'uaa0103', 'uaa0203'}

-- Function to spawn units based on boss position layer
function SpawnUnitsNearBoss(boss)
    local army = boss:GetArmy()
    local position = boss:GetPosition()
    local targetPosition = ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1")
    local layer = boss:GetCurrentLayer()

    local function CountTableEntries(table)
        local Count = 0
        for _ in pairs(table) do 
            Count = Count + 1
        end
        return Count
    end

    local function spawnUnits(blueprints, minCount, maxCount)
        local numUnits = Random(minCount, maxCount)
        for i = 1, numUnits do
            local offset = {Random(-10, 10), 0, Random(-10, 10)}
            local spawnPos = {position[1] + offset[1], position[2], position[3] + offset[3]}
            local maxTableEntries = CountTableEntries(blueprints)
            local randomUnit = Random(1, MaxTableEntries)
            local blueprint = blueprints[randomUnit]
            local unit = CreateUnitHPR(blueprint, army, spawnPos[1], spawnPos[2], spawnPos[3], 0, 0, 0)
            IssueAggressiveMove({unit}, targetPosition)
        end
    end

    if layer == 'Land' then
        spawnUnits(landUnitBlueprints, 5, 10)
        spawnUnits(airUnitBlueprints, 3, 6)
    elseif layer == 'Water' then
        spawnUnits(seaUnitBlueprints, 3, 6)
        spawnUnits(airUnitBlueprints, 3, 6)
    else
        spawnUnits(airUnitBlueprints, 3, 6)
    end
end

-- Thread to spawn units every 15 seconds
function SpawnUnitsThread(boss)
    while not boss:IsDead() do
        WaitSeconds(15)
        if not boss:IsDead() then
            SpawnUnitsNearBoss(boss)
        end
    end
end

-- Declare SpawnRandomBossThread globally
SpawnRandomBossThread = function()
    local JammerBoss1 = false
    local JammerBoss2 = false
    local JammerBoss3 = false
    local GalacticBoss = false

    local Utilities = import('/lua/utilities.lua')
    local armies = ListArmies()

    -- Correctly instantiate UnitRevealer
    local unitRevealerInstance = UnitRevealer.newInstance(armies)

    while not (JammerBoss1 and JammerBoss2 and JammerBoss3 and GalacticBoss) do 
        local remainingMinutes, remainingSeconds = DefenceObject.GametimegoalFunction()
        local gameTime = remainingMinutes 

        local function spawnBossIfNeeded(condition, healthMultiplier, shieldHealth, maxHealth, customName)
            if not condition and gameTime == healthMultiplier then
                local area = Areas.PickRandomArea(Areas.spawnLandArea)
                local spawn = Areas.PickRandomPointInArea(area)
                local army = "ARMY_ENEMY"
                local rand = Utilities.GetRandomInt(1, 4)
                local bossType = {'ual0401', 'xsl0401', 'xrl0403', 'uel0401'}[rand]

                local boss = CreateUnitHPR(bossType, army, spawn[1], spawn[2], spawn[3], 0, 0, 0)
                boss:SetVeterancy(5)
                boss:CreateShield({
                    ImpactEffects = 'SeraphimShieldHit01',
                    ImpactMesh = '/effects/entities/ShieldSection01/ShieldSection01_mesh',
                    Mesh = '/effects/entities/AeonShield01/AeonShield01_mesh',
                    MeshZ = '/effects/entities/Shield01/Shield01z_mesh',
                    RegenAssistMult = 60,
                    ShieldEnergyDrainRechargeTime = 5,
                    ShieldMaxHealth = shieldHealth,
                    ShieldRechargeTime = 24,
                    ShieldRegenRate = 150,
                    ShieldRegenStartTime = 3,
                    ShieldSize = 35,
                    ShieldVerticalOffset = -5,
                })
                boss:SetProductionPerSecondEnergy(1000)
                boss:SetConsumptionPerSecondEnergy(0)
                boss:SetRegenRate(100)
                boss:SetCustomName(customName)
                boss:SetMaxHealth(maxHealth * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
                boss:SetHealth(boss, boss:GetMaxHealth())
                IssueAggressiveMove({boss}, Markers.PickRandomPosition(Markers.dropAttackMarkers))
                IssueFormMove(boss, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
                unitRevealerInstance.revealUnit(boss, 42)
                ForkThread(SpawnUnitsThread, boss)
                return true
            end
            return condition
        end

        GalacticBoss = spawnBossIfNeeded(GalacticBoss, 50, 20000, 50000, "Galactic Colossus Boss")
        JammerBoss1 = spawnBossIfNeeded(JammerBoss1, 40, 18000, 200000, "JammerZoid V1")
        JammerBoss2 = spawnBossIfNeeded(JammerBoss2, 25, 80000, 1200000, "JammerZoid V2")
        JammerBoss3 = spawnBossIfNeeded(JammerBoss3, 10, 200000, 2000000, "JammerZoid V3")
        
        WaitSeconds(10)
    end
end
