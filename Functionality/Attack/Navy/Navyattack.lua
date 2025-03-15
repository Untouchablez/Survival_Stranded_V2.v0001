--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local NavyPlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/NavyPlatoons.lua')
local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')

-- wait time before navy starts to spawn
local seconds = 600 + ScenarioInfo.Options.opt_Survival_BuildTime




function Spawntheunitsthread()
    --- seconds before navy starts to attack
    WaitSeconds(seconds)
    -- Warn of incoming navy attacks
    ScenarioFramework.Dialogue(import('/maps/X1CA_001/X1CA_001_strings.lua').X01_M02_045, nil, true) 
    while true do
        WaitSeconds(ScenarioInfo.Options.opt_Survival_NavySpawnInterval)
        ---this is used to spawn units inside a random area specified in area.lua rather from a marker
        local area = Areas.PickRandomArea(Areas.spawnNavyArea)
        local spawn = Areas.PickRandomPointInArea(area)
        local attack = Markers.PickRandomPosition(Markers.destenemynavyMarkers)
        local army = "ARMY_ENEMY"
        local group = NavyPlatoons.RandomArmyGroup()  

        local ok, msg = pcall(
            function()
        local units = NavyPlatoons.SpawnArmyGroup(group, army, spawn)

            --local function a()#
        IssueFormAggressiveMove(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        
        --         IssueFormMove(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        --     end

        --     local function b()
        --         IssueAttack(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        --     end

        --     local function c()
        --         IssueFormMove(units, ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1"), 'GrowthFormation', 0)
        --     end

        --     local funcs = {a, b}

        --     -- Randomly execute function 'a' or 'b'
        --     local random_index = math.floor(Random() * 2) + 1
        --     funcs[random_index]()

        --     -- Always execute function 'c'
        --     c()
        end)

        if not ok then
            LOG(msg) 
        end
    end
end


-- function execute_random(f_tbl)
--     local random_index = math.floor(Random() * table.getn(f_tbl)) + 1 --pick random index from 1 to #f_tbl
--     f_tbl[random_index]() --execute function at the random_index we've picked
-- end

    

    
