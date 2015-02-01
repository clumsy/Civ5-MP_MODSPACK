-- JFD_GreatBritainUtilities
-- Author: JFD
-- DateCreated: 11/21/2014 4:13:15 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local mathFloor = math.floor
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsRevisedEnglandActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsRevisedEnglandActive()
	for row in GameInfo.Traits("JFD_EnhancedGoldenAgeFromAdmirals == 1") do
		if row.Type == "TRAIT_JFD_ENGLAND" then
			return true
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCityStartingGold
------------------------------------------------------------------------------------------------------------------------
function JFD_GetCityStartingGold(playerID, city)
	local player = Players[playerID]
	local playerEra = player:GetCurrentEra()
	local numStartingGold = 40
	local gameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent
	local eraGold = GameInfo.Eras[playerEra].StartingGold
	numStartingGold = numStartingGold + (numStartingGold * gameSpeed / 100) 
	
	if player:GetCapitalCity() then
		local capital = player:GetCapitalCity()
		local plotDistance = Map.PlotDistance(city:GetX(), city:GetY(), capital:GetX(), capital:GetY())
		numStartingGold = numStartingGold + (plotDistance * 10)
	end
	
	if eraGold > 0 then
		numStartingGold = numStartingGold + eraGold
	end
	
	return numStartingGold
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetProductionFromCities
------------------------------------------------------------------------------------------------------------------------
function JFD_GetProductionFromCities(playerID)
	local player = Players[playerID]
	local numProduction = 0
	for city in player:Cities() do
		local baseProduction = city:GetBaseYieldRate(yieldProductionID) 
		numProduction = numProduction + baseProduction
	end
	
	numProduction = mathFloor(numProduction * 5 / 100)
	return numProduction
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetProductionPenalty
------------------------------------------------------------------------------------------------------------------------
function JFD_GetProductionPenalty(playerID)
	local player = Players[playerID]
	local productionPenalty = (player:GetUnhappiness() - player:GetHappiness()) * 2
	
	return productionPenalty
end
--==========================================================================================================================
--==========================================================================================================================