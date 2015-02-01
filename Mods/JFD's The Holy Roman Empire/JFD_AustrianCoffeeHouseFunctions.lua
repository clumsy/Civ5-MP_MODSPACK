-- JFD_HolyRomanFunctions
-- Author: JFD
-- DateCreated: 11/5/2014 10:07:36 AM
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
local civilisationAustriaID = GameInfoTypes["CIVILIZATION_AUSTRIA"]

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
-- CORE AUSTRIA FUNCTIONS
--==========================================================================================================================
-- JFD_CoffeeHouseRandomCulturalSpecialist
----------------------------------------------------------------------------------------------------------------------------
function JFD_CoffeeHouseRandomCulturalSpecialist(playerID, cityID, buildingID)
	local player = Players[playerID]
    if player:GetCivilizationType() == civilisationAustriaID and player:IsEverAlive() then
		if buildingID == GameInfoTypes["BUILDING_COFFEE_HOUSE"] then
			local specialists = {}
				specialists[1] = GameInfoTypes["BUILDING_JFD_AUSTRIAN_ARTIST"]
				specialists[2] = GameInfoTypes["BUILDING_JFD_AUSTRIAN_MUSICIAN"]
				specialists[3] = GameInfoTypes["BUILDING_JFD_AUSTRIAN_WRITER"]
			if not city:IsHasBuilding(specialists[1]) and not city:IsHasBuilding(specialists[2]) and not city:IsHasBuilding(specialists[3]) then
				player:GetCityByID(cityID):SetNumRealBuilding(specialists[JFD_GetRandom(1, 3)], 1) 
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationAustriaID) then
	GameEvents.CityConstructed.Add(JFD_CoffeeHouseRandomCulturalSpecialist)
end	
--==========================================================================================================================
--==========================================================================================================================