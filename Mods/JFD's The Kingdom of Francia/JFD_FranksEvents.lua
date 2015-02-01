-- JFD_FranksEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Franks Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_THE_FRANKS"]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"] 
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local greatWorkLiteratureID = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local mathCeil = math.ceil
local unitSongOfRolandID = GameInfoTypes["UNIT_JFD_SONG_OF_ROLAND"]
local unitCombatSiegeID = GameInfoTypes["UNITCOMBAT_SIEGE"]
local unitDomainID = GameInfoTypes["DOMAIN_LAND"]
local unitMissionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
local unitPromotionLogisticsID = GameInfoTypes["PROMOTION_LOGISTICS"]
--------------------------------------------------------------------------------------------------------------------------
-- Song of Roland
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDFranksSongofRoland = {}
	Event_JFDFranksSongofRoland.Name = "TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND"
	Event_JFDFranksSongofRoland.Desc = "TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND_DESC"
	Event_JFDFranksSongofRoland.Weight = 10
	Event_JFDFranksSongofRoland.CanFunc = (
		function(player)			
			if load(player, "Event_JFDFranksSongofRoland") == true 			then return false end
			if player:GetCivilizationType() ~= civilisationID 					then return false end
			if player:GetCurrentEra() < eraMedievalID 							then return false end
			if not (player:HasAvailableGreatWorkSlot(greatWorkLiteratureID)) 	then return false end

			return true
		end
		)
	Event_JFDFranksSongofRoland.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFranksSongofRoland.Outcomes[1] = {}
	Event_JFDFranksSongofRoland.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND_OUTCOME_1"
	Event_JFDFranksSongofRoland.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND_OUTCOME_RESULT_1"
	Event_JFDFranksSongofRoland.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFDFranksSongofRoland.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDFranksSongofRoland.Outcomes[1].DoFunc = (
		function(player) 
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(unitSongOfRolandID, capitalX, capitalY):PushMission(unitMissionCreateGreatWorkID)
			for unit in player:Units() do
				if unit:GetDomainType() == unitDomainID then
					unit:ChangeExperience(5)
				end
			end
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANKS_SONG_OF_ROLAND_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANKS_SONG_OF_ROLAND"))
			save(player, "Event_JFDFranksSongofRoland", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDFranksSongofRoland", Event_JFDFranksSongofRoland)
--------------------------------------------------------------------------------------------------------------------------
-- New Siege Tactics
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumSiegeUnits(playerID) 
	local player = Players[playerID]
	local numSiegeUnits = 0
	for unit in player:Units() do
		if unit:GetUnitCombatType() == unitCombatSiegeID then
			numSiegeUnits = numSiegeUnits + 1
		end
	end

	return numSiegeUnits
end

local Event_JFDFranksNewSiegeTactics = {}
	Event_JFDFranksNewSiegeTactics.Name = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS"
	Event_JFDFranksNewSiegeTactics.Desc = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_DESC"
	Event_JFDFranksNewSiegeTactics.Weight = 5
	Event_JFDFranksNewSiegeTactics.CanFunc = (
		function(player)			
			Event_JFDFranksNewSiegeTactics.Desc = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_DESC"
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			local numSiegeUnits = JFD_GetNumSiegeUnits(player:GetID())
			local goldCost = mathCeil(numSiegeUnits * 200)
			if player:GetGold() < goldCost then return false end
			
			if player:GetCurrentEra() < eraClassicalID 			then return false end
			if player:GetCurrentEra() > eraRenaissanceID 		then return false end
			if numSiegeUnits == 0 								then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then return false end

			return true
		end
		)
	Event_JFDFranksNewSiegeTactics.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDFranksNewSiegeTactics.Outcomes[1] = {}
	Event_JFDFranksNewSiegeTactics.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_1"
	Event_JFDFranksNewSiegeTactics.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_RESULT_1"
	Event_JFDFranksNewSiegeTactics.Outcomes[1].CanFunc = (
		function(player)		
			Event_JFDFranksNewSiegeTactics.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDFranksNewSiegeTactics.Outcomes[1].DoFunc = (
		function(player) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDFranksNewSiegeTactics.Outcomes[2] = {}
	Event_JFDFranksNewSiegeTactics.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_2"
	Event_JFDFranksNewSiegeTactics.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_RESULT_2"
	Event_JFDFranksNewSiegeTactics.Outcomes[2].CanFunc = (
		function(player)			
			local numSiegeUnits = JFD_GetNumSiegeUnits(player:GetID())
			local goldCost = mathCeil(numSiegeUnits * 200)
			Event_JFDFranksNewSiegeTactics.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFDFranksNewSiegeTactics.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numSiegeUnits = JFD_GetNumSiegeUnits(player:GetID())
			local goldCost = mathCeil(numSiegeUnits * 200)
			player:ChangeGold(-goldCost)
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatSiegeID then
					unit:SetHasPromotion(unitPromotionLogisticsID, true)
				end
			end
			
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS")) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_FRANKS_NEW_SIEGE_TACTICS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_FRANKS_NEW_SIEGE_TACTICS"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDFranksNewSiegeTactics", Event_JFDFranksNewSiegeTactics)
--=======================================================================================================================
--=======================================================================================================================


