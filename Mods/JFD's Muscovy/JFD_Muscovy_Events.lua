-- JFD_MuscovyEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Muscovy Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
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
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID 	= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local eraMedievalID		= GameInfoTypes["ERA_MEDIEVAL"]	
local mathCeil		 	= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Muscovy: The Printing Press
--------------------------------------------------------------------------------------------------------------------------
local techPrintingPressID = GameInfoTypes["TECH_PRINTING_PRESS"]

local Event_JFDMuscovyPrintingPress = {}
	Event_JFDMuscovyPrintingPress.Name = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS"
	Event_JFDMuscovyPrintingPress.Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_DESC"
	Event_JFDMuscovyPrintingPress.Weight = 10
	Event_JFDMuscovyPrintingPress.CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if load(player, "Event_JFDMuscovyPrintingPress") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraMedievalID 					then return false end
			if Teams[player:GetTeam()]:IsHasTech(techPrintingPressID) 	then return false end
			return true
		end
		)
	Event_JFDMuscovyPrintingPress.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMuscovyPrintingPress.Outcomes[1] = {}
	Event_JFDMuscovyPrintingPress.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_1"
	Event_JFDMuscovyPrintingPress.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_1"
	Event_JFDMuscovyPrintingPress.Outcomes[1].Weight = 5
	Event_JFDMuscovyPrintingPress.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDMuscovyPrintingPress.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDMuscovyPrintingPress.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS"))
			save(player, "Event_JFDMuscovyPrintingPress", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMuscovyPrintingPress.Outcomes[2] = {}
	Event_JFDMuscovyPrintingPress.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_2"
	Event_JFDMuscovyPrintingPress.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_2"
	Event_JFDMuscovyPrintingPress.Outcomes[2].Weight = 2
	Event_JFDMuscovyPrintingPress.Outcomes[2].CanFunc = (
		function(player)	
			local goldCost = mathCeil(500 * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDMuscovyPrintingPress.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFDMuscovyPrintingPress.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(500 * iMod)
			player:ChangeGold(-goldCost)
			Teams[player:GetTeam()]:GetTeamTechs():SetHasTech(techPrintingPressID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MUSCOVY_PRINTING_PRESS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_PRINTING_PRESS"))
			save(player, "Event_JFDMuscovyPrintingPress", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDMuscovyPrintingPress", Event_JFDMuscovyPrintingPress)
--------------------------------------------------------------------------------------------------------------------------
--  Muscovy: Conspiring Nobles
--------------------------------------------------------------------------------------------------------------------------
local city			= nil
local taskRazeID	= TaskTypes["TASK_RAZE"]

local Event_JFDMuscovyConspiringNobles = {}
	Event_JFDMuscovyConspiringNobles.Name = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES"
	Event_JFDMuscovyConspiringNobles.Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_DESC"
	Event_JFDMuscovyConspiringNobles.Weight = 10
	Event_JFDMuscovyConspiringNobles.CanFunc = (
		function(player)	
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			if player:GetCurrentEra() < eraMedievalID						then return false end
			
			local cities = {}
			local count = 1
			for city in player:Cities() do
				if (not city:IsOriginalCapital() and city:GetOriginalOwner() ~= player:GetID()) then
					cities[count] = city
					count = count + 1
				end
			end
			
			city = cities[JFD_GetRandom(1, #cities)]
			if city == nil then return false end
			Event_JFDMuscovyConspiringNobles.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_DESC", city:GetName())
			
			return true
		end
		)
	Event_JFDMuscovyConspiringNobles.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMuscovyConspiringNobles.Outcomes[1] = {}
	Event_JFDMuscovyConspiringNobles.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_1"
	Event_JFDMuscovyConspiringNobles.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_1"
	Event_JFDMuscovyConspiringNobles.Outcomes[1].Weight = 5
	Event_JFDMuscovyConspiringNobles.Outcomes[1].CanFunc = (
		function(player)	
			local goldenAgeCost = player:GetGoldenAgeProgressMeter() * 25 / 100		
			Event_JFDMuscovyConspiringNobles.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_1", city:GetName(), goldenAgeCost)
			return true
		end
		)
	Event_JFDMuscovyConspiringNobles.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = player:GetGoldenAgeProgressMeter() * 25 / 100	
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)	
			city:DoTask(taskRazeID)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_1_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES", city:GetName())) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMuscovyConspiringNobles.Outcomes[2] = {}
	Event_JFDMuscovyConspiringNobles.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_2"
	Event_JFDMuscovyConspiringNobles.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_2"
	Event_JFDMuscovyConspiringNobles.Outcomes[2].Weight = 2
	Event_JFDMuscovyConspiringNobles.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDMuscovyConspiringNobles.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_2", city:GetName())
			return true
		end
		)
	Event_JFDMuscovyConspiringNobles.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1,10) <= 3 then
				city:ChangeResistanceTurns(1)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_2_ALT_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MUSCOVY_CONSPIRING_NOBLES_OUTCOME_RESULT_2_NOTIFICATION", city:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MUSCOVY_CONSPIRING_NOBLES"))
			end
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDMuscovyConspiringNobles", Event_JFDMuscovyConspiringNobles)
--=======================================================================================================================
--=======================================================================================================================


