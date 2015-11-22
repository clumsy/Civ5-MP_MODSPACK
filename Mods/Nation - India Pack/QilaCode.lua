-- QilaCode
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

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

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

iQila = GameInfoTypes.BUILDING_MUGHAL_FORT

function Qila(iPlayer)
    local pPlayer = Players[iPlayer]
    for pCity in pPlayer:Cities() do
        if pCity:IsHasBuilding(iQila) then
            local iNumWonders = 0
            local iNumBuildings = 0
            for iKey, sVal in pairs(tBuildings) do
                if pCity:IsHasBuilding(iKey) then
                    if sVal == "Wonder" then
                        iNumWonders = iNumWonders + 1
                    elseif sVal == "Building" then
                        iNumBuildings = iNumBuildings + 1
                    end
                end
            end
            
            local iDelta = math.floor((iNumWonders/2) + (iNumBuildings/4))
            
            if iDelta > 0 then
                pPlayer:ChangeGoldenAgeProgressMeter(iDelta)
            end
        end
    end
end

GameEvents.PlayerDoTurn.Add(Qila)
