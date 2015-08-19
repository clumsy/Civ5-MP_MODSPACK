include("PlotIterators")

function TCM_Persian_Horses(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PARTHIA"] and player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_PARTHIA_FREEHORSES_1"], 0)
			if not city:IsCapital() then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PARTHIA_FREEHORSES_1"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_Persian_Horses)

function TCM_CataphractAbility(playerID, unitID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PARTHIA"] then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PARTHIANDUMMY"], 0)	
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PARTHIANDUMMY_2"], 0)	
			local plot = city:Plot()
			for i = 0, plot:GetNumUnits() - 1, 1 do  
				local unit = plot:GetUnit(i)
				if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_LOCAL_NOBILITY"]) then
					if city:IsOccupied() or city:IsPuppet() then
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PARTHIANDUMMY"], 1)	
					end
				end
				if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_GOSAN"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PARTHIANDUMMY_2"], 1)	
				end
			end
		end
	end
	if unitID then
		local oldunit = player:GetUnitByID(unitID)
		local oldplot = oldunit:GetPlot()
		if oldplot then
			for firstloop in PlotAreaSweepIterator(oldplot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local unit = firstloop:GetUnit()
				if unit and unit:GetUnitType() == GameInfoTypes["UNIT_PARTHIA_HORSE_ARCHER"] then
					local enemyNum = 0
					local friendlyNum = 0
					for loopPlot in PlotAreaSweepIterator(firstloop, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						local otherUnit = loopPlot:GetUnit()
						if otherUnit then
							if otherUnit:GetOwner() == playerID then
								friendlyNum = friendlyNum + 1
							else
								enemyNum = enemyNum + 1
							end
						end
					end
					if enemyNum > friendlyNum then
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"], true)
					else
						if unit:IsHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"]) then
							unit:SetHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"], false)
						end
					end
				end
			end
		end
	else
		for unit in player:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_PARTHIA_HORSE_ARCHER"] then
				local plot = unit:GetPlot()
				local enemyNum = 0
				local friendlyNum = 0
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					local otherUnit = loopPlot:GetUnit()
					if otherUnit then
						if otherUnit:GetOwner() == playerID then
							friendlyNum = friendlyNum + 1
						else
							enemyNum = enemyNum + 1
						end
					end
				end
				if enemyNum > friendlyNum then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"], true)
				else
					if unit:IsHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"]) then
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_PARTHIA_RETREAT"], false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_CataphractAbility)
GameEvents.UnitSetXY.Add(TCM_CataphractAbility)

