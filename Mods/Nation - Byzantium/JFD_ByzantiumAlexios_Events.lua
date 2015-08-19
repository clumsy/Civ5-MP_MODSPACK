-- JFD_ByzantiumAlexios_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Alexios) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

-- JFD_SendWorldEvent
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
local civilizationByzantiumAlexiosID = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local eraIndustrialID				 = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID					 = GameInfoTypes["ERA_CLASSICAL"]
--------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Alexios): Tzykanion Tournament
--------------------------------------------------------------------------------------------------------------------------
local Event_ByzantiumAlexiosTzykanionTournament = {}
	Event_ByzantiumAlexiosTzykanionTournament.Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT"
	Event_ByzantiumAlexiosTzykanionTournament.Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_DESC"
	Event_ByzantiumAlexiosTzykanionTournament.Weight = 10
	Event_ByzantiumAlexiosTzykanionTournament.CanFunc = (
		function(player)			
			if load(player, "Event_ByzantiumAlexiosTzykanionTournament") == true then return false end
			if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			if player:GetCurrentEra() >= eraIndustrialID then return false end
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(256 * iMod))		
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			Event_ByzantiumAlexiosTzykanionTournament.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_DESC")
			return true
		end
		)
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1] = {}
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_1"
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_1"
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].Weight = 5
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].CanFunc = (
		function(player)			
			Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2] = {}
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_2"
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_2"
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].Weight = 5
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].CanFunc = (
		function(player)		
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(256 * iMod))		
			Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_2", goldenAgeCost)
			return true
		end
		)
	Event_ByzantiumAlexiosTzykanionTournament.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if GetRandom(1,10) <= 7 then
				local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(256 * iMod))		
				player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT", player:GetName()))
				save(player, "Event_ByzantiumAlexiosTzykanionTournament", true)
			else
				player:GetCapitalCity():ChangeWeLoveTheKingDayTurns(25)
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_TZYKANION_TOURNAMENT"))
			end
		end)
Events_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Event_ByzantiumAlexiosTzykanionTournament", Event_ByzantiumAlexiosTzykanionTournament)
--------------------------------------------------------------------------------------------------------------------------
--  Byzantium (Alexios): The Alexiad
--------------------------------------------------------------------------------------------------------------------------
local techPrintingPressID = GameInfoTypes["TECH_PRINTING_PRESS"]

local Event_ByzantiumAlexiosAlexiad = {}
	Event_ByzantiumAlexiosAlexiad.Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD"
	Event_ByzantiumAlexiosAlexiad.Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_DESC"
	Event_ByzantiumAlexiosAlexiad.Weight = 10
	Event_ByzantiumAlexiosAlexiad.CanFunc = (
		function(player)			
			if load(player, "Event_ByzantiumAlexiosAlexiad") == true then return false end
			if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false end
			if player:GetCurrentEra() >= eraIndustrialID then return false end
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(90 * iMod))		
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			Event_ByzantiumAlexiosAlexiad.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_DESC")			
			return true
		end
		)
	Event_ByzantiumAlexiosAlexiad.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ByzantiumAlexiosAlexiad.Outcomes[1] = {}
	Event_ByzantiumAlexiosAlexiad.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_1"
	Event_ByzantiumAlexiosAlexiad.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_1"
	Event_ByzantiumAlexiosAlexiad.Outcomes[1].Weight = 5
	Event_ByzantiumAlexiosAlexiad.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(130 * iMod))		
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(9 * iMod))		
			Event_ByzantiumAlexiosAlexiad.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_1", goldenAgeCost, influenceReward)
			return true
		end
		)
	Event_ByzantiumAlexiosAlexiad.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local playerTeam = player:GetTeam()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(130 * iMod))		
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(9 * iMod))		
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			for minorID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local minorCiv = Players[minorID]
				local minorCivTeam = minorCiv:GetTeam()
				if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[playerTeam]:IsHasMet(minorCivTeam)) then
					minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD"))
			save(player, "Event_ByzantiumAlexiosAlexiad", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ByzantiumAlexiosAlexiad.Outcomes[2] = {}
	Event_ByzantiumAlexiosAlexiad.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_2"
	Event_ByzantiumAlexiosAlexiad.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_2"
	Event_ByzantiumAlexiosAlexiad.Outcomes[2].Weight = 2
	Event_ByzantiumAlexiosAlexiad.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(90 * iMod))		
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(6 * iMod))		
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20 * iMod))		
			Event_ByzantiumAlexiosAlexiad.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_2", goldenAgeCost, influenceReward, cultureReward)
			return true
		end
		)
	Event_ByzantiumAlexiosAlexiad.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local playerTeam = player:GetTeam()
			local goldenAgeCost = JFD_GetEraAdjustedValue(playerID, mathCeil(90 * iMod))		
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(6 * iMod))		
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20 * iMod))		
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeJONSCulture(cultureReward)
			for minorID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local minorCiv = Players[minorID]
				local minorCivTeam = minorCiv:GetTeam()
				if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[playerTeam]:IsHasMet(minorCivTeam)) then
					minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD"))
			save(player, "Event_ByzantiumAlexiosAlexiad", true)
		end)	
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_ByzantiumAlexiosAlexiad.Outcomes[3] = {}
	Event_ByzantiumAlexiosAlexiad.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_3"
	Event_ByzantiumAlexiosAlexiad.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_3"
	Event_ByzantiumAlexiosAlexiad.Outcomes[3].Weight = 3
	Event_ByzantiumAlexiosAlexiad.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(60 * iMod))
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10 * iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(120 * iMod))
			if player:GetGold() < goldCost then return false end
			if (not Teams[player:GetTeam()]:IsHasTech(techPrintingPressID)) then return false end
			Event_ByzantiumAlexiosAlexiad.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_3", goldCost, influenceCost, goldenAgeReward)
			return true
		end
		)
	Event_ByzantiumAlexiosAlexiad.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local playerTeam = player:GetTeam()
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(60 * iMod))
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(10 * iMod))
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(120 * iMod))
			player:ChangeGold(-goldCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			for minorID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local minorCiv = Players[minorID]
				local minorCivTeam = minorCiv:GetTeam()
				if (minorCiv:IsAlive() and minorCiv:IsMinorCiv() and Teams[playerTeam]:IsHasMet(minorCivTeam)) then
					minorCiv:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BYZANTIUM_ALEXIOS_ALEXIAD", player:GetName(), player:GetCivilizationDescription()))
			save(player, "Event_ByzantiumAlexiosAlexiad", true)
		end)	
Events_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Event_ByzantiumAlexiosAlexiad", Event_ByzantiumAlexiosAlexiad)	
--=======================================================================================================================
--=======================================================================================================================


