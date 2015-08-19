-- JFD_MuscovyDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Muscovy Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetNumConqueredCities
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumConqueredCities(playerID)
	local numCities = 0
	local numCapitals = 0
	for city in Players[playerID]:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			numCities = numCities + 1
			if city:IsOriginalCapital() then
				numCapitals = numCapitals + 1
			end
		end
	end

	return numCities, numCapitals
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--------------------------------------------------------------
-- Sukritact_PlaceResource
--------------------------------------------------------------
function Sukritact_PlaceResource(cityPlot, resourceID)
    local plots = {}
    for loopPlot in PlotAreaSweepIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(plots, loopPlot)
    end
	
    for iVal = 1, 1 do
		local isPlaced = false
		while (not isPlaced) and #plots > 0 do
			local randomNumber = JFD_GetRandom(1, #plots)
			local plot = plots[randomNumber]
			if (not plot:IsHills() and plot:GetResourceType() == -1) then
				plot:SetResourceType(resourceID, 1)
				isPlaced = true
			end
			
			table.remove(plots, randomNumber)
		end
	end
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayerTeam 		= Teams[Game.GetActiveTeam()]
local civilisationID 		= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local civilisationRussiaID 	= GameInfoTypes["CIVILIZATION_RUSSIA"]
local eraRenaissanceID  	= GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil 				= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Muscovy: Found the Russian Tsardom
-------------------------------------------------------------------------------------------------------------------------
local buildingStBasilsID = GameInfoTypes["BUILDING_JFD_ST_BASILS"]

local Decisions_MuscovyRussianTsardom = {}
	Decisions_MuscovyRussianTsardom.Name = "TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIAN_TSARDOM"
	Decisions_MuscovyRussianTsardom.Desc = "TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIAN_TSARDOM_DESC"
	HookDecisionCivilizationIcon(Decisions_MuscovyRussianTsardom, "CIVILIZATION_JFD_MUSCOVY")
	Decisions_MuscovyRussianTsardom.Pedia = "TXT_KEY_JFD_ST_BASILS"
	Decisions_MuscovyRussianTsardom.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_MuscovyRussianTsardom") == true then
			Decisions_MuscovyRussianTsardom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIAN_TSARDOM_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = mathCeil(400 * iMod)
		local faithCost = mathCeil(500 * iMod)
		Decisions_MuscovyRussianTsardom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIAN_TSARDOM_DESC", cultureCost, faithCost)
		
		local numCities, numCapitals = JFD_GetNumConqueredCities(player:GetID())
		if numCities < 7 and numCapitals < 4 						then return true, false end
		if player:GetJONSCulture() < cultureCost					then return true, false end
		if player:GetFaith() < faithCost							then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end

		return true, true
	end
	)
	
	Decisions_MuscovyRussianTsardom.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(400 * iMod)
		local faithCost = mathCeil(500 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12 * iGAMod)
		player:GetCapitalCity():SetNumRealBuilding(buildingStBasilsID, 1)
		PreGame.SetCivilizationDescription(playerID, GameInfo.Civilizations[civilisationRussiaID].Description)
		PreGame.SetCivilizationShortDescription(playerID, GameInfo.Civilizations[civilisationRussiaID].ShortDescription)
		PreGame.SetCivilizationAdjective(playerID, GameInfo.Civilizations[civilisationRussiaID].Adjective)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MUSCOVY_RUSSIAN_TSARDOM"))
		save(player, "Decisions_MuscovyRussianTsardom", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_MuscovyRussianTsardom", Decisions_MuscovyRussianTsardom)
--------------------------------------------------------------------------------------------------------------------------
-- Muscovy: Unleash the Oprichniki (City-Based)
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_RussiaOprichnina = nil
local Decisions_RussiaOprichnina = {}
	Decisions_RussiaOprichnina.Name = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA"
	Decisions_RussiaOprichnina.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC"
	Decisions_RussiaOprichnina.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return end
		if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MODERN then return end
		
		--Generate Decisions
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE) or pCity:IsCapital() then
				local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
				local sName = pCity:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC"
				tTempDecisions[sKey].Data1 = pCity
				tTempDecisions[sKey].Weight = 0
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_JFD_MUSCOVY")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local sName = pCity:GetName()
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					if load(pPlayer, sKey) == true then
						if pCity:IsCapital() then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_ENACTED_DESC", sName) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_NOTE")
						else
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_ENACTED_DESC", sName)
						end
						return false, false, true
					end
					
					if pCity:IsCapital() then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC", sName, iReward) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_NOTE")
					else
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC", sName, iReward)
					end
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
					if not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE)) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
					pPlayer:ChangeGold(iReward)
					pPlayer:ChangeJONSCulture(iReward)
					
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_RussiaOprichnina", Decisions_RussiaOprichnina)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Catherine): Decree the Establishment of the Smolny Institute
-------------------------------------------------------------------------------------------------------------------------
local buildingSmolnyInstituteID = GameInfoTypes["BUILDING_JFD_SMOLNY_INSTITUTE"]
local techEducationID 			= GameInfoTypes["TECH_EDUCATION"]

