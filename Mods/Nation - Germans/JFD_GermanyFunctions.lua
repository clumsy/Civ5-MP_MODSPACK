-- Bismarckian Germany Functions
-- Author: JFD
-- DateCreated: 4/27/2014 11:45:55 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_GERMANY"]

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
	print("Chancellor Bismarck is in this game")
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_GERMANY"]
local buildingDelegateID = GameInfoTypes["BUILDING_JFD_BISMARCK_DELEGATE"]
local isGermanyCivActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CityStateConquests
----------------------------------------------------------------------------------------------------------------------------
function JFD_CityStateConquests(oldOwnerID, isCapital, cityX, cityY, newOwnerID, pop, isConquest)
	local player = Players[newOwnerID]
	local capturedPlayer = Players[oldOwnerID]
	if player:GetCivilizationType() == civilisationID then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if city:IsOriginalCapital() and capturedPlayer:IsMinorCiv() then
			if not city:IsHasBuilding(buildingDelegateID) then
				city:SetNumRealBuilding(buildingDelegateID, 1)
			end
			
			city:ChangeResistanceTurns(-mathFloor(city:GetResistanceTurns()))
		end 
	end
end

if isGermanyCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_CityStateConquests)
end
--==========================================================================================================================
--==========================================================================================================================