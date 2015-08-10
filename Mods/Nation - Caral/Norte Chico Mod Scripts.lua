print ("Norte Chico Scripts")

-- Stuff
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NorteChico";

local iFish = GameInfoTypes.RESOURCE_FISH;
local iCrab = GameInfoTypes.RESOURCE_CRAB;
local iWhale = GameInfoTypes.RESOURCE_WHALE;
local iPearls = GameInfoTypes.RESOURCE_PEARLS;
local iCoral = GameInfoTypes.RESOURCE_CORAL;
local iOil = GameInfoTypes.RESOURCE_OIL;

local iFishingBoat = GameInfoTypes.IMPROVEMENT_FISHING_BOATS
local iOffshorePlatform = GameInfoTypes.IMPROVEMENT_OFFSHORE_PLATFORM

local tCoast = GameInfoTypes.TERRAIN_COAST;

local fReef = GameInfoTypes.FEATURE_REEF;

local tSailing = GameInfoTypes.TECH_SAILING;
local tBiology = GameInfoTypes.TECH_BIOLOGY;
local tRefrigeration = GameInfoTypes.TECH_REFRIGERATION;

local uSettler = GameInfoTypes.UNITCLASS_SETTLER;
local uWorkBoat = GameInfoTypes.UNIT_WORKBOAT;

local pCaralAI = GameInfoTypes.POLICY_CARAL_AI_HANDICAP;

local bCaralCheck = GameInfoTypes.BUILDING_NORTE_CHICO_COAST_CHECK;

local speed = Game.GetGameSpeedType();

function ncaDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function ncaCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local ncSeaResourcePlots = {}
local ncStartingPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if (pPlot:GetResourceType() == iFish) or (pPlot:GetResourceType() == iCrab) or (pPlot:GetResourceType() == iWhale) or (pPlot:GetResourceType() == iPearls) or (pPlot:GetResourceType() == iCoral) or (pPlot:GetResourceType() == iOil) then
		if pPlot:IsWater() then
			if (pPlot:GetFeatureType() ~= fReef) then
				local sKey = ncaCompilePlotID(pPlot)
				ncSeaResourcePlots[sKey] = -1
			end
		end
    end
end

-- Plantation Production
local iPlantation = GameInfoTypes.IMPROVEMENT_PLANTATION;

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);

	if eImprovement == iPlantation then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
						
			local CoastCheck = 0;
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(bCaralCheck) then
					CoastCheck = 1;
					break
				end
			end
			if CoastCheck >= 1 then

				HsaveX = pPlot:GetX()
				HsaveY = pPlot:GetY()
										
				if (load(pPlayer, "CaralPlantation" .. HsaveX .. "xy" .. HsaveY .. "bool") ~= true) then

					local BetterNets = 0;
					if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
						BetterNets = 13;
						WonderHandicap = 10;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
						BetterNets = 20;
						WonderHandicap = 15;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
						BetterNets = 30;
						WonderHandicap = 22;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
						BetterNets = 60;
						WonderHandicap = 45;
					else
						BetterNets = 60;
						WonderHandicap = 45;
					end

					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(bCaralCheck) then

							if pCity:GetProductionBuilding() ~= -1 then

								local Building = pCity:GetProductionBuilding();
								local BClass = GameInfo.Buildings[Building].BuildingClass
								local BType = GameInfo.Buildings[Building].Type
								local BWonder = GameInfo.BuildingClasses["" .. BClass .. ""].MaxGlobalInstances
								local BNational = GameInfo.BuildingClasses["" .. BClass .. ""].MaxPlayerInstances

								if (BWonder == -1) and (BNational == -1) then
									pCity:ChangeProduction(BetterNets)
								else
									pCity:ChangeProduction(WonderHandicap)
								end

							elseif pCity:GetProductionBuilding() == -1 then
								pCity:ChangeProduction(BetterNets)
							end

						end
					end

					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
						Events.GameplayAlertMessage("You can now produce better fishing nets, boosting [ICON_PRODUCTION] Production in all Coastal Cities by " .. BetterNets .. "!");
					end

					HsaveX = pPlot:GetX()
					HsaveY = pPlot:GetY()

					save(pPlayer, "CaralPlantation" .. HsaveX .. "xy" .. HsaveY .. "bool", true)

				elseif (load(pPlayer, "CaralPlantation" .. HsaveX .. "xy" .. HsaveY .. "bool") == true) then

					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
						Events.GameplayAlertMessage("This Plantation has already exported materials to the coast.");
					end

				end

			end

		end
	end
end)

-- Shicra Culture
local bShicraPyramid = GameInfoTypes.BUILDING_NORTE_CHICO_MOD;

