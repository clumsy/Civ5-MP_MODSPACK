print("Xia Decisions")

--Stuff
local isShang = (GameInfoTypes.BUILDING_XIA_SHANG_SWITCH ~= nil)

function xGetClosestCity(pPlayer, pPlot)
	local newCity = nil;
	local newCityDist = 100000000;
    for city in pPlayer:Cities() do
		local dist = Map.PlotDistance(city:GetX(), city:GetY(), pPlot:GetX(), pPlot:GetY());
		if dist < newCityDist then
			newCity = city;
			newCityDist = dist
		end
    end
	return newCity;
end

local greatWorkSlotArtID = GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"]
local unitXiaYuID  = GameInfoTypes["UNIT_DECISIONS_XIA_YU"]
local unitMissionCreateGreatWorkID	= GameInfoTypes["MISSION_CREATE_GREAT_WORK"]

local speed = Game.GetGameSpeedType();

--Yellow River
local Decisions_XiaFloods = {}
	Decisions_XiaFloods.Name = "TXT_KEY_DECISIONS_TOMATEKH_XIA_YELLOW_RIVER"
	Decisions_XiaFloods.Desc = "TXT_KEY_DECISIONS_TOMATEKH_XIA_YELLOW_RIVER_DESC"
	HookDecisionCivilizationIcon(Decisions_XiaFloods, "CIVILIZATION_ERLITOU_MOD")
	Decisions_XiaFloods.Weight = nil
	Decisions_XiaFloods.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then return false, false end
		if isShang then return false, false end
		if load(pPlayer, "Decisions_XiaFloods") == true then
			Decisions_XiaFloods.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_YELLOW_RIVER_ENACTED_DESC")
			return false, false, true
		end		
	
		Decisions_XiaFloods.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_YELLOW_RIVER_DESC")

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		local RiverCheck = 0;
		for pCity in pPlayer:Cities() do
			local pPlot = pCity:Plot();
			if pPlot:IsRiver() then
				RiverCheck = 1;
				break
			end
		end
		if (RiverCheck < 1) then return true, false end	

		return true, true
	end
	)
	
	Decisions_XiaFloods.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_XiaFloods", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ERLITOU_MOD"], "Decisions_XiaFloods", Decisions_XiaFloods)

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
		if load(pPlayer, "Decisions_XiaFloods") == true then
			if pPlot:IsRiver() then
				local pTeam = pPlayer:GetTeam();
				local RiverFoodBase = 0;
				local RiverFoodShow = 0;
				if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
					RiverFoodBase = 3.3;
					RiverFoodShow = 4;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
					RiverFoodBase = 5;
					RiverFoodShow = 5;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
					RiverFoodBase = 7.3;
					RiverFoodShow = 8;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
					RiverFoodBase = 15;
					RiverFoodShow = 15;
				else
					RiverFoodBase = 15;
					RiverFoodShow = 15;
				end
				local nCity = xGetClosestCity(pPlayer, pPlot);
				nCity:ChangeFood(RiverFoodBase)
				if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
					Events.GameplayAlertMessage("Improving the river has provided an additional " .. RiverFoodShow .. " [ICON_FOOD] Food to " .. Locale.ConvertTextKey(nCity:GetName()) .. "!");
				end
			end
		end
	end
end)

--Bronzes
local bcBarracksFaith = GameInfoTypes.BUILDINGCLASS_XIA_RITUAL_BRONZE_DECISION_DUMMY;
local bBarracksFaith = GameInfoTypes.BUILDING_XIA_RITUAL_BRONZE_DECISION_DUMMY;

local Decisions_XiaBronzes = {}
	Decisions_XiaBronzes.Name = "TXT_KEY_DECISIONS_TOMATEKH_XIA_BRONZES"
	Decisions_XiaBronzes.Desc = "TXT_KEY_DECISIONS_TOMATEKH_XIA_BRONZES_DESC"
	HookDecisionCivilizationIcon(Decisions_XiaBronzes, "CIVILIZATION_ERLITOU_MOD")
	Decisions_XiaBronzes.Weight = nil
	Decisions_XiaBronzes.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then return false, false end
		if isShang then return false, false end
		if load(pPlayer, "Decisions_XiaBronzes") == true then
			Decisions_XiaBronzes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_BRONZES_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(100 * iMod)
		Decisions_XiaBronzes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_BRONZES_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (not pPlayer:HasAvailableGreatWorkSlot(greatWorkSlotArtID)) 	then return true, false end

		local bBarracks = GameInfoTypes.BUILDINGCLASS_BARRACKS;
		local bFoundryCount = pPlayer:GetBuildingClassCount(bBarracks)

		if bFoundryCount < 2 then return true, false end

		return true, true
	end
	)
	
	Decisions_XiaBronzes.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_XiaBronzes", true)

		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeGold(-iCost);

		local pcCity = pPlayer:GetCapitalCity();

		if not (pcCity:IsHasBuilding(bBarracksFaith)) then
			pcCity:SetNumRealBuilding(bBarracksFaith, 1);
		end

		local capitalX = pcCity:GetX();
		local capitalY = pcCity:GetY();

		pPlayer:InitUnit(unitXiaYuID, capitalX, capitalY):PushMission(unitMissionCreateGreatWorkID)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ERLITOU_MOD"], "Decisions_XiaBronzes", Decisions_XiaBronzes)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then
			if load(pPlayer, "Decisions_XiaBronzes") == true then
				local pcCity = pPlayer:GetCapitalCity();
				local pcBF = pPlayer:GetBuildingClassCount(bcBarracksFaith)
				if pcBF >= 2 then
					for bCity in pPlayer:Cities() do
						if (bCity:IsHasBuilding(bBarracksFaith)) then
							bCity:SetNumRealBuilding(bBarracksFaith, 0);
						end
					end
					pcCity:SetNumRealBuilding(bBarracksFaith, 1);
				end
				if pcBF <= 0 then
					pcCity:SetNumRealBuilding(bBarracksFaith, 1);
				end
			end
		end
	end
