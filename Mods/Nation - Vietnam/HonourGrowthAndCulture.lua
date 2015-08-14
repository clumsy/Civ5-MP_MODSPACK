function GetVietnameseHonour(player)
        local numHonourPolicies = 0
        for row in GameInfo.Policies() do
            if row.PolicyBranchType == "POLICY_BRANCH_HONOR" then
                local policyType = row.Type
                if player:HasPolicy(GameInfoTypes[policyType]) then
                    numHonourPolicies = numHonourPolicies + 1
                end
            end
        end
       
    return numHonourPolicies
end
                               
function VietnameseHonour(playerID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VIETNAM"] then
        local numHonourPolicies = GetVietnameseHonour(player)
        for city in player:Cities() do
            if city:GetNumBuilding(GameInfoTypes["BUILDING_CULTURE_DUMMY"]) < numHonourPolicies then
                city:SetNumRealBuilding(GameInfoTypes["BUILDING_CULTURE_DUMMY"], numHonourPolicies)
                city:SetNumRealBuilding(GameInfoTypes["BUILDING_FOOD_DUMMY"], numHonourPolicies)
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(VietnameseHonour)