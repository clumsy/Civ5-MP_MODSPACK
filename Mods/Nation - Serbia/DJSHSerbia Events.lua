-- Lua Script1
-- Author: Gebruiker
-- DateCreated: 3/1/2015 9:13:53 PM
--------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
--  Aiding Jelena
--------------------------------------------------------------------------------------------------------------------------
local Event_DJSHSerbiaJelena = {}
	Event_DJSHSerbiaJelena.Name = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA"
	Event_DJSHSerbiaJelena.Desc = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA_DESC"
	Event_DJSHSerbiaJelena.Weight = 10
	Event_DJSHSerbiaJelena.CanFunc = (
		function(player)			
			if load(player, "Event_DJSHSerbiaJelena") == true then return false end
			if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA"] 	then return false end
			if player:GetCurrentEra() ~= GameInfoTypes["ERA_MEDIEVAL"]	then return false end
			return true
		end
		)
	Event_DJSHSerbiaJelena.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_DJSHSerbiaJelena.Outcomes[1] = {}
	Event_DJSHSerbiaJelena.Outcomes[1].Name = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_1"
	Event_DJSHSerbiaJelena.Outcomes[1].Desc = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_RESULT_1"
	Event_DJSHSerbiaJelena.Outcomes[1].CanFunc = (
		function(player)		
			Event_DJSHSerbiaJelena.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_DJSHSerbiaJelena.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(GameInfoTypes["UNIT_DJSH_GUSAR"], capitalX, capitalY)
			player:InitUnit(GameInfoTypes["UNIT_DJSH_GUSAR"], capitalX, capitalY)
			player:InitUnit(GameInfoTypes["UNIT_DJSH_GUSAR"], capitalX, capitalY)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_DJSH_SERBIA_JELENA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_JELENA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_SERBIA_JELENA")) 
			save(player, "Event_DJSHSerbiaJelena", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_DJSHSerbiaJelena.Outcomes[2] = {}
	Event_DJSHSerbiaJelena.Outcomes[2].Name = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_2"
	Event_DJSHSerbiaJelena.Outcomes[2].Desc = "TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_RESULT_2"
	Event_DJSHSerbiaJelena.Outcomes[2].CanFunc = (
		function(player)		
			Event_DJSHSerbiaJelena.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_JELENA_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_DJSHSerbiaJelena.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():ChangePopulation(1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_DJSH_SERBIA_JELENA_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_JELENA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_SERBIA_JELENA")) 
			save(player, "Event_DJSHSerbiaJelena", true)
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA"], "Event_DJSHSerbiaJelena", Event_DJSHSerbiaJelena, true)
--------------------------------------------------------------------------------------------------------------------------
--  Coronation as Emperor
--------------------------------------------------------------------------------------------------------------------------
local Event_DJSHSerbiaEmperorCoronation = {}
	Event_DJSHSerbiaEmperorCoronation.Name = "TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION"
	Event_DJSHSerbiaEmperorCoronation.Desc = "TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION_DESC"
	Event_DJSHSerbiaEmperorCoronation.Weight = 10
	Event_DJSHSerbiaEmperorCoronation.CanFunc = (
		function(player)
			if load(player, "Event_DJSHSerbiaEmperorCoronation") == true then return false end						
			if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA"] then return false end
			if player:GetCurrentEra() ~= GameInfoTypes["ERA_MEDIEVAL"] 	then return false end
			return true
		end
		)
	Event_DJSHSerbiaEmperorCoronation.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_DJSHSerbiaEmperorCoronation.Outcomes[1] = {}
	Event_DJSHSerbiaEmperorCoronation.Outcomes[1].Name = "TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION_OUTCOME_1"
	Event_DJSHSerbiaEmperorCoronation.Outcomes[1].Desc = "TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION_OUTCOME_RESULT_1"
	Event_DJSHSerbiaEmperorCoronation.Outcomes[1].CanFunc = (
		function(player)			

			Event_DJSHSerbiaEmperorCoronation.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_DJSHSerbiaEmperorCoronation.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(10)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_DJSH_SERBIA_EMPEROR_CORONATION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_SERBIA_EMPEROR_CORONATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_SERBIA_EMPEROR_CORONATION")) 
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA"], "Event_DJSHSerbiaEmperorCoronation", Event_DJSHSerbiaEmperorCoronation)