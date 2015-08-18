function SicilyTrait(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SICILY"] and player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SICILY_DUMMY"], 1)	
		end	
	end
end
GameEvents.PlayerDoTurn.Add(SicilyTrait)