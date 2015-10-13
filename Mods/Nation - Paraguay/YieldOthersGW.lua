-- YieldOthersGW
-- Author: Sukritact
-- DateCreated: 2/28/2014 12:16:09 PM
--------------------------------------------------------------
print("loaded")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "BuildingYieldFromOthersGreatWorks";

function BuildingYieldFromOthersGreatWorks(iPlayer, pPlayer)
    local iGreatWorksNum = 0
    --print ("Player = " .. iPlayer)
    for iGreatWorkType = 1, 4, 1 do
        --print(iGreatWorkType)
        local tGreatWorks = pPlayer:GetGreatWorks(iGreatWorkType)
        for i, v in ipairs(tGreatWorks) do
            --print (Locale.Lookup(Game.GetGreatWorkName(v.Index)))
            --print ("Creator = " .. v.Creator)
            if (v.Creator) ~= iPlayer then
                iGreatWorksNum = iGreatWorksNum + 1
            end
        end
    end
    --print(iPlayer .. " Num of Foreign GWs = " .. iGreatWorksNum)
    for row in GameInfo.Building_YieldFromOthersGreatWorks() do
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

function BuildingYieldFromOthersGreatWorksTurnStart(iPlayer)
    print ("Turn Trigger")
    local pPlayer = Players[iPlayer]
    IsTurnStart = true
    BuildingYieldFromOthersGreatWorks(iPlayer, pPlayer)
    IsTurnStart = false
end

function BuildingYieldFromOthersGreatWorksSwap()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    if pPlayer:IsTurnActive() then
        print ("Swap Trigger")
        IsTurnStart = false
        BuildingYieldFromOthersGreatWorks(iPlayer, pPlayer)
    end
end

GameEvents.PlayerDoTurn.Add(BuildingYieldFromOthersGreatWorksTurnStart)
Events.SerialEventCityInfoDirty.Add(BuildingYieldFromOthersGreatWorksSwap)