-- BuildingProvidesAccesstoFreshWater
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

local iAquifer = GameInfoTypes.FEATURE_AQUIFER
local iNone = FeatureTypes.NO_FEATURE

function BuildingProvidesAccesstoFreshWater(iPlayer)
    local pPlayer = Players[iPlayer]    
    for pCity in pPlayer:Cities() do
        local iFreshWater = 0
        local CityPlot = pCity:Plot()
        --check if any existing buildings provide access to freshwater        
        for row in GameInfo.Building_ProvidesAccesstoFreshWater() do
            local iBuilding = GameInfo.Buildings[row.BuildingType].ID
            if pCity:IsHasBuilding(iBuilding) then
                iFreshWater = (iFreshWater + 1)
            end
        end
        --if buildings exist then create Aquifer
        if iFreshWater > 0 then
            CityPlot:SetFeatureType(iAquifer)
        --remove Aquifer if no buildings exist
        else
            if CityPlot:GetFeatureType() == iAquifer then
                CityPlot:SetFeatureType(iNone)
            end
        end
    end
end

function CityScreenBuildingProvidesAccesstoFreshWater()
    local iPlayer = Game.GetActivePlayer()
    BuildingProvidesAccesstoFreshWater(iPlayer)
end

GameEvents.PlayerDoTurn.Add(BuildingProvidesAccesstoFreshWater)
GameEvents.PlayerAdoptPolicy.Add(BuildingProvidesAccesstoFreshWater)
Events.SerialEventExitCityScreen.Add(CityScreenBuildingProvidesAccesstoFreshWater)

