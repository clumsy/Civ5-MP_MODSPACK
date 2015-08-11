--Tomatekh

print("Harappa Decisions")

local bClassAqueduct = GameInfoTypes.BUILDINGCLASS_AQUEDUCT;
local bHarappaBath = GameInfoTypes.BUILDING_HARAPPA_DECISIONS_MOD;
local fFoggoras = GameInfoTypes.FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER
local tWriting = GameInfoTypes.TECH_WRITING;
local uCaravan = GameInfoTypes.UNIT_CARAVAN;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

--Bath
local Decisions_HarappaBath = {}
	Decisions_HarappaBath.Name = "TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_BATH"
	Decisions_HarappaBath.Desc = "TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_BATH_DESC"
	HookDecisionCivilizationIcon(Decisions_HarappaBath, "CIVILIZATION_HARAPPA_MOD")
	Decisions_HarappaBath.Weight = nil
	Decisions_HarappaBath.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HARAPPA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_HarappaBath") == true then
			Decisions_HarappaBath.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_BATH_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(50 * iMod)
		Decisions_HarappaBath.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_BATH_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		local cHarappaSewer = pPlayer:GetBuildingClassCount(bClassAqueduct)
		if cHarappaSewer < 1 then return true, false end

		return true, true
	end
	)
	
	Decisions_HarappaBath.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(50 * iMod)
		pPlayer:ChangeGold(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local pcCity = pPlayer:GetCapitalCity();
		local pcPlot = pcCity:Plot();
		pcPlot:SetFeatureType(fFoggoras);

		for pCity in pPlayer:Cities() do
			local pPlot = pCity:Plot();
			if (pPlot:IsRiver()) then
				if not (pCity:IsHasBuilding(bHarappaBath)) then
					pCity:SetNumRealBuilding(bHarappaBath, 1);
				end
			end
		end

		save(pPlayer, "Decisions_HarappaBath", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_HARAPPA_MOD"], "Decisions_HarappaBath", Decisions_HarappaBath)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HARAPPA_MOD"]) then

			if load(pPlayer, "Decisions_HarappaBath") == true then
				for pCity in pPlayer:Cities() do
					local pPlot = pCity:Plot();
					if (pPlot:IsRiver()) then
						if not (pCity:IsHasBuilding(bHarappaBath)) then
							pCity:SetNumRealBuilding(bHarappaBath, 1);
						end
					elseif not (pPlot:IsRiver()) then
						if (pCity:IsHasBuilding(bHarappaBath)) then
							pCity:SetNumRealBuilding(bHarappaBath, 0);
						end
					end
				end
			end

		end
	end
end)

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local fPlot = Map.GetPlot(iX, iY);
	if fPlot:GetFeatureType() == fFoggoras then
		fPlot:SetFeatureType(-1);
	end
end);

--Indus Script
local Decisions_HarappaIndusScript = {}
	Decisions_HarappaIndusScript.Name = "TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_INDUS_WRITING"
	Decisions_HarappaIndusScript.Desc = "TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_INDUS_WRITING_DESC"
	HookDecisionCivilizationIcon(Decisions_HarappaIndusScript, "CIVILIZATION_HARAPPA_MOD")
	Decisions_HarappaIndusScript.Weight = nil
	Decisions_HarappaIndusScript.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HARAPPA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_HarappaIndusScript") == true then
			Decisions_HarappaIndusScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_INDUS_WRITING_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(100 * iMod)
		Decisions_HarappaIndusScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HARAPPA_INDUS_WRITING_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(tWriting)) then return true, false end


		return true, true
	end
	)
	
	Decisions_HarappaIndusScript.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeGold(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		save(pPlayer, "Decisions_HarappaIndusScript", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_HARAPPA_MOD"], "Decisions_HarappaIndusScript", Decisions_HarappaIndusScript)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HARAPPA_MOD"]) then

			if load(pPlayer, "Decisions_HarappaIndusScript") == true then

				local cCulture = 0;
				for pUnit in pPlayer:Units() do			
					if pUnit:GetUnitType() == uCaravan then
						local uPlot = pUnit:GetPlot()
						if uPlot:GetOwner() ~= -1 then
							if (Players[uPlot:GetOwner()] ~= pPlayer) then
								cCulture = cCulture + 2;
							end
						end
					end
				end

				pPlayer:ChangeJONSCulture(cCulture)
				if cCulture > 0 then
					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
						Events.GameplayAlertMessage("Your Caravans have generated " .. cCulture .. "  [ICON_CULTURE] Culture!");
					end
				end

			end

		end
	end
end)