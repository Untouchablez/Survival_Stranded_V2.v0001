--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local LandPlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/LandPlatoons.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')

-- wait time before Land starts to spawn default 35 + )
local seconds = 35 + ScenarioInfo.Options.opt_Survival_BuildTime

 -- * function Spawntheunitsthread(maximum)
function Spawntheunitsthread()
                --- seconds before Land starts to attack
 WaitSeconds (seconds)

    while true do
            -- seconds in between each Land group spawn    
            WaitSeconds (ScenarioInfo.Options.opt_Survival_LandSpawnInterval)

            local area = Areas.PickRandomArea(Areas.spawnLandArea)
            local spawn = Areas.PickRandomPointInArea(area)
            local attack = Markers.PickRandomPosition(Markers.dropAttackMarkers)
            local army = "ARMY_ENEMY"
            local group = LandPlatoons.RandomArmyGroup()    

            local ok,msg=pcall(
                function()
            local units = LandPlatoons.SpawnArmyGroup(group, army, spawn) 
                function a()
                    IssueFormMove(units, attack, 'GrowthFormation', 0)
                end

                function b()
                    IssueFormAggressiveMove(units, attack, 'GrowthFormation', 0)
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
        end
        )
        
        if not ok then
            LOG (msg) 
        end
    end
end


    

    
