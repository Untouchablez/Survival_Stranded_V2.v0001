local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local UnitCreator = import(ScenarioInfo.MapPath .. 'Src/UnitCreator.lua')
local PlatoonOrders = import(ScenarioInfo.MapPath .. 'Src/PlatoonOrders.lua')

local BuildTime = ScenarioInfo.Options.opt_Survival_BuildTime
local LandSpawnIntervalOption = ScenarioInfo.Options.opt_Survival_LandSpawnInterval

function SetupWaveSpawner()
    ---- Current TechLevel Tech Level 1 is first group in WaveTables
    TechLevel = 1
    --  Max WaveTables you made for this group
    MaxTechLevel = 5 
    -- Time to Advance to next Table in group
    TimeToUnlockTech = 480
    -- Start Thread for Advancing to the next Tech Level
    TechLevelAdvancer(BuildTime, TechLevel, MaxTechLevel, TimeToUnlockTech) 
    -- 3 Variables for selecting the correct WaveTable from Tables folder
    local Army = "ARMY_ENEMY"
    local Faction = "AEON"
    local UnitMods = "" -- Can Be used for Table for example TotalMayhem Units
    local WaveType = "Land"
    
    -- WaveLayer is used for PlatoonOrders.lua for generating a save pathway to position "Map Needs Waypoints added for this to work"
    local WaveLayer = 'Air'

    -- Final Location for Units to go to
    local FinalDestination = ScenarioUtils.MarkerToPosition("SURVIVAL_CENTER_1")
    -- Can add Varible here so it wil adjust to amount of players
    SpawnInterval = LandSpawnIntervalOption 

    InitializeLandWaves(Army, Faction, WaveType, UnitMods, WaveLayer, FinalDestination, SpawnInterval)
end

function TechLevelAdvancer(BuildTime, TechLevel, MaxTechLevel, TimeToUnlockTech)
    ForkThread(function()
        while true do  
            local Time = (GetGameTimeSeconds() - BuildTime)  
            if Time > TechLevel * TimeToUnlockTech then 
                if TechLevel < MaxTechLevel then
                    TechLevel = TechLevel + 1
                end
                if TechLevel == MaxTechLevel then
                    break
                end
            end
            WaitSeconds(1)
        end
    end)
end

function InitializeLandWaves(Army, Faction, WaveType, UnitMods, WaveLayer, FinalDestination, SpawnInterval)
    ForkThread(function()            
        WaitSeconds(BuildTime)
        while true do 
            WaitSeconds(1)
            -- Generate Data for SpawnPos, UnitTable
            local Area = Areas.PickRandomArea(Areas.spawnLandArea)
            local SpawnLocation = Areas.PickRandomPointInArea(Area)            
            local SelectedTable = TablePicker(Army, Faction, WaveType, UnitMods,WaveLayer)    
            local MaxTables = table.getn(SelectedTable.Tables)
            local RandomNumber = Random(1, MaxTables)    
            local UnitTableData = SelectedTable.Tables[RandomNumber].UnitIds  
            --Create the units that are in Table
            Units = UnitCreator.CreateUnits(UnitTableData, Army, SpawnLocation)

            --Generate Data for where units need to go and want Orders they recieve
            local OrderId = SelectedTable.Tables[RandomNumber].OrderId
            local Formation = SelectedTable.Tables[RandomNumber].Formation
            local AttackLocations = SelectedTable.Tables[RandomNumber].AttackLocations 
            local AreaOrMarkerCache = SelectedTable.Tables[RandomNumber].AreaOrMarkerCache 
            local CacheType = SelectedTable.Tables[RandomNumber].CacheType 
            --Generate a Table for Attack Locations
            local AttackLocationTable = GenerateTableAttackPostions(AttackLocations, AreaOrMarkerCache, CacheType)

            PlatoonOrders.GiveOrderLand(Army, WaveLayer, OrderId, Units, 
                AttackLocationTable, SpawnLocation, FinalDestination, Formation, 0) 
            WaitSeconds(SpawnInterval)
        end
    end)
end

function TablePicker(Army, Faction, WaveType, UnitMods, WaveLayer)
    local Table = nil
    Table = import(ScenarioInfo.MapPath .. 'Tables/WaveTables'..WaveType..'/'..Army..'_'..Faction..'_T'..TechLevel..'_'..UnitMods..'.lua')
    return Table
end

function GenerateTableAttackPostions(AttackLocations, AreaOrMarkerCache, CacheType)
    Table = { }
    if CacheType == "Marker" then 
        for i = 1, AttackLocations do
            local Location = Markers.PickRandomPosition(Markers[AreaOrMarkerCache])
            table.insert(Table, Location)
        end
    elseif CacheType == "Area" then
        for i = 1, AttackLocations do
            local Location = Areas.PickRandomPosition(Areas[AreaOrMarkerCache])
            table.insert(Table, Location)
        end
    else
        WARN("function GenerateTableAttackPostions() InValid CacheType : " .. CacheType ..'               Extra Info: Allowed CacheType = "Marker" or "Area"')
    end
    return Table 
end
