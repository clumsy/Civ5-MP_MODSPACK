-- JFD_GermanyHitlerDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Nazi Germany Decisions: loaded")
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NAZI_GERMANY"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local policyFuhrerprinzipID = GameInfoTypes["POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP"]
local policyLuftwaffeID = GameInfoTypes["POLICY_JFD_NAZI_GERMANY_LUFTWAFFE"]
local techFlightID = GameInfoTypes["TECH_FLIGHT"]
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Nazi Germany: Luftwaffe
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Luftwaffe = {}
	Decisions_Luftwaffe.Name = "TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE"
	Decisions_Luftwaffe.Desc = "TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE_DESC"
	HookDecisionCivilizationIcon(Decisions_Luftwaffe, "CIVILIZATION_JFD_NAZI_GERMANY")
	Decisions_Luftwaffe.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Luftwaffe") == true then
			Decisions_Luftwaffe.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(368 * iMod)
		Decisions_Luftwaffe.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techFlightID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Luftwaffe.DoFunc = (
	function(player)
		local goldCost = mathCeil(368 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyLuftwaffeID, true)
		save(player, "Decisions_Luftwaffe", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Luftwaffe", Decisions_Luftwaffe)
-------------------------------------------------------------------------------------------------------------------------
-- Nazi Germany: Führerprinzip
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Fuhrerprinzip = {}
	Decisions_Fuhrerprinzip.Name = "TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP"
	Decisions_Fuhrerprinzip.Desc = "TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP_DESC"
	HookDecisionCivilizationIcon(Decisions_Fuhrerprinzip, "CIVILIZATION_JFD_NAZI_GERMANY")
	Decisions_Fuhrerprinzip.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Fuhrerprinzip") == true then
			Decisions_Fuhrerprinzip.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP_DESC")
			return false, false, true
		end
		
		Decisions_Fuhrerprinzip.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP_DESC")
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if not(player:GetCurrentEra() >= eraRenaissanceID) 			then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_Fuhrerprinzip.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyFuhrerprinzipID, true)
		save(player, "Decisions_Fuhrerprinzip", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Fuhrerprinzip", Decisions_Fuhrerprinzip)
--=======================================================================================================================
--=======================================================================================================================