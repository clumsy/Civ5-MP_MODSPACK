--Tomatekh

print("Goths Decisions")

local pDoublePlunder = GameInfoTypes.PROMOTION_DOUBLE_PLUNDER;
local pLimitedVisibilty = GameInfoTypes.PROMOTION_SIGHT_PENALTY;
local uGeneral = GameInfo.Units.UNIT_GREAT_GENERAL.ID;
local cMelee = GameInfoTypes.UNITCOMBAT_MELEE;
local uMissionary = GameInfoTypes.UNITCLASS_MISSIONARY;

--Free the Slaves

local Decisions_GothicSlaves = {}
	Decisions_GothicSlaves.Name = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_SLAVES"
	Decisions_GothicSlaves.Desc = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_SLAVES_DESC"
	HookDecisionCivilizationIcon(Decisions_GothicSlaves, "CIVILIZATION_VISIGOTHS_MOD")
	Decisions_GothicSlaves.Weight = nil
	Decisions_GothicSlaves.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GothicSlaves") == true then
			Decisions_GothicSlaves.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_SLAVES_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(50 * iMod);
		Decisions_GothicSlaves.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_SLAVES_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		local cCapitalCheck = 0;
		for pCity in pPlayer:Cities() do
			if pCity:IsOriginalCapital() then
				local iNewOwner = pCity:GetOwner();
				local iOldOwner = pCity:GetOriginalOwner();
				local pPlayer = Players[iNewOwner];
				local oPlayer = Players[iOldOwner];
				if pPlayer ~= oPlayer then
					cCapitalCheck = 1;
					break
				end
			end
		end
		if cCapitalCheck <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_GothicSlaves.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iCost = math.ceil(50 * iMod);
		pPlayer:ChangeGold(-iCost);

		local pcCity = pPlayer:GetCapitalCity();
		if (pcCity:GetWeLoveTheKingDayCounter() >= 1) then
			pcCity:ChangeWeLoveTheKingDayCounter(20)
		elseif (pcCity:GetWeLoveTheKingDayCounter() <= 0) then
			pcCity:SetWeLoveTheKingDayCounter(20)
		end

		if (pPlayer:IsHuman()) then
			Events.GameplayAlertMessage("" .. Locale.ConvertTextKey(pcCity:GetName()) .. " loves its King!");
		end

		for pCity in pPlayer:Cities() do
			if pCity:IsResistance() then
				local tResistance = (pCity:GetResistanceTurns());
				pCity:ChangeResistanceTurns(-tResistance);
			end
		end

		for pCity in pPlayer:Cities() do
			if pCity:IsOriginalCapital() then
				local iNewOwner = pCity:GetOwner();
				local iOldOwner = pCity:GetOriginalOwner();
				local pPlayer = Players[iNewOwner];
				local oPlayer = Players[iOldOwner];
				if pPlayer ~= oPlayer then
					if pCity:GetPopulation() >= 2 then
						pCity:ChangePopulation(-1, true);
					end
				end
			end
		end

		save(pPlayer, "Decisions_GothicSlaves", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"], "Decisions_GothicSlaves", Decisions_GothicSlaves)

--[[
--To War!

local Decisions_GothicToWar = {}
	Decisions_GothicToWar.Name = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_TO_WAR"
	Decisions_GothicToWar.Desc = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_TO_WAR_DESC"
	HookDecisionCivilizationIcon(Decisions_GothicToWar, "CIVILIZATION_VISIGOTHS_MOD")
	Decisions_GothicToWar.Weight = nil
	Decisions_GothicToWar.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GothicToWar") == true then
			Decisions_GothicToWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_TO_WAR_ENACTED_DESC")
			return false, false, true
		end		

	    local iCost = math.ceil(50 * iMod);
		Decisions_GothicToWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_TO_WAR_DESC", iCost);

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_RENAISSANCE"] then return true, false end
		local isWar = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				if (oPlayer:IsAlive()) then
					local pTeam = pPlayer:GetTeam();
					local oTeam = oPlayer:GetTeam();
					if Teams[pTeam]:IsAtWar(oTeam) then
						isWar = isWar + 1;
						break
					end
				end
			end
		end
		if isWar <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_GothicToWar.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(50 * iMod);
		pPlayer:ChangeGold(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1);

		local pcCity = pPlayer:GetCapitalCity();
		pUnit = pPlayer:InitUnit(uGeneral, pcCity:GetX(), pcCity:GetY(), UNITAI_GENERAL);
		pUnit:JumpToNearestValidPlot()
		pUnit:SetName("Gainas");	

		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then 
				if (pUnit:GetUnitCombatType() == cMelee) then
					if not pUnit:IsHasPromotion(pDoublePlunder) then
						pUnit:SetHasPromotion(pDoublePlunder,true);
					end
				end
			end
		end

		save(pPlayer, "Decisions_GothicToWar", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"], "Decisions_GothicToWar", Decisions_GothicToWar)
--]]

--Wulfila

local Decisions_GothsWulfila = {}
	Decisions_GothsWulfila.Name = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_ARIANISM"
	Decisions_GothsWulfila.Desc = "TXT_KEY_DECISIONS_TOMATEKH_GOTHS_ARIANISM_DESC"
	HookDecisionCivilizationIcon(Decisions_GothsWulfila, "CIVILIZATION_VISIGOTHS_MOD")
	Decisions_GothsWulfila.Weight = nil
	Decisions_GothsWulfila.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_GothsWulfila") == true then
			Decisions_GothsWulfila.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_ARIANISM_ENACTED_DESC")
			return false, false, true
		end		

	    local iCost = math.ceil(30 * iMod);
		Decisions_GothsWulfila.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_GOTHS_ARIANISM_DESC", iCost);

		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then return true, false end

		local isGod = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer:GetReligionCreatedByPlayer() >= 1 then
				isGod = isGod + 1;
				break;
			end
		end
		if isGod <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_GothsWulfila.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(30 * iMod);
		pPlayer:ChangeFaith(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1);

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_WULFILA_MISSIONARIES"], true)

		save(pPlayer, "Decisions_GothsWulfila", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"], "Decisions_GothsWulfila", Decisions_GothsWulfila)

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local plot = Map.GetPlot(iX, iY);	
	local cCity = plot:GetPlotCity();
	local iNewOwner = cCity:GetOwner();
	local pPlayer = Players[iNewOwner];
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then
		if load(pPlayer, "Decisions_GothicSlaves") == true then
			if cCity:IsResistance() then
				local tResistance = (cCity:GetResistanceTurns());
				cCity:ChangeResistanceTurns(-tResistance);
			end
		end
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then
			if load(pPlayer, "Decisions_GothsWulfila") == true then
				for pUnit in pPlayer:Units() do
					if pUnit:GetUnitClassType() == uMissionary then
						local max = pUnit:MaxMoves();
						pUnit:SetMoves(max + 60);
					end
				end
			end
			--[[
			if load(pPlayer, "Decisions_GothicToWar") == true then
				for pUnit in pPlayer:Units() do
					if pUnit:IsCombatUnit() then 
						if (pUnit:GetUnitCombatType() == cMelee) then
							if not pUnit:IsHasPromotion(pDoublePlunder) then
								pUnit:SetHasPromotion(pDoublePlunder,true);
							end
						end
					end
				end
			end
			--]]
		end
	end
end)
