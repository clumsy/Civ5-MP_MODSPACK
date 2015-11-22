-- JFD_PrussiaDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Prussia Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PRUSSIA"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local eraModernID = GameInfoTypes["ERA_MODERN"]
local mathCeil = math.ceil
local policyEmpowerJunkersID = GameInfoTypes["POLICY_JFD_EMPOWER_JUNKER_CLASS"]
local techMetallurgyID = GameInfoTypes["TECH_METALLURGY"]
local techMilitaryScienceID = GameInfoTypes["TECH_MILITARY_SCIENCE"]
local techRiflingID = GameInfoTypes["TECH_RIFLING"]
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitLandwehrID = GameInfoTypes["UNIT_JFD_LANDWEHR"]
local unitMeriteDeathsHeadHussarID = GameInfoTypes["UNIT_JFD_MERITE_DEATHS_HEAD"]
local unitMeriteKnightID = GameInfoTypes["UNIT_JFD_MERITE_KNIGHT"]
local unitMeriteLancerID = GameInfoTypes["UNIT_JFD_MERITE_LANCER"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
--------------------------------------------------------------------------------------------------------------------------
-- Prussia: Empower the Junker Nobility
-------------------------------------------------------------------------------------------------------------------------
local Decisions_JunkerClass = {}
	Decisions_JunkerClass.Name = "TXT_KEY_DECISIONS_JFD_PRUSSIA_EMPOWER_JUNKER_CLASS"
	Decisions_JunkerClass.Desc = "TXT_KEY_DECISIONS_JFD_PRUSSIA_EMPOWER_JUNKER_CLASS_DESC"
	HookDecisionCivilizationIcon(Decisions_JunkerClass, "CIVILIZATION_JFD_PRUSSIA")
	Decisions_JunkerClass.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_JunkerClass") == true then
			Decisions_JunkerClass.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_EMPOWER_JUNKER_CLASS_ENACTED_DESC")
			return false, false, true 
		end
		
		local goldCost = mathCeil(530 * iMod)
		Decisions_JunkerClass.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_EMPOWER_JUNKER_CLASS_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techRiflingID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_JunkerClass.DoFunc = (
	function(player)
		local goldCost = mathCeil(530 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEmpowerJunkersID, true)
		save(player, "Decisions_JunkerClass", true)
	end
	)

	Decisions_JunkerClass.Monitors = {}
	Decisions_JunkerClass.Monitors[GameEvents.SetPopulation] =  (
	function(cityX, cityY, oldPopulation, newPopulation)
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		local player = Players[city:GetOwner()]
		if (player:GetCivilizationType() ~= civilisationID and player:IsEverAlive()) then return end
		if load(player, "Decisions_JunkerClass") == true then
			if oldPopulation < newPopulation then
				if player:CanTrain(unitLandwehrID) then
					city:ChangeUnitProduction(unitLandwehrID, city:GetYieldRate(yieldProductionID) * 3)
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_JunkerClass", Decisions_JunkerClass)
-------------------------------------------------------------------------------------------------------------------------
-- Prussia: Award the Pour le Merite
-------------------------------------------------------------------------------------------------------------------------
local Decisions_PourleMerite = {}
	Decisions_PourleMerite.Name = "TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE"
	Decisions_PourleMerite.Desc = "TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_DESC"
	HookDecisionCivilizationIcon(Decisions_PourleMerite, "CIVILIZATION_JFD_PRUSSIA")
	Decisions_PourleMerite.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		
		local era = load(player, "Decisions_PourleMerite")
		local currentEra = player:GetCurrentEra()
		if currentEra >= eraModernID then
			Decisions_PourleMerite.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_ENACTED_DESC")
			return false, false, true 
		else
			if era ~= nil then
				if era < currentEra then
					save(player, "Decisions_PourleMerite", nil)
				else
					Decisions_PourleMerite.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_ENACTED_DESC")
					return false, false, true
				end
			end
		end
		
		local cultureCost = mathCeil(370 * iMod)
		Decisions_PourleMerite.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PRUSSIA_POUR_LE_MERITE_DESC", cultureCost)	
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetJONSCulture() < cultureCost 						then return true, false end
		if not (player:GetCurrentEra() > eraMedievalID) 			then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PourleMerite.DoFunc = (
	function(player)
		local cultureCost = mathCeil(370 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		for unit in player:Units() do
			local unitID = unitMeriteKnightID
			if unit:GetUnitType() == unitGreatGeneralID then
				if Teams[player:GetTeam()]:IsHasTech(techMilitaryScienceID) then 
					unitID = unitMeriteDeathsHeadHussarID
				elseif Teams[player:GetTeam()]:IsHasTech(techMetallurgyID) then
					unitID = unitMeriteLancerID
				end
				
				local newUnit = player:InitUnit(unitID, unit:GetX(), unit:GetY())
				newUnit:Convert(unit, false)
				newUnit:ChangeExperience(25)
			end
		end

		save(player, "Decisions_PourleMerite", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_PourleMerite", Decisions_PourleMerite)
--=======================================================================================================================
--=======================================================================================================================
