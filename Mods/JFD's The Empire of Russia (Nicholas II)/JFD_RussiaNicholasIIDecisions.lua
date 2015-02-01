-- JFD_RussiaNicholasIIDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Nicholas II) Decisions: loaded")
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
local buildingBroadcastTowerID = GameInfoTypes["BUILDING_BROADCAST_TOWER"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraModernID = GameInfoTypes["ERA_MODERN"]
local mathCeil = math.ceil
local policyAllRussiaExhibitionID = GameInfoTypes["POLICY_JFD_ALL_RUSSIA_EXHIBITION"]
local techEducationID = GameInfoTypes["TECH_EDUCATION"]
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Nicholas II): Hold the All-Russia Exhibition
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AllRussiaExhibition = {}
	Decisions_AllRussiaExhibition.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ALL_RUSSIA_EXHIBITION"
	Decisions_AllRussiaExhibition.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ALL_RUSSIA_EXHIBITION_DESC"
	HookDecisionCivilizationIcon(Decisions_AllRussiaExhibition, "CIVILIZATION_JFD_NICHOLAS_RUSSIA")
	Decisions_AllRussiaExhibition.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_AllRussiaExhibition") == true then
			Decisions_AllRussiaExhibition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ALL_RUSSIA_EXHIBITION_ENACTED_DESC")
			return false, false, true 
		end
		
		local goldCost = mathCeil(900 * iMod)
		Decisions_AllRussiaExhibition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ALL_RUSSIA_EXHIBITION_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraIndustrialID 				then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AllRussiaExhibition.DoFunc = (
	function(player)
		local goldCost = mathCeil(900 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAllRussiaExhibitionID, true)
		player:GetCapitalCity():SetNumRealBuilding(buildingBroadcastTowerID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_ALL_RUSSIA_EXHIBITION")) 
		save(player, "Decisions_AllRussiaExhibition", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AllRussiaExhibition", Decisions_AllRussiaExhibition)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Nicholas II): Celebrate the Romanov Tercentary
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RomanovTercentary = {}
	Decisions_RomanovTercentary.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ROMANOV_TERCENTARY"
	Decisions_RomanovTercentary.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ROMANOV_TERCENTARY_DESC"
	HookDecisionCivilizationIcon(Decisions_RomanovTercentary, "CIVILIZATION_JFD_NICHOLAS_RUSSIA")
	Decisions_RomanovTercentary.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_RomanovTercentary") == true then
			Decisions_RomanovTercentary.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ROMANOV_TERCENTARY_ENACTED_DESC")
			return false, false, true
		end
		
		local faithCost = mathCeil(400 * iMod)
		local cultureReward = player:GetTotalFaithPerTurn() * 3
		Decisions_RomanovTercentary.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_NICHOLAS_ROMANOV_TERCENTARY_DESC", faithCost, cultureReward)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetFaith() < faithCost 							then return true, false end
		if player:GetCurrentEra() < eraModernID 					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_RomanovTercentary.DoFunc = (
	function(player)
		local faithCost = mathCeil(400 * iMod)
		local cultureReward = player:GetTotalFaithPerTurn() * 3
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(cultureReward)
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(10)
		end
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_ROMANOV_TERCENTARY")) 
		save(player, "Decisions_RomanovTercentary", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_RomanovTercentary", Decisions_RomanovTercentary)
--=======================================================================================================================
--=======================================================================================================================
