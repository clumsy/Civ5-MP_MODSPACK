-- KalmarUnionFunctions
-- Author: Viregel
-- DateCreated: 10/12/2014 8:16:05 AM
--------------------------------------------------------------

print ("Sveriges, Danmarks og Norges enkeltkalmarunionen stiger!")

function GE_KalmarGarrisonedBorderExpansion (playerID)
		local player = Players[playerID]
            for city in player:Cities() do
                 if city:GetGarrisonedUnit():GetUnitType(GameInfoTypes["UNIT_GE_KALMAR_UNION_BALTIC_WARSHIP"]) then
                         city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_BALTIC_EXPANSION"], 1)
                 else
					if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_BALTIC_EXPANSION"]) then
                                            city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_BALTIC_EXPANSION"], 0)
                                    end
						 end
			 end
    end
GameEvents.PlayerDoTurn.Add(GE_KalmarGarrisonedBorderExpansion)

function GE_KalmarCoastalGoldenAge (playerID)
	local player = Players[playerID]
		for city in player:Cities() do
			if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_KALMAR_UNION"] and player:IsEverAlive() then
				if city:IsCoastal() then 
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_HYGGE"], 1) 
				 else
						if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_HYGGE"]) then
											  city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_HYGGE"], 0)
									 end
							end
				end
		end
end
GameEvents.PlayerDoTurn.Add(GE_KalmarCoastalGoldenAge)


function GE_KalmarGoldenAgeCulture (playerID)
	local player = Players[playerID]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_KALMAR_UNION"] and player:IsEverAlive() then
			if player:IsGoldenAge() then
					for city in player:Cities() do
						if city:IsCoastal() then 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_KALMAR_GOLD"], 1) 
				 else
						if city:IsHasBuilding(GameInfoTypes["BUILDING_GE_KALMAR_GOLD"]) then
											  city:SetNumRealBuilding(GameInfoTypes["BUILDING_GE_KALMAR_GOLD"], 0)
						end
					end
				end
			end
		end
	end
GameEvents.PlayerDoTurn.Add(GE_KalmarGoldenAgeCulture)
			
	

