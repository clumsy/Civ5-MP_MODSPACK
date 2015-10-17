	

    function JFD_GetNumPagansInCity(playerID, city)
            return city:GetNumFollowers(GameInfoTypes["RELIGION_PANTHEON"])
    end
     
    function JFD_PaganCulture(playerID)
            local player = Players[playerID]
            if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_PICTS"] and player:IsAlive() and player:HasCreatedPantheon() then
                    for city in player:Cities() do
                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_CULTURE_DUMMY"], JFD_GetNumPagansInCity(playerID, city))
                    end
            end
    end
    GameEvents.PlayerDoTurn.Add(JFD_PaganCulture)
     
    function JFD_GetNumPagansInCity(playerID, city)
            return city:GetNumFollowers(GameInfoTypes["RELIGION_PANTHEON"])
    end
     
     
     
    function JFD_PictishHappinessFromPantheon(playerID)
            local player = Players[playerID]
            if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_PICTS"] then
                    for city in player:Cities() do
                            if city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
                                    if not city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_HAPPINESS"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_HAPPINESS"], 1)
                                    end
                            else
                                    if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_HAPPINESS"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_HAPPINESS"], 0)
                                    end
                            end    
                    end
            end
    end
    GameEvents.PlayerDoTurn.Add(JFD_PictishHappinessFromPantheon)
     
    function JFD_PictishNoOccupiedUnhappiness(playerID)
            local player = Players[playerID]
            if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_PICTS"] then
                    for city in player:Cities() do
                            if city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
                                    if not city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_COURTHOUSE"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_COURTHOUSE"], 1)
                                    end
                            else
                                    if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_COURTHOUSE"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_DUMMY_COURTHOUSE"], 0)
                                    end
                            end    
                    end
            end
    end
    GameEvents.PlayerDoTurn.Add(JFD_PictishNoOccupiedUnhappiness)
     
    function FidachBonus(playerID)
            local player = Players[playerID]
            for city in player:Cities() do
                 if city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(GameInfoTypes["PROMOTION_SON_OF_FIDACH"]) then
                         city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIDACH_DUMMY"], 1)
                 else
					if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIDACH_DUMMY"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIDACH_DUMMY"], 0)
                                    end
				 end
            end
    end
    GameEvents.PlayerDoTurn.Add(FidachBonus)
     
    function FibBonus(playerID)
            local player = Players[playerID]
            for city in player:Cities() do
					 if city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(GameInfoTypes["PROMOTION_SON_OF_FIB"]) then
                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIB_DUMMY"], 1)
                    else
						if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIB_DUMMY"]) then
                              city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_PICTS_FIB_DUMMY"], 0)
                         end
				end
            end
    end
    GameEvents.PlayerDoTurn.Add(FibBonus)

