
function TCM_Bactrian_Connection(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_BACTRIA"] and player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_BACTRIA_DUMMY"], 0)
			if (not city:IsCapital() and player:IsCapitalConnectedToCity(city)) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_BACTRIA_DUMMY"], 1)
				if city:IsOccupied() then
					if not city:IsHasBuilding(GameInfoTypes["BUILDING_COURTHOUSE"]) then
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_COURTHOUSE"], 1)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_Bactrian_Connection)
