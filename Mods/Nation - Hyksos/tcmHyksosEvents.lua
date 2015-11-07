local civilisationID = GameInfoTypes["CIVILIZATION_TCM_HYKSOS"]

function tcmGetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local Event_TCMHyksosSet = {}
	Event_TCMHyksosSet.Name = "TXT_KEY_EVENT_TCM_HYKSOS_SET"
	Event_TCMHyksosSet.Desc = "TXT_KEY_EVENT_TCM_HYKSOS_SET_DESC"
	Event_TCMHyksosSet.Weight = 5
	Event_TCMHyksosSet.CanFunc = (
		function(player)			
			if load(player, "Event_TCMHyksosSet") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end

			local maxCities = player:GetNumCities()
			local randomCity = tcmGetRandom(1,maxCities)
			Event_TCMHyksosSet.Data1 = nil
			for city in player:Cities() do
				if randomCity <= 1 then
					Event_TCMHyksosSet.Data1 = city
					break
				else
					randomCity = randomCity - 1
				end
			end

			if (Event_TCMHyksosSet.Data1 == nil) then return false end

			Event_TCMHyksosSet.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_DESC", Event_TCMHyksosSet.Data1:GetName())

			return true
		end
		)
	Event_TCMHyksosSet.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCMHyksosSet.Outcomes[1] = {}
	Event_TCMHyksosSet.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_1"
	Event_TCMHyksosSet.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_1"
	Event_TCMHyksosSet.Outcomes[1].CanFunc = (
		function(player, city)
			local faithGained = math.ceil(25 * iMod * (player:GetCurrentEra() + 1))
			Event_TCMHyksosSet.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_1", faithGained, city:GetName())
			return true
		end
		)
	Event_TCMHyksosSet.Outcomes[1].DoFunc = (
		function(player, city)
			local faithGained = math.ceil(25 * iMod * (player:GetCurrentEra() + 1))
			player:ChangeFaith(faithGained)
			city:ChangeResistanceTurns(3)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_NOTIFICATION_1"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_NOTIFICATION"))
			save(player, "Event_TCMHyksosSet", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCMHyksosSet.Outcomes[2] = {}
	Event_TCMHyksosSet.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_2"
	Event_TCMHyksosSet.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_2"
	Event_TCMHyksosSet.Outcomes[2].CanFunc = (
		function(player, city)
			local faithGained = math.ceil(25 * iMod * (player:GetCurrentEra() + 1))
			Event_TCMHyksosSet.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_2", faithGained, city:GetName())
			return true
		end
		)
	Event_TCMHyksosSet.Outcomes[2].DoFunc = (
		function(player, city)
			local faithGained = math.ceil(25 * iMod * (player:GetCurrentEra() + 1))
			player:ChangeFaith(faithGained)
			local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			local unitOne = Players[63]:InitUnit(unitID, city:GetX() + 1, city:GetY() + 1):JumpToNearestValidPlot() 
			local unitTwo = Players[63]:InitUnit(unitID, city:GetX() + 1, city:GetY() + 1):JumpToNearestValidPlot() 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_NOTIFICATION_2"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_NOTIFICATION"))
			save(player, "Event_TCMHyksosSet", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TCMHyksosSet.Outcomes[3] = {}
	Event_TCMHyksosSet.Outcomes[3].Name = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_3"
	Event_TCMHyksosSet.Outcomes[3].Desc = "TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_3"
	Event_TCMHyksosSet.Outcomes[3].CanFunc = (
		function(player, city)
			local faithLost = math.ceil(30 * iMod * (player:GetCurrentEra() + 1))
			Event_TCMHyksosSet.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_3", city:GetName(), faithLost)
			if (player:GetFaith() < faithLost) then return false end
			return true
		end
		)
	Event_TCMHyksosSet.Outcomes[3].DoFunc = (
		function(player, city)
			local faithLost = math.ceil(30 * iMod * (player:GetCurrentEra() + 1))
			player:ChangeFaith(-faithLost)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TEMPLE"], 1)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_OUTCOME_RESULT_NOTIFICATION_3"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_HYKSOS_SET_NOTIFICATION"))
			save(player, "Event_TCMHyksosSet", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_TCMHyksosSet", Event_TCMHyksosSet)