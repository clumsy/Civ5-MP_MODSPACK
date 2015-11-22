-- JFD_DenmarkNorwayDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Denmark-Norway Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_DENMARK_NORWAY"]
local christiania = nil
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local policyBranchFreedomID = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local policyRigsraadAbolishedID = GameInfoTypes["POLICY_JFD_RIGSRAAD_ABOLISHED"]
--------------------------------------------------------------------------------------------------------------------------
-- Denmark-Norway: Organise a Witch-hunt
-------------------------------------------------------------------------------------------------------------------------
local Decisions_DenmarkNorwayWitchhunt = {}
	Decisions_DenmarkNorwayWitchhunt.Name = "TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_WITCH_HUNT"
	Decisions_DenmarkNorwayWitchhunt.Desc = "TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_WITCH_HUNT_DESC"
	HookDecisionCivilizationIcon(Decisions_DenmarkNorwayWitchhunt, "CIVILIZATION_JFD_DENMARK_NORWAY")
	Decisions_DenmarkNorwayWitchhunt.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		
		local era = load(player, "Decisions_DenmarkNorwayWitchhunt")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_DenmarkNorwayWitchhunt", nil)
			else
				Decisions_DenmarkNorwayWitchhunt.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_WITCH_HUNT_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local goldCost = mathCeil(170 * iMod)
		local faithReward = mathCeil(48 * iMod)
		local goldenAgeReward = mathCeil(202 * iMod)
		Decisions_DenmarkNorwayWitchhunt.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_WITCH_HUNT_DESC", goldCost, faithReward, goldenAgeReward)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then  return true, false end
		if player:GetGold() < goldCost 								then  return true, false end
		if player:GetCurrentEra() < eraMedievalID 					then  return true, false end
		if player:IsPolicyBranchUnlocked(policyBranchFreedomID) 	then  return true, false end

		return true, true
	end
	)
	
	Decisions_DenmarkNorwayWitchhunt.DoFunc = (
	function(player)
		local goldCost = mathCeil(170 * iMod)
		local faithReward = mathCeil(48 * iMod)
		local goldenAgeReward = mathCeil(202 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeFaith(faithReward)
		player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_DenmarkNorwayWitchhunt", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_DenmarkNorwayWitchhunt", Decisions_DenmarkNorwayWitchhunt)
-------------------------------------------------------------------------------------------------------------------------
-- Denmark-Norway: Abolish the Rigsraad
-------------------------------------------------------------------------------------------------------------------------
local Decisions_DenmarkNorwayRigsraad = {}
	Decisions_DenmarkNorwayRigsraad.Name = "TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_RIGSRAAD"
	Decisions_DenmarkNorwayRigsraad.Desc = "TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_RIGSRAAD_DESC"
	HookDecisionCivilizationIcon(Decisions_DenmarkNorwayRigsraad, "CIVILIZATION_JFD_DENMARK_NORWAY")
	Decisions_DenmarkNorwayRigsraad.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID 			then return false, false end
		if load(player, "Decisions_DenmarkNorwayRigsraad") == true 	then
			Decisions_DenmarkNorwayRigsraad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_RIGSRAAD_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = mathCeil(player:GetNextPolicyCost() * iMod)
		Decisions_DenmarkNorwayRigsraad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_DENMARK_NORWAY_RIGSRAAD_DESC", cultureCost)
		
		if player:GetJONSCulture() < cultureCost 		then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_DenmarkNorwayRigsraad.DoFunc = (
	function(player)
		local cultureCost = mathCeil(player:GetNextPolicyCost() * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRigsraadAbolishedID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_RIGSRAAD")) 
		save(player, "Decisions_DenmarkNorwayRigsraad", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_DenmarkNorwayRigsraad", Decisions_DenmarkNorwayRigsraad)
--=======================================================================================================================
--=======================================================================================================================
