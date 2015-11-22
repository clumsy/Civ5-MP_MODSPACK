-- JFD_ItalyEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Italy Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"]
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local playerBarbarian = Players[63] 
--------------------------------------------------------------------------------------------------------------------------
--  Divided Military
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDJapanTojoDividedMilitary = {}
	Event_JFDJapanTojoDividedMilitary.Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"
	Event_JFDJapanTojoDividedMilitary.Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_DESC"
	Event_JFDJapanTojoDividedMilitary.Weight = 5
	Event_JFDJapanTojoDividedMilitary.CanFunc = (
		function(player)			
			if load(player, "Event_JFDJapanTojoDividedMilitary") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			if player:GetCurrentEra() < eraMedievalID 						then return false end
			if not (player:GetCapitalCity():GetGarrisonedUnit())			then return false end

			return true
		end
		)
	Event_JFDJapanTojoDividedMilitary.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDJapanTojoDividedMilitary.Outcomes[1] = {}
	Event_JFDJapanTojoDividedMilitary.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_1"
	Event_JFDJapanTojoDividedMilitary.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_1"
	Event_JFDJapanTojoDividedMilitary.Outcomes[1].CanFunc = (
		function(player)		
			if not (player:GetCapitalCity():GetGarrisonedUnit()) then return false end
			Event_JFDJapanTojoDividedMilitary.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDJapanTojoDividedMilitary.Outcomes[1].DoFunc = (
		function(player)
			local playerID = player:GetID()
			player:GetCapitalCity():GetGarrisonedUnit():Kill(false, -1)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDJapanTojoDividedMilitary.Outcomes[2] = {}
	Event_JFDJapanTojoDividedMilitary.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_2"
	Event_JFDJapanTojoDividedMilitary.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_2"
	Event_JFDJapanTojoDividedMilitary.Outcomes[2].CanFunc = (
		function(player)	
			local numMilitaryUnits = player:GetNumMilitaryUnits()
			local goldCost = mathCeil(25 * numMilitaryUnits * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDJapanTojoDividedMilitary.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFDJapanTojoDividedMilitary.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numMilitaryUnits = player:GetNumMilitaryUnits()
			local goldCost = mathCeil(25 * numMilitaryUnits * iMod)
			player:ChangeGold(-goldCost)
			for unit in player:Units() do
				if (unit:GetDomainType() == domainLandID and unit:IsCombatUnit()) then
					unit:ChangeExperience(5)
				end
			end
			
			if JFD_GetRandom(1,100) <= 20 then
				local capitalX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,3)
				local capitalY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,3)
				
				local unitToSpawn = GetStrongestMilitaryUnit(playerBarbarian, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				local unitOne = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				local unitTwo = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				local unitThree = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				unitOne:SetName("Rebel")
				unitTwo:SetName("Rebel")
				unitThree:SetName("Rebel")
				unitOne:JumpToNearestValidPlot()
				unitTwo:JumpToNearestValidPlot()
				unitThree:JumpToNearestValidPlot()

				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDJapanTojoDividedMilitary.Outcomes[3] = {}
	Event_JFDJapanTojoDividedMilitary.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_3"
	Event_JFDJapanTojoDividedMilitary.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_3"
	Event_JFDJapanTojoDividedMilitary.Outcomes[3].CanFunc = (
		function(player)	
			local goldCost = mathCeil(120 + player:GetNextPolicyCost() * iMod)
			if player:GetGold() < goldCost then return false end
			
			Event_JFDJapanTojoDividedMilitary.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFDJapanTojoDividedMilitary.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(120 + player:GetNextPolicyCost() * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeNumFreePolicies(1)
			
			if JFD_GetRandom(1,100) <= 40 then
				local capitalX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,3)
				local capitalY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,3)
				
				local unitToSpawn = GetStrongestMilitaryUnit(playerBarbarian, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				local unitOne = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				local unitTwo = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				local unitThree = playerBarbarian:InitUnit(unitToSpawn, capitalX, capitalY)
				unitOne:SetName("Rebel")
				unitTwo:SetName("Rebel")
				unitThree:SetName("Rebel")
				unitOne:JumpToNearestValidPlot()
				unitTwo:JumpToNearestValidPlot()
				unitThree:JumpToNearestValidPlot()

				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_3_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_DIVIDED_MILITARY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_JAPAN_TOJO_DIVIDED_MILITARY"))
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDJapanTojoDividedMilitary", Event_JFDJapanTojoDividedMilitary)
--------------------------------------------------------------------------------------------------------------------------
-- Emperor's Summons
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDJapanTojoEmperorsSummons = {}
	Event_JFDJapanTojoEmperorsSummons.Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS"
	Event_JFDJapanTojoEmperorsSummons.Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_DESC"
	Event_JFDJapanTojoEmperorsSummons.Weight = 2
	Event_JFDJapanTojoEmperorsSummons.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			Event_JFDJapanTojoEmperorsSummons.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_DESC")
			return true
		end
		)
	Event_JFDJapanTojoEmperorsSummons.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDJapanTojoEmperorsSummons.Outcomes[1] = {}
	Event_JFDJapanTojoEmperorsSummons.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_OUTCOME_1"
	Event_JFDJapanTojoEmperorsSummons.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_OUTCOME_RESULT_1"
	Event_JFDJapanTojoEmperorsSummons.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDJapanTojoEmperorsSummons.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDJapanTojoEmperorsSummons.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:ChangeGoldenAgeTurns(12)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_JAPAN_TOJO_EMPERORS_SUMMONS_1"))
		end)
		
Events_AddCivilisationSpecific(civilisationID, "Event_JFDJapanTojoEmperorsSummons", Event_JFDJapanTojoEmperorsSummons)
--=======================================================================================================================
--=======================================================================================================================


