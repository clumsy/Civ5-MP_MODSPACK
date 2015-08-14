-- CommandoDefense
-- Author: ViceVirtuoso
-- DateCreated: 5/7/2014 9:42:58 AM
--------------------------------------------------------------
local iBoers = GameInfoTypes.CIVILIZATION_BOER
local iPromotion = GameInfoTypes.PROMOTION_BOER_UU_PROMOTION
local iImprovement = GameInfoTypes.IMPROVEMENT_FARM



function BoerUnitHeal(iPlayer, iUnitID)
	if iPlayer < GameDefines.MAX_MAJOR_CIVS then
		local pPlayer = Players[iPlayer]
		local pUnit = pPlayer:GetUnitByID(iUnitID)
		if pPlayer:GetCivilizationType() == iBoers then
			local pPlot = pUnit:GetPlot()
			if (pPlot ~= nil and pPlot:GetImprovementType() == iImprovement) then
				pUnit:SetHasPromotion(iPromotion, true)
				return
			end
		end
		pUnit:SetHasPromotion(iPromotion, false)
	end
end

GameEvents.UnitSetXY.Add(BoerUnitHeal)