-- JFD_GreatBritainEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Great Britain Events: loaded")
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
local cityID = nil
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"] 
local mathCeil = math.ceil
local playerBarbarian = Players[63]
--------------------------------------------------------------------------------------------------------------------------
--  Worker Strikes
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDUSSRStalinWorkerStrike = {}
	Event_JFDUSSRStalinWorkerStrike.Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE"
	Event_JFDUSSRStalinWorkerStrike.Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_DESC"
	Event_JFDUSSRStalinWorkerStrike.Weight = 5
	Event_JFDUSSRStalinWorkerStrike.CanFunc = (
		function (player)			
			if player:GetCivilizationType() ~= civilisationID 		    then return false end
			if player:GetCurrentEra() < eraIndustrialID 			    then return false end
			if player:GetHappiness() < 2 								then return false end
			local cities = {}
			cityID = nil

			local count = 1
			for city in player:Cities() do
				cities[count] = city:GetID()
				count = count + 1
			end

			cityID = cities[GetRandom(1, #cities)]
			if cityID == nil then return false end
			
			Event_JFDUSSRStalinWorkerStrike.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_DESC", player:GetCityByID(cityID):GetName())
			return true
		end
		)
	Event_JFDUSSRStalinWorkerStrike.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDUSSRStalinWorkerStrike.Outcomes[1] = {}
	Event_JFDUSSRStalinWorkerStrike.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_1"
	Event_JFDUSSRStalinWorkerStrike.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_1"
	Event_JFDUSSRStalinWorkerStrike.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDUSSRStalinWorkerStrike.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_1", player:GetCityByID(cityID):GetName())
			return true
		end
		)
	Event_JFDUSSRStalinWorkerStrike.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			local resistanceTurns = JFD_GetRandom(1,3)
			player:GetCityByID(cityID):ChangeResistanceTurns(resistanceTurns)
			player:InitUnit(GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_GUN"), capitalX, capitalY)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_1_NOTIFICATION", player:GetCityByID(cityID):GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_USSR_STALIN_WORKER_STRIKE_1"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDUSSRStalinWorkerStrike.Outcomes[2] = {}
	Event_JFDUSSRStalinWorkerStrike.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_2"
	Event_JFDUSSRStalinWorkerStrike.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_2"
	Event_JFDUSSRStalinWorkerStrike.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDUSSRStalinWorkerStrike.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_2", player:GetCityByID(cityID):GetName())
			return true
		end
		)
	Event_JFDUSSRStalinWorkerStrike.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCityByID(cityID):ChangeResistanceTurns(1)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_WORKER_STRIKE_OUTCOME_RESULT_2_NOTIFICATION", player:GetCityByID(cityID):GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_WORKER_STRIKE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_USSR_STALIN_WORKER_STRIKE_2"))
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDUSSRStalinWorkerStrike", Event_JFDUSSRStalinWorkerStrike)
--------------------------------------------------------------------------------------------------------------------------
-- Revolutionary Movement
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDUSSRStalinRevolutionaryMovement = {}
	Event_JFDUSSRStalinRevolutionaryMovement.Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT"
	Event_JFDUSSRStalinRevolutionaryMovement.Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_DESC"
	Event_JFDUSSRStalinRevolutionaryMovement.Weight = 5
	Event_JFDUSSRStalinRevolutionaryMovement.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 		    then return false end
			if player:GetCurrentEra() < eraIndustrialID 			    then return false end
			
			return true
		end
		)
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1] = {}
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_1"
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_1"
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(25)
			
			if JFD_GetRandom(1,100) <= 30 then
				local capitalX = player:GetCapitalCity():GetX() + 1
				local capitalY = player:GetCapitalCity():GetY() + 1
				local unit = playerBarbarian:InitUnit(GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN"), capitalX, capitalY)
				unit:SetName("Rebel")
				unit:JumpToNearestValidPlot()
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENT_USSR_STALIN_REVOLUTIONARY_MOVEMENT_1")) 
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT"))
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2] = {}
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_2"
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_2"
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDUSSRStalinRevolutionaryMovement.Outcomes[2].DoFunc = (
		function(player) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_USSR_STALIN_REVOLUTIONARY_MOVEMENT"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDUSSRStalinRevolutionaryMovement", Event_JFDUSSRStalinRevolutionaryMovement)
--=======================================================================================================================
--=======================================================================================================================


