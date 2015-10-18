function SafavidWarTimeEffects(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SAFAVIDS"] and player:IsEverAlive() then
		if Teams[player:GetTeam()]:GetAtWarCount(true) > 0 then
			if not player:HasPolicy(GameInfoTypes["POLICY_SAFAVID_DUMMY"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_SAFAVID_DUMMY"], true)
			end
		else
			if player:HasPolicy(GameInfoTypes["POLICY_SAFAVID_DUMMY"]) then
				player:SetHasPolicy(GameInfoTypes["POLICY_SAFAVID_DUMMY"], false)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(SafavidWarTimeEffects)