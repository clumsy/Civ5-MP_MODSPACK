-- Tomatekh

print("Kievan Rus' Scripts")

-- City-State trade friendship
local pRusCSBonus = GameInfoTypes.POLICY_DNIEPER_TRADE;

GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"]) then
			if pCity:IsCapital() then
				if not pPlayer:HasPolicy(pRusCSBonus) then
					pPlayer:SetNumFreePolicies(1)
					pPlayer:SetNumFreePolicies(0)
					pPlayer:SetHasPolicy(pRusCSBonus, true);
				end
			end
		end
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"]) then
			if not pPlayer:HasPolicy(pRusCSBonus) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(pRusCSBonus, true);
			end
		end
	end
end)

-- Veche
local bVeche = GameInfoTypes.BUILDING_KIEVAN_RUS_MOD;
local bVecheCount = GameInfoTypes.BUILDING_KIEVAN_RUS_TRAIT_DUMMY_BUILDING;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"]) then
			local pcCity = pPlayer:GetCapitalCity();
			local Maintenance = 0;
			for sCity in pPlayer:Cities() do
				if (sCity:IsHasBuilding(bVecheCount)) then
					sCity:SetNumRealBuilding(bVecheCount, 0);
				end
				if (sCity:IsHasBuilding(bVeche)) then
					local BuildingCost = sCity:GetTotalBaseBuildingMaintenance();
					Maintenance = (Maintenance + BuildingCost)
				end
			end
			local Discount = math.floor(Maintenance / 5)
			pPlayer:ChangeGold(Discount);
			pcCity:SetNumRealBuilding(bVecheCount, Discount);
		end
	end
end)

-- Other teams can't capture gardens outside of freshwater
local bGARDEN = GameInfoTypes.BUILDING_GARDEN;

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local kPlot = Map.GetPlot(iX, iY);
	local kCity = kPlot:GetPlotCity();
	if kCity:IsHasBuilding(bAssembly) then
		kCity:SetNumRealBuilding(bAssembly, 0);
	end
	if kCity:IsHasBuilding(bAssemblyCount) then
		kCity:SetNumRealBuilding(bAssemblyCount, 0);
	end
	if kCity:IsHasBuilding(bGARDEN) then
		if not kPlot:IsFreshWater() then
			kCity:SetNumRealBuilding(bGARDEN, 0);
		end
	end
end)