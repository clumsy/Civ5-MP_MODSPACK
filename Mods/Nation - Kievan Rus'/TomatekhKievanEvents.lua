--Tomatekh

print("Kievan Events")

--Golden Horde

local rHorse = GameInfoTypes.RESOURCE_HORSE;
local pQuickStudy = GameInfoTypes.PROMOTION_GAIN_EXPERIENCE;

local MongolID = GameInfoTypes.CIVILIZATION_MONGOL;

local uKhan = GameInfoTypes.UNIT_MONGOLIAN_KHAN;
local uHorseman = GameInfoTypes.UNIT_BARBARIAN_HORSEMAN;
local uKeshik = GameInfoTypes.UNIT_MONGOLIAN_KESHIK;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

function KievGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local Event_TomatekhRusMongolInvasion = {}
	Event_TomatekhRusMongolInvasion.Name = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION"
	Event_TomatekhRusMongolInvasion.Desc = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_DESC"
	Event_TomatekhRusMongolInvasion.Weight = 0
	Event_TomatekhRusMongolInvasion.CanFunc = (
		function(pPlayer)		
				
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"] then return false end

			if load(pPlayer, "Event_TomatekhRusMongolInvasion") == true then return false end

			local MongolCheck = 0;
			for i, player in pairs(Players) do
				if player:IsEverAlive() then
					if player:GetCivilizationType() == MongolID then
						MongolCheck = 1;
						break;
					end
				end
			end
			if MongolCheck == 1 then return false end

			if (Game.GetGameTurnYear() >= 1400) then return false end

			Event_TomatekhRusMongolInvasion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_DESC")

			return true

		end
		)

	Event_TomatekhRusMongolInvasion.Outcomes = {}

	Event_TomatekhRusMongolInvasion.Outcomes[1] = {}
	Event_TomatekhRusMongolInvasion.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_1"
	Event_TomatekhRusMongolInvasion.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_1"
	Event_TomatekhRusMongolInvasion.Outcomes[1].Weight = 5
	Event_TomatekhRusMongolInvasion.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_TomatekhRusMongolInvasion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_TomatekhRusMongolInvasion.Outcomes[1].DoFunc = (

		function(pPlayer) 

			local sPlot = 0;
			for iPlot = 0, Map.GetNumPlots() - 1, 1 do
				local pPlot = Map.GetPlotByIndex(iPlot)
				local pID = pPlayer:GetID()
				if pPlot:GetOwner() ~= -1 then
					if pPlot:GetOwner() == pID then 
						if not pPlot:IsCity() and not pPlot:IsWater() and not pPlot:IsMountain() and not pPlot:IsImpassable() then
							for loop, direction in ipairs(directions) do
								local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
								if adjPlot:GetOwner() ~= pID then 
									sPlot = pPlot;
									break
								end
							end
						end
					end
				end
			end

			local bPlayer = Players[63];
			bPlayer:ChangeNumResourceTotal(rHorse, 2)

			kUnit = bPlayer:InitUnit(uKhan, sPlot:GetX(), sPlot:GetY(), UNITAI_GENERAL);
			kUnit:JumpToNearestValidPlot();

			hUnit = bPlayer:InitUnit(uHorseman, sPlot:GetX(), sPlot:GetY(), UNITAI_FAST_ATTACK);
			hUnit:JumpToNearestValidPlot();

			bUnit = bPlayer:InitUnit(uKeshik, sPlot:GetX(), sPlot:GetY(), UNITAI_RANGED);
			bUnit:JumpToNearestValidPlot();

			h2Unit = bPlayer:InitUnit(uHorseman, sPlot:GetX(), sPlot:GetY(), UNITAI_FAST_ATTACK);
			h2Unit:JumpToNearestValidPlot();

			--b2Unit = bPlayer:InitUnit(uKeshik, sPlot:GetX(), sPlot:GetY(), UNITAI_RANGED);
			--b2Unit:JumpToNearestValidPlot();

			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
					if pUnit:IsCombatUnit() then 
						if not (pUnit:IsHasPromotion(pQuickStudy)) then
							pUnit:SetHasPromotion(pQuickStudy,true);
						end
					end
				end
			end

			save(pPlayer, "Event_TomatekhRusMongolInvasion", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhRusMongolInvasion.Name))
			Events.GameplayAlertMessage("The Golden Horde is invading the Rus'!")

		end)

	Event_TomatekhRusMongolInvasion.Outcomes[2] = {}
	Event_TomatekhRusMongolInvasion.Outcomes[2].Name = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_2"
	Event_TomatekhRusMongolInvasion.Outcomes[2].Desc = "TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_2"
	Event_TomatekhRusMongolInvasion.Outcomes[2].Weight = 10
	Event_TomatekhRusMongolInvasion.Outcomes[2].CanFunc = (
		function(pPlayer)	

			local iCost = math.ceil(100 * iMod)

			if (pPlayer:GetGold() < iCost) then return false end

			Event_TomatekhRusMongolInvasion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_2", iCost)

			return true
		end
		)
	Event_TomatekhRusMongolInvasion.Outcomes[2].DoFunc = (

		function(pPlayer) 

			local iCost = math.ceil(100 * iMod)
			pPlayer:ChangeGold(-iCost);

			save(pPlayer, "Event_TomatekhRusMongolInvasion", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_MONGOL_RUS_INVASION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhRusMongolInvasion.Name))
			Events.GameplayAlertMessage("The Rus' have paid tribute to the Golden Horde.")

		end)

