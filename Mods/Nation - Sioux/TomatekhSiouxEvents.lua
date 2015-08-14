--Tomatekh

print("Sioux Events")

--White Buffalo

local bWhiteBuffalo = GameInfoTypes.BUILDING_SIOUX_BISON_DUMMY;

local Event_SiouxWhiteBuffalo = {}
    Event_SiouxWhiteBuffalo.Name = "TXT_KEY_EVENT_SIOUX_WHITE_BUFFALO"
	Event_SiouxWhiteBuffalo.Desc = "TXT_KEY_EVENT_SIOUX_WHITE_BUFFALOT_DESC"
	Event_SiouxWhiteBuffalo.tValidCivs = 
		{
		["CIVILIZATION_SIOUX_MOD"]		= true,
		["CIVILIZATION_BLACKFOOTFIRSTNATION"]		= true,
		["CIVILIZATION_SHOSHONE"]		= true,
		["CIVILIZATION_THECREEFIRSTNATION"]		= true,
		}
	Event_SiouxWhiteBuffalo.Weight = 5
	Event_SiouxWhiteBuffalo.CanFunc = (
		function(pPlayer)
			if load(pPlayer, "Event_SiouxWhiteBuffalo") == true then return false end
			Event_SiouxWhiteBuffalo.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SIOUX_WHITE_BUFFALOT_DESC")
			local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			return Event_SiouxWhiteBuffalo.tValidCivs[sCivType]
		end
		)

	Event_SiouxWhiteBuffalo.Outcomes = {}
	Event_SiouxWhiteBuffalo.Outcomes[1] = {}
	Event_SiouxWhiteBuffalo.Outcomes[1].Name = "TXT_KEY_EVENT_SIOUX_WHITE_BUFFALO_OUTCOME_1"
	Event_SiouxWhiteBuffalo.Outcomes[1].Desc = "TXT_KEY_EVENT_SIOUX_WHITE_BUFFALO_OUTCOME_1_DESC"
	Event_SiouxWhiteBuffalo.Outcomes[1].Weight = 10
	Event_SiouxWhiteBuffalo.Outcomes[1].CanFunc = (
		function(pPlayer)

			Event_SiouxWhiteBuffalo.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SIOUX_WHITE_BUFFALO_OUTCOME_1_DESC")

			return true
		end
		)
	Event_SiouxWhiteBuffalo.Outcomes[1].DoFunc = (
		function(pPlayer)

			for pCity in pPlayer:Cities() do
				if not (pCity:IsHasBuilding(bWhiteBuffalo)) then
					pCity:SetNumRealBuilding(bWhiteBuffalo, 1);
				end
			end

			save(pPlayer, "Event_SiouxWhiteBuffalo", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_SIOUX_WHITE_BUFFALO_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_SiouxWhiteBuffalo.Name))
			Events.GameplayAlertMessage("A white buffalo calf has been spotted by the " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjective()) .. "!")

		end
		)

for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local slotStatus = PreGame.GetSlotStatus(iSlot)
	if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
		local iCiv = PreGame.GetCivilization(iSlot)
		local sCiv = GameInfo.Civilizations[iCiv].Type
		if Event_SiouxWhiteBuffalo.tValidCivs[sCiv] then
			tEvents.Event_SiouxWhiteBuffalo = Event_SiouxWhiteBuffalo
			break
		end
	end
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then

		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) or (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION) or (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SHOSHONE) or (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION) then
			if load(pPlayer, "Event_SiouxWhiteBuffalo") == true then

				for pCity in pPlayer:Cities() do
					if not (pCity:IsHasBuilding(bWhiteBuffalo)) then
						pCity:SetNumRealBuilding(bWhiteBuffalo, 1);
					end
				end

			end
		end

	end
end)