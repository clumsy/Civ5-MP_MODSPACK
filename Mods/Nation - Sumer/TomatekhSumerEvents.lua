--Tomatekh

print("Sumer Events")

--Abgal Sages

local uScientist = GameInfo.Units.UNIT_SCIENTIST.ID ;
local uEngineer = GameInfo.Units.UNIT_ENGINEER.ID;
local uMerchant = GameInfo.Units.UNIT_MERCHANT.ID;
local uGeneral = GameInfo.Units.UNIT_GREAT_GENERAL.ID;

function SumGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local Event_TomatekhMesoSages = {}
    Event_TomatekhMesoSages.Name = "TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES"
	Event_TomatekhMesoSages.Desc = "TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_DESC"
	Event_TomatekhMesoSages.tValidCivs = 
		{
		["CIVILIZATION_AKKADIAN_MOD"]		= true,
		["CIVILIZATION_BABYLON"]		= true,
		["CIVILIZATION_ASSYRIA"]		= true,
		["CIVILIZATION_LITE_AKKAD"]		= true,
		}
	Event_TomatekhMesoSages.Weight = 5
	Event_TomatekhMesoSages.CanFunc = (
		function(pPlayer)

			if load(pPlayer, "Event_TomatekhMesoSages") == true then return false end

			--if not ((pPlayer:GetReligionCreatedByPlayer() > 0) or (pPlayer:GetCapitalCity():GetReligiousMajority() > 0)) then return false end
            local religionID = pPlayer:GetReligionCreatedByPlayer()
            if religionID <= 0 then 
				if (pPlayer:GetNumCities() >= 1) then
					religionID = pPlayer:GetCapitalCity():GetReligiousMajority() 
				end
			end
			if (religionID <= 0) then return false end

			if (Game.GetGameTurnYear() >= 0) then return false end

			Event_TomatekhMesoSages.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_DESC")

			local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			return Event_TomatekhMesoSages.tValidCivs[sCivType]
		end
		)

	Event_TomatekhMesoSages.Outcomes = {}
	Event_TomatekhMesoSages.Outcomes[1] = {}
	Event_TomatekhMesoSages.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_OUTCOME_1"
	Event_TomatekhMesoSages.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_OUTCOME_1_DESC"
	Event_TomatekhMesoSages.Outcomes[1].Weight = 10
	Event_TomatekhMesoSages.Outcomes[1].CanFunc = (
		function(pPlayer)

			Event_TomatekhMesoSages.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_OUTCOME_1_DESC")

			return true
		end
		)
	Event_TomatekhMesoSages.Outcomes[1].DoFunc = (
		function(pPlayer)

			local pcCity = pPlayer:GetCapitalCity();
			local SumRandom = SumGetRandom(1, 4)
			if SumRandom == 1 then
				pUnit = pPlayer:InitUnit(uScientist, pcCity:GetX(), pcCity:GetY(), UNITAI_SCIENTIST);
				pUnit:JumpToNearestValidPlot()
				pUnit:SetName("Utuabzu");
			elseif SumRandom == 2 then
				pUnit = pPlayer:InitUnit(uEngineer, pcCity:GetX(), pcCity:GetY(), UNITAI_ENGINEER);
				pUnit:JumpToNearestValidPlot()
				pUnit:SetName("Uanna");
			elseif SumRandom == 3 then
				pUnit = pPlayer:InitUnit(uMerchant, pcCity:GetX(), pcCity:GetY(), UNITAI_MERCHANT);
				pUnit:JumpToNearestValidPlot()
				pUnit:SetName("An-Enlilda");						
			elseif SumRandom == 4 then
				pUnit = pPlayer:InitUnit(uGeneral, pcCity:GetX(), pcCity:GetY(), UNITAI_GENERAL);
				pUnit:JumpToNearestValidPlot()
				pUnit:SetName("Enmebulugga");												
			end

			save(pPlayer, "Event_TomatekhMesoSages", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MESOPOTAMIAN_SAGES_OUTCOME_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhMesoSages.Name))
			Events.GameplayAlertMessage("A divine sage has visited " .. Locale.ConvertTextKey(pPlayer:GetCivilizationShortDescription()) .. "!")

		end
		)

for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local slotStatus = PreGame.GetSlotStatus(iSlot)
	if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
		local iCiv = PreGame.GetCivilization(iSlot)
		local sCiv = GameInfo.Civilizations[iCiv].Type
		if Event_TomatekhMesoSages.tValidCivs[sCiv] then
			tEvents.Event_TomatekhMesoSages = Event_TomatekhMesoSages
			break
		end
	end
end