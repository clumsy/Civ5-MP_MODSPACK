-- JFD_Normandy_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Normandy Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

-- JFD_IsHasConqueredMajorCapital
function JFD_IsHasConqueredMajorCapital(playerID)
	local player = Players[playerID]
	local numConqueredCapitals = 0
	for city in player:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			if city:IsOriginalCapital() then
				return true
			end
		end
	end
end

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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationNormandyID = GameInfoTypes["CIVILIZATION_JFD_NORMANDY"]
--------------------------------------------------------------------------------------------------------------------------
-- Normandy: Revolt of the Earls
--------------------------------------------------------------------------------------------------------------------------
local eraMedievalID   = GameInfoTypes["ERA_MEDIEVAL"]
local eventRevoltingCity		
local playerBarbarian = Players[63]				 
local unitKnightID    = GameInfoTypes["UNIT_KNIGHT"]

local Event_NormandyRevoltOfTheEarls = {}
	Event_NormandyRevoltOfTheEarls.Name = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS"
	Event_NormandyRevoltOfTheEarls.Desc = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_DESC"
	Event_NormandyRevoltOfTheEarls.Weight = 10
	Event_NormandyRevoltOfTheEarls.CanFunc = (
		function(player)			
			if load(player, "Event_NormandyRevoltOfTheEarls") == true then return false end
			if player:GetCivilizationType() ~= civilizationNormandyID then return false end
			if player:GetCurrentEra() ~= eraMedievalID then return false end
			local goldCost = mathCeil(500 * iMod)	
			if player:GetGold() < goldCost then return false end
			local playerID = player:GetID()
			if (not JFD_IsHasConqueredMajorCapital(playerID)) then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if city:GetOriginalOwner() ~= playerID then
					cities[count] = city:GetID()
					count = count + 1
				end
			end	
			local cityID = cities[GetRandom(1,#cities)]
			if (not cityID) then return false end
			eventRevoltingCity = player:GetCityByID(cityID)
			Event_NormandyRevoltOfTheEarls.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_DESC", eventRevoltingCity:GetName(), Players[eventRevoltingCity:GetOriginalOwner()]:GetCivilizationShortDescription())
			return true
		end
		)
	Event_NormandyRevoltOfTheEarls.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_NormandyRevoltOfTheEarls.Outcomes[1] = {}
	Event_NormandyRevoltOfTheEarls.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_1"
	Event_NormandyRevoltOfTheEarls.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_1"
	Event_NormandyRevoltOfTheEarls.Outcomes[1].Weight = 5
	Event_NormandyRevoltOfTheEarls.Outcomes[1].CanFunc = (
		function(player)			
			Event_NormandyRevoltOfTheEarls.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_1", eventRevoltingCity:GetName())
			return true
		end
		)
	Event_NormandyRevoltOfTheEarls.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cityX = eventRevoltingCity:GetX() + GetRandom(-1,1)
			local cityY = eventRevoltingCity:GetY() + GetRandom(-1,1)
			playerBarbarian:InitUnit(unitKnightID, cityX, cityY):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitKnightID, cityX, cityY):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitKnightID, cityX, cityY):JumpToNearestValidPlot()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS", player:GetCivilizationDescription(), player:GetName(), Players[eventRevoltingCity:GetOriginalOwner()]:GetCivilizationShortDescription()))
			save(player, "Event_NormandyRevoltOfTheEarls", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_NormandyRevoltOfTheEarls.Outcomes[2] = {}
	Event_NormandyRevoltOfTheEarls.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_2"
	Event_NormandyRevoltOfTheEarls.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_2"
	Event_NormandyRevoltOfTheEarls.Outcomes[2].Weight = 5
	Event_NormandyRevoltOfTheEarls.Outcomes[2].CanFunc = (
		function(player)		
			local goldCost = mathCeil(500 * iMod)	
			Event_NormandyRevoltOfTheEarls.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_2", goldCost, eventRevoltingCity:GetName())
			return true
		end
		)
	Event_NormandyRevoltOfTheEarls.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(500 * iMod)	
			player:ChangeGold(-goldCost)
			if GetRandom(1,10) <= 2 then
				local cityX = eventRevoltingCity:GetX() + GetRandom(-1,1)
				local cityY = eventRevoltingCity:GetY() + GetRandom(-1,1)
				playerBarbarian:InitUnit(unitKnightID, cityX, cityY):JumpToNearestValidPlot()
				playerBarbarian:InitUnit(unitKnightID, cityX, cityY):JumpToNearestValidPlot()
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NORMANDY_REVOLT_OF_THE_EARLS", player:GetCivilizationDescription(), player:GetName()))
			save(player, "Event_NormandyRevoltOfTheEarls", true)
		end)
Events_AddCivilisationSpecific(civilizationNormandyID, "Event_NormandyRevoltOfTheEarls", Event_NormandyRevoltOfTheEarls)
--------------------------------------------------------------------------------------------------------------------------
--  Normandy: Bayeux Tapestry
--------------------------------------------------------------------------------------------------------------------------
local buildingBayeuxTapestryID = GameInfoTypes["BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY"]

local Event_NormandyBayeuxTapestry = {}
	Event_NormandyBayeuxTapestry.Name = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY"
	Event_NormandyBayeuxTapestry.Desc = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_DESC"
	Event_NormandyBayeuxTapestry.Weight = 10
	Event_NormandyBayeuxTapestry.CanFunc = (
		function(player)			
			if load(player, "Event_NormandyBayeuxTapestry") == true then return false end
			if player:GetCivilizationType() ~= civilizationNormandyID then return false end
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(200 * iMod))
			if player:GetGold() < goldCost then return false end
			if (not JFD_IsHasConqueredMajorCapital(playerID)) then return false end
			Event_NormandyBayeuxTapestry.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_DESC")			
			return true
		end
		)
	Event_NormandyBayeuxTapestry.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_NormandyBayeuxTapestry.Outcomes[1] = {}
	Event_NormandyBayeuxTapestry.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_1"
	Event_NormandyBayeuxTapestry.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_1"
	Event_NormandyBayeuxTapestry.Outcomes[1].Weight = 5
	Event_NormandyBayeuxTapestry.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(200 * iMod))
			Event_NormandyBayeuxTapestry.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_NormandyBayeuxTapestry.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(200 * iMod))
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():SetNumRealBuilding(buildingBayeuxTapestryID, 1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY"))
			save(player, "Event_NormandyBayeuxTapestry", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_NormandyBayeuxTapestry.Outcomes[2] = {}
	Event_NormandyBayeuxTapestry.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_2"
	Event_NormandyBayeuxTapestry.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_2"
	Event_NormandyBayeuxTapestry.Outcomes[2].Weight = 2
	Event_NormandyBayeuxTapestry.Outcomes[2].CanFunc = (
		function(player)			
			Event_NormandyBayeuxTapestry.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_NormandyBayeuxTapestry.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NORMANDY_BAYEUX_TAPESTRY"))
			save(player, "Event_NormandyBayeuxTapestry", true)
		end)	
Events_AddCivilisationSpecific(civilizationNormandyID, "Event_NormandyBayeuxTapestry", Event_NormandyBayeuxTapestry)	
--=======================================================================================================================
--=======================================================================================================================


