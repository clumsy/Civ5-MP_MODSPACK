-- JFD_GermanHitlerEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Nazi Germany Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NAZI_GERMANY"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local majorCivID = nil
local majorCiv = nil
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Demand for De=militarisation
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDNaziGermanyDemilitarisation = {}
	Event_JFDNaziGermanyDemilitarisation.Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION"
	Event_JFDNaziGermanyDemilitarisation.Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_DESC"
	Event_JFDNaziGermanyDemilitarisation.Weight = 10
	Event_JFDNaziGermanyDemilitarisation.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID	then return false end
			if player:GetNumMilitaryUnits() < 8					then return false end

			local playerTeam = Teams[player:GetTeam()]
			local majorCivs = {}
			local count = 1
			for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[playerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				if (playerID ~= player:GetID() and playerTeam:IsHasMet(otherPlayerTeamID) and not (playerTeam:IsAtWar(otherPlayerTeamID) and not (otherPlayer:IsDenouncedPlayer(player)) and not (otherPlayer:IsDenouncingPlayer(player)))) then
					majorCivs[count] = playerID
					count = count + 1	
				end
			end
			
			majorCivID = majorCivs[GetRandom(1, #majorCivs)]
			if majorCivID == nil then return false end
			majorCiv = Players[majorCivID]
			
			Event_JFDNaziGermanyDemilitarisation.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_DESC", majorCiv:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNaziGermanyDemilitarisation.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNaziGermanyDemilitarisation.Outcomes[1] = {}
	Event_JFDNaziGermanyDemilitarisation.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_1"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_1"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDNaziGermanyDemilitarisation.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_1", majorCiv:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNaziGermanyDemilitarisation.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			Teams[player:GetTeam()]:DeclareWar(majorCiv:GetTeam(), true)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_1_NOTIFICATION", majorCiv:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_NAZI_GERMANY_DEMILITARISATION_1", majorCiv:GetCivilizationShortDescription(), majorCiv:GetName()))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDNaziGermanyDemilitarisation.Outcomes[2] = {}
	Event_JFDNaziGermanyDemilitarisation.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_2"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_2"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDNaziGermanyDemilitarisation.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDNaziGermanyDemilitarisation.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do
				if (unit:IsCombatUnit() and unit:GetLevel() < 3 and not (unit:IsGarrisoned())) then
					unit:Kill(false, playerID)
				end
			end

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_2_NOTIFICATION", majorCiv:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_NAZI_GERMANY_DEMILITARISATION_2", majorCiv:GetName(), majorCiv:GetCivilizationShortDescription()))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDNaziGermanyDemilitarisation.Outcomes[3] = {}
	Event_JFDNaziGermanyDemilitarisation.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_3"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_3"
	Event_JFDNaziGermanyDemilitarisation.Outcomes[3].CanFunc = (
		function(player)	
			Event_JFDNaziGermanyDemilitarisation.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_3", majorCiv:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDNaziGermanyDemilitarisation.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1,100) <= 50 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_3_NOTIFICATION", majorCiv:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_NAZI_GERMANY_DEMILITARISATION_3", majorCiv:GetName(), majorCiv:GetCivilizationShortDescription()))
			else
				majorCiv:DoForceDenounce(playerID)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_DEMILITARISATION_OUTCOME_RESULT_3_ALT_NOTIFICATION", majorCiv:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_DEMILITARISATION"))
			end
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDNaziGermanyDemilitarisation", Event_JFDNaziGermanyDemilitarisation)
--------------------------------------------------------------------------------------------------------------------------
--  New Propaganda
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDNaziGermanyPropaganda = {}
	Event_JFDNaziGermanyPropaganda.Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA"
	Event_JFDNaziGermanyPropaganda.Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA_DESC"
	Event_JFDNaziGermanyPropaganda.Weight = 2
	Event_JFDNaziGermanyPropaganda.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end

			Event_JFDNaziGermanyPropaganda.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA_DESC")
			return true
		end
		)
	Event_JFDNaziGermanyPropaganda.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDNaziGermanyPropaganda.Outcomes[1] = {}
	Event_JFDNaziGermanyPropaganda.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA_OUTCOME_1"
	Event_JFDNaziGermanyPropaganda.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA_OUTCOME_RESULT_1"
	Event_JFDNaziGermanyPropaganda.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDNaziGermanyPropaganda.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDNaziGermanyPropaganda.Outcomes[1].DoFunc = (
		function(player) 
			player:ChangeNumFreeGreatPeople(1)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_NAZI_GERMANY_PROPAGANDA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_NAZI_GERMANY_PROPAGANDA"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDNaziGermanyPropaganda", Event_JFDNaziGermanyPropaganda)
--=======================================================================================================================
--=======================================================================================================================


