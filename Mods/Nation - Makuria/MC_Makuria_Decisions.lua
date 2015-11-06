-- Makurian_Decisions
-- Author: JFD
--=======================================================================================================================
print("Makurian Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationMakuriaID  = GameInfoTypes["CIVILIZATION_MC_MAKURIA"]
local mathCeil 				= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Makuria: Baqt
-------------------------------------------------------------------------------------------------------------------------
local buildingBaqtID = GameInfoTypes["BUILDING_MC_MAKURIA_BAQT"]
local Decisions_MC_Makuria_Baqt = {}
	Decisions_MC_Makuria_Baqt.Name = "TXT_KEY_DECISIONS_MC_MAKURIA_BAQT"
	Decisions_MC_Makuria_Baqt.Desc = "TXT_KEY_DECISIONS_MC_MAKURIA_BAQT_DESC"
	HookDecisionCivilizationIcon(Decisions_MC_Makuria_Baqt, "CIVILIZATION_MC_MAKURIA")
	Decisions_MC_Makuria_Baqt.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMakuriaID then return false, false end
		if load(player, "Decisions_MC_Makuria_Baqt") == true then
			Decisions_MC_Makuria_Baqt.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MC_MAKURIA_BAQT_ENACTED_DESC")
			return false, false, true
		end
		local faithCost	= mathCeil(2*iMod)
		Decisions_MC_Makuria_Baqt.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MC_MAKURIA_BAQT_DESC", faithCost)
		if player:GetFaith() < faithCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_MC_Makuria_Baqt.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithCost	= mathCeil(2*iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeFaith(-faithCost)
		player:GetCapitalCity():SetNumRealBuilding(buildingBaqtID, 1)
		save(player, "Decisions_MC_Makuria_Baqt", true)
	end
	)
	
	Decisions_MC_Makuria_Baqt.Monitors = {}
	Decisions_MC_Makuria_Baqt.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilizationMakuriaID then return end
		if load(player, "Decisions_MC_Makuria_Baqt") == true then
			local capital = player:GetCapitalCity()
			if (not capital:IsHasBuilding(buildingBaqtID)) then
				capital:SetNumRealBuilding(buildingBaqtID, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMakuriaID, "Decisions_MC_Makuria_Baqt", Decisions_MC_Makuria_Baqt)
-------------------------------------------------------------------------------------------------------------------------
-- Makura: Bowmanship
-------------------------------------------------------------------------------------------------------------------------
local policyBowmanshipID = GameInfoTypes["POLICY_DECISIONS_MC_MAKURIA_BOWMANSHIP"]
local Decisions_MC_Makuria_Bowmanship = {}
	Decisions_MC_Makuria_Bowmanship.Name = "TXT_KEY_DECISIONS_MC_MAKURIA_BOWMANSHIP"
	Decisions_MC_Makuria_Bowmanship.Desc = "TXT_KEY_DECISIONS_MC_MAKURIA_BOWMANSHIP_DESC"
	HookDecisionCivilizationIcon(Decisions_MC_Makuria_Bowmanship, "CIVILIZATION_MC_MAKURIA")
	Decisions_MC_Makuria_Bowmanship.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationMakuriaID then return false, false end
		if player:HasPolicy(policyBowmanshipID) then
			Decisions_MC_Makuria_Bowmanship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MC_MAKURIA_BOWMANSHIP_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		Decisions_MC_Makuria_Bowmanship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MC_MAKURIA_BOWMANSHIP_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_MC_Makuria_Bowmanship.DoFunc = (
	function(player)
		local playerID = player:GetID()
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBowmanshipID, true)
		save(player, "Decisions_MC_Makuria_Bowmanship", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationMakuriaID, "Decisions_MC_Makuria_Bowmanship", Decisions_MC_Makuria_Bowmanship)
--=======================================================================================================================
--=======================================================================================================================