tDecisions.Decisions_RussianStreltsy = nil

local Decisions_RussiaCatherineSmolnyInstitute = {}
	Decisions_RussiaCatherineSmolnyInstitute.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE"
	Decisions_RussiaCatherineSmolnyInstitute.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_DESC"
	Decisions_RussiaCatherineSmolnyInstitute.Pedia = "TXT_KEY_JFD_SMOLNY_INSTITUTE"
	HookDecisionCivilizationIcon(Decisions_RussiaCatherineSmolnyInstitute, "CIVILIZATION_RUSSIA")
	Decisions_RussiaCatherineSmolnyInstitute.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationRussiaID then return false, false end
		if load(player, "Decisions_RussiaCatherineSmolnyInstitute") == true then
			Decisions_RussiaCatherineSmolnyInstitute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(570 * iMod)
		Decisions_RussiaCatherineSmolnyInstitute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_SMOLNY_INSTITUTE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techEducationID)) then return true, false end

		return true, true
	end
	)
	
	Decisions_RussiaCatherineSmolnyInstitute.DoFunc = (
	function(player)
		local goldCost = mathCeil(570 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingSmolnyInstituteID, 1)
	
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CATHERINE_SMOLNY_INTITUTE")) 
		save(player, "Decisions_RussiaCatherineSmolnyInstitute", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationRussiaID, "Decisions_RussiaCatherineSmolnyInstitute", Decisions_RussiaCatherineSmolnyInstitute)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Catherine): Patronise the Fur Trade
-------------------------------------------------------------------------------------------------------------------------
local resourceFurID 	= GameInfoTypes["RESOURCE_FUR"]
local terrainTundraID 	= GameInfoTypes["TERRAIN_TUNDRA"]
local unitSettlerID 	= GameInfoTypes["UNIT_SETTLER"]

local Decisions_RussiaCatherineFurTrade = {}
	Decisions_RussiaCatherineFurTrade.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_FUR_TRADE"
	Decisions_RussiaCatherineFurTrade.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_FUR_TRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_RussiaCatherineFurTrade, "CIVILIZATION_RUSSIA")
	Decisions_RussiaCatherineFurTrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationRussiaID then return false, false end
		if load(player, "Decisions_RussiaCatherineFurTrade") == true then
			Decisions_RussiaCatherineFurTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_FUR_TRADE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(1100 * iMod)
		Decisions_RussiaCatherineFurTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_CATHERINE_FUR_TRADE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetNumResourceAvailable(resourceFurID, false) < 1 then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		return true, true
	end
	)
	
	Decisions_RussiaCatherineFurTrade.DoFunc = (
	function(player)
		local goldCost = mathCeil(1100 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:InitUnit(unitSettlerID, capitalX, capitalY)
		player:InitUnit(unitSettlerID, capitalX, capitalY)
		save(player, "Decisions_RussiaCatherineFurTrade", true)
	end
	)
	
	Decisions_RussiaCatherineFurTrade.Monitors = {}
	Decisions_RussiaCatherineFurTrade.Monitors[GameEvents.PlayerCityFounded] =  (
	function(playerID, cityX, cityY)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationRussiaID then return end
		if load(player, "Decisions_RussiaCatherineFurTrade") == true then
			local plot = Map.GetPlot(cityX, cityY)
			if plot:GetTerrainType() == terrainTundraID then
				Sukritact_PlaceResource(plot, resourceFurID)
			end		
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationRussiaID, "Decisions_RussiaCatherineFurTrade", Decisions_RussiaCatherineFurTrade)
--=======================================================================================================================
--=======================================================================================================================
