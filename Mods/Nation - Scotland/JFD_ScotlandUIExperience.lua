	-- Scotland Clan Castle Experience
	-- Author: JFD	
		 
function JFD_GetNumberWorkedClanCastles(playerID, city)
	local numWorkedClanCastles = 0
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if plot then
			if plot:GetOwner() == playerID then
				if city:IsWorkingPlot(plot) then	
					if plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MC_SCOTTISH_CLAN_CASTLE"] then 
						numWorkedClanCastles = numWorkedClanCastles + 1
					end
				end
			end
		end
	end
	
	return numWorkedClanCastles
end
	
function JFD_ClanCastleExperience(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_SCOTTISH_CLAN_CASTLE_EXPERIENCE"], JFD_GetNumberWorkedClanCastles(playerID, city))
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ClanCastleExperience)