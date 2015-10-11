-- JFD_JFD_ItalyMussolini_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Italy (Mussolini) Events: loaded")
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
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_ITALY"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Nemi Ships
--------------------------------------------------------------------------------------------------------------------------
local buildingNemiShipsID	= GameInfoTypes["BUILDING_JFD_NEMI_SHIPS"]
local eraRenaissanceID		= GameInfoTypes["ERA_RENAISSANCE"]
local greatWorkArtID		= GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"]

local Event_JFDItalyNemiShips = {}
	Event_JFDItalyNemiShips.Name = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS"
	Event_JFDItalyNemiShips.Desc = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_DESC"
	Event_JFDItalyNemiShips.Weight = 5
	Event_JFDItalyNemiShips.CanFunc = (
		function(player)			
			if load(player, "Event_JFDItalyNemiShips") == true 			then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetCurrentEra() < eraRenaissanceID 				then return false end
			if (not player:HasAvailableGreatWorkSlot(greatWorkArtID)) 	then return false end

			local goldCost = mathCeil(400 * iMod)
			if player:GetGold() < goldCost then return false end
			
			return true
		end
		)
	Event_JFDItalyNemiShips.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDItalyNemiShips.Outcomes[1] = {}
	Event_JFDItalyNemiShips.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_1"
	Event_JFDItalyNemiShips.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_1"
	Event_JFDItalyNemiShips.Outcomes[1].CanFunc = (
		function(player)		
			local goldCost = mathCeil(400 * iMod)
			Event_JFDItalyNemiShips.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDItalyNemiShips.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(400 * iMod)
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():SetNumRealBuilding(buildingNemiShipsID, 1)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ITALY_NEMI_SHIPS"))
			save(player, "Event_JFDItalyNemiShips", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDItalyNemiShips.Outcomes[2] = {}
	Event_JFDItalyNemiShips.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_2"
	Event_JFDItalyNemiShips.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_2"
	Event_JFDItalyNemiShips.Outcomes[2].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(160 * iMod)
			Event_JFDItalyNemiShips.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDItalyNemiShips.Outcomes[2].DoFunc = (
		function(player) 
			local cultureReward = mathCeil(160 * iMod)
			player:ChangeJONSCulture(cultureReward)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_NEMI_SHIPS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_NEMI_SHIPS"))
			save(player, "Event_JFDItalyNemiShips", true)	
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDItalyNemiShips", Event_JFDItalyNemiShips)
--------------------------------------------------------------------------------------------------------------------------
-- Blackshirt violence
--------------------------------------------------------------------------------------------------------------------------
local policyBlackshirtsID = GameInfoTypes["POLICY_JFD_BLACKSHIRTS"]

local Event_JFDItalyBlackshirtViolence = {}
	Event_JFDItalyBlackshirtViolence.Name = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE"
	Event_JFDItalyBlackshirtViolence.Desc = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_DESC"
	Event_JFDItalyBlackshirtViolence.Weight = 5
	Event_JFDItalyBlackshirtViolence.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if (not player:HasPolicy(policyBlackshirtsID)) 		then return false end
			
			Event_JFDItalyBlackshirtViolence.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_DESC")
			return true
		end
		)
	Event_JFDItalyBlackshirtViolence.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDItalyBlackshirtViolence.Outcomes[1] = {}
	Event_JFDItalyBlackshirtViolence.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_1"
	Event_JFDItalyBlackshirtViolence.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_1"
	Event_JFDItalyBlackshirtViolence.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDItalyBlackshirtViolence.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDItalyBlackshirtViolence.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1,10) <= 5 then
				player:GetCapitalCity():ChangeResistanceTurns(2)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_1"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDItalyBlackshirtViolence.Outcomes[2] = {}
	Event_JFDItalyBlackshirtViolence.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_2"
	Event_JFDItalyBlackshirtViolence.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_2"
	Event_JFDItalyBlackshirtViolence.Outcomes[2].CanFunc = (
		function(player)	
			local goldenAgeReward = mathCeil(140 * iMod)
			Event_JFDItalyBlackshirtViolence.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFDItalyBlackshirtViolence.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1,10) <= 5 then
				player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_BLACKSHIRT_VIOLENCE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE"))
			end
			player:GetCapitalCity():ChangeResistanceTurns(1)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ITALY_BLACKSHIRT_VIOLENCE_2"))
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDItalyBlackshirtViolence", Event_JFDItalyBlackshirtViolence)
--------------------------------------------------------------------------------------------------------------------------
-- Late Trains
--------------------------------------------------------------------------------------------------------------------------
local techRailroadID = GameInfoTypes["TECH_RAILROAD"]

local Event_JFDItalyLateTrains = {}
	Event_JFDItalyLateTrains.Name = "TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS"
	Event_JFDItalyLateTrains.Desc = "TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS_DESC"
	Event_JFDItalyLateTrains.Weight = 10
	Event_JFDItalyLateTrains.CanFunc = (
		function(player)			
			if load(player, "Event_JFDItalyLateTrains") == true 		then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if (not player:HasPolicy(policyBlackshirtsID)) 				then return false end
			if (not Teams[player:GetTeam()]:IsHasTech(techRailroadID))  then return false end
			
			Event_JFDItalyLateTrains.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS_DESC")
			return true
		end
		)
	Event_JFDItalyLateTrains.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDItalyLateTrains.Outcomes[1] = {}
	Event_JFDItalyLateTrains.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS_OUTCOME_1"
	Event_JFDItalyLateTrains.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS_OUTCOME_RESULT_1"
	Event_JFDItalyLateTrains.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDItalyLateTrains.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDItalyLateTrains.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_LATE_TRAINS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ITALY_LATE_TRAINS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ITALY_LATE_TRAINS"))
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDItalyLateTrains", Event_JFDItalyLateTrains)
--=======================================================================================================================
--=======================================================================================================================


