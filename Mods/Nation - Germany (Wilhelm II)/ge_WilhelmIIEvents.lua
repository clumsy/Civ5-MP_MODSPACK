local civilisationID = GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"]

local Event_GEGermanyDisastrousSpeech = {}
	Event_GEGermanyDisastrousSpeech.Name = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH"
	Event_GEGermanyDisastrousSpeech.Desc = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_DESC"
	Event_GEGermanyDisastrousSpeech.Weight = 10
	Event_GEGermanyDisastrousSpeech.CanFunc = (
		function(player)			
			if load(player, "Event_GEGermanyDisastrousSpeech") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_GEGermanyDisastrousSpeech.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_GEGermanyDisastrousSpeech.Outcomes[1] = {}
	Event_GEGermanyDisastrousSpeech.Outcomes[1].Name = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_1"
	Event_GEGermanyDisastrousSpeech.Outcomes[1].Desc = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_1"
	Event_GEGermanyDisastrousSpeech.Outcomes[1].CanFunc = (
		function(player)			
			Event_GEGermanyDisastrousSpeech.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_GEGermanyDisastrousSpeech.Outcomes[1].DoFunc = (
		function(player) 
			player:ChangeAnarchyNumTurns(3)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_NOTIFICATION"))
			save(player, "Event_GEGermanyDisastrousSpeech", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_GEGermanyDisastrousSpeech.Outcomes[2] = {}
	Event_GEGermanyDisastrousSpeech.Outcomes[2].Name = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_2"
	Event_GEGermanyDisastrousSpeech.Outcomes[2].Desc = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_2"
	Event_GEGermanyDisastrousSpeech.Outcomes[2].CanFunc = (
		function(player)			
			Event_GEGermanyDisastrousSpeech.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_GEGermanyDisastrousSpeech.Outcomes[2].DoFunc = (
		function(player) 
			player:GetCapitalCity():ChangeResistanceTurns(5)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_NOTIFICATION"))
			save(player, "Event_GEGermanyDisastrousSpeech", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_GEGermanyDisastrousSpeech.Outcomes[3] = {}
	Event_GEGermanyDisastrousSpeech.Outcomes[3].Name = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_3"
	Event_GEGermanyDisastrousSpeech.Outcomes[3].Desc = "TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_3"
	Event_GEGermanyDisastrousSpeech.Data1 = {}
	Event_GEGermanyDisastrousSpeech.Data2 = {}
	Event_GEGermanyDisastrousSpeech.Outcomes[3].CanFunc = (
		function(player)			
			Event_GEGermanyDisastrousSpeech.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[player:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_GEGermanyDisastrousSpeech.Data1, pCS)
				end
			end
			if #Event_GEGermanyDisastrousSpeech.Data1 < 1 then return false end
			Event_GEGermanyDisastrousSpeech.Data2 = Event_GEGermanyDisastrousSpeech.Data1[GetRandom(1, #Event_GEGermanyDisastrousSpeech.Data1)]
			Event_GEGermanyDisastrousSpeech.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_3", Event_GEGermanyDisastrousSpeech.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_GEGermanyDisastrousSpeech.Outcomes[3].DoFunc = (
		function(player) 
			Event_GEGermanyDisastrousSpeech.Data2:ChangeMinorCivFriendshipWithMajor(player:GetID(), -200)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_OUTCOME_RESULT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_GE_DISASTROUS_SPEECH_NOTIFICATION"))
			save(player, "Event_GEGermanyDisastrousSpeech", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_GEGermanyDisastrousSpeech", Event_GEGermanyDisastrousSpeech)