-- JFD_KilwaFunctions
-- Author: JFD
-- DateCreated: 10/11/2014 4:08:02 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("RouteConnections")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_MC_KILWA"]

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

if JFD_IsCivilisationActive(civilisationID) then
	print("Sultan Al-Hassan is in this game")
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_KilwaGrowth
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumberInternationalRoutesLeavingCity(player, city)
	local tradeRoutes = player:GetTradeRoutes()
	local numRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		if originatingCity == city then
			numRoutes = numRoutes + 1
		end
	end
	
	return numRoutes
end

local buildingCoralPortID = GameInfoTypes["BUILDING_MC_SWAHILI_CORAL_PORT"]
local buildingKilwaID = GameInfoTypes["BUILDING_MC_KILWA"]

function JFD_KilwaGrowth(playerID)
	local player = Players[playerID]
    if player:IsEverAlive() and player:GetCivilizationType() == civilisationID then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingCoralPortID) then
				city:SetNumRealBuilding(buildingKilwaID, math.min(JFD_GetNumberInternationalRoutesLeavingCity(player, city), 5)) 
			else
				city:SetNumRealBuilding(buildingKilwaID, 0) 
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_KilwaGrowth)
end
--==========================================================================================================================
--==========================================================================================================================