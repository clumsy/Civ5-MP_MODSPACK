-- JFD_RussiaNicholasIIEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Peter) Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PETRINE_RUSSIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local playerBarbarianID = Players[63]
local policyGrandEmbassy1ID = GameInfoTypes["POLICY_JFD_GRAND_EMBASSY_1"]
local policyGrandEmbassy2ID = GameInfoTypes["POLICY_JFD_GRAND_EMBASSY_2"]
local policyGrandEmbassy3ID = GameInfoTypes["POLICY_JFD_GRAND_EMBASSY_3"]
local unitCossackID = GameInfoTypes["UNIT_RUSSIAN_COSSACK"]
--------------------------------------------------------------------------------------------------------------------------
--  The Grand Embassy
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDRussiaGrandEmbassy = {}
	Event_JFDRussiaGrandEmbassy.Name = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY"
	Event_JFDRussiaGrandEmbassy.Desc = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_DESC"
	Event_JFDRussiaGrandEmbassy.Weight = 10
	Event_JFDRussiaGrandEmbassy.CanFunc = (
		function(player)			
			if load(player, "Event_JFDRussiaGrandEmbassy") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 		then return false end
			if player:GetCurrentEra() < eraRenaissanceID			then return false end
			
			
			return true
		end
		)
	Event_JFDRussiaGrandEmbassy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDRussiaGrandEmbassy.Outcomes[1] = {}
	Event_JFDRussiaGrandEmbassy.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_1"
	Event_JFDRussiaGrandEmbassy.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1"
	Event_JFDRussiaGrandEmbassy.Outcomes[1].Weight = 5
	Event_JFDRussiaGrandEmbassy.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDRussiaGrandEmbassy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDRussiaGrandEmbassy.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy1ID, true)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_GRAND_EMBASSY")) 
			save(player, "Event_JFDRussiaGrandEmbassy", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDRussiaGrandEmbassy.Outcomes[2] = {}
	Event_JFDRussiaGrandEmbassy.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_2"
	Event_JFDRussiaGrandEmbassy.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2"
	Event_JFDRussiaGrandEmbassy.Outcomes[2].Weight = 5
	Event_JFDRussiaGrandEmbassy.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDRussiaGrandEmbassy.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDRussiaGrandEmbassy.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy2ID, true)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_GRAND_EMBASSY")) 
			save(player, "Event_JFDRussiaGrandEmbassy", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDRussiaGrandEmbassy.Outcomes[3] = {}
	Event_JFDRussiaGrandEmbassy.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_3"
	Event_JFDRussiaGrandEmbassy.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3"
	Event_JFDRussiaGrandEmbassy.Outcomes[3].Weight = 5
	Event_JFDRussiaGrandEmbassy.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDRussiaGrandEmbassy.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDRussiaGrandEmbassy.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyGrandEmbassy3ID, true)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PETER_GRAND_EMBASSY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_GRAND_EMBASSY")) 
			save(player, "Event_JFDRussiaGrandEmbassy", true)	
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDRussiaGrandEmbassy", Event_JFDRussiaGrandEmbassy)
--------------------------------------------------------------------------------------------------------------------------
--  The Bulavin Rebellion
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDRussiaBulavinRebellion = {}
	Event_JFDRussiaBulavinRebellion.Name = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION"
	Event_JFDRussiaBulavinRebellion.Desc = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_DESC"
	Event_JFDRussiaBulavinRebellion.Weight = 0
	Event_JFDRussiaBulavinRebellion.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end			
			return true
		end
		)
	Event_JFDRussiaBulavinRebellion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDRussiaBulavinRebellion.Outcomes[1] = {}
	Event_JFDRussiaBulavinRebellion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_1"
	Event_JFDRussiaBulavinRebellion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1"
	Event_JFDRussiaBulavinRebellion.Outcomes[1].Weight = 5
	Event_JFDRussiaBulavinRebellion.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDRussiaBulavinRebellion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDRussiaBulavinRebellion.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local plotX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,3)
			local plotY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,3)
			playerBarbarianID:InitUnit(unitCossackID, plotX, plotY):JumpToNearestValidPlot()
			playerBarbarianID:InitUnit(unitCossackID, plotX, plotY):JumpToNearestValidPlot()
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_BULAVIN_REBELLION"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDRussiaBulavinRebellion.Outcomes[2] = {}
	Event_JFDRussiaBulavinRebellion.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_2"
	Event_JFDRussiaBulavinRebellion.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2"
	Event_JFDRussiaBulavinRebellion.Outcomes[2].Weight = 1
	Event_JFDRussiaBulavinRebellion.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(230 * iMod)
			local cultureCost = mathCeil(120 * iMod)
			Event_JFDRussiaBulavinRebellion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2", goldCost, cultureCost)
			return true
		end
		)
	Event_JFDRussiaBulavinRebellion.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(230 * iMod)
			local cultureCost = mathCeil(120 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(-cultureCost)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_PETER_BULAVIN_REBELLION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_PETER_BULAVIN_REBELLION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PETER_BULAVIN_REBELLION"))
		end)
	
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDRussiaBulavinRebellion", Event_JFDRussiaBulavinRebellion, 1707, true)
--=======================================================================================================================
--=======================================================================================================================


