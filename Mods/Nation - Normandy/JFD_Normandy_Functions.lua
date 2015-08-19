-- JFD_Normandy_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("UniqueDiplomacyUtils.lua")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsHasOriginalCapital
function JFD_IsHasOriginalCapital(playerID, otherPlayerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if (city:GetOriginalOwner() == otherPlayerID and city:IsOriginalCapital()) then
			return true
		end
	end
end	
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationNormandyID    = GameInfoTypes["CIVILIZATION_JFD_NORMANDY"]
local isCivNormandyActive		= JFD_IsCivilisationActive(civilizationNormandyID)
local isCivNormandyActivePlayer	= activePlayer:GetCivilizationType() == civilizationNormandyID

if isCivNormandyActive then
	print("Duke William the Conqueror is in this game")
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationAngloSaxons 		= GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
local civilizationEnglandID 		= GameInfoTypes["CIVILIZATION_ENGLAND"]
local civilizationHenryVIIEngland 	= GameInfoTypes["CIVILIZATION_JFD_HENRY_ENGLAND"]

-- JFD_NormandyUniqueResponses
function JFD_NormandyUniqueResponses()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			-- If the player is England
			if (civilizationID == civilizationAngloSaxons or civilizationID == civilizationEnglandID or civilizationID == civilizationHenryVIIEngland) then
				ChangeDiplomacyResponse("LEADER_JFD_WILLIAM_I", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_WILLIAM_I_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_WILLIAM_I_FIRSTGREETING_ENGLAND%", 500)
				ChangeDiplomacyResponse("LEADER_JFD_WILLIAM_I", "RESPONSE_DEFEATED", "TXT_KEY_LEADER_JFD_WILLIAM_I_DEFEATED%", "TXT_KEY_LEADER_JFD_WILLIAM_I_DEFEATED_ENGLAND%", 500)
				break
			end
		end
	end
end
if (isCivNormandyActive and (not isCivNormandyActivePlayer)) then
	Events.SequenceGameInitComplete.Add(JFD_NormandyUniqueResponses)
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- BAYEUX TAPESTRY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_NormandyCourthousesOnConquest
local buildingCourthouseID = GameInfoTypes["BUILDING_COURTHOUSE"]

function JFD_NormandyCourthousesOnConquest(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationNormandyID) then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if city:IsOriginalCapital() then
			city:SetNumRealBuilding(buildingCourthouseID, 1)
			for otherCity in player:Cities() do
				if otherCity:GetOriginalOwner() == oldOwnerID then
					if (not otherCity:IsHasBuilding(buildingCourthouseID)) then
						otherCity:SetNumRealBuilding(buildingCourthouseID, 1)
					end
				end
			end	
		else
			if JFD_IsHasOriginalCapital(newOwnerID, oldOwnerID) then
				city:SetNumRealBuilding(buildingCourthouseID, 1)
			end
		end
	end
end
if isCivNormandyActive then
	GameEvents.CityCaptureComplete.Add(JFD_NormandyCourthousesOnConquest)
end
--==========================================================================================================================
--==========================================================================================================================