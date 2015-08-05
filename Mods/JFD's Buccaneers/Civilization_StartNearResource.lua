-- Civilization_StartNearResource
-- Author: Sukritact
--------------------------------------------------------------
--[[

For luxuries and bonuses, this code will replace one of the
local resource with another. The 'replacee' will always be of
the same type, so luxuries will always replace luxuries, etc.

The replacee is removed completely in an attempt to maintain 
balance (so you won't end up with too many types of luxuries)

For strategics, a source of quantity between 2-4 is placed on the first
valid tile empty of other resources.

If no normally valid tiles are found then the resource will be 
forcibly placed; the only limitation being resources that can 
be placed in the sea will never appear on land and vice-versa

Resources that already exist locally are ignored.

]]
--------------------------------------------------------------

print("loaded")
include("PlotIterators")
include("NewSaveUtils")

--------------------------------------------------------------
-- Utility functions
--------------------------------------------------------------

function GetRandom(lower, upper)
    return Map.Rand((upper + 1) - lower, "") + lower
end

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------
if GetPersistentProperty("Civilization_StartNearResource") ~= nil then
    --print("Has run: Terminated")
    return
else
    SetPersistentProperty("Civilization_StartNearResource", true)
    --print("Initialising")
end

for iPlayer = 0, (GameDefines.MAX_MAJOR_CIVS - 1) do
    local pPlayer = Players[iPlayer]
    if pPlayer:IsEverAlive() then
        local iCiv = pPlayer:GetCivilizationType()
        
        local tResourcestoPlace = {}
        local iEntries = 0
        for row in GameInfo.Civilization_StartNearResource("CivilizationType = '" .. GameInfo.Civilizations[iCiv].Type .. "'") do
            tResourcestoPlace[row.ResourceType] = GameInfoTypes[row.ResourceType]
            iEntries = iEntries + 1
        end
        
        if iEntries > 0 then

            --Make a list of resources available
            tLocalResources = {}
            local pPlot = pPlayer:GetStartingPlot()
            for pIterPlot in PlotAreaSpiralIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
                iLocalResource = pIterPlot:GetResourceType()
                if iLocalResource ~= -1 then
                    if tLocalResources[iLocalResource] == nil then
                        tLocalResources[iLocalResource] = 1
                    else
                        tLocalResources[iLocalResource] = tLocalResources[iLocalResource] + 1
                    end
                end
            end
            
            for i,v in pairs (tResourcestoPlace) do print(i,v) end
            for i,v in pairs (tLocalResources) do print(GameInfo.Resources[i].Type ,v) end
            
            --Eliminate duplicate resources from both lists
            for sKey, iVal in pairs(tResourcestoPlace) do
                if tLocalResources[iVal] ~= nil then
                    print("eliminating " .. sKey)
                    tLocalResources[iVal] = nil
                    tResourcestoPlace[sKey] = nil
                end
            end
            
            for sKey, iVal in pairs(tResourcestoPlace) do
                local sResourceClass = GameInfo.Resources[iVal].ResourceClassType
                local iResourcetoReplace = nil
                local iNumtoPlace = 999
                local bStrategic = false
                local bHasPlaced = false
                if sResourceClass == "RESOURCECLASS_RUSH" or sResourceClass == "RESOURCECLASS_MODERN" then
                    bStrategic = true
                end
                
                ----------------------
                --Strategics
                ----------------------
                
                if bStrategic then
                    for pIterPlot in PlotAreaSpiralIterator(pPlot, 3, GetRandom(1,6), DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
                        if pIterPlot:CanHaveResource(iVal, true) and pIterPlot:GetResourceType() == -1 then
                            print("pasta")
                            pIterPlot:SetResourceType(iVal, GetRandom(2,4))
                            print("Placed " .. sKey)
                            bHasPlaced = true
                            break
                        end
                    end
                    --If None have yet been placed
                    if not(bHasPlaced) then
                        for row in GameInfo.Resource_TerrainBooleans("ResourceType = '" .. sKey .. "'") do
                            if row.TerrainType == TERRAIN_OCEAN or row.TerrainType == TERRAIN_COAST then
                                bWater = true
                            end
                        end
                        for pIterPlot in PlotAreaSpiralIterator(pPlot, 2, GetRandom(1,6), DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
                            if (not(pIterPlot:IsMountain())) and (pIterPlot:GetResourceType() == -1) then
                                if pIterPlot:IsWater() and bWater then
                                    pIterPlot:SetResourceType(iVal, GetRandom(2,4))
                                    print("pasta1")
                                    print("Placed " .. sKey)
                                    break
                                elseif not(pIterPlot:IsWater()) and not(bWater) then
                                    pIterPlot:SetResourceType(iVal, GetRandom(2,4))
                                    print("pasta2")
                                    print("Placed " .. sKey)
                                    break
                                end
                            end
                        end
                    end
                
                ----------------------
                --Bonuses and Luxuries
                ----------------------
                
                else
                    --Assign resource to replace
                    for iKey, iNum in pairs(tLocalResources) do
                        if sResourceClass == GameInfo.Resources[iKey].ResourceClassType then
                            if (iResourcetoReplace == nil) or (GetRandom(1,2) == 1) then
                                iResourcetoReplace = iKey
                                iNumtoPlace = iNum
                                tLocalResources[iKey] = nil
                            end
                        end
                    end
                    
                    --If a resource has been assigned
                    if iResourcetoReplace ~= nil then
                        print("Replacing ".. GameInfo.Resources[iResourcetoReplace].Type)
                        local tPlots = {}
                        local iKey = 1
                        for pIterPlot in PlotAreaSpiralIterator(pPlot, 3, GetRandom(1,6), DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
                            if pIterPlot:GetResourceType() == iResourcetoReplace then
                                pIterPlot:SetResourceType(-1, 0)
                            end
                            if iNumtoPlace >= 1 then
                                if pIterPlot:CanHaveResource(iVal, true) and pIterPlot:GetResourceType() == -1 then
                                    --print("Placed!")
                                    pIterPlot:SetResourceType(iVal, 1)
                                    iNumtoPlace = iNumtoPlace - 1
                                    bHasPlaced = true
                                    print("Placed " .. sKey)
                                end
                            end
                        end
                    --No Resources have been assigned, just place them as you can.
                    else
                        iNumtoPlace = GetRandom(1,3)
                        for pIterPlot in PlotAreaSpiralIterator(pPlot, 3, GetRandom(1,6), DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
                            if iNumtoPlace < 1 then
                                break
                            end
                            if (pIterPlot:CanHaveResource(iVal, true)) and pIterPlot:GetResourceType() == -1 then
                                pIterPlot:SetResourceType(iVal, 1)
                                iNumtoPlace = iNumtoPlace - 1
                                print("Placed " .. sKey)
                                bHasPlaced = true
                            end
                        end
                    end
                end
                if not(bHasPlaced) then
                    --Failed to place, placing up to 3 anomalous copies.
                    --print("Failed to Place")
                    iNumtoPlace = GetRandom(1,3)
                    local bWater = false
                    for row in GameInfo.Resource_TerrainBooleans("ResourceType = '" .. sKey .. "'") do
                        if row.TerrainType == TERRAIN_OCEAN or row.TerrainType == TERRAIN_COAST then
                            bWater = true
                        end
                    end
                    for pIterPlot in PlotAreaSpiralIterator(pPlot, 2, GetRandom(1,6), DIRECTION_CLOCKWISE, DIRECTION_INWARDS, CENTRE_INCLUDE) do
                        if iNumtoPlace < 1 then
                            break
                        end
                        if (not(pIterPlot:IsMountain())) and (pIterPlot:GetResourceType() == -1) then
                            if pIterPlot:IsWater() and bWater then
                                pIterPlot:SetResourceType(iVal, 1)
                                iNumtoPlace = iNumtoPlace - 1
                                print("Placed " .. sKey)
                            elseif not(pIterPlot:IsWater()) and not(bWater) then
                                pIterPlot:SetResourceType(iVal, 1)
                                iNumtoPlace = iNumtoPlace - 1
                                print("Placed " .. sKey)
                            end
                        end
                    end
                end
            end
        end
    end
end
