ScenarioInfo.MapPath = '/maps/survival_stranded_v2.v0002/'

local Areas = import(ScenarioInfo.MapPath .. 'Src/Areas.lua')
local AllFactions = import(ScenarioInfo.MapPath .. 'Src/AllFactions.lua')
local Boss = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Boss/Boss.lua')
local IdleUnits = import(ScenarioInfo.MapPath .. 'Src/IdleUnits.lua')
local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')
local DefaultOptions = import(ScenarioInfo.MapPath .. 'Src/DefaultOptions.lua')
local Drops = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Drops/Drops.lua')
local Gates = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Gates/Gates.lua')
local GameTime = import(ScenarioInfo.MapPath .. 'Src/GameTime.lua')
local GatePlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/GatePlatoons.lua')
local LandPlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/LandPlatoons.lua')
local LandAttack = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Land/LandAttack.lua')
--local LandAttackV2 = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Land/LandAttackV2.lua')
local Markers = import(ScenarioInfo.MapPath .. 'Src/Markers.lua')
local Missions = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Missions/Missions.lua')
local NavyPlatoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/NavyPlatoons.lua')
local NavyAttack = import(ScenarioInfo.MapPath .. 'Functionality/Attack/Navy/NavyAttack.lua')
local PlayableArea = import(ScenarioInfo.MapPath .. 'Src/PlayableArea.lua')
local Platoons = import(ScenarioInfo.MapPath .. 'Functionality/Tables/Platoons.lua')
local ResourceSpawning = import(ScenarioInfo.MapPath .. 'Src/ResourceSpawning.lua')
local ResourceTable = import(ScenarioInfo.MapPath .. 'Survival_Stranded_V2_tables.lua')
local UnitRevealer = import(ScenarioInfo.MapPath .. 'Src/UnitRevealer.lua')
local Wrecks = import(ScenarioInfo.MapPath .. 'Src/Wrecks.lua')


-- Forged Alliance 
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

---TABLES
PlayerArmyCount = 0
PlayerArmies = { }
PlayerIndex = { }
EnemyArmies = { }

ScenarioUtils.CreateResources = function() end

function OnPopulate()
    ScenarioUtils.InitializeArmies()
    ScenarioInfo.CampaignMode = true
    Sync.CampaignMode = true
    import('/lua/sim/simuistate.lua').IsCampaign(true)
end
    
