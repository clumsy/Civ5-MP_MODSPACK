-- JFD_JapanTojoDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Japan (Tojo) Decisions: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"]
local eraModernID = GameInfoTypes["ERA_MODERN"]
local mathCeil = math.ceil
local resourceCoalID = GameInfoTypes["RESOURCE_COAL"]
local policyKantaiKessenID = GameInfoTypes["POLICY_JFD_KANTAI_KESSEN"]
local techIndustrialisationID = GameInfoTypes["TECH_INDUSTRIALIZATION"]
local techSteampowerID = GameInfoTypes["TECH_STEAM_POWER"]
local unitIroncladID = GameInfoTypes["UNIT_IRONCLAD"]
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Japan (Tojo): Modernise the Imperial Navy
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ModerniseImperialNavy = {}
	Decisions_ModerniseImperialNavy.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_MODERNISE_THE_IMPERIAL_NAVY"
	Decisions_ModerniseImperialNavy.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_MODERNISE_THE_IMPERIAL_NAVY_DESC"
	HookDecisionCivilizationIcon(Decisions_ModerniseImperialNavy, "CIVILIZATION_JFD_JAPAN_TOJO")
	Decisions_ModerniseImperialNavy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_ModerniseImperialNavy") == true then
			Decisions_ModerniseImperialNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_MODERNISE_THE_IMPERIAL_NAVY_ENACTED_DESC")
			return false, false, true 
		end
		
		local cultureCost = mathCeil(200 * iMod)
		local goldCost = mathCeil(350 * iMod)
		Decisions_ModerniseImperialNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_MODERNISE_THE_IMPERIAL_NAVY_DESC", cultureCost, goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 			then return true, false end
		if player:GetJONSCulture() < cultureCost 							then return true, false end
		if player:GetGold() < goldCost							 			then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techIndustrialisationID)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ModerniseImperialNavy.DoFunc = (
	function(player)
		local cultureCost = mathCeil(200 * iMod)
		local goldCost = mathCeil(350 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		Teams[player:GetTeam()]:GetTeamTechs():SetHasTech(techSteampowerID, true)
		player:ChangeNumResourceTotal(resourceCoalID, 2)
		player:InitUnit(unitIroncladID, capitalX, capitalY):JumpToNearestValidPlot()
		player:InitUnit(unitIroncladID, capitalX, capitalY):JumpToNearestValidPlot()
		save(player, "Decisions_ModerniseImperialNavy", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"], "Decisions_ModerniseImperialNavy", Decisions_ModerniseImperialNavy)
-------------------------------------------------------------------------------------------------------------------------
-- Japan (Tojo): Adopt the Kantai Kessen
-------------------------------------------------------------------------------------------------------------------------
local Decisions_KantaiKessen = {}
	Decisions_KantaiKessen.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_KANTAI_KESSEN"
	Decisions_KantaiKessen.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_KANTAI_KESSEN_DESC"
	HookDecisionCivilizationIcon(Decisions_KantaiKessen, "CIVILIZATION_JFD_JAPAN_TOJO")
	Decisions_KantaiKessen.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_KantaiKessen") == true then
			Decisions_KantaiKessen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_KANTAI_KESSEN_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_KantaiKessen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_KANTAI_KESSEN_DESC")
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if player:GetCurrentEra() < eraModernID 					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_KantaiKessen.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyKantaiKessenID, true)
		save(player, "Decisions_KantaiKessen", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"], "Decisions_KantaiKessen", Decisions_KantaiKessen)
--=======================================================================================================================
--=======================================================================================================================
