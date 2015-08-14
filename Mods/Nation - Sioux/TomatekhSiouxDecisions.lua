--Tomatekh

print("Sioux Decisions")

local tChivalry = GameInfoTypes.TECH_CHIVALRY;

--Akichita

local Decisions_SiouxAkichita = {}
	Decisions_SiouxAkichita.Name = "TXT_KEY_DECISIONS_TOMATEKH_SIOUX_AKICHITA"
	Decisions_SiouxAkichita.Desc = "TXT_KEY_DECISIONS_TOMATEKH_SIOUX_AKICHITA_DESC"
	HookDecisionCivilizationIcon(Decisions_SiouxAkichita, "CIVILIZATION_SIOUX_MOD")
	Decisions_SiouxAkichita.Weight = nil
	Decisions_SiouxAkichita.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SIOUX_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_SiouxAkichita") == true then
			Decisions_SiouxAkichita.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SIOUX_AKICHITA_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(250 * iMod)
		Decisions_SiouxAkichita.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SIOUX_AKICHITA_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetNumCities() < 3) then return true, false end		
		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tChivalry)) then return true, false end
		return true, true
	end
	)
	
	Decisions_SiouxAkichita.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost);
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_AKICHITA_POLICE_MOD"], true)

		save(pPlayer, "Decisions_SiouxAkichita", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SIOUX_MOD"], "Decisions_SiouxAkichita", Decisions_SiouxAkichita)

--Ghost Dance

local Decisions_SiouxGhostDance = {}
	Decisions_SiouxGhostDance.Name = "TXT_KEY_DECISIONS_TOMATEKH_SIOUX_GHOST_DANCE"
	Decisions_SiouxGhostDance.Desc = "TXT_KEY_DECISIONS_TOMATEKH_SIOUX_GHOST_DANCE_DESC"
	HookDecisionCivilizationIcon(Decisions_SiouxGhostDance, "CIVILIZATION_SIOUX_MOD")
	Decisions_SiouxGhostDance.Weight = nil
	Decisions_SiouxGhostDance.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SIOUX_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_SiouxGhostDance") == true then
			Decisions_SiouxGhostDance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SIOUX_GHOST_DANCE_ENACTED_DESC")
			return false, false, true
		end		

		local pTeam = pPlayer:GetTeam();
		local iCost = math.ceil(50 * iMod)
		Decisions_SiouxGhostDance.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SIOUX_GHOST_DANCE_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if Teams[pTeam]:GetAtWarCount(true) == 0 then return true, false end
		if pPlayer:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then return true, false end

		return true, true
	end
	)
	
	Decisions_SiouxGhostDance.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local iCost = math.ceil(50 * iMod)
		pPlayer:ChangeGold(-iCost);

		save(pPlayer, "Decisions_SiouxGhostDance", true)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SIOUX_MOD"], "Decisions_SiouxGhostDance", Decisions_SiouxGhostDance)

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local plot = Map.GetPlot(iX, iY);	
	local cCity = plot:GetPlotCity();
	local iPreviousOwner = cCity:GetPreviousOwner();
	local lPlayer = Players[iPreviousOwner];
	if (lPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
		if load(lPlayer, "Decisions_SiouxGhostDance") == true then
			if cCity:IsResistance() then
				local tResistance = ((cCity:GetResistanceTurns()) + 1);
				cCity:ChangeResistanceTurns(tResistance);
			end
		end
	end
end)

local uSettler = GameInfoTypes.UNIT_SETTLER;
local uWorker = GameInfoTypes.UNIT_WORKER;
local uMissionary = GameInfoTypes.UNIT_MISSIONARY;
local uInquisitor = GameInfoTypes.UNIT_INQUISITOR;

function SiouxGhostDance(playerID, cityID, unitID)
	local pPlayer = Players[playerID];
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
		if load(pPlayer, "Decisions_SiouxGhostDance") == true then
			local pCity = pPlayer:GetCityByID(cityID)
			local pUnit = pPlayer:GetUnitByID(unitID)
			if not pUnit:IsCombatUnit() then
				local BonusFaith = 0;
				if (pUnit:GetUnitType() == uSettler) then				
					BonusFaith = math.ceil(15 * iMod);
				elseif (pUnit:GetUnitType() == uWorker) then
					BonusFaith = math.ceil(10 * iMod);
				elseif (pUnit:GetUnitType() == uMissionary) then
					BonusFaith = math.ceil(15 * iMod);
				elseif (pUnit:GetUnitType() == uInquisitor) then
					BonusFaith = math.ceil(15 * iMod);
				else
					BonusFaith = math.ceil(10 * iMod);
				end
				pPlayer:ChangeFaith(BonusFaith);
				if (pPlayer:IsHuman()) and (playerID == Game.GetActivePlayer()) then	
					Events.GameplayAlertMessage("The Ghost Dance has provided " .. BonusFaith .. " [ICON_PEACE] Faith!");					
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(SiouxGhostDance)
