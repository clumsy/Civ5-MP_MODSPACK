local civilisationID = GameInfoTypes["CIVILIZATION_TCM_SONG"]

function tcmGetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local Event_TCMSongReformists = {}
	Event_TCMSongReformists.Name = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS"
	Event_TCMSongReformists.Desc = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS_DESC"
	Event_TCMSongReformists.Weight = 6
	Event_TCMSongReformists.CanFunc = (
		function(player)			
			if load(player, "Event_TCMSongReformists") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_TCMSongReformists.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCMSongReformists.Outcomes[1] = {}
	Event_TCMSongReformists.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_1"
	Event_TCMSongReformists.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_1"
	Event_TCMSongReformists.Outcomes[1].CanFunc = (
		function(player)
			local culture = player:GetNextPolicyCost() / 2
			Event_TCMSongReformists.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_1", culture)
			return true
		end
		)
	Event_TCMSongReformists.Outcomes[1].DoFunc = (
		function(player) 
			player:ChangeNumResourceTotal(iMagistrate, 1)
			local culture = player:GetNextPolicyCost() / 2
			local randomValue = tcmGetRandom(1,2)
			if randomValue == 1 then
				player:ChangeJONSCulture(culture)
			else
				local currentCulture = player:GetJONSCulture()
				local cultureToChange = currentCulture - culture
				if cultureToChange < 0 then
					cultureToChange = 0
				end
				player:SetJONSCulture(cultureToChange)
			end
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_NOTIFICATION_1"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_NOTIFICATION"))
			save(player, "Event_TCMSongReformists", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCMSongReformists.Outcomes[2] = {}
	Event_TCMSongReformists.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_2"
	Event_TCMSongReformists.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_2"
	Event_TCMSongReformists.Outcomes[2].CanFunc = (
		function(player)
			Event_TCMSongReformists.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_TCMSongReformists.Outcomes[2].DoFunc = (
		function(player) 
			player:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_OUTCOME_RESULT_NOTIFICATION_2"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_SONG_REFORMISTS_NOTIFICATION"))
			save(player, "Event_TCMSongReformists", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_TCMSongReformists", Event_TCMSongReformists)