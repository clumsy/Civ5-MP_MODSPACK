include("PlotIterators")
--_________________________________________________________________________________________________________________________________________________________________________________________________________
--"Start with a free Great General. Great Generals grant Combat Strenth against cities to nearby units, and you gain points towards Great Generals from repairing or improving tiles on conquered cities."
--Add PlotIterators to the mod (The Safavids have one, just copy it from there) and set it as import into VSF = True
--The free Great General can be done through SQL/XML, with Civilization_FreeUnits. 
--You also need to add a promotion that grant combat strength against cities and change the promotionID here.
--The local greatGeneralPoints defines how much you gain from improving tiles.
--_________________________________________________________________________________________________________________________________________________________________________________________________________
local civilizationID = GameInfoTypes["CIVILIZATION_LITE_AKKAD"]
local promotionID = GameInfoTypes["PROMOTION_LITE_AKKAD_CITY_BONUS"]
local greatGeneralPoints = 2
--_________________________________________________________________________________________________________________________________________________________________________________________________________
--GREAT GENERAL BONUS AGAINST CITIES
--_________________________________________________________________________________________________________________________________________________________________________________________________________
function liteGreatGeneralBonusReset(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		local greatGenerals = {}
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionID) then
				unit:SetHasPromotion(promotionID, false)
			end
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"]) then
				table.insert(greatGenerals, unit)
			end
		end
		for key,greatGeneral in pairs(greatGenerals) do 
			local plot = greatGeneral:GetPlot()
			for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:IsCombatUnit() and not(otherUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
						otherUnit:SetHasPromotion(promotionID, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(liteGreatGeneralBonusReset)

function liteGreatGeneralBonusAgainstCities(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID and (player:GetUnitClassCount(GameInfoTypes["UNITCLASS_GREAT_GENERAL"]) > 0) then
		local unit = player:GetUnitByID(unitID)
		local plot = unit:GetPlot()
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"]) then
			for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:IsCombatUnit() and not(otherUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
						otherUnit:SetHasPromotion(promotionID, true)
					end
				end
			end
		elseif unit:IsCombatUnit() and not(unit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
			unit:SetHasPromotion(promotionID, false)
			for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"]) then
						unit:SetHasPromotion(promotionID, true)
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(liteGreatGeneralBonusAgainstCities)
--_________________________________________________________________________________________________________________________________________________________________________________________________________
--GREAT GENERAL POINTS FROM IMPROVEMENTS
--_________________________________________________________________________________________________________________________________________________________________________________________________________
function liteGreatGeneralPointsfromImproving(playerID, plotX, plotY, improvementID) 
	local player = Players[playerID]
	if improvementID then
		if player:GetCivilizationType() == civilizationID then
			local plot = Map.GetPlot(plotX, plotY)
			local city = plot:GetWorkingCity()
			if city and city:IsOccupied() then
				player:ChangeCombatExperience(greatGeneralPoints)
			end
		end
	end
end
GameEvents.BuildFinished.Add(liteGreatGeneralPointsfromImproving)
--_________________________________________________________________________________________________________________________________________________________________________________________________________