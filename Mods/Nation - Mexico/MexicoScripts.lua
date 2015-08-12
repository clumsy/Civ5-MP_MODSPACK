-- Free Building only on Capital
local GiftBuild = "BUILDING_MEXICO_UA"
local iCiv = GameInfoTypes.CIVILIZATION_MEXICO

print ("This is the Free Building on Capital Script");

function BuildingforCap (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == iCiv) then
			for pCity in pPlayer:Cities() do
				if (pCity:IsCapital()) then
					-- Just as a funny note, there are many ways of using GameInfoTypes, don't know why I like this one.
					pCity:SetNumRealBuilding(GameInfoTypes["" .. GiftBuild .. ""], 1)
				else
					pCity:SetNumRealBuilding(GameInfoTypes["" .. GiftBuild .. ""], 0)
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(BuildingforCap);
GameEvents.PlayerCityFounded.Add(BuildingforCap);

--Garrisoned Unit Bonus

local pHappinessPromo = GameInfoTypes.PROMOTION_RURAL_HAPPINESS;
local DummyBuild = "BUILDING_RURAL_HAPPINESS"

print ("This is the Rurales Happiness Script");


function GarrisonedHappy (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes["" .. DummyBuild .. ""], 0)
			local garrisonedUnit = pCity:GetGarrisonedUnit();
			if (garrisonedUnit ~= nil and garrisonedUnit:IsHasPromotion(pHappinessPromo)) then
				pCity:SetNumRealBuilding(GameInfoTypes["" .. DummyBuild .. ""], 1)
			else
				pCity:SetNumRealBuilding(GameInfoTypes["" .. DummyBuild .. ""], 0)
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(GarrisonedHappy);
GameEvents.PlayerCityFounded.Add(GarrisonedHappy);