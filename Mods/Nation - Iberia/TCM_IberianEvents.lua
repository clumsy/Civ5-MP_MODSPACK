-------------------------------------------------------------------------------------------------------------------------
--  Requested Mercenaries
-------------------------------------------------------------------------------------------------------------------------
local Event_IberianRequestedMercenaries = {}
    Event_IberianRequestedMercenaries.Name = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES"
	Event_IberianRequestedMercenaries.Desc = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_DESC"
	Event_IberianRequestedMercenaries.Data1 = {}
	Event_IberianRequestedMercenaries.Data2 = nil
	Event_IberianRequestedMercenaries.Data3 = nil
	Event_IberianRequestedMercenaries.Weight = 7
	Event_IberianRequestedMercenaries.CanFunc = (
		function(pPlayer)
			Event_IberianRequestedMercenaries.Data1 = {}
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"] then return false end
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_IberianRequestedMercenaries.Data1, pCS)
				end
			end
			if #Event_IberianRequestedMercenaries.Data1 < 2 then return false end
			
			Event_IberianRequestedMercenaries.Data2 = Event_IberianRequestedMercenaries.Data1[GetRandom(1, #Event_IberianRequestedMercenaries.Data1)]
			Event_IberianRequestedMercenaries.Data3 = Event_IberianRequestedMercenaries.Data1[GetRandom(1, #Event_IberianRequestedMercenaries.Data1)]

			if Event_IberianRequestedMercenaries.Data2 == Event_IberianRequestedMercenaries.Data3 then return false end
			
			Event_IberianRequestedMercenaries.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_DESC", Event_IberianRequestedMercenaries.Data2:GetCivilizationShortDescription(), Event_IberianRequestedMercenaries.Data3:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IberianRequestedMercenaries.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_IberianRequestedMercenaries.Outcomes[1] = {}
	Event_IberianRequestedMercenaries.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_1"
	Event_IberianRequestedMercenaries.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_1"
	Event_IberianRequestedMercenaries.Outcomes[1].Weight = 1
	Event_IberianRequestedMercenaries.Outcomes[1].CanFunc = (
		function(pPlayer)
			Event_IberianRequestedMercenaries.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_1", Event_IberianRequestedMercenaries.Data2:GetCivilizationShortDescription(), Event_IberianRequestedMercenaries.Data3:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IberianRequestedMercenaries.Outcomes[1].DoFunc = (
		function(pPlayer)
			local newOwner = Event_IberianRequestedMercenaries.Data2
			local capital = newOwner:GetCapitalCity()
			-- first unit
	
			local IberianUnits = {}
			for unit in pPlayer:Units() do	
				if unit:IsCombatUnit() and not(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCOUT"]) then
					local unitID = unit:GetID()
					table.insert(IberianUnits, unitID)
				end
			end
			local oldUnit = IberianUnits[GetRandom(1, #IberianUnits)]

			local unit = pPlayer:GetUnitByID(oldUnit) 

			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_GIFTED_UNIT"], true)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_SOLDIER"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_IBERIAN_GUERRILA"], false)

			local pNewUnit = newOwner:InitUnit(unit:GetUnitType(), capital:GetX(), capital:GetY())
			pNewUnit:Convert(unit);

			Event_IberianRequestedMercenaries.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), 40)
			Event_IberianRequestedMercenaries.Data3:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -15)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_NOTIFICATION"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_IberianRequestedMercenaries.Outcomes[2] = {}
	Event_IberianRequestedMercenaries.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_2"
	Event_IberianRequestedMercenaries.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_2"
	Event_IberianRequestedMercenaries.Outcomes[2].Weight = 5
	Event_IberianRequestedMercenaries.Outcomes[2].CanFunc = (
		function(pPlayer)
			local goldBonus = math.ceil((100) * iMod)
			Event_IberianRequestedMercenaries.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_2", Event_IberianRequestedMercenaries.Data2:GetCivilizationShortDescription(), Event_IberianRequestedMercenaries.Data3:GetCivilizationShortDescription(), goldBonus)
			return true
		end
		)
	Event_IberianRequestedMercenaries.Outcomes[2].DoFunc = (
		function(pPlayer)

			local goldBonus = math.ceil((100) * iMod)
			pPlayer:ChangeGold(goldBonus)

			local newOwner = Event_IberianRequestedMercenaries.Data2
			local capital = newOwner:GetCapitalCity()
			-- first unit
			local IberianUnits = {}
			for unit in pPlayer:Units() do	
				if unit:IsCombatUnit() and not(unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SCOUT"]) then
					local unitID = unit:GetID()
					table.insert(IberianUnits, unitID)
				end
			end
			local oldUnit = IberianUnits[GetRandom(1, #IberianUnits)]

			local unit = pPlayer:GetUnitByID(oldUnit) 

			local pNewUnit = newOwner:InitUnit(unit:GetUnitType(), capital:GetX(), capital:GetY())
			pNewUnit:Convert(unit);
			--
			Event_IberianRequestedMercenaries.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), 30)
			Event_IberianRequestedMercenaries.Data3:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -15)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_NOTIFICATION"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_IberianRequestedMercenaries.Outcomes[3] = {}
	Event_IberianRequestedMercenaries.Outcomes[3].Name = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_3"
	Event_IberianRequestedMercenaries.Outcomes[3].Desc = "TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_3"
	Event_IberianRequestedMercenaries.Outcomes[3].Weight = 3
	Event_IberianRequestedMercenaries.Outcomes[3].CanFunc = (
		function(pPlayer)
			Event_IberianRequestedMercenaries.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_3", Event_IberianRequestedMercenaries.Data2:GetCivilizationShortDescription(), Event_IberianRequestedMercenaries.Data3:GetCivilizationShortDescription())
			return true
		end
		)
	Event_IberianRequestedMercenaries.Outcomes[3].DoFunc = (
		function(pPlayer)
			Event_IberianRequestedMercenaries.Data3:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), 30)
			Event_IberianRequestedMercenaries.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -30)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_IBERIAN_REQUESTED_MERCENARIES_NOTIFICATION"))
		end
		)
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"], "Event_IberianRequestedMercenaries", Event_IberianRequestedMercenaries)