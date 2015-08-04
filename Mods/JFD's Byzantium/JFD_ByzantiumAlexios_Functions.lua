-- JFD_ByzantiumAlexios_Functions
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

-- JFD_IsCommunityPatchDLL
function JFD_IsCommunityPatchDLL()
	local communityPatchDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingCPDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchDLLID) then
			isUsingCPDLL = true
			break
		end
	end

	return isUsingCPDLL
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID					= Game.GetActivePlayer()
local activePlayer						= Players[activePlayerID]
local civilizationByzantiumAlexiosID    = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local gameSpeedID						= Game:GetGameSpeedType()
local isCivByzantiumAlexiosActive		= JFD_IsCivilisationActive(civilizationByzantiumAlexiosID)
local isCivByzantiumAlexiosActivePlayer	= activePlayer:GetCivilizationType() == civilizationByzantiumAlexiosID
local isUsingCPDLL						= JFD_IsCommunityPatchDLL()
local mathCeil							= math.ceil

if isCivByzantiumAlexiosActive then
	print("Emperor Alexios I Komnenos is in this game")
	if isUsingPiety then
		include("JFD_PietyUtils.lua")
	end
end
--==========================================================================================================================
-- DIPLOMACY FUNCTIONS
--==========================================================================================================================
-- DIPLOMACY
----------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumID = GameInfoTypes["CIVILIZATION_BYZANTIUM"]

-- JFD_ByzantiumAlexiosUniqueResponses
function JFD_ByzantiumAlexiosUniqueResponses()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			-- If the player is England
			if civilizationID == civilizationByzantiumID then
				ChangeDiplomacyResponse("LEADER_JFD_ALEXIOS", "RESPONSE_FIRST_GREETING", "TXT_KEY_LEADER_JFD_ALEXIOS_FIRSTGREETING%", "TXT_KEY_LEADER_JFD_ALEXIOS_FIRSTGREETING_THEODORA%", 500)
				break
			end
		end
	end
end
if (isCivByzantiumAlexiosActive and (not isCivByzantiumAlexiosActivePlayer)) then
	Events.SequenceGameInitComplete.Add(JFD_ByzantiumAlexiosUniqueResponses)
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- KOMNENONIAN RESTORATION
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ByzantiumAlexiosInit
local policyByzantiumAlexiosRangedCombatStrengthOffID = GameInfoTypes["POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_OFF"]
local policyByzantiumAlexiosRangedCombatStrengthOnID  = GameInfoTypes["POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_ON"]

function JFD_ByzantiumAlexiosInit(playerID, isStart, turns)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumAlexiosID) then
			if ((not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID)) and (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID))) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, true)
			end
		end
	end 
end
if isCivByzantiumAlexiosActive then
	Events.LoadScreenClose.Add(JFD_ByzantiumAlexiosInit)
end

-- JFD_ByzantiumAlexiosGoldenAgeRangedCombatStrength
function JFD_ByzantiumAlexiosGoldenAgeRangedCombatStrength(playerID, isStart, turns)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumAlexiosID) then
		if player:IsGoldenAge() then
			if player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, false)
			end
			if (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID)) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID, true)
			end
		else
			if player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOnID, false)
			end
			if (not player:HasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID)) then
				player:SetHasPolicy(policyByzantiumAlexiosRangedCombatStrengthOffID, true)
			end
		end
	end
end
if isCivByzantiumAlexiosActive then
	if isUsingCPDLL then
		GameEvents.PlayerGoldenAge.Add(JFD_ByzantiumAlexiosGoldenAgeRangedCombatStrength)
	else
		GameEvents.PlayerDoTurn.Add(JFD_ByzantiumAlexiosGoldenAgeRangedCombatStrength)
	end
end

-- JFD_ByzantiumAlexiosGoldenAgePointsOnWar
local goldenAgeMod = GameInfo.GameSpeeds[gameSpeedID].GoldenAgePercent

function JFD_ByzantiumAlexiosGoldenAgeOnWar(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local playerID = team:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = otherTeam:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumAlexiosID) then
		local otherPlayerSize = otherPlayer:GetNumCities()
		player:ChangeGoldenAgeTurns(otherPlayerSize)
	elseif (otherPlayer:IsAlive() and otherPlayer:GetCivilizationType() == civilizationByzantiumAlexiosID) then
		local otherPlayerSize = player:GetNumCities()
		otherPlayer:ChangeGoldenAgeTurns(otherPlayerSize)
	end
end
if isCivByzantiumAlexiosActive then
	GameEvents.DeclareWar.Add(JFD_ByzantiumAlexiosGoldenAgeOnWar)
end
--==========================================================================================================================
-- UU FUNCTIONS
--==========================================================================================================================
-- LANTERNAS
--------------------------------------------------------------------------------------------------------------------------
local unitPromotionLanternasID = GameInfoTypes["PROMOTION_JFD_LANTERNAS"]

function JFD_ByzantiumAlexiosLanternasGoldenAgeSupply(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumAlexiosID) then 
		if player:IsGoldenAge() then
			for unit in player:Units() do
				if unit:IsHasPromotion(unitPromotionLanternasID) then
					local unitDamage = unit:GetDamage()
					if unitDamage > 0 then
						unit:ChangeDamage(-15)
					end
				end
			end
		end
	end
end
if isCivByzantiumAlexiosActive then
	GameEvents.PlayerDoTurn.Add(JFD_ByzantiumAlexiosLanternasGoldenAgeSupply)
end
--==========================================================================================================================
--==========================================================================================================================