--[[
GameEvents.CityConstructed.Add(
function(player, city, building)
	local pPlayer = Players[player]
	local pCity = pPlayer:GetCityByID(city)

	local BClass = GameInfo.Buildings[building].BuildingClass
	local BDefault = GameInfo.BuildingClasses["" .. BClass .. ""].DefaultBuilding

	local ncPlayer;
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if (oPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			ncPlayer = oPlayer;
			break
		end
	end

	if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
		
		if (load(ncPlayer, "Buildings:" .. BDefault .. "bool") ~= true) then
			save(ncPlayer, "Buildings:" .. BDefault .. "bool", true)
		end

	elseif (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then

		if (building ~= bShicraPyramid) and (pCity:IsHasBuilding(bShicraPyramid)) then

			if (load(ncPlayer, "Buildings:" .. BDefault .. "bool") ~= true) then

				local BCost = GameInfo.Buildings[building].Cost
				local BWonder = GameInfo.BuildingClasses["" .. BClass .. ""].MaxGlobalInstances
				local BNational = GameInfo.BuildingClasses["" .. BClass .. ""].MaxPlayerInstances

				if BCost ~= -1 then

					local WonderMult = 2;
					if (BWonder == -1) and (BNational == -1) then
						WonderMult = 1;
					end

					local ShicraCulture = 0;
					if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
						ShicraCulture = 10;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
						ShicraCulture = 15;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
						ShicraCulture = 25;
					elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
						ShicraCulture = 50;
					else
						ShicraCulture = 50;
					end

					local BCulture = (ShicraCulture * WonderMult)

					pPlayer:ChangeJONSCulture(BCulture)

					if (pPlayer:IsHuman()) and (player == Game.GetActivePlayer()) then
						Events.GameplayAlertMessage("Constructing a " .. Locale.ConvertTextKey(GameInfo.Buildings[building].Description) .. " in the City of " .. Locale.ConvertTextKey(pCity:GetName()) .. " has provided " .. BCulture .. " [ICON_CULTURE] Culture!");
					end

				end
			end 
		end
	end
end)
--]]

--AI
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_NORTE_CHICO_MOD"]) then
			if not (pPlayer:IsHuman()) then
				if pCity:IsCapital() then
					if not pPlayer:HasPolicy(pCaralAI) then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(pCaralAI, true);
					end
				end
			end
		end
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();

    if (pPlayer:IsAlive()) then	
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
			if not (pPlayer:IsHuman()) then		

				if Teams[pTeam]:GetAtWarCount(true) == 0 then

					for sKey, tTable in pairs(ncSeaResourcePlots) do
						local pPlot = ncaDecompilePlotID(sKey)
					
						if pPlot:GetOwner() ~= -1 then
							if pPlot:GetOwner() == iPlayer then	
								if (pPlot:GetResourceType() ~= iOil) then
									if (pPlot:GetResourceType() ~= -1) then
										if (pPlot:GetImprovementType() == -1) then
											pPlot:SetImprovementType(iFishingBoat);
										end
									end
								elseif (pPlot:GetResourceType() == iOil) then
									if (Teams[pTeam]:IsHasTech(tBiology)) and (Teams[pTeam]:IsHasTech(tRefrigeration)) then
										if (pPlot:GetImprovementType() == -1) then
											pPlot:SetImprovementType(iOffshorePlatform);
										end
									end
								end
							end
						end

					end
				end
			end
		end
	end

end)

--Fish Start
function CaralBonusFish(pPlayer)
	local Replace = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsWater() and (pPlot:GetResourceType() ~= -1) then
			local plotResource = pPlot:GetResourceType(); 
			if (GameInfo.Resources[plotResource].Happiness == 0) and (GameInfo.Resources[plotResource].AIObjective == 0) then
				pPlot:SetResourceType(-1);	
				Replace = Replace + 1;
				print ("Removed 1 Bonus")
				break
			end
		end
	end
	if Replace == 1 then
		for sKey, tTable in pairs(ncStartingPlots) do
			local pPlot = ncaDecompilePlotID(sKey)
			if not pPlot:IsLake() and (pPlot:GetFeatureType() ~= fReef) then
				if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() == -1) then
					pPlot:SetResourceType(iFish, 1);	
					local sKey = ncaCompilePlotID(pPlot)
					ncSeaResourcePlots[sKey] = -1
					print ("Added 1 Fish")	
					Replace = 0;									
					break
				end
			end
		end	
	end	
end

function CaralLuxuryFish(pPlayer)
	local Replace = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsWater() and (pPlot:GetResourceType() ~= -1) then
			local plotResource = pPlot:GetResourceType(); 
			if (GameInfo.Resources[plotResource].Happiness > 0) then
				pPlot:SetResourceType(-1);
				Replace = Replace + 1;
				print ("Removed 1 Luxury")	
				break
			end
		end
	end
	if Replace == 1 then
		for sKey, tTable in pairs(ncStartingPlots) do
			local pPlot = ncaDecompilePlotID(sKey)
			if not pPlot:IsLake() and (pPlot:GetFeatureType() ~= fReef) then
				if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() == -1) then
					pPlot:SetResourceType(iCrab, 1);				
					local sKey = ncaCompilePlotID(pPlot)
					ncSeaResourcePlots[sKey] = -1
					print ("Added 1 Crab")	
					Replace = 0;							
					break
				end
			end
		end		
	end
