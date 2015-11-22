-- JFD_BavariaDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Bavaria Decisions: loaded")
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
local buildingMuisiciansGuildID = GameInfoTypes["BUILDING_MUSICIANS_GUILD"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BAVARIA"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local mathCeil = math.ceil
local policyStateOrchestraID = GameInfoTypes["POLICY_JFD_BAVARIA_STATE_ORCHESTRA"]
local unitBavarianMusician = nil
local unitClassMuisicianID = GameInfoTypes["UNITCLASS_MUSICIAN"]
-------------------------------------------------------------------------------------------------------------------------
-- Bavaria: Found the Bavarian State Orchestra
-------------------------------------------------------------------------------------------------------------------------
local Decisions_BavariaStateOrchestra = {}
	Decisions_BavariaStateOrchestra.Name = "TXT_KEY_DECISIONS_JFD_BAVARIA_STATE_ORCHESTRA"
	Decisions_BavariaStateOrchestra.Desc = "TXT_KEY_DECISIONS_JFD_BAVARIA_STATE_ORCHESTRA_DESC"
	HookDecisionCivilizationIcon(Decisions_BavariaStateOrchestra, "CIVILIZATION_JFD_BAVARIA")
	Decisions_BavariaStateOrchestra.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_BavariaStateOrchestra") == true then
			Decisions_BavariaStateOrchestra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BAVARIA_STATE_ORCHESTRA_ENACTED_DESC")
			return false, false, true 
		end
		
		Decisions_BavariaStateOrchestra.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BAVARIA_STATE_ORCHESTRA_DESC")
		
		if player:GetNumResourceAvailable(iMagistrate, false) 	< 1 	then return true, false end
		if player:CountNumBuildings(buildingMuisiciansGuildID) == 0 	then return true, false end
		
		local plot = player:GetCapitalCity():Plot()
		for iVal = 0,(plot:GetNumUnits() - 1) do
			local unit = plot:GetUnit(iVal)
			if unit:GetUnitClassType() == unitClassMuisicianID then
				unitBavarianMusician = unit
				break
			end
		end

		if unitBavarianMusician ~= nil then
			return true, true
		else
			return true, false
		end

		return true, true
	end
	)
	
	Decisions_BavariaStateOrchestra.DoFunc = (
	function(player)
		unitBavarianMusician:Kill()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyStateOrchestraID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_STATE_ORCHESTRA")) 
		save(player, "Decisions_BavariaStateOrchestra", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Decisions_BavariaStateOrchestra", Decisions_BavariaStateOrchestra)
-------------------------------------------------------------------------------------------------------------------------
-- Bavaria: Design Blueprints for a new Wonder
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumCitiesBuildingWonders(player)
	local numWonderBuildings = 0
	for city in player:Cities() do
		if city:GetProductionBuilding() ~= -1 then
			local currentBuildingClass = GameInfo.Buildings[city:GetProductionBuilding()].BuildingClass
			local buildingClass = GameInfo.BuildingClasses[currentBuildingClass]
			if buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1 then
				numWonderBuildings = numWonderBuildings + 1
			end
		end
	end

	return numWonderBuildings
end

local Decisions_NewWonder = {}
	Decisions_NewWonder.Name = "TXT_KEY_DECISIONS_JFD_BAVARIA_NEW_WONDER"
	Decisions_NewWonder.Desc = "TXT_KEY_DECISIONS_JFD_BAVARIA_NEW_WONDER_DESC"
	HookDecisionCivilizationIcon(Decisions_NewWonder, "CIVILIZATION_JFD_BAVARIA")
	Decisions_NewWonder.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		local era = load(player, "Decisions_NewWonder")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_NewWonder", nil)
			else
				Decisions_NewWonder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BAVARIA_NEW_WONDER_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local culturePerTurn = player:GetTotalJONSCulturePerTurn()
		local cultureCost = mathCeil(culturePerTurn * 10)
		local productionReward = mathCeil(culturePerTurn * 5)
		Decisions_NewWonder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BAVARIA_NEW_WONDER_DESC", cultureCost, productionReward)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if JFD_GetNumCitiesBuildingWonders(player) == 0 			then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetCurrentEra() < eraMedievalID 					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_NewWonder.DoFunc = (
	function(player)
		local culturePerTurn = player:GetTotalJONSCulturePerTurn()
		local cultureCost = mathCeil(culturePerTurn * 10)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		if not player:IsHuman() then
			local productionReward = mathCeil(culturePerTurn * 2)
			for city in player:Cities() do
				if city:GetProductionBuilding() ~= -1 then
					city:ChangeBuildingProduction(city:GetBuildingProduction(), productionReward)
				end
			end
		else
			LuaEvents.JFDChooseBavarianWonder()
		end
		save(player, "Decisions_NewWonder", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Decisions_NewWonder", Decisions_NewWonder)
--=======================================================================================================================
--=======================================================================================================================
