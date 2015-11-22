-- BohemiaDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Bohemia Decisions: loaded")
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
local buildingHradID = GameInfoTypes["BUILDING_JFD_HRAD"]
local buildingMintID = GameInfoTypes["BUILDING_MINT"]
local buildingPragueRenovationID = GameInfoTypes["BUILDING_JFD_PRAGUE_RENOVATION"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local policyBohemianSilverID = GameInfoTypes["POLICY_JFD_BOHEMIA_SILVER"]
local resourceSilverID = GameInfoTypes["RESOURCE_SILVER"]
-------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Renovate Prague Castle
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RenovatePragueHrad = {}
	Decisions_RenovatePragueHrad.Name = "TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATE_PRAGUE_CASTLE"
	Decisions_RenovatePragueHrad.Desc = "TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATE_PRAGUE_CASTLE_DESC"
	HookDecisionCivilizationIcon(Decisions_RenovatePragueHrad, "CIVILIZATION_JFD_BOHEMIA")
	Decisions_RenovatePragueHrad.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_RenovatePragueHrad") == true then
			Decisions_RenovatePragueHrad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATE_PRAGUE_CASTLE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(200 * iMod)
		Decisions_RenovatePragueHrad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_RENOVATE_PRAGUE_CASTLE_DESC", goldCost)
		
		if not (player:GetCapitalCity()) then return true, false end
		if not (player:GetCapitalCity():IsHasBuilding(buildingHradID)) then return true, false end
		if player:GetGold() < goldCost 									then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 					then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 		then return true, false end

		return true, true
	end
	)
	
	Decisions_RenovatePragueHrad.DoFunc = (
	function(player)
		local goldCost = mathCeil(200 * iMod)
		player:ChangeGold(-goldCost)
		player:GetCapitalCity():SetNumRealBuilding(buildingPragueRenovationID, 1)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_RenovatePragueHrad", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"], "Decisions_RenovatePragueHrad", Decisions_RenovatePragueHrad)
-------------------------------------------------------------------------------------------------------------------------
-- Bohemia: Issue Prague Groschen
-------------------------------------------------------------------------------------------------------------------------
local Decisions_IssuePragueGroschen = {}
	Decisions_IssuePragueGroschen.Name = "TXT_KEY_DECISIONS_JFD_BOHEMIA_ISSUE_PRAGUE_GROSCHEN"
	Decisions_IssuePragueGroschen.Desc = "TXT_KEY_DECISIONS_JFD_BOHEMIA_ISSUE_PRAGUE_GROSCHEN_DESC"
	HookDecisionCivilizationIcon(Decisions_IssuePragueGroschen, "CIVILIZATION_JFD_BOHEMIA")
	Decisions_IssuePragueGroschen.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_IssuePragueGroschen") == true then
			Decisions_IssuePragueGroschen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_ISSUE_PRAGUE_GROSCHEN_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_IssuePragueGroschen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BOHEMIA_ISSUE_PRAGUE_GROSCHEN_DESC")
		
		if not (player:GetCapitalCity()) then return true, false end
		if not (player:GetCapitalCity():IsHasBuilding(buildingHradID)) 		then return true, false end
		if player:GetNumResourceAvailable(resourceSilverID, false) == 0 	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 			then return true, false end

		return true, true
	end
	)
	
	Decisions_IssuePragueGroschen.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBohemianSilverID, true)
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingMintID, 1)
		end
		save(player, "Decisions_IssuePragueGroschen", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_IssuePragueGroschen", Decisions_IssuePragueGroschen)
--=======================================================================================================================
--=======================================================================================================================
