-- JFD_PeterDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- JFD_GetGoldFromDoF
--=======================================================================================================================
--  JFD_GetScienceFromDoF
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetScienceFromDoF(playerID)
	local player = Players[playerID]
	local scienceBoost = 0
	for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local playerTeam = Teams[player:GetTeam()]
		local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
		local otherPlayer = Players[iPlayerLoop]
		if otherPlayer ~= player and otherPlayer:IsAlive() then
			local otherTeam = Teams[otherPlayer:GetTeam()]
			if otherPlayer:IsDoF(playerID) then
				for row in GameInfo.Technologies() do
					if otherTeam:IsHasTech(row.ID) and player:GetCurrentResearch() == row.ID then
						scienceBoost = math.floor(otherPlayer:GetScience()*5 / 100)
					end
				end
			end
		end
	end

	return scienceBoost
end
--=======================================================================================================================
--=======================================================================================================================