end				
								
function CaralAddFish(pPlayer)
	local BonusCheck = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsWater() and (pPlot:GetResourceType() ~= -1) then
			local plotResource = pPlot:GetResourceType(); 
			if (GameInfo.Resources[plotResource].Happiness == 0) and (GameInfo.Resources[plotResource].AIObjective == 0) then
				BonusCheck = BonusCheck + 1;
			end
		end
	end
	if (BonusCheck >= 1) then
		CaralBonusFish(pPlayer)
	end
end

function CaralAddCrab(pPlayer)
	local LuxuryCheck = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsWater() and (pPlot:GetResourceType() ~= -1) then
			local plotResource = pPlot:GetResourceType(); 
			if (GameInfo.Resources[plotResource].Happiness > 0) then
				LuxuryCheck = LuxuryCheck + 1;
			end
		end
	end
	if (LuxuryCheck >= 1) then
		CaralLuxuryFish(pPlayer)
	end
end

function CaralCheckFish(pPlayer)
	local WaterCheck = 0;
	local FishCheck = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsLake() and (pPlot:GetFeatureType() ~= fReef) then
			if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() == -1) then
				WaterCheck = WaterCheck + 1;
			end
			if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() ~= -1) then
				if (pPlot:GetResourceType() ~= iOil) then
					FishCheck = FishCheck + 1;
				end
			end
		end
	end
	if (FishCheck == 0) and (WaterCheck >= 1) then
		CaralAddFish(pPlayer)
	end
	if (FishCheck >= 1) then
		print ("Sea Resources Present")	
	end
	if (WaterCheck == 0) then
		print ("Full Inland Start")	
	end
end

function CaralCheckCrab(pPlayer)
	local WaterCheck = 0;
	local FishCheck = 0;
	for sKey, tTable in pairs(ncStartingPlots) do
		local pPlot = ncaDecompilePlotID(sKey)
		if not pPlot:IsLake() and (pPlot:GetFeatureType() ~= fReef) then
			if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() == -1) then
				WaterCheck = WaterCheck + 1;
			end
			if (pPlot:GetTerrainType() == tCoast) and (pPlot:GetResourceType() ~= -1) then
				if (pPlot:GetResourceType() ~= iOil) then
					FishCheck = FishCheck + 1;
				end
			end
		end
	end
	if (FishCheck == 1) and (WaterCheck >= 1) then
		CaralAddCrab(pPlayer)
	end
	if (FishCheck >= 2) then
		print ("Sea Resources Present Plus")	
	end
end
	
function CaralStartPlots(pPlayer)
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == uSettler then
			local uPlot = pUnit:GetPlot();
			local plotX = uPlot:GetX();
			local plotY = uPlot:GetY();
			local iRange = 3;
			for iDX = -iRange, iRange do
				for iDY = -iRange, iRange do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
					if pTargetPlot then			
						local pPlot = pTargetPlot
						local sKey = ncaCompilePlotID(pPlot)
						ncStartingPlots[sKey] = -1
					end
				end
			end
		end
	end
end	
								
function CaralFishScript()
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[mPlayer];
		if pPlayer:IsAlive() then
			if pPlayer:GetNumCities() < 1 then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
					print ("Caral Resource Shuffle")
					CaralStartPlots(pPlayer)
					CaralCheckFish(pPlayer)
					CaralCheckCrab(pPlayer)
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(CaralFishScript)

--Embark
function CaralAndeanEmbark()
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[mPlayer];
		if pPlayer:IsAlive() then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
				pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_ANDEAN_EMBARK")
			end
		end
	end 
end
Events.LoadScreenClose.Add(CaralAndeanEmbark)

--AI

GameEvents.TeamSetHasTech.Add(
function(iTeam, iTech, bAdopted) 
	if (iTech == tSailing) then
		local gPlayer = 0;
		local pTeam = 0;
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:IsAlive()) then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD) then
					if not (pPlayer:IsHuman()) then
						gPlayer = pPlayer;
						pTeam = pPlayer:GetTeam();
					end
				end
			end
		end
		if pTeam == iTeam then
			for gCity in gPlayer:Cities() do
				if gCity:IsHasBuilding(bCaralCheck) then
					gUnit = gPlayer:InitUnit(uWorkBoat, gCity:GetX(), gCity:GetY(), UNITAI_WORKER_SEA);
					gUnit:JumpToNearestValidPlot();
					gwUnit = gPlayer:InitUnit(uWorkBoat, gCity:GetX(), gCity:GetY(), UNITAI_WORKER_SEA);
					gwUnit:JumpToNearestValidPlot();
					break
				end
			end
		end
	end
end)
