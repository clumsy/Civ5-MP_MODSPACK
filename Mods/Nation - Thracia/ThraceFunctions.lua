
	--==========================================================================================================================
    -- UTILITY FUNCTIONS
    --==========================================================================================================================
    include("PlotIterators")
    --------------------------------------------------------------
    -- JFD_IsCivilisationActive
    --------------------------------------------------------------
    local civilisationID = GameInfoTypes["CIVILIZATION_MC_THRACE"]
     
    function JFD_IsCivilisationActive(civilisationID)
            for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
                    local slotStatus = PreGame.GetSlotStatus(iSlot)
                    if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
                            if PreGame.GetCivilization(iSlot) == civilisationID then
                                    return true
                            end
                    end
            end
     
            return false
    end
     
    if JFD_IsCivilisationActive(civilisationID) then
            print("Thrace is in this game")
    end
    ----------------------------------------------------------------------------------------------------------------------------   
    --JFD_GoldenAgeFromBarbKills
    ----------------------------------------------------------------------------------------------------------------------------
    function JFD_GoldenAgeFromBarbKills(killerID, killedID, killedUnitID)
            local player = Players[killerID]
            if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
                    local otherPlayer = Players[killedID]
                    if otherPlayer:IsBarbarian() then
                            if GameInfo.Units[killedUnitID].Domain == "DOMAIN_LAND" then   
                                    local goldenAgeBoost = math.floor(GameInfo.Units[killedUnitID].Combat)
                                    player:ChangeGoldenAgeProgressMeter(goldenAgeBoost)
                                    if player:IsHuman() then Events.GameplayAlertMessage(Locale.ConvertTextKey("+{1_Num} [ICON_GOLDEN_AGE] Golden Age progress from killing a Barbarian Unit!", goldenAgeBoost)) end
                            end
                    end
            end
    end
     
    if JFD_IsCivilisationActive(civilisationID) then
            GameEvents.UnitKilledInCombat.Add(JFD_GoldenAgeFromBarbKills)
    end
    ----------------------------------------------------------------------------------------------------------------------------   
    --JFD_XPFromCityCapture
    ----------------------------------------------------------------------------------------------------------------------------
    function JFD_XPFromCityCapture(oldOwnerID, capital, iX, iY, newOwnerID)
            local player = Players[newOwnerID]
            if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
                    local cityPlot = Map.GetPlot(iX, iY)
                    for loopPlot in PlotAreaSweepIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
                            if loopPlot:GetUnit() then
                                    loopPlot:GetUnit():ChangeExperience(10)
                            end
                    end
            end
    end
     
    if JFD_IsCivilisationActive(civilisationID) then
            GameEvents.CityCaptureComplete.Add(JFD_XPFromCityCapture)
    end
    ------------------------------------------------------------------------------------------------------------------
    --JFD_NearbyGermanEncampment
    ------------------------------------------------------------------------------------------------------------------
    function JFD_NearbyGermanEncampment(playerID, unitID, unitX, unitY)
        local player = Players[playerID]
        if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
            local plot = Map.GetPlot(unitX, unitY)
            if plot ~= nil then
                local unit = player:GetUnitByID(unitID)
                local nearbyGermanEncampment = false
                for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
                        local tribalEncampmentID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]
                        if (loopPlot:GetImprovementType() == tribalEncampmentID) then
                                nearbyGermanEncampment = true
                                break
                        end
                end
 
                if nearbyGermanEncampment then
                        if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_MC_THRACE_ENCAMPMENT_BONUS"]) then
                                unit:SetHasPromotion(GameInfoTypes["PROMOTION_MC_THRACE_ENCAMPMENT_BONUS"], true)
                        end
                else
                        if unit:IsHasPromotion(GameInfoTypes["PROMOTION_MC_THRACE_ENCAMPMENT_BONUS"]) then
                                unit:SetHasPromotion(GameInfoTypes["PROMOTION_MC_THRACE_ENCAMPMENT_BONUS"], false)
                        end
                end
            end
        end
    end
     
    if JFD_IsCivilisationActive(civilisationID) then
            GameEvents.UnitSetXY.Add(JFD_NearbyGermanEncampment)
    end
    ----------------------------------------------------------------------------------------------------------------------------
    -- JFD_PeltestAdjacentBonus
    ----------------------------------------------------------------------------------------------------------------------------
     local direction_types = {
                DirectionTypes.DIRECTION_NORTHEAST,
                DirectionTypes.DIRECTION_NORTHWEST,
                DirectionTypes.DIRECTION_EAST,
                DirectionTypes.DIRECTION_SOUTHEAST,
                DirectionTypes.DIRECTION_SOUTHWEST,
                DirectionTypes.DIRECTION_WEST,
           }
               
     function JFD_PeltestAdjacentBonus(playerID, unitID, unitX, unitY)
                local player = Players[playerID]
                local unit = player:GetUnitByID(unitID)
                if unit:IsHasPromotion(GameInfoTypes["PROMOTION_MC_PELTAST"]) then
                        local adjacentEnemy = false
                        local plot = Map.GetPlot(unitX, unitY)
                        if plot then
                                for loop, direction in ipairs(direction_types) do
                                        local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
                                        if adjPlot:IsUnit() then
                                                local adjUnit = adjPlot:GetUnit(i)
                                                if adjUnit:IsCombatUnit() then
                                                        local adjUnitPlayer = Players[adjUnit:GetOwner()]
                                                        if Teams[adjUnitPlayer:GetTeam()]:IsAtWar(playerID) then
                                                                adjacentEnemy = true
                                                                break
                                                        end
                                                end
                                        end
                                end
                        end
         
                        if adjacentEnemy then
                                if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_MC_PELTAST_BONUS"]) then
                                        unit:SetHasPromotion(GameInfoTypes["PROMOTION_MC_PELTAST_BONUS"], true)
                                end
                        else
                                if unit:IsHasPromotion(GameInfoTypes["PROMOTION_MC_PELTAST_BONUS"]) then
                                        unit:SetHasPromotion(GameInfoTypes["PROMOTION_MC_PELTAST_BONUS"], false)
                                end
                        end
                end
    end
    GameEvents.UnitSetXY.Add(JFD_PeltestAdjacentBonus)



