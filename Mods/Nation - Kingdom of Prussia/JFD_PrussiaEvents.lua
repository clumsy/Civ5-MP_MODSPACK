-- JFD_PrussiaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Prussia Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PRUSSIA"]
local mathCeil = math.ceil
local unitDomainLandID = GameInfoTypes["DOMAIN_LAND"]
--------------------------------------------------------------------------------------------------------------------------
-- Enlightened Absolutism
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPrussiaEnlightenedAbsolutism = {}
	Event_JFDPrussiaEnlightenedAbsolutism.Name = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM"
	Event_JFDPrussiaEnlightenedAbsolutism.Desc = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_DESC"
	Event_JFDPrussiaEnlightenedAbsolutism.Weight = 0
	Event_JFDPrussiaEnlightenedAbsolutism.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end

			return true
		end
		)
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1] = {}
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_1"
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_1"
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1].CanFunc = (
		function(player)			
			local scienceReward = mathCeil(player:GetTotalJONSCulturePerTurn() * 4)
			Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_1", scienceReward)
			return true
		end
		)
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local scienceReward = mathCeil(player:GetTotalJONSCulturePerTurn() * 4)
			player:GetCapitalCity():ChangeResistanceTurns(2)
			player:ChangeGoldenAgeTurns(12)
			Teams[player:GetTeam()]:GetTeamTechs():ChangeResearchProgress(player:GetCurrentResearch(), scienceReward, playerID)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2] = {}
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_2"
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_2"
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = player:GetGoldenAgeProgressMeter() * 60 / 100
			Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_JFDPrussiaEnlightenedAbsolutism.Outcomes[2].DoFunc = (
		function(player) 
			local goldenAgeCost = player:GetGoldenAgeProgressMeter() * 60 / 100
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeNumFreePolicies(1)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_ENLIGHTENED_ABSOLUTISM"))
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDPrussiaEnlightenedAbsolutism", Event_JFDPrussiaEnlightenedAbsolutism, JFD_GetRandom(1562, 1791), true)
--------------------------------------------------------------------------------------------------------------------------
-- Compilation of Clausewitz' 'On War'
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPrussiaClausewitzOnWar = {}
	Event_JFDPrussiaClausewitzOnWar.Name = "TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR"
	Event_JFDPrussiaClausewitzOnWar.Desc = "TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR_DESC"
	Event_JFDPrussiaClausewitzOnWar.Weight = 0
	Event_JFDPrussiaClausewitzOnWar.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			return true
		end
		)
	Event_JFDPrussiaClausewitzOnWar.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPrussiaClausewitzOnWar.Outcomes[1] = {}
	Event_JFDPrussiaClausewitzOnWar.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR_OUTCOME_1"
	Event_JFDPrussiaClausewitzOnWar.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR_OUTCOME_RESULT_1"
	Event_JFDPrussiaClausewitzOnWar.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDPrussiaClausewitzOnWar.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDPrussiaClausewitzOnWar.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for unit in player:Units() do
				if unit:GetDomainType() == unitDomainLandID and unit:IsCombatUnit() then
					unit:ChangeExperience(10)
				end
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PRUSSIA_CLAUSEWITZ_ON_WAR")) 
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDPrussiaClausewitzOnWar", Event_JFDPrussiaClausewitzOnWar, 1832, true)
--=======================================================================================================================
--=======================================================================================================================


