-- JFD_AngloSaxonsDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Anglo-Saxons Decisions: loaded")
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
local buildingBurghalID = GameInfoTypes["BUILDING_JFD_BURGHAL"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local policyDombocID = GameInfoTypes["POLICY_JFD_ANGLO_SAXONS_DOMBOC"]
--------------------------------------------------------------------------------------------------------------------------
-- Anglo-Saxons: Issue the Domboc
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AngloSaxonsDombroc = {}
	Decisions_AngloSaxonsDombroc.Name = "TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_DOMBOC"
	Decisions_AngloSaxonsDombroc.Desc = "TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_DOMBOC_DESC"
	HookDecisionCivilizationIcon(Decisions_AngloSaxonsDombroc, "CIVILIZATION_JFD_ANGLO_SAXONS")
	Decisions_AngloSaxonsDombroc.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_AngloSaxonsDombroc") == true then
			Decisions_AngloSaxonsDombroc.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_DOMBOC_ENACTED_DESC")
			return false, false, true 
		end
		
		local cultureCost = mathCeil(30 + player:GetNumPolicies() * 30 * iMod)
		Decisions_AngloSaxonsDombroc.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_DOMBOC_DESC", cultureCost)
		
		if player:GetNumCities() < 4 								then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetCurrentEra() < eraMedievalID 					then return true, false end

		return true, true
	end
	)
	
	Decisions_AngloSaxonsDombroc.DoFunc = (
	function(player)
		local cultureCost = mathCeil(player:GetNextPolicyCost() + 30 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyDombocID, true)
		player:ChangeGoldenAgeTurns(12)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_DOMBOC")) 
		save(player, "Decisions_AngloSaxonsDombroc", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"], "Decisions_AngloSaxonsDombroc", Decisions_AngloSaxonsDombroc)
-------------------------------------------------------------------------------------------------------------------------
-- Anglo-Saxons: Create the Burghal System
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AngloSaxonsBurghalSystem = {}
	Decisions_AngloSaxonsBurghalSystem.Name = "TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_BURGHAL_SYSTEM"
	Decisions_AngloSaxonsBurghalSystem.Desc = "TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_BURGHAL_SYSTEM_DESC"
	HookDecisionCivilizationIcon(Decisions_AngloSaxonsBurghalSystem, "CIVILIZATION_JFD_ANGLO_SAXONS")
	Decisions_AngloSaxonsBurghalSystem.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_AngloSaxonsBurghalSystem") == true then
			Decisions_AngloSaxonsBurghalSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_BURGHAL_SYSTEM_ENACTED_DESC")
			return false, false, true
		end
		
		local wallsMod = player:GetNumCities() - player:CountNumBuildings(buildingWallsID) + 1
		local goldCost = mathCeil((150 * iMod) * wallsMod) 
		Decisions_AngloSaxonsBurghalSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_BURGHAL_SYSTEM_DESC", goldCost)
		
		if player:GetNumCities() < 3 								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraMedievalID 					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AngloSaxonsBurghalSystem.DoFunc = (
	function(player)
		local wallsMod = player:GetNumCities() - player:CountNumBuildings(GameInfoTypes["BUILDING_WALLS"])
		local goldCost = mathCeil((150 * iMod) * wallsMod) 
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingWallsID, 1)
			city:SetNumRealBuilding(buildingBurghalID, 1)
		end

		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_BURGHAL_SYSTEM")) 
		save(player, "Decisions_AngloSaxonsBurghalSystem", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"], "Decisions_AngloSaxonsBurghalSystem", Decisions_AngloSaxonsBurghalSystem)
--=======================================================================================================================
--=======================================================================================================================
