--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Wrecks = import(ScenarioInfo.MapPath .. 'Src/Wrecks.lua')

cachelandPlatoons = { }

function RandomArmyGroup()
    local n = table.getn(cachelandPlatoons)
    local i = math.floor(Random() * n) + 1
    return cachelandPlatoons[i]
end

function SpawnArmyGroup(tblData, army, position)
    if tblData == nil then
        --LOG("CacheNavyPlatoons tblData is nil!")
        return {} -- Return an empty table to avoid further errors
    end

    local units = { }
    ----LOGHEEEEEEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRRRRREEEEEEEE);
    local unit = nil -- Add this line to declare and initialize the 'unit' variable
    for k, bp in tblData do 

  
    local unit = CreateUnitHPR(bp, army, position[1], position[2], position[3], 0, 0, 0)
    
     unit:SetMaxHealth(unit:GetMaxHealth() * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
     unit:SetHealth(unit,unit:GetMaxHealth())
               -- Set the damadge multiplier
               for i = 1, unit:GetWeaponCount() do
                local Weapon = unit:GetWeapon(i)
                --if Weapon.Label ~= 'DeathWeapon' and Weapon.Label ~= 'DeathImpact' then
                    Weapon:AddDamageMod(Weapon:GetBlueprint().Damage * (ScenarioInfo.Options.opt_Survival_DamageMultiplier - 1))
                --end
            end

    table.insert(units, unit)
    end
    return units

end

local function UnitToBlueprintID(unit)
    return unit:GetBlueprint().BlueprintId
end

local function UnitsToBlueprintID(units)
    local ids = { }
    for k, unit in units do 
        table.insert(ids, UnitToBlueprintID(unit))
    end
    return ids
end

--local offset = 0 -- set to startup time
local offset = ScenarioInfo.Options.opt_Survival_BuildTime
local timeToUnlockTech = 580 -- in seconds

---- Starting tech lvl
local techIntegral = 1
local techIdentifiers = {
    -- land tech 1,2,3 group x (When adding into MAP Maker the group would be called LT1G1)
    "LT1G", "LT2G", "LT3G", "LT4G", "LEXP"
}

local techIdentifier = techIdentifiers[techIntegral]

function OnStart()

    local army = "ARMY_ENEMY"
    local scenario = ScenarioInfo.Env.Scenario 
    local tblNode = Scenario.Armies[army].Units

    techIdentifier = techIdentifiers[techIntegral]
 
    for k = 1, 30 do 
        -- construct the name of the unit group x
        local name = techIdentifier .. k 

        -- check if the group exists
        local group = ScenarioUtils.FindUnitGroup(name, tblNode)
        if group then 
            local units = ScenarioUtils.CreateArmyGroup(army, name, false, false)
            local bps = UnitsToBlueprintID(units)
                
            -- Create them for the group then After they have spawned kill them        
            for k, unit in units do 
                
                ---- CHeck if Wrecks is enabled or not
                if ScenarioInfo.Options.opt_Wrecks == 1 then
                    local bp = unit:GetBlueprint()
                    if (bp != nil) then
                    bp.Wreckage = nil
                    end 
                end

                    unit:Destroy()
            end

            table.insert(cachelandPlatoons, bps)
        end
    end
end

function OnTick()

    local army = "ARMY_ENEMY"
    local scenario = ScenarioInfo.Env.Scenario 
    local tblNode = Scenario.Armies[army].Units
    

    while true do 

        -- get current game time in seconds  
        local time = (GetGameTimeSeconds() - offset)  
        --local k = math.random(1,10)
        -- want to map time to integral value that represents tech
        if time > techIntegral * timeToUnlockTech then 

            -- make sure we stay within the size of techIdentifiers
            --techIdentifier = techIdentifiers[math.min(2, techIntegral)]
            
           
                if techIntegral >= 5 then
                    techIntegral = 5
                    --LOG"land tech is already maxed out: " .. techIntegral)
                else
                    techIntegral = techIntegral + 1
                    --LOG"Upgrading land tech to " .. techIntegral)
                end
             -- update the tech identifier
                techIdentifier = techIdentifiers[(techIntegral)]

            cachelandPlatoons = { }

            for k = 1, 30 do 
                -- construct the name of the unit group
                
                local name = techIdentifier .. k 
                --LOG"group name is" .. name)

                -- check if the group exists
                local group = ScenarioUtils.FindUnitGroup(name, tblNode)
                if group then 
                    local units = ScenarioUtils.CreateArmyGroup(army, name, false, false)
                    local bps = UnitsToBlueprintID(units)
                        
                    -- Create them for the group then After they have spawned kill them        
                    for k, unit in units do 
                        unit:Destroy()
                    end
        
                    table.insert(cachelandPlatoons, bps)
                end
            end

        end

        -- this needs to be in forkthread
        WaitSeconds(1)
    end
end
