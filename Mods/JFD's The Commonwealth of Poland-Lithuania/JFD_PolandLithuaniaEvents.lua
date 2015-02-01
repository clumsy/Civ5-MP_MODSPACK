-- JFD_Poland-LithuaniaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Poland-Lithuania Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_POLAND_LITHUANIA"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local unitScientistID = GameInfoTypes["UNIT_SCIENTIST"]
--------------------------------------------------------------------------------------------------------------------------
--  Alchemist
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPolandLithuaniaAlchemist = {}
	Event_JFDPolandLithuaniaAlchemist.Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST"
	Event_JFDPolandLithuaniaAlchemist.Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_DESC"
	Event_JFDPolandLithuaniaAlchemist.Weight = 10
	Event_JFDPolandLithuaniaAlchemist.CanFunc = (
		function(player)			
			if load(player, "Event_JFDPolandLithuaniaAlchemist") == true 	then return false end
			if player:GetCivilizationType() ~= civilisationID 				then return false end
			if player:GetCurrentEra() < eraMedievalID 		then return false end
			if player:GetCurrentEra() > eraIndustrialID 	then return false end

			return true
		end
		)
	Event_JFDPolandLithuaniaAlchemist.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1] = {}
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_1"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_1"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1].Weight = 5
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1].CanFunc = (
		function(player)		
			local cultureReward = mathCeil(20 * iMod)
			Event_JFDPolandLithuaniaAlchemist.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_1", cultureReward)
			return true
		end
		)
	Event_JFDPolandLithuaniaAlchemist.Outcomes[1].DoFunc = (
		function(player) 
			local cultureReward = mathCeil(20 * iMod)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST"))
			save(player, "Event_JFDPolandLithuaniaAlchemist", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2] = {}
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_2"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_2"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2].Weight = 0
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2].CanFunc = (
		function(player)
			local goldCost = mathCeil(200 * iMod)
			if player:GetGold() < goldCost then return false end
			
			local reward = mathCeil(175 * iMod)
			local yield = "[ICON_PEACE] Faith"
			if JFD_GetRandom(1, 100) <= 50 then
				reward = mathCeil(140 * iMod)
				yield = "[ICON_RESEARCH] Science"
			end

			Event_JFDPolandLithuaniaAlchemist.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_2", goldCost, reward, yield)
			return true
		end
		)
	Event_JFDPolandLithuaniaAlchemist.Outcomes[2].DoFunc = (
		function(player) 
			local goldCost = mathCeil(100 * iMod)
			player:ChangeGold(-goldCost)
			if yield == "[ICON_PEACE] Faith" then
				player:ChangeFaith(reward)
			else
				LuaEvents.Sukritact_ChangeResearchProgress(player:GetID(), reward)
			end

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST"))
			save(player, "Event_JFDPolandLithuaniaAlchemist", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3] = {}
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_3"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_3"
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3].Weight = 0
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3].CanFunc = (
		function(player)
			local goldCost = mathCeil(160 * iMod)
			local goldenAgeReward = mathCeil(255 * iMod)
			if player:GetGold() < goldCost then return false end

			Event_JFDPolandLithuaniaAlchemist.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_3", goldCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDPolandLithuaniaAlchemist.Outcomes[3].DoFunc = (
		function(player) 
			local goldCost = mathCeil(160 * iMod)
			local goldenAgeReward = mathCeil(255 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_LITHUANIA_ALCHEMIST_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_ALCHEMIST"))
			save(player, "Event_JFDPolandLithuaniaAlchemist", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDPolandLithuaniaAlchemist", Event_JFDPolandLithuaniaAlchemist)
--------------------------------------------------------------------------------------------------------------------------
-- Thursday Dinners
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDPolandLithuaniaDinners = {}
	Event_JFDPolandLithuaniaDinners.Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS"
	Event_JFDPolandLithuaniaDinners.Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_DESC"
	Event_JFDPolandLithuaniaDinners.Weight = 10
	Event_JFDPolandLithuaniaDinners.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraMedievalID 			then return false end

			return true
		end
		)
	Event_JFDPolandLithuaniaDinners.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDPolandLithuaniaDinners.Outcomes[1] = {}
	Event_JFDPolandLithuaniaDinners.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_1"
	Event_JFDPolandLithuaniaDinners.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_1"
	Event_JFDPolandLithuaniaDinners.Outcomes[1].CanFunc = (
		function(player)
			local goldCost = mathCeil(100 * iMod)
			local cultureReward = mathCeil(150 * iMod)
			if player:GetGold() < goldCost then return false end

			Event_JFDPolandLithuaniaDinners.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_1", goldCost, cultureReward)
			return true
		end
		)
	Event_JFDPolandLithuaniaDinners.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(100 * iMod)
			local cultureReward = mathCeil(150 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(cultureReward)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLAND_LITHUANIA_DINNERS_1")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDPolandLithuaniaDinners.Outcomes[2] = {}
	Event_JFDPolandLithuaniaDinners.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_2"
	Event_JFDPolandLithuaniaDinners.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_2"
	Event_JFDPolandLithuaniaDinners.Outcomes[2].CanFunc = (
		function(player)		
			local goldCost = mathCeil(200 * iMod)
			local scienceReward = mathCeil(60 * iMod)
			if player:GetGold() < goldCost then return false end

			Event_JFDPolandLithuaniaDinners.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_2", goldCost, scienceReward)
			return true
		end
		)
	Event_JFDPolandLithuaniaDinners.Outcomes[2].DoFunc = (
		function(player) 
			local goldCost = mathCeil(200 * iMod)
			local scienceReward = mathCeil(60 * iMod)
			player:ChangeGold(-goldCost)
			LuaEvents.Sukritact_ChangeResearchProgress(player:GetID(), scienceReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDPolandLithuaniaDinners.Outcomes[3] = {}
	Event_JFDPolandLithuaniaDinners.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_3"
	Event_JFDPolandLithuaniaDinners.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_POLAND_LITHUANIA_DINNERS_OUTCOME_RESULT_3"
	Event_JFDPolandLithuaniaDinners.Outcomes[3].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_JFDPolandLithuaniaDinners.Outcomes[3].DoFunc = (
		function(player) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDPolandLithuaniaDinners", Event_JFDPolandLithuaniaDinners)
--=======================================================================================================================
--=======================================================================================================================


