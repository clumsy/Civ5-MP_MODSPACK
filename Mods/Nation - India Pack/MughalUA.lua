-- MughalUA
-- Author: Sukritact
--------------------------------------------------------------

print ("loaded") 
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "MughalUA";

--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------

function IsBuildingReal(iBuilding)
    if((GameInfo.Buildings[iBuilding].GreatWorkCount == -1) or ((GameInfo.Buildings[iBuilding].PrereqTech == nil) and ((GameInfo.Buildings[iBuilding].FaithCost == -1) and (GameInfo.Buildings[iBuilding].Cost == -1 )))) then
        return false
    else
        return true
    end
end

--------------------------------------------------------------
-- Initial Processes
--------------------------------------------------------------

local tBuildings = {}
for Building in GameInfo.Buildings() do
    iBuilding = Building.ID
    if (GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass].MaxGlobalInstances > (-1)) or (GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass].MaxPlayerInstances > (-1)) then
        tBuildings[iBuilding] = "Wonder"
    elseif IsBuildingReal(iBuilding) then
        tBuildings[iBuilding] = "Building"
    end
end

local iProduction = GameInfo.Yields["YIELD_PRODUCTION"].ID
local iCulture = GameInfo.Yields["YIELD_CULTURE"].ID
local iCivType = GameInfoTypes["CIVILIZATION_MUGHAL"]

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function MughalUA(pPlayer)
    if pPlayer:IsGoldenAge() then
        for pCity in pPlayer:Cities() do
            
            local iCity = pCity:GetID()
            local iNumBuildings = 0
            local iNumWonders = 0
            
            for iKey, sVal in pairs(tBuildings) do
                if pCity:IsHasBuilding(iKey) then
                    if sVal == "Wonder" then
                        iNumWonders = iNumWonders + 1
                    elseif sVal == "Building" then
                        iNumBuildings = iNumBuildings + 1
                    end
                end
            end
            
            -- Set Culture
            
            local iDelta = iNumWonders*3
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iCulture)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            save( pPlayer, iCity .. "Y" .. iCulture, iDelta)
            pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta - iOldDelta)
            
            -- Set Production
            
            local iDelta = math.ceil(iNumBuildings/2)
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iProduction)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            save( pPlayer, iCity .. "Y" .. iProduction, iDelta)
            pCity:ChangeBaseYieldRateFromBuildings(iProduction, iDelta - iOldDelta)
            
            --local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100
            --local iCulturePerTurn = pCity:GetJONSCulturePerTurn()
            --print(iCity, iProductionPerTurn, iCulturePerTurn)
        end
        
    else
    
        for pCity in pPlayer:Cities() do
            local iCity = pCity:GetID()
            
            -- Set Culture
            
            local iDelta = 0
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iCulture)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            save( pPlayer, iCity .. "Y" .. iCulture, iDelta)
            pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta - iOldDelta)
            
            -- Set Production
            
            local iDelta = 0
            local iOldDelta = load( pPlayer, iCity .. "Y" .. iProduction)
            if iOldDelta == nil then
                iOldDelta = 0
            end
            save( pPlayer, iCity .. "Y" .. iProduction, iDelta)
            pCity:ChangeBaseYieldRateFromBuildings(iProduction, iDelta - iOldDelta)
            
            --local iProductionPerTurn = pCity:GetCurrentProductionDifferenceTimes100(false, false) / 100
            --local iCulturePerTurn = pCity:GetJONSCulturePerTurn()
            --print(iCity, iProductionPerTurn, iCulturePerTurn)
        end
    end
end

-- End of Main Code

function MughalUATrigger1(iPlayer)
    --print("Trigger Type 1")
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == iCivType) then
        MughalUA(pPlayer)
    end
end

GameEvents.PlayerDoTurn.Add(MughalUATrigger1)
GameEvents.PlayerAdoptPolicy.Add(MughalUATrigger1)

function MughalUATrigger2()
    local iPlayer = Game.GetActivePlayer()
    local pPlayer = Players[iPlayer]
    if pPlayer:IsTurnActive() then
        --print ("Trigger Type 2")
        if (pPlayer:GetCivilizationType() == iCivType) then
            MughalUA(pPlayer)
        end
    end
end

Events.SerialEventGameDataDirty.Add(MughalUATrigger2) --This triggers toolbar updates; perhaps it'll also work for our purposes?
--Events.SerialEventExitCityScreen.Add(MughalUATrigger2) -- not needed due to above.