tEvents.Event_TomatekhRusMongolInvasion = Event_TomatekhRusMongolInvasion
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"] then
		if KievGetRandom(1,5) == 5 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhRusMongolInvasion", 1250, true)
		end
	end
end

----------------------------------
----------------------------------

--Varangian Guard

--[[
local uGuard = GameInfoTypes.UNIT_KIEVAN_RUS_MOD;
local uSword = GameInfoTypes.UNIT_SWORDSMAN;
local rIron = GameInfoTypes.RESOURCE_IRON;
local mPlayer = 0;

local Event_TomatekhRussianGuard = {}
    Event_TomatekhRussianGuard.Name = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES"
	Event_TomatekhRussianGuard.Desc = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_DESC"
	Event_TomatekhRussianGuard.tValidCivs = 
		{
		["CIVILIZATION_KIEVAN_RUS_MOD"]		= true,
		}
	Event_TomatekhRussianGuard.Weight = 5
	Event_TomatekhRussianGuard.CanFunc = (

		function(pPlayer)

			if load(pPlayer, "Event_TomatekhRussianGuard") == true then return false end

			if (pPlayer:GetNumMinorCivsMet() < 1) then return false end

			if (pPlayer:GetNumMinorCivsMet() >= 1) then
				for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
					local tPlayer = Players[i];
					local pTeam = pPlayer:GetTeam();
					local tTeam = tPlayer:GetTeam();
					if pTeam ~= tTeam then
						if Teams[pTeam]:IsHasMet(tTeam) then 
							mPlayer = tPlayer;
							break;
						end
					end
				end
			end

			local DruzhinaCount = 0;
			for pUnit in pPlayer:Units() do
				if (pUnit:GetUnitType() == uGuard) or (pUnit:GetUnitType() == uSword) then
					DruzhinaCount = DruzhinaCount + 1;
				end
			end

			if DruzhinaCount < 2 then return false end

			if mPlayer ~= 0 then
				iCost = "" .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. ""
			else
				iCost = ""
			end
			Event_TomatekhRussianGuard.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_DESC", iCost)

			local sCivType = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
			return Event_TomatekhRussianGuard.tValidCivs[sCivType]

		end
		)

	Event_TomatekhRussianGuard.Outcomes = {}
	Event_TomatekhRussianGuard.Outcomes[1] = {}
	Event_TomatekhRussianGuard.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_1"
	Event_TomatekhRussianGuard.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_1"
	Event_TomatekhRussianGuard.Outcomes[1].Weight = 10
	Event_TomatekhRussianGuard.Outcomes[1].CanFunc = (
		function(pPlayer)

			if mPlayer ~= 0 then
				iCost = "" .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. ""
			else
				iCost = ""
			end
			Event_TomatekhRussianGuard.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_1", iCost)

			return true
		end
		)
	Event_TomatekhRussianGuard.Outcomes[1].DoFunc = (
		function(pPlayer)

			local pID = pPlayer:GetID()
			mPlayer:ChangeMinorCivFriendshipWithMajor(pID, 100)

			local KillCount = 0;
			for pUnit in pPlayer:Units() do
				if (pUnit:GetUnitType() == uGuard) or (pUnit:GetUnitType() == uSword) then
					if KillCount < 2 then
						pUnit:Kill(true, -1);
						KillCount = KillCount + 1;
					end
				end
			end

			local mcCity = mPlayer:GetCapitalCity();
			mPlayer:ChangeNumResourceTotal(rIron, 2)

			mUnit = bPlayer:InitUnit(uGuard, mcCity:GetX(), mcCity:GetY(), UNITAI_ATTACK);
			mUnit:JumpToNearestValidPlot();

			mUnit1 = bPlayer:InitUnit(uGuard, mcCity:GetX(), mcCity:GetY(), UNITAI_ATTACK);
			mUnit1:JumpToNearestValidPlot();

			save(pPlayer, "Event_TomatekhRussianGuard", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhRussianGuard.Name))
			Events.GameplayAlertMessage("The Kievan Rus' have sent Druzhina to protect " .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. "!")

		end)

	Event_TomatekhRussianGuard.Outcomes = {}
	Event_TomatekhRussianGuard.Outcomes[2] = {}
	Event_TomatekhRussianGuard.Outcomes[2].Name = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_2"
	Event_TomatekhRussianGuard.Outcomes[2].Desc = "TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_2"
	Event_TomatekhRussianGuard.Outcomes[2].Weight = 5
	Event_TomatekhRussianGuard.Outcomes[2].CanFunc = (
		function(pPlayer)

			if mPlayer ~= 0 then
				iCost = "" .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. ""
			else
				iCost = ""
			end
			Event_TomatekhRussianGuard.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_2", iCost)

			return true
		end
		)
	Event_TomatekhRussianGuard.Outcomes[2].DoFunc = (
		function(pPlayer)

			local pID = pPlayer:GetID()
			mPlayer:ChangeMinorCivFriendshipWithMajor(pID, -25)

			save(pPlayer, "Event_TomatekhRussianGuard", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_VARANGIAN_MERCENARIES_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhRussianGuard.Name))
			Events.GameplayAlertMessage("The Kievan Rus' have refused to help " .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. ".")

		end)

for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local slotStatus = PreGame.GetSlotStatus(iSlot)
	if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
		local iCiv = PreGame.GetCivilization(iSlot)
		local sCiv = GameInfo.Civilizations[iCiv].Type
		if Event_TomatekhRussianGuard.tValidCivs[sCiv] then
			tEvents.Event_TomatekhRussianGuard = Event_TomatekhRussianGuard
			break
		end
	end
end
--]]
