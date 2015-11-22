-- JFD_AngloSaxonsEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Anglo-Saxons Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local unitBerserkerID = GameInfoTypes["UNIT_DANISH_BERSERKER"]
local unitHuscarlID = GameInfoTypes["UNIT_JFD_HUSCARL"]
--------------------------------------------------------------------------------------------------------------------------
--  Great Heathen Army
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDAngloSaxonsVikingInvasion = {}
	Event_JFDAngloSaxonsVikingInvasion.Name = "TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY"
	Event_JFDAngloSaxonsVikingInvasion.Desc = "TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY_DESC"
	Event_JFDAngloSaxonsVikingInvasion.Weight = 10
	Event_JFDAngloSaxonsVikingInvasion.CanFunc = (
		function(player)			
			if load(player, "Event_JFDAngloSaxonsVikingInvasion") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() ~= eraMedievalID		 	then return false end
			return true
		end
		)
	Event_JFDAngloSaxonsVikingInvasion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAngloSaxonsVikingInvasion.Outcomes[1] = {}
	Event_JFDAngloSaxonsVikingInvasion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY_OUTCOME_1"
	Event_JFDAngloSaxonsVikingInvasion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY_OUTCOME_RESULT_1"
	Event_JFDAngloSaxonsVikingInvasion.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDAngloSaxonsVikingInvasion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDAngloSaxonsVikingInvasion.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local barbarianPlayer = Players[63]
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			local plotX = capitalX + JFD_GetRandom(1,3)
			local plotY = capitalY + JFD_GetRandom(1,3)
			barbarianPlayer:InitUnit(unitBerserkerID, plotX, plotY):JumpToNearestValidPlot()
			barbarianPlayer:InitUnit(unitBerserkerID, plotX, plotY):JumpToNearestValidPlot()
			barbarianPlayer:InitUnit(unitBerserkerID, plotX, plotY):JumpToNearestValidPlot()
			player:InitUnit(unitHuscarlID, capitalX, capitalY)
			player:InitUnit(unitHuscarlID, capitalX, capitalY)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ALFRED_GREAT_HEATHEN_ARMY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ALFRED_GREAT_HEATHEN_ARMY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_GREAT_HEATHEN_ARMY")) 
			save(player, "Event_JFDAngloSaxonsVikingInvasion", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDAngloSaxonsVikingInvasion", Event_JFDAngloSaxonsVikingInvasion)
--------------------------------------------------------------------------------------------------------------------------
--  Venerable Bede
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDAngloSaxonsBede = {}
	Event_JFDAngloSaxonsBede.Name = "TXT_KEY_EVENT_JFD_ALFRED_BEDE"
	Event_JFDAngloSaxonsBede.Desc = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_DESC"
	Event_JFDAngloSaxonsBede.Weight = 0
	Event_JFDAngloSaxonsBede.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_JFDAngloSaxonsBede.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDAngloSaxonsBede.Outcomes[1] = {}
	Event_JFDAngloSaxonsBede.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_1"
	Event_JFDAngloSaxonsBede.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_1"
	Event_JFDAngloSaxonsBede.Outcomes[1].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(34 * iMod)
			local goldenAgeReward = mathCeil(70 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end

			Event_JFDAngloSaxonsBede.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_1", cultureCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDAngloSaxonsBede.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureCost = mathCeil(34 * iMod)
			local goldenAgeReward = mathCeil(70 * iMod)
			player:ChangeJONSCulture(-cultureCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ALFRED_BEDE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_JFDAngloSaxonsBede.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_GREAT_HEATHEN_ARMY")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDAngloSaxonsBede.Outcomes[2] = {}
	Event_JFDAngloSaxonsBede.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_2"
	Event_JFDAngloSaxonsBede.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_2"
	Event_JFDAngloSaxonsBede.Outcomes[2].CanFunc = (
		function(player)			
			local faithCost = mathCeil(60 * iMod)
			local cultureReward = mathCeil(35 * iMod)
			if player:GetFaith() < faithCost then return false end
			
			Event_JFDAngloSaxonsBede.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_2", faithCost, cultureReward)
			return true
		end
		)
	Event_JFDAngloSaxonsBede.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = mathCeil(60 * iMod)
			local cultureReward = mathCeil(35 * iMod)
			player:ChangeFaith(-faithCost)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ALFRED_BEDE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_JFDAngloSaxonsBede.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_GREAT_HEATHEN_ARMY")) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDAngloSaxonsBede.Outcomes[3] = {}
	Event_JFDAngloSaxonsBede.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_3"
	Event_JFDAngloSaxonsBede.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_3"
	Event_JFDAngloSaxonsBede.Outcomes[3].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			local faithReward = mathCeil(57 * iMod)
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end

			Event_JFDAngloSaxonsBede.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ALFRED_BEDE_OUTCOME_RESULT_3", goldenAgeCost, faithReward)
			return true
		end
		)
	Event_JFDAngloSaxonsBede.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			local faithReward = mathCeil(57 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeFaith(faithReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ALFRED_BEDE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey(Event_JFDAngloSaxonsBede.Name))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_SAXONS_GREAT_HEATHEN_ARMY")) 
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDAngloSaxonsBede", Event_JFDAngloSaxonsBede, 731, true)
--=======================================================================================================================
--=======================================================================================================================


