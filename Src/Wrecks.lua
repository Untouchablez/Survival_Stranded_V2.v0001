--- Made by GaryTheGoat --- 
--- Please do not amend / upload / copy any content without permission
--- feedback welcome samcaunt@hotmail.co.uk

local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local ScenarioFramework = import('/lua/ScenarioFramework.lua')

function Wrecks()        
    local bp = unit:GetBlueprint()
        if (bp != nil) then
        bp.Wreckage = nil
        end
end
