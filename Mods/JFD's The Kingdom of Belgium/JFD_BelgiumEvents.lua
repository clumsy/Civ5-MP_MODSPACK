-- JFD_BelgiumEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Belgium Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"] 
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local improvementBelgianPlantationID = GameInfoTypes["IMPROVEMENT_JFD_BELGIAN_PLANTATION"]
local improvementPlantationID = GameInfoTypes["IMPROVEMENT_PLANTATION"]
local mathCeil = math.ceil
local unitSongOfRolandID = GameInfoTypes["UNIT_JFD_SONG_OF_ROLAND"]
local unitCombatSiegeID = GameInfoTypes["UNITCOMBAT_SIEGE"]
local unitDomainID = GameInfoTypes["DOMAIN_LAND"]
local unitMissionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
local unitPromotionLogisticsID = GameInfoTypes["PROMOTION_LOGISTICS"]
--------------------------------------------------------------------------------------------------------------------------
--  Linguistic Tensions
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBelgiumLinguisticTensions = {}
	Event_JFDBelgiumLinguisticTensions.Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"
	Event_JFDBelgiumLinguisticTensions.Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_DESC"
	Event_JFDBelgiumLinguisticTensions.Weight = 10
	Event_JFDBelgiumLinguisticTensions.CanFunc = (
		function(player)	
			if load(player, "Event_JFDBelgiumLinguisticTensions") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			local language = {}
				language[1] = "Picard"
				language[2] = "French"
				language[3] = "Walloon"
			language = language[JFD_GetRandom(1,3)]

			Event_JFDBelgiumLinguisticTensions.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_DESC", language)
			if player:GetCurrentEra() < eraMedievalID then return false end
			return true
		end
		)
	Event_JFDBelgiumLinguisticTensions.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBelgiumLinguisticTensions.Outcomes[1] = {}
	Event_JFDBelgiumLinguisticTensions.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_1"
	Event_JFDBelgiumLinguisticTensions.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1"
	Event_JFDBelgiumLinguisticTensions.Outcomes[1].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(50 * iMod)
			Event_JFDBelgiumLinguisticTensions.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1", cultureReward)
			return true
		end
		)
	Event_JFDBelgiumLinguisticTensions.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(50 * iMod)
			player:GetCapitalCity():ChangeResistanceTurns(1)
			player:ChangeJONSCulture(cultureReward)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS")) 
			save(player, "Event_JFDBelgiumLinguisticTensions", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBelgiumLinguisticTensions.Outcomes[2] = {}
	Event_JFDBelgiumLinguisticTensions.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_2"
	Event_JFDBelgiumLinguisticTensions.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2"
	Event_JFDBelgiumLinguisticTensions.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			Event_JFDBelgiumLinguisticTensions.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_JFDBelgiumLinguisticTensions.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 20 / 100)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_LINGUISTIC_TENSIONS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_LINGUISTIC_TENSIONS")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDBelgiumLinguisticTensions", Event_JFDBelgiumLinguisticTensions)
--------------------------------------------------------------------------------------------------------------------------
-- Profitable Year
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBelgiumProfitableYear = {}
	Event_JFDBelgiumProfitableYear.Name = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR"
	Event_JFDBelgiumProfitableYear.Desc = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR_DESC"
	Event_JFDBelgiumProfitableYear.Weight = 5
	Event_JFDBelgiumProfitableYear.CanFunc = (
		function(player)			
			Event_JFDBelgiumProfitableYear.Desc = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR_DESC"
			if player:GetCivilizationType() ~= civilisationID then return false end
			if (player:GetImprovementCount(improvementBelgianPlantationID) == 0 and player:GetImprovementCount(improvementPlantationID) == 0) then return false end
			if player:GetCurrentEra() < eraIndustrialID then return false end

			return true
		end
		)
	Event_JFDBelgiumProfitableYear.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBelgiumProfitableYear.Outcomes[1] = {}
	Event_JFDBelgiumProfitableYear.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR_OUTCOME_1"
	Event_JFDBelgiumProfitableYear.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR_OUTCOME_RESULT_1"
	Event_JFDBelgiumProfitableYear.Outcomes[1].CanFunc = (
		function(player)			
			local improvementCount = (player:GetImprovementCount(improvementBelgianPlantationID) + player:GetImprovementCount(improvementPlantationID))
			local goldReward = mathCeil((improvementCount) * 5)
			Event_JFDBelgiumProfitableYear.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR_OUTCOME_RESULT_1", goldReward)
			return true
		end
		)
	Event_JFDBelgiumProfitableYear.Outcomes[1].DoFunc = (
		function(player) 
			local improvementCount = (player:GetImprovementCount(improvementBelgianPlantationID) + player:GetImprovementCount(improvementPlantationID))
			local goldReward = mathCeil((improvementCount) * 5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_PROFITABLE_YEAR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BELGIUM_PROFITABLE_YEAR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BELGIUM_PROFITABLE_YEAR")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDBelgiumProfitableYear", Event_JFDBelgiumProfitableYear)
--=======================================================================================================================
--=======================================================================================================================


