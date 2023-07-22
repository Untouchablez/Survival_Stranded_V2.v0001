


function CreateUnits(TableData, Army, Position)
	local Units = { }
	for k, UnitBlueprint in TableData do 
	   	local Unit = CreateUnitHPR(UnitBlueprint, Army, Position[1], Position[2], Position[3], 0, 0, 0)
		   if Army == "ARMY_ENEMY" then


			--UnitBuffer.HealthMultiplier(Unit)
			--UnitBuffer.DamageMultiplier(Unit)
	
			Unit:SetProductionPerSecondEnergy(1000)
			Unit:SetProductionPerSecondMass(1000)
			if EntityCategoryContains(categories.TECH3 + categories.EXPERIMENTAL, Unit) then
				Unit:SetReclaimable(false)
			end
			Unit:SetCapturable(false)

		   end

		table.insert(Units, Unit)
	end
	return Units
end