end)

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------

--Chopsticks
local bChopsticks = GameInfoTypes.BUILDING_XIA_CHOPSTICK_DECISION_DUMMY;
local bcChopsticks = GameInfoTypes.BUILDINGCLASS_XIA_CHOPSTICK_DECISION_DUMMY;
local iFarm = GameInfo.Improvements["IMPROVEMENT_FARM"].ID

local Decisions_XiaChopsticks = {}
	Decisions_XiaChopsticks.Name = "TXT_KEY_DECISIONS_TOMATEKH_XIA_CHOPSTICKS"
	Decisions_XiaChopsticks.Desc = "TXT_KEY_DECISIONS_TOMATEKH_XIA_CHOPSTICKS_DESC"
	HookDecisionCivilizationIcon(Decisions_XiaChopsticks, "CIVILIZATION_ERLITOU_MOD")
	Decisions_XiaChopsticks.Weight = nil
	Decisions_XiaChopsticks.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then return false, false end
		if not isShang then return false, false end
		if load(pPlayer, "Decisions_XiaChopsticks") == true then
			Decisions_XiaChopsticks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_CHOPSTICKS_ENACTED_DESC")
			return false, false, true
		end		
	
		local iTech = GameInfoTypes.TECH_AGRICULTURE
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech) * 1.5)

		Decisions_XiaChopsticks.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_CHOPSTICKS_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local cFarms = pPlayer:GetImprovementCount(iFarm)
		if cFarms < 4 then return true, false end

		if (Teams[pPlayer:GetTeam()]:IsHasTech(iTech)) and (pPlayer:GetResearchProgress(pPlayer:GetCurrentResearch()) >= iCost) then
			return true, true
		else
			return true, false
		end

		return true, true
	end
	)
	
	Decisions_XiaChopsticks.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		local iTech = GameInfoTypes.TECH_AGRICULTURE
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech) * 1.5)	
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		pTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), -iCost, pPlayer:GetID())

		local pcCity = pPlayer:GetCapitalCity();
		if not (pcCity:IsHasBuilding(bChopsticks)) then
			pcCity:SetNumRealBuilding(bChopsticks, 1);
		end

		local uWorker = GameInfo.Units.UNIT_WORKER.ID;

		pUnit = pPlayer:InitUnit(uWorker, pcCity:GetX(), pcCity:GetY(), UNITAI_WORKER);
		pUnit:JumpToNearestValidPlot()

		save(pPlayer, "Decisions_XiaChopsticks", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ERLITOU_MOD"], "Decisions_XiaChopsticks", Decisions_XiaChopsticks)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			if load(pPlayer, "Decisions_XiaChopsticks") == true then
				local pcCity = pPlayer:GetCapitalCity();
				local pcSC = pPlayer:GetBuildingClassCount(bcChopsticks)
				if pcSC >= 2 then
					for bCity in pPlayer:Cities() do
						if (bCity:IsHasBuilding(bChopsticks)) then
							bCity:SetNumRealBuilding(bChopsticks, 0);
						end
					end
					pcCity:SetNumRealBuilding(bChopsticks, 1);
				end
				if pcBF <= 0 then
					pcCity:SetNumRealBuilding(bChopsticks, 1);
				end
			end
		end
	end
end)

--Shell and Bone Script
local bShang = GameInfoTypes.BUILDING_SHANG_DYNASTY_DUMMY;
local tWriting = GameInfoTypes.TECH_WRITING;

local Decisions_XiaShangWriting = {}
	Decisions_XiaShangWriting.Name = "TXT_KEY_DECISIONS_TOMATEKH_XIA_SHANG_CHINESE_WRITING"
	Decisions_XiaShangWriting.Desc = "TXT_KEY_DECISIONS_TOMATEKH_XIA_SHANG_CHINESE_WRITING_DESC"
	HookDecisionCivilizationIcon(Decisions_XiaShangWriting, "CIVILIZATION_ERLITOU_MOD")
	Decisions_XiaShangWriting.Weight = nil
	Decisions_XiaShangWriting.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then return false, false end
		if not isShang then return false, false end
		if load(pPlayer, "Decisions_XiaShangWriting") == true then
			Decisions_XiaShangWriting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_SHANG_CHINESE_WRITING_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(200 * iMod)
		Decisions_XiaShangWriting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_XIA_SHANG_CHINESE_WRITING_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end	
		if (pPlayer:GetGold() < iCost) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(tWriting)) then return true, false end

		return true, true
	end
	)
	
	Decisions_XiaShangWriting.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeGold(-iCost);

		save(pPlayer, "Decisions_XiaShangWriting", true)

		for bCity in pPlayer:Cities() do
			if not (bCity:IsHasBuilding(bShang)) then
				bCity:SetNumRealBuilding(bShang, 1);
			end
		end

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_ERLITOU_MOD"], "Decisions_XiaShangWriting", Decisions_XiaShangWriting)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ERLITOU_MOD"]) then
			if load(pPlayer, "Decisions_XiaShangWriting") == true then
				for bCity in pPlayer:Cities() do
					if not (bCity:IsHasBuilding(bShang)) then
						bCity:SetNumRealBuilding(bShang, 1);
					end
				end
			end
		end
	end
end)