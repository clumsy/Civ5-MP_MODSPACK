-- Belgian Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Belgian Decisions: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil = math.ceil
local policyForcePubliqueID = GameInfoTypes["POLICY_JFD_BELGIAN_FORCE_PUBLIQUE"]
local policyGeographicConferenceID = GameInfoTypes["POLICY_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE"]
--------------------------------------------------------------------------------------------------------------------------
-- Belgian: Create the Force Publique
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ForcePublique = {}
	Decisions_ForcePublique.Name = "TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE"
	Decisions_ForcePublique.Desc = "TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_DESC"
	HookDecisionCivilizationIcon(Decisions_ForcePublique, "CIVILIZATION_JFD_BELGIUM")
	Decisions_ForcePublique.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_ForcePublique") == true then
			Decisions_ForcePublique.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(750 * iMod)
		Decisions_ForcePublique.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1   then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCapitalCity() == nil 							then return true, false end
		if player:GetCurrentEra() < eraIndustrialID 				then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ForcePublique.DoFunc = (
	function(player)
		local goldCost = mathCeil(750 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyForcePubliqueID, true)
		save(player, "Decisions_ForcePublique", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_ForcePublique", Decisions_ForcePublique)
-------------------------------------------------------------------------------------------------------------------------
-- Belgian: Convene the Brussels Geographic Confederence
-------------------------------------------------------------------------------------------------------------------------
local Decisions_GeographicConference = {}
	Decisions_GeographicConference.Name = "TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE"
	Decisions_GeographicConference.Desc = "TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_DESC"
	HookDecisionCivilizationIcon(Decisions_GeographicConference, "CIVILIZATION_JFD_BELGIUM")
	Decisions_GeographicConference.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_GeographicConference") == true then
			Decisions_GeographicConference.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(1100 * iMod)
		Decisions_GeographicConference.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCapitalCity() == nil 							then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		
		return true, true
	end
	)
	
	Decisions_GeographicConference.DoFunc = (
	function(player)
		local goldCost = mathCeil(1100 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyGeographicConferenceID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE")) 
		save(player, "Decisions_GeographicConference", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_GeographicConference", Decisions_GeographicConference)
--=======================================================================================================================
--=======================================================================================================================