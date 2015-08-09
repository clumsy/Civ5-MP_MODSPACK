-- Garrison Artillery Affinity Bonus
-- Author: John
-- DateCreated: 12/19/2013 4:22:46 PM
--------------------------------------------------------------

function GarrisonArtilleryBonus(player, unit, pX, pY)
	local pPlayer = Players[player]
	local pUnit = pPlayer:GetUnitByID(unit)
	if pUnit:GetUnitType() == GameInfoTypes.UNIT_GARRISONARTILLERY then
		pPlot = Map.GetPlot(pX,pY)
		print("Plot Improvement = " .. pPlot:GetImprovementType() .. ", Forts are " .. GameInfoTypes.IMPROVEMENT_FORT .. ", Citadels are " .. GameInfoTypes.IMPROVEMENT_CITADEL)
		if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FORT or pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CITADEL then
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_STRONGRANGED, true)
		else
			pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_STRONGRANGED, false)
		end
	end
end
GameEvents.UnitSetXY.Add(GarrisonArtilleryBonus)