function OnStart(self)



 ScenarioInfo.Debug = false

 -- Spawns all factions is enabled in map options
 AllFactions.OnStart()
 -- Spawns the Defence object & objectives
 DefenceObject.OnStart()
 --- Set the gameoptions
 DefaultOptions.OnStart()
 --- Update players on remaining time every 60 seconds
 ForkThread(GameTime.UpdateGameTimeObjective)
 --- Update players Playable Area through out the game
 ForkThread(PlayableArea.OnTick) 
 -- misc settings
 ScenarioInfo.Options.Victory = 'sandbox'	-- custom victory condition
  -- Check the Areas and open up as time progress
 Areas.OnStart()
 -- Cache all the markers
 Markers.OnStart()

 -- Cache all the transport drop platoons in table
 Platoons.OnStart() 
 -- Check the time and update the table and tech
 ForkThread(Platoons.OnTick) 
 
 -- Cache all the navy groups in table
 NavyPlatoons.OnStart()
 -- Check the time and update the table and tech
 ForkThread(NavyPlatoons.OnTick)  

 -- Cache all the land groups in table
 LandPlatoons.OnStart()
 -- Check the time and update the table and tech
 ForkThread(LandPlatoons.OnTick)  

 -- Cache all the gate platoons
 GatePlatoons.OnStart()
 -- Check the time and update the table and tech
 ForkThread(GatePlatoons.OnTick) 

 -- Initiate the Drops spawns and attack moves
 ForkThread(Drops.KeepThemDroppingThread)
  -- Initiate the Navy spawns and attack moves
 ForkThread(NavyAttack.Spawntheunitsthread)
 -- Initiate the Land spawns and attack moves
 ForkThread(LandAttack.Spawntheunitsthread)
 
 
 -- initiate and spawn land / navy gates
 Gates.OnStart()
 -- Initiate the spawns from the land / navy gates
 ForkThread(Gates.Spawntheunitsthread)
 ForkThread(Gates.Spawntheunitsthread2)
 ForkThread(Gates.Spawntheunitsthread3)

 -- initiate boss thread
 ForkThread(Boss.SpawnRandomBossThread)

 -- initialise Missions
 ForkThread(Missions.OnTick)

 -- Update the Game time objective for the defence object
 --ForkThread(DefenceObject.OnTick)
 ForkThread(DefenceObject.UpdateGameTimeObjective)

 -- Adaptive Mass Spawning configuration
 TheRedOrTheBluePill()
 -- intialise the resource spawning
 ResourceSpawning.SetupResources(PlayerIndex, ResourceTable)


 -- check for enemy idle units and kill them after 5 minutes
 --ForkThread(IdleUnits.CheckIdleEnemyUnits)

 -- setup army specific things
 for i, army in ListArmies() do
    if (army == "ARMY_1" or army == "ARMY_2" or army == "ARMY_3" or army == "ARMY_4"  or army == "ARMY_5"  or army == "ARMY_6") then
        -- restrict players from building walls
        ScenarioFramework.AddRestriction(army, categories.WALL)

        for x, ArmyX in ListArmies() do
            -- if human army
            if (ArmyX == "ARMY_1" or ArmyX == "ARMY_2" or ArmyX == "ARMY_3" or ArmyX == "ARMY_4" or army == "ARMY_5"  or army == "ARMY_6") then
                SetAlliance(army, ArmyX, 'Ally')
                SetAlliance(army, "ARMY_ENEMY", "Enemy")
                SetAlliance(army, "ARMY_ALLY", "Ally")
                SetAlliance("ARMY_ENEMY", "ARMY_ALLY", 'Enemy') 
                SetAlliedVictory(army, true)
            end
        end
    end
 end

  -- set army colours
  SetArmyColor("ARMY_ENEMY", 128, 0, 0)
  SetArmyColor("ARMY_ALLY",128, 128, 128)
 
  -- spawnwaves don't have a unit cap
  -- SetIgnoreArmyUnitCap("ARMY_ENEMY", true)
  --LandAttackV2.SetupWaveSpawner()

end


function TheRedOrTheBluePill()
    local ArmyName = {
        "ARMY_1", "ARMY_2", "ARMY_3", "ARMY_4", "ARMY_5", "ARMY_6", "ARMY_7", "ARMY_8", 
        "ARMY_9", "ARMY_10", "ARMY_11", "ARMY_12", "ARMY_13", "ARMY_14", "ARMY_15", "ARMY_16"}
    local EnemyArmyName = {
        "ARMY_ENEMY" , "ARMY_ALLY"}

    for i, Player in ListArmies() do
        for x, PossibleName in ArmyName do 
            if PossibleName == Player then 
                table.insert(PlayerArmies, Player)
            end
        end
        for x, PossibleName in EnemyArmyName do
            if PossibleName == Player then
                table.insert(EnemyArmies, Player)
            end
        end
    end
    for Every, Player in PlayerArmies do
        for IndexNumber = 1, 16 do 
            if Player == "ARMY_" .. IndexNumber then
                table.insert(PlayerIndex, IndexNumber)
            end
        end   
    end
        
    ResourceTable =	ResourceTable
    PlayerArmyCount = table.getn(PlayerArmies)
    SetIgnoreArmyUnitCap("ARMY_ENEMY", true)
end

function GetActivePlayerCount()
    local activePlayerCount = 0
    local armies = GetArmiesTable()

    for index, army in armies do
        if army.is_human and not army.out_of_game then
            activePlayerCount = activePlayerCount + 1
        end
    end

    return activePlayerCount
end





