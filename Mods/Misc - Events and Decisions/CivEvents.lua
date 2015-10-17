-- Core Events
-- Author: Sukritact
--=======================================================================================================================

print("Civ Events: loaded")

--=======================================================================================================================
-- General Events
--=======================================================================================================================
-- White Elephant Found
--------------------------------------------------------------------------------------------------------------------------
local Event_WhiteElephant = {}
    Event_WhiteElephant.Name = "TXT_KEY_EVENT_WHITEELEPHANT"
	Event_WhiteElephant.Desc = "TXT_KEY_EVENT_WHITEELEPHANT_DESC"
	Event_WhiteElephant.tValidCivs = 
		{
		["CIVILIZATION_SIAM"]		= true,
		["CIVILIZATION_BURMA"]		= true,
		["CIVILIZATION_KHMER"]		= true,
		["CIVILIZATION_CHAMPA_MOD"]	= true,
		}
	Event_WhiteElephant.Weight = 5
	Event_WhiteElephant.CanFunc = (
		function(pPlayer)
			local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			return Event_WhiteElephant.tValidCivs[sCivType]
		end
		)
	Event_WhiteElephant.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_WhiteElephant.Outcomes[1] = {}
	Event_WhiteElephant.Outcomes[1].Name = "TXT_KEY_EVENT_WHITEELEPHANT_OUTCOME_1"
	Event_WhiteElephant.Outcomes[1].Desc = "TXT_KEY_EVENT_WHITEELEPHANT_OUTCOME_1_DESC"
	Event_WhiteElephant.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iDelta1 = math.ceil(100 * iMod)
			local iDelta2 = math.ceil(75 * iMod)
			Event_WhiteElephant.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_WHITEELEPHANT_OUTCOME_1_DESC", iDelta1, iDelta2)
			return true
		end
		)
	Event_WhiteElephant.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iDelta1 = math.ceil(100 * iMod)
			local iDelta2 = math.ceil(75 * iMod)
			pPlayer:ChangeGoldenAgeProgressMeter(iDelta1)
			pPlayer:ChangeJONSCulture(iDelta2)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_WHITEELEPHANT_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_WhiteElephant.Name))
		end
		)

for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local slotStatus = PreGame.GetSlotStatus(iSlot)
	if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
		local iCiv = PreGame.GetCivilization(iSlot)
		local sCiv = GameInfo.Civilizations[iCiv].Type
		if Event_WhiteElephant.tValidCivs[sCiv] then
			tEvents.Event_WhiteElephant = Event_WhiteElephant
			break
		end
	end
end
--=======================================================================================================================
--=======================================================================================================================