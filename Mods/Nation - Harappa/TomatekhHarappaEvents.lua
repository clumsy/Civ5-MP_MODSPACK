--Tomatekh

print("Harappa Events")

local rHorse = GameInfoTypes.RESOURCE_HORSE;
local pQuickStudy = GameInfoTypes.PROMOTION_GAIN_EXPERIENCE;
local uBrute = GameInfoTypes.UNIT_BARBARIAN_WARRIOR;
local uHorseman = GameInfoTypes.UNIT_BARBARIAN_HORSEMAN;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

function hGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local Event_TomatekhAryanInvasion = {}
	Event_TomatekhAryanInvasion.Name = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION"
	Event_TomatekhAryanInvasion.Desc = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_DESC"
	Event_TomatekhAryanInvasion.Weight = 0
	Event_TomatekhAryanInvasion.CanFunc = (
		function(pPlayer)		
				
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HARAPPA_MOD"] then return false end

			if load(pPlayer, "Event_TomatekhAryanInvasion") == true then return false end

			if (Game.GetGameTurnYear() >= -1000) then return false end

			Event_TomatekhAryanInvasion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_DESC")

			return true

		end
		)

	Event_TomatekhAryanInvasion.Outcomes = {}

	Event_TomatekhAryanInvasion.Outcomes[1] = {}
	Event_TomatekhAryanInvasion.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_1"
	Event_TomatekhAryanInvasion.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_1"
	Event_TomatekhAryanInvasion.Outcomes[1].Weight = 0
	Event_TomatekhAryanInvasion.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_TomatekhAryanInvasion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_TomatekhAryanInvasion.Outcomes[1].DoFunc = (

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
			hUnit = bPlayer:InitUnit(uHorseman, sPlot:GetX(), sPlot:GetY(), UNITAI_FAST_ATTACK);
			hUnit:JumpToNearestValidPlot();

			bUnit = bPlayer:InitUnit(uBrute, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK);
			bUnit:JumpToNearestValidPlot();

			h2Unit = bPlayer:InitUnit(uHorseman, sPlot:GetX(), sPlot:GetY(), UNITAI_FAST_ATTACK);
			h2Unit:JumpToNearestValidPlot();

			--b2Unit = bPlayer:InitUnit(uBrute, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK);
			--b2Unit:JumpToNearestValidPlot();

			local bCastle = GameInfoTypes.BUILDING_CASTLE;
			local pcCity = pPlayer:GetCapitalCity();

			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
					if pUnit:IsCombatUnit() then 
						if not (pUnit:IsHasPromotion(pQuickStudy)) then
							pUnit:SetHasPromotion(pQuickStudy,true);
						end
					end
				end
			end

			if not (pcCity:IsHasBuilding(bCastle)) then
				pcCity:SetNumRealBuilding(bCastle, 1);
			end

			save(pPlayer, "Event_TomatekhAryanInvasion", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhAryanInvasion.Name))
			Events.GameplayAlertMessage("The Vedic Aryans are invading the Punjab!")

		end)

	Event_TomatekhAryanInvasion.Outcomes[2] = {}
	Event_TomatekhAryanInvasion.Outcomes[2].Name = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_2"
	Event_TomatekhAryanInvasion.Outcomes[2].Desc = "TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_2"
	Event_TomatekhAryanInvasion.Outcomes[2].Weight = 10
	Event_TomatekhAryanInvasion.Outcomes[2].CanFunc = (
		function(pPlayer)	
			Event_TomatekhAryanInvasion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_TomatekhAryanInvasion.Outcomes[2].DoFunc = (

		function(pPlayer) 
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_ARYAN_INVASION_MOD"], true)
			pPlayer:ChangeNumResourceTotal(rHorse, 2)

			save(pPlayer, "Event_TomatekhAryanInvasion", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_ARYAN_INVASION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhAryanInvasion.Name))
			Events.GameplayAlertMessage("The Vedic Aryans have begun to settle the Punjab.")

		end)
	
tEvents.Event_TomatekhAryanInvasion = Event_TomatekhAryanInvasion
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HARAPPA_MOD"] then
		if hGetRandom(1,4) == 4 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhAryanInvasion", -1500, true)
		end
	end
end