print("Harappa Scripts")

-- Aqueduct Stuff

local bAqueduct = GameInfoTypes.BUILDING_AQUEDUCT
local bSewer = GameInfoTypes.BUILDING_HARAPPA_DRAIN
local bDummyAqueduct = GameInfoTypes.BUILDING_HARAPPA_DUMMY_FOOD
local bDummyHappy = GameInfoTypes.BUILDING_HARAPPA_DUMMY_HAPPY
local hTrade = GameInfoTypes.BUILDING_HARAPPA_DUMMY_TRAIT;
local uCaravan = GameInfoTypes.UNIT_CARAVAN;
local uScout = GameInfoTypes.UNIT_SCOUT;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			local cPlot = pCity:Plot()

			if (pCity:GetNumFreeBuilding(bAqueduct) > 0) then
				if (pCity:IsHasBuilding(bSewer)) then 
					pCity:SetNumRealBuilding(bSewer, 0);
				end
				if (pCity:IsHasBuilding(bDummyAqueduct)) then 
					pCity:SetNumRealBuilding(bDummyAqueduct, 0);
				end
				if (pCity:IsHasBuilding(bDummyHappy)) then 
					pCity:SetNumRealBuilding(bDummyHappy, 0);
				end
			end

			if (pCity:IsHasBuilding(bDummyAqueduct)) then 
				if not (pCity:IsHasBuilding(bSewer)) then 
					pCity:SetNumRealBuilding(bDummyAqueduct, 0);
				end
			end
			if (pCity:IsHasBuilding(bSewer)) then
				if not (pCity:IsHasBuilding(bDummyAqueduct)) then 
					pCity:SetNumRealBuilding(bDummyAqueduct, 1);
				end
			end

			if (pCity:IsHasBuilding(bDummyHappy)) then 
				if not (pCity:IsHasBuilding(bSewer)) then 
					pCity:SetNumRealBuilding(bDummyHappy, 0);
				end
			end
			if (pCity:IsHasBuilding(bSewer)) then 
				if not (cPlot:IsRiver()) then
					if not (pCity:IsHasBuilding(bDummyHappy)) then 
						pCity:SetNumRealBuilding(bDummyHappy, 1);
					end
				end
			end

		end
	end
end)

-- Capitals
local uSettler = GameInfoTypes.UNIT_SETTLER;

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if pCity:IsOriginalCapital() then
			for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
				local oPlayer = Players[oPlayer];
				if (oPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HARAPPA_MOD"]) then
					local oTeam = oPlayer:GetTeam();

					local oPlot = 0;
					if (oPlayer:GetNumCities() < 1) then
						for oUnit in oPlayer:Units() do
							if (oUnit:GetUnitType() == uSettler) then
								oPlot = oUnit:GetPlot();
								break
							end
						end
					elseif (oPlayer:GetNumCities() >= 1) then
						local ocCity = oPlayer:GetCapitalCity();
						oPlot = ocCity:Plot();
					end

					iDistance = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), oPlot:GetX(), oPlot:GetY());
					if iDistance <= 25 then
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
							pPlot:SetRevealed(oTeam, true);
							adjPlot:SetRevealed(oTeam, true);
						end
					end

				end
			end
		end
	end
end)

-- Free Trade
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HARAPPA_MOD) then
			if pCity:IsCapital() then
				pCity:SetNumRealBuilding(hTrade, 1);
				pUnit = pPlayer:InitUnit(uCaravan, pCity:GetX(), pCity:GetY(), UNITAI_TRADE_UNIT);
				
				if not (pPlayer:IsHuman()) then
					for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
						local tPlayer = Players[i];
						if (tPlayer:GetMinorCivTrait() ~= MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS) then
							local tTeam = tPlayer:GetTeam();
							if pTeam ~= tTeam then
								Teams[pTeam]:Meet(tTeam, true)
								break;
							end
						end
					end							
				end

			end
		end
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HARAPPA_MOD) then
			for pCity in pPlayer:Cities() do
				if pCity:IsCapital() then
					if not (pCity:GetNumBuilding(hTrade) > 0) then
						pCity:SetNumRealBuilding(hTrade, 1);
					end
				end
			end
		end
	end
end)

--AI
local bWELOVE = GameInfoTypes.BUILDING_HARAPPA_KING_DAY_DUMMY;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HARAPPA_MOD) then
			if not (pPlayer:IsHuman()) then
				for pCity in pPlayer:Cities() do
					if (pCity:GetWeLoveTheKingDayCounter() == 19) then
						pCity:SetNumRealBuilding(bWELOVE, 1)
					end
					if (pCity:GetWeLoveTheKingDayCounter() == 1) and (pCity:GetNumBuilding(bWELOVE) > 0) then
						pCity:SetNumRealBuilding(bWELOVE, 0)
						pCity:ChangeWeLoveTheKingDayCounter(10)
					end
				end
			end
		end
	end
end)