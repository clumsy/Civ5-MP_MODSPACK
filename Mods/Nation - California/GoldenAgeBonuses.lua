	

           
     
        local tGoldenAgeBuildings = {}
        local tGoldenAgePolicies = {}
         
        local bAnyGoldenAgeBuildings;
        local bAnyGoldenAgePolicies;
         
             local iMaxCivs = GameDefines.MAX_MAJOR_CIVS
             
        --Cache all players in game who get free buildings or policies during GA
        for i = 0, iMaxCivs - 1, 1 do
                local pPlayer = Players[i]
                            tGoldenAgeBuildings[i] = {}
                            tGoldenAgePolicies[i] = {}
                if pPlayer:IsEverAlive() then
                        leaderType = GameInfo.Leaders[pPlayer:GetLeaderType()].Type
                        leadertraitType = GameInfo.Leader_Traits("LeaderType ='" .. leaderType .. "'")().TraitType
                        for row in GameInfo.Trait_FreeBuildingDuringGoldenAge() do
                                if row.TraitType == leadertraitType then
                                        table.insert(tGoldenAgeBuildings[i], GameInfo.Buildings("Type ='" .. row.BuildingType .. "'")().ID)
                                        bAnyGoldenAgeBuildings = true
                                end
                        end
                        for row in GameInfo.Trait_FreePolicyDuringGoldenAge() do
                                if row.TraitType == leadertraitType then
                                        table.insert(tGoldenAgePolicies[i], GameInfo.Policies("Type ='" .. row.PolicyType .. "'")().ID)
                                        bAnyGoldenAgePolicies = true
                                end
                        end
                end
        end
         
        --End the script if nobody has GA buildings or policies, because then there is no reason for this script to continue
        if not bAnyGoldenAgeBuildings and not bAnyGoldenAgePolicies then
                return
        end
         
         
       function OnDoTurn(iPlayer)
            local pPlayer = Players[iPlayer]
            if pPlayer:IsEverAlive() then
                    if tGoldenAgeBuildings[iPlayer] and #tGoldenAgeBuildings[iPlayer] > 0 then
                            if pPlayer:IsGoldenAge() then
                                    for pCity in pPlayer:Cities() do
                                            for k, v in pairs(tGoldenAgeBuildings[iPlayer]) do
                                                    pCity:SetNumRealBuilding(v, 1)
                                            end
                                    end
                            else
                                    for pCity in pPlayer:Cities() do
                                            for k, v in pairs(tGoldenAgeBuildings[iPlayer]) do
                                                    pCity:SetNumRealBuilding(v, 0)
                                            end
                                    end
                            end
                    end    
                    if tGoldenAgeBuildings[iPlayer] and #tGoldenAgePolicies[iPlayer] > 0 then
                            if pPlayer:IsGoldenAge() then
                                    for k, v in pairs(tGoldenAgePolicies[iPlayer]) do
                                                                            if not pPlayer:HasPolicy(v) then
                                            pPlayer:SetNumFreePolicies(1)
                                            pPlayer:SetHasPolicy(v, true)
                                                                                    pPlayer:SetNumFreePolicies(0) end
                                                                           
                                    end
                            else
                                    for k, v in pairs(tGoldenAgePolicies[iPlayer]) do
                                                                            if pPlayer:HasPolicy(v) then
                                                                                    pPlayer:SetNumFreePolicies(1)
                                            pPlayer:SetHasPolicy(v, false)
                                                                                    pPlayer:SetNumFreePolicies(0)
                                                                            end
                                    end
                            end
                    end
            end
    end
         
        GameEvents.PlayerDoTurn.Add(OnDoTurn)
         
        function OnCityInfoDirty()
                local iPlayer = Game:GetActivePlayer()
                if Players[iPlayer]:IsTurnActive() then
                        OnDoTurn(iPlayer)
                end
        end
         
        Events.SerialEventCityInfoDirty.Add(OnCityInfoDirty)

