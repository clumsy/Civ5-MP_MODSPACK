--Tomatekh

print("Hittite Events")

local PhilistineID = GameInfoTypes.CIVILIZATION_LEUGI_PHILISTINE;
local uGalley = GameInfoTypes.UNIT_GALLEY;
local uTrireme = GameInfoTypes.UNIT_TRIREME;
local pQuickStudy = GameInfoTypes.PROMOTION_GAIN_EXPERIENCE;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

function hitGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local Event_TomatekhSeaPeoplesInvasion = {}
	Event_TomatekhSeaPeoplesInvasion.Name = "TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION"
	Event_TomatekhSeaPeoplesInvasion.Desc = "TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION_DESC"
	Event_TomatekhSeaPeoplesInvasion.Weight = 0
	Event_TomatekhSeaPeoplesInvasion.CanFunc = (
		function(pPlayer)				

			if ((pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) and (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_EGYPT"]) and (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MC_PHOENICIA"])) then return false end

			if load(pPlayer, "Event_TomatekhSeaPeoplesInvasion") == true then return false end

			local CoastCheck = 0;
			for pCity in pPlayer:Cities() do
				if pCity:IsCoastal() then
					CoastCheck = 1;
				end
			end
			if CoastCheck == 0 then return false end

			local PhilistineCheck = 0;
			for i, player in pairs(Players) do
				if player:IsEverAlive() then
					if player:GetCivilizationType() == PhilistineID then
						PhilistineCheck = 1;
						break;
					end
				end
			end
			if PhilistineCheck == 1 then return false end

			if (Game.GetGameTurnYear() >= -1000) then return false end

			Event_TomatekhSeaPeoplesInvasion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION_DESC")

			return true

		end
		)

	Event_TomatekhSeaPeoplesInvasion.Outcomes = {}

	Event_TomatekhSeaPeoplesInvasion.Outcomes[1] = {}
	Event_TomatekhSeaPeoplesInvasion.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION_OUTCOME_1"
	Event_TomatekhSeaPeoplesInvasion.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION_OUTCOME_RESULT_1"
	Event_TomatekhSeaPeoplesInvasion.Outcomes[1].Weight = 10
	Event_TomatekhSeaPeoplesInvasion.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_TomatekhSeaPeoplesInvasion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_SEA_PEOPLES_INVASION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_TomatekhSeaPeoplesInvasion.Outcomes[1].DoFunc = (

		function(pPlayer) 

			local sPlot = 0;
			for iPlot = 0, Map.GetNumPlots() - 1, 1 do
				local pPlot = Map.GetPlotByIndex(iPlot)
				local pID = pPlayer:GetID()
				if pPlot:GetOwner() ~= -1 then
					if pPlot:GetOwner() == pID then 
						if pPlot:IsWater() and not pPlot:IsLake() and not pPlot:IsImpassable() then
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
			hUnit = bPlayer:InitUnit(uGalley, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK_SEA);
			hUnit:JumpToNearestValidPlot();

			bUnit = bPlayer:InitUnit(uTrireme, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK_SEA);
			bUnit:JumpToNearestValidPlot();

			h2Unit = bPlayer:InitUnit(uGalley, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK_SEA);
			h2Unit:JumpToNearestValidPlot();

			--b2Unit = bPlayer:InitUnit(uTrireme, sPlot:GetX(), sPlot:GetY(), UNITAI_ATTACK_SEA);
			--b2Unit:JumpToNearestValidPlot();

			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
					if pUnit:IsCombatUnit() and not pUnit:IsEmbarked() then 
						if not (pUnit:IsHasPromotion(pQuickStudy)) then
							pUnit:SetHasPromotion(pQuickStudy,true);
						end
					end
				end
			end

			save(pPlayer, "Event_TomatekhSeaPeoplesInvasion", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_SEA_PEOPLES_INVASION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhSeaPeoplesInvasion.Name))
			
			oPlayer = pPlayer;

			if (load(oPlayer, "SeaNotification") ~= true) then
				Events.GameplayAlertMessage("The Sea Peoples are invading!")
			end

			for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
				local oPlayer = Players[oPlayer];
				save(oPlayer, "SeaNotification", true)			
			end

		end)

tEvents.Event_TomatekhSeaPeoplesInvasion = Event_TomatekhSeaPeoplesInvasion

for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HITTITE_MOD"] then
		if hitGetRandom(1,5) == 5 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhSeaPeoplesInvasion", -1250, true)
		end
	end
end

for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_EGYPT"] then
		if hitGetRandom(1,5) == 5 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhSeaPeoplesInvasion", -1250, true)
		end
	end
end

for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_PHOENICIA"] then
		if hitGetRandom(1,5) == 5 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhSeaPeoplesInvasion", -1250, true)
		end
	end
end
