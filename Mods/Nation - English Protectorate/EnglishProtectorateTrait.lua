-- Policy_barracks
-- Author: User
-- DateCreated: 12/8/2014 9:54:51 PM
--------------------------------------------------------------
 function FaithFromPolicies (playerID)
	local player = Players[playerID]
	local PoliciesNum = player:GetNumPolicies()
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PROTECTORATE"] and player:IsAlive() then
		for city in player:Cities() do
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_FROM_POLICIES"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_FROM_POLICIES"], 0);
			end
			if city:IsCapital() then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_FROM_POLICIES"], math.floor(PoliciesNum/3))
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FaithFromPolicies)
 
function FaithFromMilitary (playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PROTECTORATE"] and player:IsAlive() then
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_BARRACKS"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_1"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_ARMORY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_2"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_MILITARY_ACADEMY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_FAITH_3"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FaithFromMilitary)

function FaithUnitProduction(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PROTECTORATE"] and player:IsAlive() then
		for city in player:Cities() do
			local faithproductionAmount = math.floor(player:GetTotalFaithPerTurn()/4)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_PROTECTORATE_PRODUCTION"], faithproductionAmount)
		end
	end
end
GameEvents.PlayerDoTurn.Add(FaithUnitProduction)
