-- JFD_SwitzerlandFunctions
-- Author: JFD
-- DateCreated: 12/4/2013 9:47:55 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_SwitzerlandDynamicTopPanelSupport.lua")
--------------------------------------------------------------
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingSwissManpowerID = GameInfoTypes["BUILDING_JFD_SWISS_MANPOWER"]
local buildingSwissManpowerHandicapID = GameInfoTypes["BUILDING_JFD_SWISS_MANPOWER_HANDICAP"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local isSwitzerlandCivActive = JFD_IsCivilisationActive(civilisationID)
local mathMin = math.min 
local resourceManpowerID = GameInfoTypes["RESOURCE_JFD_MANPOWER"]
				
if isSwitzerlandCivActive then
	print("General Dufour is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_NeutralCityStates
----------------------------------------------------------------------------------------------------------------------------
function JFD_NeutralCityStates(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if player:IsMinorCiv() and otherPlayer:GetCivilizationType() == civilisationID then
		Teams[otherTeamID]:MakePeace(teamID)
		player:ChangeMinorCivFriendshipWithMajor(otherPlayer:GetID(), 1)
	end
end
GameEvents.DeclareWar.Add(JFD_NeutralCityStates)

function OnNotificationAdded(iNotificationId, iNotificationType, sHeader, sSummary, iData1, iData2, iPlayer)
	if (Players[iPlayer]:GetCivilizationType() == civilisationID and sSummary == Locale.ConvertTextKey("TXT_KEY_MISC_MINOR_ALLIES_DECLARED_WAR_ON_YOU_SUMMARY")) then
		UI.RemoveNotification(iNotificationId)
	end
end
Events.NotificationAdded.Add(OnNotificationAdded)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissManpower
----------------------------------------------------------------------------------------------------------------------------
function JFD_SwissManpower(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and not (player:IsMinorCiv()) and not (player:IsBarbarian())) then
		local numManpower = player:GetNumResourceTotal(resourceManpowerID, true)
		for city in player:Cities() do
			if player:GetCivilizationType() == civilisationID then
				city:SetNumRealBuilding(buildingSwissManpowerHandicapID, mathMin(8, numManpower))
			else
				city:SetNumRealBuilding(buildingSwissManpowerID, mathMin(4, numManpower))
			end
		end
	end
end

if isSwitzerlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_SwissManpower)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissBankDeposits
----------------------------------------------------------------------------------------------------------------------------
function JFD_SwissBankDeposits(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationID then
		local goldBoost = JFD_GetGoldFromDoF(playerID)
		if goldBoost > 0 then
			player:ChangeGold(goldBoost)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SwissBankDeposits)
--=======================================================================================================================================================================================
--=======================================================================================================================================================================================
