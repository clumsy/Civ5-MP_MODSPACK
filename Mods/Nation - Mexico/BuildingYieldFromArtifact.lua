-- BuildingYieldFromArtifacts
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "BuildingYieldFromArtifacts";

function BuildingYieldFromArtifacts(iPlayer, pPlayer)
    local iGreatWorksNum = 0
    --print ("Player = " .. iPlayer)
    local iGreatWorkType = 2
        --print(iGreatWorkType)
        local tGreatWorks = pPlayer:GetGreatWorks(iGreatWorkType)
        for i, v in ipairs(tGreatWorks) do
            iGreatWorksNum = iGreatWorksNum + 1
        end
    --print(iPlayer .. " Num of Foreign GWs = " .. iGreatWorksNum)
    for row in GameInfo.Building_YieldFromArtifacts() do
        local iBuilding = GameInfo.Buildings[row.BuildingType].ID
        strName = GameInfo.Buildings[iBuilding].Description
        local iYield = YieldTypes[row.YieldType]
        local iDeltaModifier = row.Yield
        for pCity in pPlayer:Cities() do
            local iCity = pCity:GetID()
            --local strCityName = pCity:GetName()
            local iDelta = (iGreatWorksNum*iDeltaModifier)
            if pCity:IsHasBuilding(iBuilding) then
            --print("Building: " .. strName .. " exists in city: " .. strCityName)
                if iYield == 4 then
                    local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. 4)
                    --print (iYield .. "NUM" .. tostring(iOldDelta))
                    save( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. 4, iDelta)
                    if iOldDelta == nil then
                        pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta)
                    else
                        pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta - iOldDelta)
                    end
                elseif iYield == 5 then
                    if IsTurnStart == true then
                        pPlayer:ChangeFaith(iDelta)
                    --else
                        --print ("Not Turn Start")
                    end
                else
                    local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
                    --print (iYield .. "NUM" .. tostring(iOldDelta))
                    save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, iDelta)
                    if iOldDelta == nil then
                        pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta)
                    else
                        pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta - iOldDelta)
                    end
                end
                
            -- Clear data if Building does not exist --
            
            else
                --print("Building: " .. strName .. " does not exist in city: " .. strCityName)
                if iYield == 4 then
                    local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. 4)
                    if iOldDelta == nil then
                        --print("Never existed")
                    elseif iOldDelta > 0 then
                        save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. 4, 0)
                        pCity:ChangeJONSCulturePerTurnFromBuildings(-iOldDelta)
                        --print("Data Cleared")
                    end
                elseif iYield == 5 then
                    --print("Faith = Nil")
                else
                    local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
                    if iOldDelta == nil then
                        --print("Never existed")
                    elseif iOldDelta > 0 then
                        save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, 0)
                        pCity:ChangeBaseYieldRateFromBuildings(iYield, -iOldDelta)
                        --print("Data Cleared")
                    end
                end
            end
        end    
    end
end

-- End of Main Code --

function BuildingYieldFromArtifactsTurnStart(iPlayer)
    print ("Turn Trigger")
    local pPlayer = Players[iPlayer]
    IsTurnStart = true
    BuildingYieldFromArtifacts(iPlayer, pPlayer)
    IsTurnStart = false
end

function BuildingYieldFromArtifactsSwap()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    if pPlayer:IsTurnActive() then
        print ("Swap Trigger")
        IsTurnStart = false
        BuildingYieldFromArtifacts(iPlayer, pPlayer)
    end
end

GameEvents.PlayerDoTurn.Add(BuildingYieldFromArtifactsTurnStart)
Events.SerialEventCityInfoDirty.Add(BuildingYieldFromArtifactsSwap)