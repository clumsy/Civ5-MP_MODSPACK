-- Slavic Functions
-- Author: Viregel
-- DateCreated: 8/28/2014 6:47:22 PM
--------------------------------------------------------------

print("Plz work Slavs")

 function GE_SlavicGarrisonFaith(playerID)
            local player = Players[playerID]
            for city in player:Cities() do
                 if city:GetGarrisonedUnit() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_SLAVS"] then
                         city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_FAITH"], 1)
                 else
					if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_SLAVS_FAITH"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_FAITH"], 0)
                                    end
						 end
			 end
    end
GameEvents.PlayerDoTurn.Add(GE_SlavicGarrisonFaith)

 function GE_SlavicGarrisonXP(playerID)
            local player = Players[playerID]
            for city in player:Cities() do
                 if city:GetGarrisonedUnit() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_SLAVS"] and city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
                         city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_XP"], 1)
                 else
					if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_SLAVS_XP"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_XP"], 0)
                                    end
						 end
			 end
    end
GameEvents.PlayerDoTurn.Add(GE_SlavicGarrisonXP)

 function GE_SlavicPantheonXP(playerID)
            local player = Players[playerID]
            for city in player:Cities() do
                 if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_SLAVS"] and city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
                         city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_PANTHEON_XP"], 1)
                 else
					if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_SLAVS_PANTHEON_XP"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_SLAVS_PANTHEON_XP"], 0)
                                    end
						 end
			 end
    end
GameEvents.PlayerDoTurn.Add(GE_SlavicPantheonXP)