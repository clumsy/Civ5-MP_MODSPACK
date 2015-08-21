
function tcm_AurelianEvent(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"] and player:IsEverAlive() then
		local capital = player:GetCapitalCity()
		if capital:IsHasBuilding(GameInfoTypes["BUILDING_TCM_AURELIAN_MINT"]) then 
			for city in player:Cities() do
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AURELIAN_MINT"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_AurelianEvent)