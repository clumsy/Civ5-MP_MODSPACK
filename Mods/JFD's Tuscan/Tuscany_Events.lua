-- Tuscan Events
-- Author: Sukritact
--=======================================================================================================================

print("Tuscan Events: loaded")

--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Tuscany: The Pazzi Conspiracy
-------------------------------------------------------------------------------------------------------------------------
local Event_TuscanyPazziConspiracy = {}
    Event_TuscanyPazziConspiracy.Name = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY"
	Event_TuscanyPazziConspiracy.Desc = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_DESC"
	Event_TuscanyPazziConspiracy.Weight = 0
	Event_TuscanyPazziConspiracy.CanFunc = (
		function(pPlayer)
			if math.abs(Game.GetGameTurnYear() - 1478) > 50 then return false end
			return true
		end
		)
	Event_TuscanyPazziConspiracy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TuscanyPazziConspiracy.Outcomes[1] = {}
	Event_TuscanyPazziConspiracy.Outcomes[1].Name = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_1"
	Event_TuscanyPazziConspiracy.Outcomes[1].Desc = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_1_DESC"
	Event_TuscanyPazziConspiracy.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_TuscanyPazziConspiracy.Outcomes[1].DoFunc = (
		function(pPlayer)
			for pCity in pPlayer:Cities() do
				pCity:ChangeWeLoveTheKingDayCounter(20)
				JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY"))
			end
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TuscanyPazziConspiracy.Outcomes[2] = {}
	Event_TuscanyPazziConspiracy.Outcomes[2].Name = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_2"
	Event_TuscanyPazziConspiracy.Outcomes[2].Desc = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_2_DESC"
	Event_TuscanyPazziConspiracy.Outcomes[2].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_TuscanyPazziConspiracy.Outcomes[2].DoFunc = (
		function(pPlayer)
			local pCity = pPlayer:GetCapitalCity()
			InitUnitFromCity(pCity, GameInfoTypes.UNIT_TUSCAN_CONDOTTIERE, 2)
			InitUnitFromCity(pCity, GameInfoTypes.UNIT_GERMAN_LANDSKNECHT, 2)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TuscanyPazziConspiracy.Outcomes[3] = {}
	Event_TuscanyPazziConspiracy.Outcomes[3].Name = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_3"
	Event_TuscanyPazziConspiracy.Outcomes[3].Desc = "TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_3_DESC"
	Event_TuscanyPazziConspiracy.Outcomes[3].CanFunc = (
		function(pPlayer)
			return not(pPlayer:GetCapitalCity():IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE))
		end
		)
	Event_TuscanyPazziConspiracy.Outcomes[3].DoFunc = (
		function(pPlayer)
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_CONSTABLE, 1)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY_OUTCOME_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TUSCANYPAZZICONSPIRACY"))
		end
		)
	
Events_AddCivilisationSpecificScheduled(GameInfoTypes.CIVILIZATION_TUSCANY, "Event_TuscanyPazziConspiracy", Event_TuscanyPazziConspiracy, 1478, true)
-------------------------------------------------------------------------------------------------------------------------
-- The Italian States: Patrons of the Renaissance
-------------------------------------------------------------------------------------------------------------------------
local Event_ItalianStatesPatronage = {}
    Event_ItalianStatesPatronage.Name = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE"
	Event_ItalianStatesPatronage.Desc = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_DESC"
	Event_ItalianStatesPatronage.tValidCivs = 
		{
		["CIVILIZATION_TUSCANY"]			= true,
		["CIVILIZATION_VENICE"]				= true,
		["CIVILIZATION_JFD_PAPAL_STATES"]	= true,
		["CIVILIZATION_JFD_MILAN"]			= true,
		["CIVILIZATION_JFD_GENOA"]			= true,
		["CIVILIZATION_JFD_NAPLES"]			= true,
		}
	Event_ItalianStatesPatronage.Weight = 20
	Event_ItalianStatesPatronage.CanFunc = (
		function(pPlayer)
			if pPlayer:GetCurrentEra() ~= GameInfoTypes.ERA_RENAISSANCE then return false end
			if load(pPlayer, "Event_ItalianStatesPatronage") == true then return false end
			local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			return Event_ItalianStatesPatronage.tValidCivs[sCivType]
		end
		)
	Event_ItalianStatesPatronage.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ItalianStatesPatronage.Outcomes[1] = {}
	Event_ItalianStatesPatronage.Outcomes[1].Name = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_1"
	Event_ItalianStatesPatronage.Outcomes[1].Desc = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_1_DESC"
	Event_ItalianStatesPatronage.Outcomes[1].CanFunc = (
		function(pPlayer)
		
			local iReward = math.ceil(1000 * iMod)
			Event_ItalianStatesPatronage.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_1_DESC", iReward)
			
			return true
		end
		)
	Event_ItalianStatesPatronage.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iReward = math.ceil(1000 * iMod)
			pPlayer:ChangeGold(iReward)
			pPlayer:ChangeGoldenAgeTurns(math.ceil(10 * iGAMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_1_NOTIFICATION", pPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE"))
			save(pPlayer, "Event_ItalianStatesPatronage", true)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ItalianStatesPatronage.Outcomes[2] = {}
	Event_ItalianStatesPatronage.Outcomes[2].Name = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_2"
	Event_ItalianStatesPatronage.Outcomes[2].Desc = "TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_2_DESC"
	Event_ItalianStatesPatronage.Outcomes[2].CanFunc = (
		function(pPlayer)
		
			local iCost = math.ceil(500 * iMod)
			if pPlayer:GetGold() < iCost then return false end
			Event_ItalianStatesPatronage.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_2_DESC", iCost)
			
			return true
		end
		)
	Event_ItalianStatesPatronage.Outcomes[2].DoFunc = (
		function(pPlayer)
			local iCost = math.ceil(500 * iMod)
			
			pPlayer:ChangeGold(-iCost)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_EVENT_ITALIANSTATESPATRONAGE, true)
		
			pPlayer:ChangeGoldenAgeTurns(math.ceil(10 * iGAMod))
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE_OUTCOME_2_NOTIFICATION", pPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_ITALIANSTATESPATRONAGE"))
			save(pPlayer, "Event_ItalianStatesPatronage", true)	
		end
		)
	

for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local slotStatus = PreGame.GetSlotStatus(iSlot)
	if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
		local iCiv = PreGame.GetCivilization(iSlot)
		local sCiv = GameInfo.Civilizations[iCiv].Type
		if Event_ItalianStatesPatronage.tValidCivs[sCiv] then
			tEvents.Event_ItalianStatesPatronage = Event_ItalianStatesPatronage
			break		
		end
	end
end