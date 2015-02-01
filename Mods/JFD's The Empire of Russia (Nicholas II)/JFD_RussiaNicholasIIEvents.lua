-- JFD_RussiaNicholasIIEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Nicholas II) Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local unitScientistID = GameInfoTypes["UNIT_SCIENTIST"]
--------------------------------------------------------------------------------------------------------------------------
--  Contention in the State Duma
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDRussiaNicholasIIStateDuma = {}
	Event_JFDRussiaNicholasIIStateDuma.Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA"
	Event_JFDRussiaNicholasIIStateDuma.Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_DESC"
	Event_JFDRussiaNicholasIIStateDuma.Weight = 10
	Event_JFDRussiaNicholasIIStateDuma.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraMedievalID 			then return false end
			return true
		end
		)
	Event_JFDRussiaNicholasIIStateDuma.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1] = {}
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_1"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_1"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].Weight = 5
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()* 35 / 100)
			local cultureReward = mathCeil(player:GetNextPolicyCost() * 20 / 100 * iMod)
			local faithReward = mathCeil(cultureReward * 2 * iMod)

			Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_1", goldenAgeCost, faithReward, cultureReward)
			return true
		end
		)
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter()* 35 / 100)
			local cultureReward = mathCeil(player:GetNextPolicyCost() * 20 / 100 * iMod)
			local faithReward = mathCeil(cultureReward * 2 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeJONSCulture(cultureReward)
			player:ChangeFaith(faithReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2] = {}
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_2"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_2"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].Weight = 3
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(260 * iMod)
			local cultureReward = mathCeil(player:GetNextPolicyCost() * 10 / 100 * iMod)
			if player:GetGold() < goldCost then return false end
			
			Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_2", goldCost, cultureReward)
			return true
		end
		)
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(260 * iMod)
			local cultureReward = mathCeil(player:GetNextPolicyCost() * 10 / 100 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(cultureReward)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA")) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3] = {}
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_3"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_3"
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].Weight = 1
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(player:GetNextPolicyCost() * 22 / 100 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			
			Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_3", cultureCost)
			return true
		end
		)
	Event_JFDRussiaNicholasIIStateDuma.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureCost = mathCeil(player:GetNextPolicyCost() * 22 / 100 * iMod)
			player:ChangeJONSCulture(-cultureCost)
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(10)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_CONTENTION_DUMA_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_CONTENTION_DUMA")) 
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDRussiaNicholasIIStateDuma", Event_JFDRussiaNicholasIIStateDuma)
--------------------------------------------------------------------------------------------------------------------------
--  Alexei's Illness
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDRussiaNicholasIIAlexeisIllness = {}
	Event_JFDRussiaNicholasIIAlexeisIllness.Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"
	Event_JFDRussiaNicholasIIAlexeisIllness.Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_DESC"
	Event_JFDRussiaNicholasIIAlexeisIllness.Weight = 10
	Event_JFDRussiaNicholasIIAlexeisIllness.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraMedievalID 			then return false end
			return true
		end
		)
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1] = {}
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_1"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_1"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].Weight = 3
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(200 * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(200 * iMod)
			player:ChangeGold(-goldCost)
			if JFD_GetRandom(1, 100) <= 50 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
				player:ChangeGoldenAgeTurns(5)
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS")) 
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2] = {}
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_2"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_2"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].Weight = 5
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].CanFunc = (
		function(player)			
			local faithCost = mathCeil(230 * iMod)
			if player:GetFaith() < faithCost then return false end
			
			Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_2", faithCost)
			return true
		end
		)
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = mathCeil(230 * iMod)
			player:ChangeFaith(-faithCost)
			
			if JFD_GetRandom(1, 100) <= 25 then
				for city in player:Cities() do
					city:ChangeWeLoveTheKingDayCounter(5)
				end
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS")) 
			end
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3] = {}
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_3"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_3"
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].Weight = 1
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDRussiaNicholasIIAlexeisIllness.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			if JFD_GetRandom(1, 100) <= 10 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
				player:InitUnit(unitScientistID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NICHOLAS_II_ALEXEI_ILLNESS_OUTCOME_RESULT_3_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_NICHOLAS_II_ALEXEI_ILLNESS")) 
			end
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDRussiaNicholasIIAlexeisIllness", Event_JFDRussiaNicholasIIAlexeisIllness)
--=======================================================================================================================
--=======================================================================================================================


