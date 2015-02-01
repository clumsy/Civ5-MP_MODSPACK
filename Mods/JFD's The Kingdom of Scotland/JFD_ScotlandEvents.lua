-- JFD_ScotlandEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Scotland Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local techGunpowderID = GameInfoTypes["TECH_GUNPOWDER"]
local unitMerchantID = GameInfoTypes["UNIT_MERCHANT"]
--------------------------------------------------------------------------------------------------------------------------
-- Gunpowder Plot
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDScotlandGunpowderPlot = {}
	Event_JFDScotlandGunpowderPlot.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT"
	Event_JFDScotlandGunpowderPlot.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_DESC"
	Event_JFDScotlandGunpowderPlot.Weight = 10
	Event_JFDScotlandGunpowderPlot.CanFunc = (
		function(player)			
			if load(player, "Event_JFDScotlandGunpowderPlot") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 			 then return false end
			if not (Teams[player:GetTeam()]:IsHasTech(techGunpowderID)) then return false end
			
			return true
		end
		)
	Event_JFDScotlandGunpowderPlot.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDScotlandGunpowderPlot.Outcomes[1] = {}
	Event_JFDScotlandGunpowderPlot.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_1"
	Event_JFDScotlandGunpowderPlot.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1"
	Event_JFDScotlandGunpowderPlot.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDScotlandGunpowderPlot.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDScotlandGunpowderPlot.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_GUNPOWDER_PLOT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_GUNPOWDER_PLOT")) 
			save(player, "Event_JFDScotlandGunpowderPlot", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDScotlandGunpowderPlot", Event_JFDScotlandGunpowderPlot)
--------------------------------------------------------------------------------------------------------------------------
-- Wealth of Nations
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDScotlandWealthofNations = {}
	Event_JFDScotlandWealthofNations.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS"
	Event_JFDScotlandWealthofNations.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_DESC"
	Event_JFDScotlandWealthofNations.Weight = 0
	Event_JFDScotlandWealthofNations.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraRenaissanceID 		then return false end

			return true
		end
		)
	Event_JFDScotlandWealthofNations.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDScotlandWealthofNations.Outcomes[1] = {}
	Event_JFDScotlandWealthofNations.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_1"
	Event_JFDScotlandWealthofNations.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1"
	Event_JFDScotlandWealthofNations.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDScotlandWealthofNations.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDScotlandWealthofNations.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(unitMerchantID, capitalX, capitalY):SetName("Adam Smith")
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WEALTH_OF_NATIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_WEALTH_OF_NATIONS")) 
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDScotlandWealthofNations", Event_JFDScotlandWealthofNations, 1776, true)
--------------------------------------------------------------------------------------------------------------------------
-- Wild Haggis
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDScotlandWildHaggis = {}
	Event_JFDScotlandWildHaggis.Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"
	Event_JFDScotlandWildHaggis.Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_DESC"
	Event_JFDScotlandWildHaggis.Weight = 10
	Event_JFDScotlandWildHaggis.CanFunc = (
		function(player)			
			if load(player, "Event_JFDScotlandWildHaggis") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end

			Event_JFDScotlandWildHaggis.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_DESC")
			return true
		end
		)
	Event_JFDScotlandWildHaggis.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDScotlandWildHaggis.Outcomes[1] = {}
	Event_JFDScotlandWildHaggis.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_1"
	Event_JFDScotlandWildHaggis.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1"
	Event_JFDScotlandWildHaggis.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFDScotlandWildHaggis.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDScotlandWildHaggis.Outcomes[1].DoFunc = (
		function(player) 
			str =  Locale.ConvertTextKey("TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT_TRUTH");
			local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT'"}
			for i, iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			-- refresh UI texts
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
		
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFDScotlandWildHaggis", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDScotlandWildHaggis.Outcomes[2] = {}
	Event_JFDScotlandWildHaggis.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_2"
	Event_JFDScotlandWildHaggis.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2"
	Event_JFDScotlandWildHaggis.Outcomes[2].CanFunc = (
		function(player)			
			local faithReward = mathCeil(100 * iMod)
			Event_JFDScotlandWildHaggis.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDScotlandWildHaggis.Outcomes[2].DoFunc = (
		function(player) 
			str =  Locale.ConvertTextKey("TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT_TRUTH");
			local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_CIV5_SCOTLAND_FACTOID_TEXT'"}
			for i, iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			-- refresh UI texts
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
		
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFDScotlandWildHaggis", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDScotlandWildHaggis.Outcomes[3] = {}
	Event_JFDScotlandWildHaggis.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_3"
	Event_JFDScotlandWildHaggis.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3"
	Event_JFDScotlandWildHaggis.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDScotlandWildHaggis.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDScotlandWildHaggis.Outcomes[3].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND_WILD_HAGGIS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SCOTLAND_WILD_HAGGIS"))
			save(player, "Event_JFDScotlandWildHaggis", true)	
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDScotlandWildHaggis", Event_JFDScotlandWildHaggis)
--=======================================================================================================================
--=======================================================================================================================


