      
 
    local tWarPolicies = {}
     
    local bAnyWarPolicies;
     
         local iMaxCivs = GameDefines.MAX_MAJOR_CIVS
         
    --Cache all players in game who get free buildings or policies during GA
    for i = 0, iMaxCivs - 1, 1 do
            local pPlayer = Players[i]
                        tWarPolicies[i] = {}
            if pPlayer:IsEverAlive() then
                    leaderType = GameInfo.Leaders[pPlayer:GetLeaderType()].Type
                    leadertraitType = GameInfo.Leader_Traits("LeaderType ='" .. leaderType .. "'")().TraitType
                    for row in GameInfo.Trait_FreePolicyDuringWar() do
                            if row.TraitType == leadertraitType then
                                    table.insert(tWarPolicies[i], GameInfo.Policies("Type ='" .. row.PolicyType .. "'")().ID)
                                    bAnyWarPolicies = true
                            end
                    end
            end
    end
     
    --End the script if nobody has war policies, because then there is no reason for this script to continue
    if not bAnyWarPolicies then
            return
    end
 
    function OnDoTurn(iPlayer)
                if iPlayer < iMaxCivs then
                        local pPlayer = Players[iPlayer]
                        if pPlayer:IsEverAlive() then
                                if #tWarPolicies[iPlayer] > 0 then
                                        local pTeam = Teams[pPlayer:GetTeam()]
                                        local bAtWarAnyMajor;
                                        for i = 0, iMaxCivs - 1, 1 do
                                                if pTeam:IsAtWar(Players[i]:GetTeam()) and Players[i]:IsAlive() then
                                                        bAtWarAnyMajor = true
                                                        break
                                                end
                                        end
                                        if bAtWarAnyMajor then
                                                for k, v in pairs(tWarPolicies[iPlayer]) do
                                                        if not pPlayer:HasPolicy(v) then
                                                                pPlayer:SetNumFreePolicies(1)
                                                                pPlayer:SetHasPolicy(v, true)
                                                                pPlayer:SetNumFreePolicies(0)
                                                        end
                                                end
                                        else
                                                for k, v in pairs(tWarPolicies[iPlayer]) do
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
    end
       
    GameEvents.PlayerDoTurn.Add(OnDoTurn)
       
        function OnCityInfoDirty()
                local iPlayer = Game:GetActivePlayer()
                if Players[iPlayer]:IsTurnActive() then
                                OnDoTurn(iPlayer)
                end
    end
     
    Events.SerialEventCityInfoDirty.Add(OnCityInfoDirty)
       
       
       
       
       
       
        --REBELYELL promotion stuff -- this isn't extensible like the other code since it would require SaveUtils
       
        local iRebelYell4Turns = GameInfoTypes.PROMOTION_CSA_REBELYELL_4
        local iRebelYell3Turns = GameInfoTypes.PROMOTION_CSA_REBELYELL_3
        local iRebelYell2Turns = GameInfoTypes.PROMOTION_CSA_REBELYELL_2
        local iRebelYell1Turns = GameInfoTypes.PROMOTION_CSA_REBELYELL_1
        local iCSAType = GameInfoTypes.CIVILIZATION_CSA
       
        local iMelee = GameInfoTypes.UNITCOMBAT_MELEE
        local iGun = GameInfoTypes.UNITCOMBAT_GUN
       
        local tCSAPlayers = {}
       
    for i = 0, iMaxCivs - 1, 1 do
                local pPlayer = Players[i]
                if pPlayer:GetCivilizationType() == iCSAType then
                        tCSAPlayers[i] = true
                end
        end
       
       
        function OnWarStateChanged(iTeam1, iTeam2, bWar)
                local tCSAPlayersChecked = {}
                for k, v in pairs(tCSAPlayers) do
                        local iTestTeam = Players[k]:GetTeam()
                        if iTestTeam == iTeam1 or iTestTeam == iTeam2 then
                                tCSAPlayersChecked[k] = true
                        end
                end
                for k, v in pairs(tCSAPlayersChecked) do
                        local pPlayer = Players[k]
                        if not bWar then
                                --check if still at war with anyone else
                                local pTeam = Teams[pPlayer:GetTeam()]
                                local bAtWarAnyMajor;
                                for i = 0, iMaxCivs - 1, 1 do
                                        if pTeam:IsAtWar(Players[i]:GetTeam()) then
                                                bAtWarAnyMajor = true
                                                break
                                        end
                                end
                                if not bAtWarAnyMajor then
                                        for pUnit in Players[k]:Units() do
                                                local iType = pUnit:GetUnitCombatType()
                                                if iType == iMelee or iType == iGun then
                                                        pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                                        pUnit:SetHasPromotion(iRebelYell3Turns, false)
                                                        pUnit:SetHasPromotion(iRebelYell2Turns, false)
                                                        pUnit:SetHasPromotion(iRebelYell1Turns, false)
                                                end                                            
                                        end
                                end
                        else
                                --If it is NOT the CSA player's turn, use the 4 turn promotion (which will automatically decrement when it becomes the CSA player's turn)
                                --If it IS the CSA player's turn, they get the 3 turn promotion
                                --This way they always get 3 turns of attacking with the promo active
                                local iPromo;
                                if not pPlayer:IsTurnActive() then
                                        iPromo = iRebelYell4Turns
                                else
                                        iPromo = iRebelYell3Turns
                                end
                                for pUnit in pPlayer:Units() do
                                        local iType = pUnit:GetUnitCombatType()
                                        if iType == iMelee or iType == iGun then
                                                pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                                pUnit:SetHasPromotion(iRebelYell3Turns, false)
                                                pUnit:SetHasPromotion(iRebelYell2Turns, false)
                                                pUnit:SetHasPromotion(iRebelYell1Turns, false)
                                                pUnit:SetHasPromotion(iPromo, true)
                                        end
                                end
                        end
                end
        end
       
        Events.WarStateChanged.Add(OnWarStateChanged)
       
       
        function OnDoTurnCSAAbility(iPlayer)
                if tCSAPlayers[iPlayer] then
                        local pPlayer = Players[iPlayer]
                        for pUnit in pPlayer:Units() do
                                if pUnit:IsHasPromotion(iRebelYell4Turns) then
                                        pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell3Turns, true)
                                        pUnit:SetHasPromotion(iRebelYell2Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell1Turns, false)
                                elseif pUnit:IsHasPromotion(iRebelYell3Turns) then
                                        pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell3Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell2Turns, true)
                                        pUnit:SetHasPromotion(iRebelYell1Turns, false)
                                elseif pUnit:IsHasPromotion(iRebelYell2Turns) then
                                        pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell3Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell2Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell1Turns, true)          
                                elseif pUnit:IsHasPromotion(iRebelYell1Turns) then
                                        pUnit:SetHasPromotion(iRebelYell4Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell3Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell2Turns, false)
                                        pUnit:SetHasPromotion(iRebelYell1Turns, false)
                                end
                        end
                end
        end
       
        GameEvents.PlayerDoTurn.Add(OnDoTurnCSAAbility)
       
        function OnCityInfoDirtyCSAAbility()
                local iPlayer = Game:GetActivePlayer()
                if Players[iPlayer]:IsTurnActive() and tCSAPlayers[iPlayer] then
                                OnDoTurnCSAAbility(iPlayer)
                end
    end
     
    Events.SerialEventCityInfoDirty.Add(OnCityInfoDirtyCSAAbility)
       
       
        function OnSetXYCSAAbility(iPlayer, iUnit, iX, iY)
                if iX > 0 and iY > 0 and tCSAPlayers[iPlayer] then
                        local pPlayer = Players[iPlayer]
                        local pUnit = pPlayer:GetUnitByID(iUnit)
                        local iThisTurn = Game:GetGameTurn()
                        if pUnit:GetGameTurnCreated() == iThisTurn then
                                if not pUnit:IsHasPromotion(iRebelYell4Turns) and not pUnit:IsHasPromotion(iRebelYell3Turns) and not pUnit:IsHasPromotion(iRebelYell2Turns) and not pUnit:IsHasPromotion(iRebelYell1Turns) then
                                        --We will loop through units until we find the first Melee or Gun Unit which wasn't created this turn, and set the promotion according to what it has. Then we end the function to reduce overhead.
                                        for pLoopUnit in pPlayer:Units() do
                                                if pLoopUnit ~= pUnit and pLoopUnit:GetGameTurnCreated() ~= iThisTurn then
                                                        local iType = pUnit:GetUnitCombatType()
                                                        if iType == iMelee or iType == iGun then
                                                                if pLoopUnit:IsHasPromotion(iRebelYell4Turns) then
                                                                        pUnit:SetHasPromotion(iRebelYell4Turns, true)
                                                                elseif pLoopUnit:IsHasPromotion(iRebelYell3Turns) then
                                                                        pUnit:SetHasPromotion(iRebelYell3Turns, true)
                                                                elseif pLoopUnit:IsHasPromotion(iRebelYell2Turns) then
                                                                        pUnit:SetHasPromotion(iRebelYell2Turns, true)
                                                                elseif pLoopUnit:IsHasPromotion(iRebelYell1Turns) then
                                                                        pUnit:SetHasPromotion(iRebelYell1Turns, true)  
                                                                end
                                                                return
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
       
        GameEvents.UnitSetXY.Add(OnSetXYCSAAbility)