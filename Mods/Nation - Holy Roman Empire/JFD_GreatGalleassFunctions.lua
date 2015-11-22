-- JFD_GreatGalleassFunctions
-- Author: JFD
-- DateCreated: 11/7/2014 2:57:31 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local civilisationVeniceID = GameInfoTypes["CIVILIZATION_VENICE"]

function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--==========================================================================================================================
-- CORE VENICE FUNCTIONS
--==========================================================================================================================
-- JFD_VenetianGreatGalleass
----------------------------------------------------------------------------------------------------------------------------
function JFD_VenetianGreatGalleass(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationVeniceID and player:IsEverAlive() then
		local greatGalleassNearby = false
		for unit in player:Units() do
			if unit and unit:IsCombatUnit() and unit:GetDomainType() == GameInfoTypes["DOMAIN_LAND"] or unit:GetDomainType() == GameInfoTypes["DOMAIN_SEA"] and not unit:IsEmbarked() then
				local siegePromotionID = GameInfoTypes["PROMOTION_SIEGE"]
				for greatGalleass in player:Units() do
					if greatGalleass:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_CITY_BONUS_GALLEASS"]) then
						if Map.PlotDistance(unit:GetX(), unit:GetY(), greatGalleass:GetX(), greatGalleass:GetY()) < 2 then
							greatGalleassNearby = true
						end
					end
				end
				
				if greatGalleassNearby then
					if not unit:IsHasPromotion(siegePromotionID) then
						unit:SetHasPromotion(siegePromotionID, true)
					end
				else
					if unit:IsHasPromotion(siegePromotionID) then
						unit:SetHasPromotion(siegePromotionID, false)
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationVeniceID) then
	GameEvents.UnitSetXY.Add(JFD_VenetianGreatGalleass) 
	GameEvents.PlayerDoTurn.Add(JFD_VenetianGreatGalleass)
end
--==========================================================================================================================
--==========================================================================================================================