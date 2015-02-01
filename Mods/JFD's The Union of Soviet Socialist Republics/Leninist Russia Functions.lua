-- Leninist Russia Functions
-- Author: JFD
-- DateCreated: 4/19/2014 1:40:04 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- JFD_AddBuilding
--------------------------------------------------------------------------------------------------------------------------
function JFD_AddBuilding(player, city, buildingType, num)
	if city:GetNumBuilding(GameInfoTypes[buildingType]) ~= num then
		city:SetNumRealBuilding(GameInfoTypes[buildingType], math.min(15, num))
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RemoveBuilding
--------------------------------------------------------------------------------------------------------------------------
function JFD_RemoveBuilding(player, city, buildingType)
	if city:IsHasBuilding(GameInfoTypes[buildingType]) then
		city:SetNumRealBuilding(GameInfoTypes[buildingType], 0)
	end
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- JFD_LeninSocialism
--------------------------------------------------------------------------------------------------------------------------
print("The Soviet Union...")

function JFD_LeninSocialism(playerID)
	local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_USSR_LENIN"] then 
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_LENIN_COMMISSARIAT"]) then
				local cityProduction = city:GetYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) 
				JFD_AddBuilding(player, city, "BUILDING_JFD_LENIN_FOOD", math.min(20, cityProduction))
			else
				JFD_RemoveBuilding(player, city, "BUILDING_JFD_LENIN_FOOD")
			end

			local plot = city:Plot()
			local workerPresent = false
			for i = 0, plot:GetNumUnits() - 1 do
				if plot:GetUnit(i):GetUnitType() == GameInfoTypes["UNIT_JFD_LENIN_WORKER"] or plot:GetUnit(i):GetUnitType() == GameInfoTypes["UNIT_WORKER"] then
					workerPresent = true
				end
			end

			if workerPresent then
				JFD_AddBuilding(player, city, "BUILDING_JFD_WORKER_PRODUCTION", 1)
			else
				JFD_RemoveBuilding(player, city, "BUILDING_JFD_WORKER_PRODUCTION")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_LeninSocialism)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_LeninWorker
--------------------------------------------------------------------------------------------------------------------------
function JFD_LeninTraining(playerID, unitID)
	local player = Players[playerID]
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_USSR_LENIN"] and unitID == GameInfoTypes["UNIT_JFD_LENIN_WORKER"] then 
		if player:IsHuman() then
			return 
		end
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_LeninTraining)

function JFD_LeninWorker(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:IsHuman() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_USSR_LENIN"] then 
       	 if player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_WORKER"] then
			if player:IsPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]) or player:IsPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_FREEDOM"]) or player:IsPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_ORDER"]) then
				unit = player:GetUnitByID(unitID)
				local newUnit
				newUnit = player:InitUnit(GameInfoTypes["UNIT_JFD_LENIN_WORKER"], unit:GetX(), unit:GetY())
				
				newUnit:Convert(unit)
				if newUnit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_LENIN_WORKER"]) then
					newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_LENIN_WORKER"], false)
				end
			end
         end
    end
end
Events.SerialEventUnitCreated.Add(JFD_LeninWorker)

function JFD_IdeologyAdoption(playerID, policyTypeID)
	local player = Players[playerID]
	local policyLevel = GameInfo.Policies[policyTypeID].Level
	if policyLevel == 1 and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_USSR_LENIN"] then
		for unit in player:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_WORKER"] then
				local newUnit
				newUnit = player:InitUnit(GameInfoTypes["UNIT_JFD_LENIN_WORKER"], unit:GetX(), unit:GetY())
				
				newUnit:Convert(unit)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_IdeologyAdoption)
--==========================================================================================================================
--==========================================================================================================================