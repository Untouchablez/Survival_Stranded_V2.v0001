--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

local DefenceObject = import(ScenarioInfo.MapPath .. 'Functionality/Defence/DefenceObject.lua')

function OnTick()
  while true do
    -- get current game time in seconds  
    Gametime = DefenceObject.GametimegoalFunction()
    
    -- make the AI unaware of this box # replace ENEMY_1 with army name
    ScenarioFramework.SetIgnorePlayableRect("ARMY_ENEMY", true)
    
    -- make all the players aware of this area and playable at the set time
--    if Gametime >= 40 then
--        ScenarioFramework.SetPlayableArea('STAGE1AREA', false)
--    elseif Gametime <= 36 and Gametime >= 26 then
 --       ScenarioFramework.SetPlayableArea('STAGE2AREA', false)
--    elseif Gametime <= 25 and Gametime >= 11 then
--        ScenarioFramework.SetPlayableArea('STAGE3AREA', false)
--    elseif Gametime <= 10 and Gametime >= 0 then
        ScenarioFramework.SetPlayableArea('STAGE4AREA', false)
--    end

    -- Introduce a delay of 1 second before the next iteration
    -- You may need to replace this with an appropriate delay function
    -- or method provided by the game engine.
    WaitSeconds(1)
  end
end
