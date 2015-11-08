-- Peter I Decisions
-- Author: DJSHenninger
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
--  Cultural Gatherings
--------------------------------------------------------------------------------------------------------------------------
local Event_DJSHCulturalGatherings = {}
	Event_DJSHCulturalGatherings.Name = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS"
	Event_DJSHCulturalGatherings.Desc = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_DESC"
	Event_DJSHCulturalGatherings.Weight = 10
	Event_DJSHCulturalGatherings.CanFunc = (
		function(player)			
			if load(player, "Event_DJSHCulturalGatherings") == true then return false end
			if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"] 	then return false end
			if player:GetCurrentEra() ~= GameInfoTypes["ERA_MODERN"]	then return false end
			return true
		end
		)
	Event_DJSHCulturalGatherings.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_DJSHCulturalGatherings.Outcomes[1] = {}
	Event_DJSHCulturalGatherings.Outcomes[1].Name = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_1"
	Event_DJSHCulturalGatherings.Outcomes[1].Desc = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_1"
	Event_DJSHCulturalGatherings.Outcomes[1].CanFunc = (
		function(player)	
			local goldCost = (200 * iMod)	
			local cultureBoost = (400 * iMod)
			if player:GetGold() < goldCost then return false end	
			Event_DJSHCulturalGatherings.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_1", goldCost, cultureBoost)
			return true
		end
		)
	Event_DJSHCulturalGatherings.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = (200 * iMod)	
			local cultureBoost = (400 * iMod)	
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(cultureBoost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_CULTURAL_GATHERINGS")) 
			save(player, "Event_DJSHCulturalGatherings", true)
		end)

	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_DJSHCulturalGatherings.Outcomes[2] = {}
	Event_DJSHCulturalGatherings.Outcomes[2].Name = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_2"
	Event_DJSHCulturalGatherings.Outcomes[2].Desc = "TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_2"
	Event_DJSHCulturalGatherings.Outcomes[2].CanFunc = (
		function(player)	
			local cultureBoost = (250 * iMod)		
			Event_DJSHCulturalGatherings.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_2", cultureBoost)
			return true
		end
		)
	Event_DJSHCulturalGatherings.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureBoost = (250 * iMod)
			player:ChangeJONSCulture(cultureBoost)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_DJSH_CULTURAL_GATHERINGS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DJSH_CULTURAL_GATHERINGS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_CULTURAL_GATHERINGS")) 
			save(player, "Event_DJSHCulturalGatherings", true)
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"], "Event_DJSHCulturalGatherings", Event_DJSHCulturalGatherings, true)