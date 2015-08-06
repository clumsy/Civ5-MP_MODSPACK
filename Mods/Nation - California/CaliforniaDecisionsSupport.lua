	

    -- CaliforniaDecisions
    -- Author: Vicevirtuoso
    --------------------------------------------------------------
     
    --------------------------------------------------------------------------------------------------------------------------------------------
    --Decision 1: Develop Hydraulic Mining
    --------------------------------------------------------------------------------------------------------------------------------------------
     
    local Decisions_CaliforniaHydraulicMining = {}
            Decisions_CaliforniaHydraulicMining.Name = "TXT_KEY_DECISIONS_CALIFORNIA_MINING"
            Decisions_CaliforniaHydraulicMining.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_MINING_DESC")
            HookDecisionCivilizationIcon(Decisions_CaliforniaHydraulicMining, "CIVILIZATION_CALIFORNIA")
            Decisions_CaliforniaHydraulicMining.CanFunc = (
            function(pPlayer)
                    if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALIFORNIA) then
                            return false, false
                    end
                   
                    if not pPlayer:GetCapitalCity() then return false, false end
                   
                    if load(pPlayer, "Decisions_CaliforniaHydraulicMining") then
                            Decisions_CaliforniaHydraulicMining.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_MINING_ENACTED_DESC")
                            return false, false, true
                    end
                   
                    local iGoldCost = math.ceil(800 * iMod)
                    local iScienceCost = math.ceil(200 * iMod)
                    Decisions_CaliforniaHydraulicMining.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_MINING_DESC", iGoldCost, iScienceCost)
                   
                    if pPlayer:GetGold() < iGoldCost then return true, false end
                   
                    if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
                   
                    if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL then return true, false end
                   
                    local pTeam = Teams[pPlayer:GetTeam()]
                    local pTeamTechs = pTeam:GetTeamTechs()
                   
                    if pTeamTechs:GetResearchProgress(pPlayer:GetCurrentResearch()) < iScienceCost then
                            return true, false
                    else
                            return true, true
                    end
     
            end
            )
           
            Decisions_CaliforniaHydraulicMining.DoFunc = (
            function(pPlayer)
                    local iGoldCost = math.ceil(800 * iMod)
                    local iScienceCost = math.ceil(200 * iMod)
                    pPlayer:ChangeGold(-iGoldCost)
                    pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
                    LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), -iScienceCost)
                   
                    pPlayer:ChangeGoldenAgeTurns(pPlayer:GetGoldenAgeLength())
                   
                    local iNumGold = 2
                    if Game.Rand(2, "California Decision Random Gold Amount Roll") >= 1 then
                            iNumGold = 3
                    end
                   
                    local pCapital = pPlayer:GetCapitalCity()
                    local iNumPlots = pCapital:GetNumCityPlots()
                    local EmptyHillPlots = {}
                    local EmptyNotHillPlots = {}
                   
                    for iPlot = 0, iNumPlots - 1 do
                            local pPlot = pCapital:GetCityIndexPlot(iPlot)
                            if pPlot and pPlot:GetResourceType() > -1 and Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCapital:GetX(), pCapital:GetY()) <= 3 then
                                    if not pPlot:IsWater() and not pPlot:IsImpassable() and not pPlot:IsMountain() and not pPlot:IsCity() then
                                            if pPlot:IsHills() then
                                                    EmptyHillPlots[#EmptyHillPlots + 1] = pPlot
                                            else
                                                    EmptyNotHillPlots[#EmptyNotHillPlots + 1] = pPlot
                                            end
                                    end
                            end
                    end
                   
                    --Try to spawn it on hills first
                   
                    for k, pPlot in pairs(EmptyHillPlots) do
                            pPlot:SetResourceType(GameInfoTypes.RESOURCE_GOLD, 1)
                            iNumGold = iNumGold - 1
                            if iNumGold <= 0 then break end
                    end
                   
                    if iNumGold > 0 then
                            for k, pPlot in pairs(EmptyNotHillPlots) do
                                    pPlot:SetResourceType(GameInfoTypes.RESOURCE_GOLD, 1)
                                    iNumGold = iNumGold - 1
                                    if iNumGold <= 0 then break end
                            end
                    end
                   
                    save(pPlayer, "Decisions_CaliforniaHydraulicMining", true)
            end
            )
     
    Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CALIFORNIA, "Decisions_CaliforniaHydraulicMining", Decisions_CaliforniaHydraulicMining)
     
     
     
    --------------------------------------------------------------------------------------------------------------------------------------------
    --Decision 2: Build the Pacific Coast Highway
    --------------------------------------------------------------------------------------------------------------------------------------------
    local Decisions_CaliforniaHighway = {}
            Decisions_CaliforniaHighway.Name = "TXT_KEY_DECISIONS_CALIFORNIA_HIGHWAY"
            Decisions_CaliforniaHighway.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_HIGHWAY_DESC")
            HookDecisionCivilizationIcon(Decisions_CaliforniaHighway, "CIVILIZATION_CALIFORNIA")
            Decisions_CaliforniaHighway.CanFunc = (
            function(pPlayer)
                    if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CALIFORNIA) then
                            return false, false
                    end
                   
                    if not pPlayer:GetCapitalCity() then return false, false end
                   
                    if load(pPlayer, "Decisions_CaliforniaHighway") == true then
                            Decisions_CaliforniaHighway.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_HIGHWAY_ENACTED_DESC")
                            return false, false, true
                    end
     
                    local iCost = math.ceil(1000 * iMod)
                    Decisions_CaliforniaHighway.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CALIFORNIA_HIGHWAY_DESC", iCost)
                   
                    if pPlayer:GetGold() < iCost then return true, false end
     
                    if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
     
     
                    local pTeam = Teams[pPlayer:GetTeam()]
                    local pTeamTechs = pTeam:GetTeamTechs()
                   
                    if not pTeamTechs:HasTech(GameInfoTypes.TECH_DYNAMITE) then return true, false end
                   
                    for pUnit in pPlayer:Units() do
                            if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_ENGINEER then
                                    return true, true
                            end
                    end
     
                    return true, false
            end
            )
           
            Decisions_CaliforniaHighway.DoFunc = (
            function(pPlayer)
                    local iCost = math.ceil(1000 * iMod)
                    pPlayer:ChangeGold(-iCost)
                    pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
                    for pUnit in pPlayer:Units() do
                            if pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_ENGINEER then
                                    GameEvents.GreatPersonExpended.Call(pPlayer:GetID(), pUnit:GetID(), pUnit:GetUnitType(), pUnit:GetX(), pUnit:GetY())
                                    pUnit:Kill(true)
                                    break
                            end
                    end
                   
                    save(pPlayer, "Decisions_CaliforniaHighway", true)
                   
                    VV_DoRefreshCaliforniaHighway(pPlayer:GetID())
                    Events.SerialEventCityInfoDirty()
            end
            )
           
            Decisions_CaliforniaHighway.Monitors = {}
            Decisions_CaliforniaHighway.Monitors[GameEvents.PlayerDoTurn] =  VV_DoRefreshCaliforniaHighway
           
    Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CALIFORNIA, "Decisions_CaliforniaHighway", Decisions_CaliforniaHighway)
     
     
    function VV_DoRefreshCaliforniaHighway(iPlayer)
            local pPlayer = Players[iPlayer]
            if load(pPlayer, "Decisions_CaliforniaHighway") == true then
                    local iNumCoastRoads = 0
                    local iNumConnections = 0
                    for pCity in pPlayer:Cities() do
                            local iNumPlots = pCity:GetNumCityPlots();
                            for iPlot = 0, iNumPlots - 1 do
                                    local pPlot = pCity:GetCityIndexPlot(iPlot)
                                    if pPlot then
                                            if pPlot:GetOwner() == pPlayer:GetID() then
                                                    if pPlot:IsRoute() and pPlot:IsCoastalLand() then
                                                            iNumCoastRoads = iNumCoastRoads + 1
                                                    end
                                            end
                                    end
                            end
                            if pPlayer:IsCapitalConnectedToCity(pCity) then
                                    iNumConnections = iNumConnections + 1
                            end
                    end
                   
                    local pCapital = pPlayer:GetCapitalCity()
                    if pCapital then
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_GOLD, iNumConnections)
                           
                            local tBuildingTable = toBits(iNumCoastRoads)
                           
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_1, tBuildingTable[1] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_2, tBuildingTable[2] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_4, tBuildingTable[3] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_8, tBuildingTable[4] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_16, tBuildingTable[5] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_32, tBuildingTable[6] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_64, tBuildingTable[7] or 0)
                            pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_128, tBuildingTable[8] or 0)
                    end
            end
    end
     
    --Credit to UltimatePotato from Civfanatics for this trick!
    function toBits(num)
        -- returns a table of bits, least significant first.
            t={} -- will contain the bits
        while num>0 do
            local rest=math.fmod(num,2)
            t[#t+1]=rest
            num=(num-rest)/2
        end
        return t
    end

