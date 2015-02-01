-- JFD_RussiaPeterDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Peter) Decisions: loaded")
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
local buildingBeardTaxID = GameInfoTypes["BUILDING_JFD_BEARD_TAX"]
local buildingSmolnyInstituteID = GameInfoTypes["BUILDING_JFD_SMOLNY_INSTITUTE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PETRINE_RUSSIA"]
local civilisationRussiaID = GameInfoTypes["CIVILIZATION_RUSSIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local policyTableOfRanksID = GameInfoTypes["POLICY_JFD_TABLE_OF_RANKS"]
local techEducationID = GameInfoTypes["TECH_EDUCATION"]
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): Create the Table of Ranks
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TableofRanks = {}
	Decisions_TableofRanks.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS"
	Decisions_TableofRanks.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_DESC"
	HookDecisionCivilizationIcon(Decisions_TableofRanks, "CIVILIZATION_JFD_PETRINE_RUSSIA")
	Decisions_TableofRanks.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_TableofRanks") == true then
			Decisions_TableofRanks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_ENACTED_DESC")
			return false, false, true 
		end
		
		local cultureCost = mathCeil(330 * iMod)
		Decisions_TableofRanks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1	then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		return true, true
	end
	)
	
	Decisions_TableofRanks.DoFunc = (
	function(player)
		local cultureCost = mathCeil(330 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyTableOfRanksID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_TABLE_OF_RANKS")) 
		save(player, "Decisions_TableofRanks", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_TableofRanks", Decisions_TableofRanks)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Peter): Implement a Beard Tax
-------------------------------------------------------------------------------------------------------------------------
local Decisions_BeardTax = {}
	Decisions_BeardTax.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_BEARD_TAX"
	Decisions_BeardTax.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_BEARD_TAX_DESC"
	HookDecisionCivilizationIcon(Decisions_BeardTax, "CIVILIZATION_JFD_PETRINE_RUSSIA")
	Decisions_BeardTax.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_BeardTax") == true then
			Decisions_BeardTax.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_BEARD_TAX_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_BeardTax.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_BEARD_TAX_DESC")
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID			 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_BeardTax.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingBeardTaxID, 1)
		end
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_BEARD_TAX")) 
		save(player, "Decisions_BeardTax", true)
	end
	)

	Decisions_BeardTax.Monitors = {}
	Decisions_BeardTax.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local player = Players[iPlayer]
		if (player:GetCivilizationType() ~= civilisationID and player:IsEverAlive()) then return end
		if load(player, "Decisions_BeardTax") == true then
			for city in player:Cities() do
				if not city:IsHasBuilding(buildingBeardTaxID) then
					city:SetNumRealBuilding(buildingBeardTaxID, 1)
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_BeardTax", Decisions_BeardTax)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Catherine): Decree the Establishment of the Smolny Institute
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_SmolnyInstitute = nil

local Decisions_SmolnyInstitute = {}
	Decisions_SmolnyInstitute.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE"
	Decisions_SmolnyInstitute.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_DESC"
	Decisions_SmolnyInstitute.Pedia = "TXT_KEY_JFD_SMOLNY_INSTITUTE_CIVILOPEDIA"
	HookDecisionCivilizationIcon(Decisions_SmolnyInstitute, "CIVILIZATION_RUSSIA")
	Decisions_SmolnyInstitute.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationRussiaID then return false, false end
		if load(player, "Decisions_SmolnyInstitute") == true then
			Decisions_SmolnyInstitute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(570 * iMod)
		Decisions_SmolnyInstitute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techEducationID)) then return true, false end

		return true, true
	end
	)
	
	Decisions_SmolnyInstitute.DoFunc = (
	function(player)
		local goldCost = mathCeil(570 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingSmolnyInstituteID, 1)
	
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CATHERINE_SMOLNY_INTITUTE")) 
		save(player, "Decisions_SmolnyInstitute", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationRussiaID, "Decisions_SmolnyInstitute", Decisions_SmolnyInstitute)
--=======================================================================================================================
--=======================================================================================================================
