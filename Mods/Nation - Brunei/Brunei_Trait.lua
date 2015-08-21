-- Brunei_Trait
-- Author: User
-- DateCreated: 7/2/2015 8:48:42 PM
--------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators")

----------------------------------------------------
--OilTradeGold
----------------------------------------------------
function DJSH_RBruneiOilCount(playerID, city)
        local player = Players[playerID]
        local numOilResources = 0
        for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
                local plot = city:GetCityIndexPlot(cityPlot)
                if plot and plot:GetOwner() == playerID then
                        if city:IsWorkingPlot(plot) then
                                if plot:GetResourceType() == GameInfoTypes["RESOURCE_OIL"] then
                                        if (plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_WELL"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_OFFSHORE_PLATFORM"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_ACADEMY"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CITADEL"]) or plot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MANUFACTORY"])) then
                                                numOilResources = numOilResources + 1
                                        end
                                end
                        end
                end    
        end
 
        return numOilResources
end
 
function DJSH_RBruneiGoldFromOil(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RBRUNEI"] and player:IsAlive() then
                for city in player:Cities() do
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_1"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_1"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_2"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_2"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_3"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_3"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_4"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_4"], 0)
                        end
                        if city:GetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_5"]) > 0 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_5"], 0)
                        end
                        if DJSH_RBruneiOilCount(playerID, city) >= 1 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_1"], 1)
                        end
                        if DJSH_RBruneiOilCount(playerID, city) >= 2 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_2"], 1)
                        end
                        if DJSH_RBruneiOilCount(playerID, city) >= 3 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_3"], 1)
                        end
                        if DJSH_RBruneiOilCount(playerID, city) >= 4 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_4"], 1)
                        end
                        if DJSH_RBruneiOilCount(playerID, city) >= 5 then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RBRUNEI_OIL_DUMMY_5"], 1)
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(DJSH_RBruneiGoldFromOil)
----------------------------------------------------
--CargoShipBonus
----------------------------------------------------
function DJSH_KampongAyerCargoShip(playerID, unitID)
        local player = Players[playerID]
        local unit = player:GetUnitByID(unitID)
        local plot = Map.GetPlot(unit:GetX(), unit:GetY())
        local delay = 0
        if unit:GetUnitType() == GameInfoTypes["UNIT_CARGO_SHIP"] then
                for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
                        if adjacentPlot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_CUSTOM_IMPROVEMENT_B_1"] then
                                local kampongPlayerID = adjacentPlot:GetOwner()
                                local kampongPlayer = Players[kampongPlayerID]
                                local randomGold = Game.Rand(2, "random Gold") + 2
                                kampongPlayer:ChangeGold(randomGold)
                                Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(adjacentPlot:GetX(), adjacentPlot:GetY()))), "+".. randomGold .." [COLOR_POSITIVE_TEXT][ICON_GOLD] Gold[ENDCOLOR]", randomGold, delay)
                                delay = delay + 0.5
                        end
                end
        end
end
GameEvents.UnitSetXY.Add(DJSH_KampongAyerCargoShip)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
 
function BruneiNavalUnits(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RBRUNEI"] then
                if JFD_GetRandom(1,100) <= 33 then
                        if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_TRIREME"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_TRIREME"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_CARAVEL"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_CARAVEL"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_RSEA_NOMAD"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_SEA_NOMAD"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_PRIVATEER"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_PRIVATEER"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                                  if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_IRONCLAD"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_IRONCLAD"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_DESTROYER"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_DESTROYER"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_GALLEASS"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_GALLEASS"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                                  if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_FRIGATE"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_FRIGATE"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_BATTLESHIP"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_BATTLESHIP"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_CARRIER"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_CARRIER"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
				   if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_MISSILE_CRUISER"] then
                        unit = player:GetUnitByID(unitID)
                        local newUnit
                        newUnit = player:InitUnit(GameInfoTypes["UNIT_RBRUNEI_MISSILE_CRUISER"], unit:GetX(), unit:GetY())
                        newUnit:Convert(unit)
                end
                end
    end
end
Events.SerialEventUnitCreated.Add(BruneiNavalUnits)

