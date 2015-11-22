-- JFD_SwitzerlandDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- JFD_GetGoldFromDoF
--=======================================================================================================================
--  JFD_GetGoldFromDoF
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetGoldFromDoF(playerID)
	local player = Players[playerID]
	local goldBoost = 0
	local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
	if player:GetCivilizationType() == civilisationID then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local otherPlayer = Players[iPlayer]
			if otherPlayer:IsAlive() and otherPlayer ~= player then
				if Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()) then
					if not otherPlayer:IsDoF(playerID) and not otherPlayer:IsDenouncedPlayer(playerID) and not otherPlayer:IsDenouncingPlayer(playerID) and not Teams[otherPlayer:GetTeam()]:IsAtWar(player:GetTeam()) then
						local otherPlayerGold = otherPlayer:CalculateGoldRate()
						goldBoost = goldBoost + math.floor(otherPlayerGold * 10/100)
					end
				end
			end
		end
	end

	return goldBoost
end
--=======================================================================================================================
--=======================================================================================================================


