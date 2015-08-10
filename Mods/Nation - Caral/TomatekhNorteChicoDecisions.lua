--Tomatekh

print("Norte Chico Decisions")

function ncDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function ncCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local ncHillPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:IsHills() and pPlot:IsFreshWater()) then
		local sKey = ncCompilePlotID(pPlot)
		ncHillPlots[sKey] = -1
    end
end

local iFarm = GameInfoTypes.IMPROVEMENT_FARM;
local iTerraceFarm = GameInfoTypes.IMPROVEMENT_TERRACE_FARM;
local isInca = (GameInfoTypes.CIVILIZATION_INCA ~= nil)
local fFoggoras = GameInfoTypes.FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER
local bCottonNets = GameInfoTypes.BUILDING_NORTE_CHICO_DECISION_DUMMY;
local bClassCaral = GameInfoTypes.BUILDINGCLASS_NORTE_CHICO_COAST_CHECK;
local bCaralCheck = GameInfoTypes.BUILDING_NORTE_CHICO_COAST_CHECK;

--Bird Flutes

local Decisions_CaralFlutes = {}
	Decisions_CaralFlutes.Name = "TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_FLUTES"
	Decisions_CaralFlutes.Desc = "TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_FLUTES_DESC"
	HookDecisionCivilizationIcon(Decisions_CaralFlutes, "CIVILIZATION_NORTE_CHICO_MOD")
	Decisions_CaralFlutes.Weight = nil
	Decisions_CaralFlutes.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_NORTE_CHICO_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_CaralFlutes") == true then
			Decisions_CaralFlutes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_FLUTES_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(50 * iMod)
		Decisions_CaralFlutes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_FLUTES_DESC", iCost)

		local iCaralCoast = pPlayer:GetBuildingClassCount(bClassCaral)
		if iCaralCoast < 2 then return true, false end

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end

		return true, true
	end
	)
	
	Decisions_CaralFlutes.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(50 * iMod)
		pPlayer:ChangeGold(-iCost);

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_CaralFlutes", true)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_NORTE_CHICO_MOD"], "Decisions_CaralFlutes", Decisions_CaralFlutes)

local bMusicGuild = GameInfoTypes.BUILDING_MUSICIANS_GUILD
local sMusician = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			if load(pPlayer, "Decisions_CaralFlutes") == true then
				local pCapital = pPlayer:GetCapitalCity()
				local AwardCity = pCapital
				local CoastMusician = 0;
				for pCity in pPlayer:Cities() do
					if pCity:IsHasBuilding(bMusicGuild) then
						AwardCity = pCity
					end
					if pCity:IsHasBuilding(bCaralCheck) then
						CoastMusician = CoastMusician + 1;
					end
				end
				GACoast = (CoastMusician * 100)
				AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sMusician, GACoast)
				if AwardCity ~= pCapital then
					local CapProgress = ((pCapital:GetSpecialistGreatPersonProgress(sMusician)) * 100)
					if CapProgress ~= 0 then
						pCapital:ChangeSpecialistGreatPersonProgressTimes100(sMusician, -CapProgress)	
						AwardCity:ChangeSpecialistGreatPersonProgressTimes100(sMusician, CapProgress)
					end
				end
			end
		end
	end
end)

--Irrigation

local Decisions_CaralIrrigation = {}
	Decisions_CaralIrrigation.Name = "TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_IRRIGATION"
	Decisions_CaralIrrigation.Desc = "TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_IRRIGATION_DESC"
	HookDecisionCivilizationIcon(Decisions_CaralIrrigation, "CIVILIZATION_NORTE_CHICO_MOD")
	Decisions_CaralIrrigation.Weight = nil
	Decisions_CaralIrrigation.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_NORTE_CHICO_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_CaralIrrigation") == true then
			Decisions_CaralIrrigation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_IRRIGATION_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(250 * iMod)
		Decisions_CaralIrrigation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_NORTE_CHICO_IRRIGATION_DESC", iCost)

		local NoCoastCheck = 0;
		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(bCaralCheck) then
				NoCoastCheck = NoCoastCheck + 1;
			end
		end
		if (NoCoastCheck < 2) then return true, false end	

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end

		return true, true
	end
	)
	
	Decisions_CaralIrrigation.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost);

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_CaralIrrigation", true)

		local pID = pPlayer:GetID()
		for sKey, tTable in pairs(ncHillPlots) do
			local pPlot = ncDecompilePlotID(sKey)
			if (pPlot:GetOwner() ~= -1) then
				if pPlot:GetOwner() == pID then
					if (pPlot:GetImprovementType() == iFarm) then
						if isInca then
							pPlot:SetImprovementType(-1);
							pPlot:SetImprovementType(iTerraceFarm);
						end
						if pPlot:IsRiver() then
							pPlot:SetFeatureType(fFoggoras);
						end
					end
				end
			end
		end

		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(bCaralCheck) then
				if not (pCity:IsHasBuilding(bCottonNets)) then
					pCity:SetNumRealBuilding(bCottonNets, 1);
				end
			end
		end

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_NORTE_CHICO_MOD"], "Decisions_CaralIrrigation", Decisions_CaralIrrigation)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			if load(pPlayer, "Decisions_CaralIrrigation") == true then
				for sKey, tTable in pairs(ncHillPlots) do
					local pPlot = ncDecompilePlotID(sKey)
					if (pPlot:GetOwner() ~= -1) then
						if pPlot:IsRiver() then
							if pPlot:GetFeatureType() == fFoggoras then
								if (pPlot:GetImprovementType() ~= iTerraceFarm) then		
									if (Players[pPlot:GetOwner()]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) and (Players[pPlot:GetOwner()]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ANCIENT_LIBYA_MOD) and (Players[pPlot:GetOwner()]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_HARAPPA_MOD) then											
										pPlot:SetFeatureType(-1);								
									end
								end
							end
						end
						if pPlot:GetOwner() == iPlayer then
							if (pPlot:GetImprovementType() == iFarm) then
								if isInca then
									pPlot:SetImprovementType(-1);
									pPlot:SetImprovementType(iTerraceFarm);
								end
								if pPlot:IsRiver() then
									pPlot:SetFeatureType(fFoggoras);
								end
							end
						end
					end
				end
				for pCity in pPlayer:Cities() do
					if not pCity:IsHasBuilding(bCaralCheck) then
						if not (pCity:IsHasBuilding(bCottonNets)) then
							pCity:SetNumRealBuilding(bCottonNets, 1);
						end
					end
				end
			end
		end
	end	
end)

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);

	if eImprovement == iFarm then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			if load(pPlayer, "Decisions_CaralIrrigation") == true then
				if pPlot:IsHills() then
					if isInca then
						pPlot:SetImprovementType(-1);
						pPlot:SetImprovementType(iTerraceFarm);
					end
					if pPlot:IsRiver() then
						pPlot:SetFeatureType(fFoggoras);
					end
				end
			end
		end
	end

end)

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);

	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			if pPlot:GetFeatureType() == fFoggoras then							
				pPlot:SetFeatureType(-1);								
			end
		end
	end

end)
