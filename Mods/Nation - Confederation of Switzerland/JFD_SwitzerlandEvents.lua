-- JFD_SwitzerlandEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Switzerland Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
local unitPromotionExtraSight1ID = GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"]
local zurich = nil
--------------------------------------------------------------------------------------------------------------------------
-- Promising Student
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDSwitzerlandPromisingStudent = {}
	Event_JFDSwitzerlandPromisingStudent.Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"
	Event_JFDSwitzerlandPromisingStudent.Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_DESC"
	Event_JFDSwitzerlandPromisingStudent.Weight = 5
	Event_JFDSwitzerlandPromisingStudent.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraRenaissanceID 		then return false end

			return true
		end
		)
	Event_JFDSwitzerlandPromisingStudent.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDSwitzerlandPromisingStudent.Outcomes[1] = {}
	Event_JFDSwitzerlandPromisingStudent.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_1"
	Event_JFDSwitzerlandPromisingStudent.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1"
	Event_JFDSwitzerlandPromisingStudent.Outcomes[1].CanFunc = (
		function(player)			
			Event_JFDSwitzerlandPromisingStudent.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDSwitzerlandPromisingStudent.Outcomes[1].DoFunc = (
		function(player) 
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					unit:ChangeExperience(5)
				end
			end
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDSwitzerlandPromisingStudent.Outcomes[2] = {}
	Event_JFDSwitzerlandPromisingStudent.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_2"
	Event_JFDSwitzerlandPromisingStudent.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2"
	Event_JFDSwitzerlandPromisingStudent.Outcomes[2].CanFunc = (
		function(player)			
			Event_JFDSwitzerlandPromisingStudent.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDSwitzerlandPromisingStudent.Outcomes[2].DoFunc = (
		function(player) 
			for unit in player:Units() do
				if unit:IsCombatUnit() then
					unit:SetHasPromotion(unitPromotionExtraSight1ID, true)
				end
			end

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_PROMISING_STUDENT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_PROMISING_STUDENT"))
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"], "Event_JFDSwitzerlandPromisingStudent", Event_JFDSwitzerlandPromisingStudent)
--------------------------------------------------------------------------------------------------------------------------
-- Zuriputsch
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDZuriputsch = {}
	Event_JFDZuriputsch.Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH"
	Event_JFDZuriputsch.Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_DESC"
	Event_JFDZuriputsch.Weight = 5
	Event_JFDZuriputsch.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraRenaissanceID 		then return false end
	
			for city in player:Cities() do
				if city:GetNameKey() == "TXT_KEY_CITY_NAME_JFD_ZURICH" then
					zurich = city
				end
			end
			if zurich == nil then return false end

			return true
		end
		)
	Event_JFDZuriputsch.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDZuriputsch.Outcomes[1] = {}
	Event_JFDZuriputsch.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_1"
	Event_JFDZuriputsch.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_1"
	Event_JFDZuriputsch.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDZuriputsch.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDZuriputsch.Outcomes[1].DoFunc = (
		function(player) 
			zurich:ChangeResistanceTurns(2)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDZuriputsch.Outcomes[2] = {}
	Event_JFDZuriputsch.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_2"
	Event_JFDZuriputsch.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_2"
	Event_JFDZuriputsch.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDZuriputsch.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDZuriputsch.Outcomes[2].DoFunc = (
		function(player) 
			player:GetCapitalCity():ChangeResistanceTurns(1)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDZuriputsch.Outcomes[3] = {}
	Event_JFDZuriputsch.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_3"
	Event_JFDZuriputsch.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_3"
	Event_JFDZuriputsch.Outcomes[3].CanFunc = (
		function(player)	
			local goldCost = mathCeil(278 * iMod)
			Event_JFDZuriputsch.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_3", goldCost)
			if player:GetGold() < goldCost then return false end

			return true
		end
		)
	Event_JFDZuriputsch.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(278 * iMod)
			player:ChangeGold(-goldCost)
			
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SWITZERLAND_ZURIPUTSCH")) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SWITZERLAND_ZURIPUTSCH_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SWITZERLAND_ZURIPUTSCH"))
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"], "Event_JFDZuriputsch", Event_JFDZuriputsch)
--=======================================================================================================================
--=======================================================================================================================


