-- JFD_Ottoman_Functions
-- Author: JFD
-- DateCreated: 6/5/2015 2:45:49 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("JFD_OttomansDynamicTopPanelSupport.lua")
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
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationOttomanID		= GameInfoTypes["CIVILIZATION_OTTOMAN"]
local isCivOttomanActive		= JFD_IsCivilisationActive(civilizationOttomanID)
local isCivOttomanActivePlayer  = activePlayer:GetCivilizationType() == civilizationOttomanID

if isCivOttomanActive then
	print("Sultan Suleiman is in this game")
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- SUZERAINTY
----------------------------------------------------------------------------------------------------------------------------
-- JFD_OttomansInit
local policyOttomanInternalTradeRoutes = GameInfoTypes["POLICY_JFD_OTTOMAN_INTERNAL_BONUS"]

function JFD_OttomansInit()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationOttomanID) then
			if (not player:HasPolicy(policyOttomanInternalTradeRoutes)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyOttomanInternalTradeRoutes, true)
			end
		end
	end 
end
if isCivOttomanActive then
	Events.LoadScreenClose.Add(JFD_OttomansInit)
end

-- JFD_OttomanPuppetTributes
function JFD_OttomanPuppetTributes(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationOttomanID) then
		local numGoldFromPuppets = JFD_OttomanGetGoldFromPuppets(playerID)
		if numGoldFromPuppets > 0 then
			player:ChangeGold(numGoldFromPuppets)
		end
		local numFaithFromPuppets = JFD_OttomanGetFaithFromPuppets(playerID)
		if numFaithFromPuppets > 0 then
			player:ChangeFaith(numFaithFromPuppets)
		end
	end
end
if isCivOttomanActive then
	GameEvents.PlayerDoTurn.Add(JFD_OttomanPuppetTributes)
end
--==========================================================================================================================
--==========================================================================================================================