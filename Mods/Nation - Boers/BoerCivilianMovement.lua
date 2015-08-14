-- BoerMovement
-- Author: ViceVirtuoso
-- DateCreated: 5/8/2014 12:12:38 PM
--------------------------------------------------------------
local iBoers = GameInfoTypes.CIVILIZATION_BOER
local iGPPromo = GameInfoTypes.PROMOTION_BOER_MOVEMENT

function BoerCivilianMovement(iPlayer, iUnitID)
	if iPlayer < GameDefines.MAX_MAJOR_CIVS then
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == iBoers then
			local pUnit = pPlayer:GetUnitByID(iUnitID)
			if pUnit:IsGreatPerson() and not pUnit:IsHasPromotion(iGPPromo) then
				pUnit:SetHasPromotion(iGPPromo, true)
				pUnit:SetMoves(pUnit:GetMoves() + 1)
			end
		end
	end
end

GameEvents.UnitSetXY.Add(BoerCivilianMovement)