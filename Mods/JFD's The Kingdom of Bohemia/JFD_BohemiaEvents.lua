-- JFD_BohemiaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Bohemia Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
local unitWriterID = GameInfoTypes["UNIT_WRITER"]
--------------------------------------------------------------------------------------------------------------------------
--  Czech Language
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBohemiaCzechLanguage = {}
	Event_JFDBohemiaCzechLanguage.Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"
	Event_JFDBohemiaCzechLanguage.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_DESC"
	Event_JFDBohemiaCzechLanguage.Weight = 10
	Event_JFDBohemiaCzechLanguage.CanFunc = (
		function(player)			
			if load(player, "Event_JFDBohemiaCzechLanguage") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			
			local goldCost = mathCeil(1000 * iMod)
			if player:GetGold() < goldCost 					then return false end
			if player:GetCurrentEra() < eraRenaissanceID 	then return false end

			Event_JFDBohemiaCzechLanguage.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_DESC", goldCost)
			return true
		end
		)
	Event_JFDBohemiaCzechLanguage.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBohemiaCzechLanguage.Outcomes[1] = {}
	Event_JFDBohemiaCzechLanguage.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_1"
	Event_JFDBohemiaCzechLanguage.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1"
	Event_JFDBohemiaCzechLanguage.Outcomes[1].Weight = 5
	Event_JFDBohemiaCzechLanguage.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(1000 * iMod)
			
			Event_JFDBohemiaCzechLanguage.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDBohemiaCzechLanguage.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(1000 * iMod)
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:ChangeGold(-goldCost)
			player:InitUnit(unitWriterID, capitalX, capitalY)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE")) 
			save(player, "Event_JFDBohemiaCzechLanguage", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBohemiaCzechLanguage.Outcomes[2] = {}
	Event_JFDBohemiaCzechLanguage.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_2"
	Event_JFDBohemiaCzechLanguage.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2"
	Event_JFDBohemiaCzechLanguage.Outcomes[2].Weight = 0
	Event_JFDBohemiaCzechLanguage.Outcomes[2].CanFunc = (
		function(player)
			Event_JFDBohemiaCzechLanguage.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDBohemiaCzechLanguage.Outcomes[2].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_CZECH_LANGUAGE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_CZECH_LANGUAGE")) 
			save(player, "Event_JFDBohemiaCzechLanguage", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDBohemiaCzechLanguage", Event_JFDBohemiaCzechLanguage)
--------------------------------------------------------------------------------------------------------------------------
-- Defenestration of Prague
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBohemiaPragueDefenstration = {}
	Event_JFDBohemiaPragueDefenstration.Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"
	Event_JFDBohemiaPragueDefenstration.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_DESC"
	Event_JFDBohemiaPragueDefenstration.Weight = 10
	Event_JFDBohemiaPragueDefenstration.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			Event_JFDBohemiaPragueDefenstration.Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_DESC"
			return true
		end
		)
	Event_JFDBohemiaPragueDefenstration.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBohemiaPragueDefenstration.Outcomes[1] = {}
	Event_JFDBohemiaPragueDefenstration.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_1"
	Event_JFDBohemiaPragueDefenstration.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1"
	Event_JFDBohemiaPragueDefenstration.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDBohemiaPragueDefenstration.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDBohemiaPragueDefenstration.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBohemiaPragueDefenstration.Outcomes[2] = {}
	Event_JFDBohemiaPragueDefenstration.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_2"
	Event_JFDBohemiaPragueDefenstration.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2"
	Event_JFDBohemiaPragueDefenstration.Outcomes[2].CanFunc = (
		function(player)		
			local cultureCost = mathCeil(45 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end

			Event_JFDBohemiaPragueDefenstration.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2", cultureCost)
			return true
		end
		)
	Event_JFDBohemiaPragueDefenstration.Outcomes[2].DoFunc = (
		function(player) 
			local cultureCost = mathCeil(45 * iMod)
			player:ChangeJONSCulture(-cultureCost)			
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(5)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION")) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDBohemiaPragueDefenstration.Outcomes[3] = {}
	Event_JFDBohemiaPragueDefenstration.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_3"
	Event_JFDBohemiaPragueDefenstration.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3"
	Event_JFDBohemiaPragueDefenstration.Outcomes[3].CanFunc = (
		function(player)		
			local cultureReward = mathCeil(55 * iMod)

			Event_JFDBohemiaPragueDefenstration.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3", cultureReward)
			return true
		end
		)
	Event_JFDBohemiaPragueDefenstration.Outcomes[3].DoFunc = (
		function(player) 
			local cultureReward = mathCeil(55 * iMod)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA_PRAGUE_DEFENSTRATION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BOHEMIA_PRAGUE_DEFENSTRATION"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BOHEMIA_PRAGUE_DEFENESTRATION")) 
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"], "Event_JFDBohemiaPragueDefenstration", Event_JFDBohemiaPragueDefenstration)
--=======================================================================================================================
--=======================================================================================================================


