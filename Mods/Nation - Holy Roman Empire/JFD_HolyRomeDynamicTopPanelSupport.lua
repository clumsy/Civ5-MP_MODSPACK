-- JFD_HolyRomeDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
--  JFD_GetFaithFromMinors
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetFaithFromMinors(playerID)
	local numFaith = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if minorCiv:GetCapitalCity() and minorCiv:IsAlive() then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
				numFaith = numFaith + minorCiv:GetCapitalCity():GetBaseYieldRate(GameInfoTypes["YIELD_FAITH"]) * 50 / 100
			elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				numFaith = numFaith + minorCiv:GetCapitalCity():GetBaseYieldRate(GameInfoTypes["YIELD_FAITH"]) * 75 / 100 
			end
		end
	end

	return math.floor(numFaith)
end
--------------------------------------------------------------------------------------------------------------------------
--  JFD_GetGoldFromMinors
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetGoldFromMinors(playerID)
	local numGold = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if minorCiv:GetCapitalCity() and minorCiv:IsAlive() then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
				numGold = numGold + minorCiv:GetCapitalCity():GetBaseYieldRate(GameInfoTypes["YIELD_GOLD"]) * 25 / 100
			elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				numGold = numGold + minorCiv:GetCapitalCity():GetBaseYieldRate(GameInfoTypes["YIELD_GOLD"]) * 50 / 100 
			end
		end
	end

	return math.floor(numGold)
end
--------------------------------------------------------------------------------------------------------------------------
--  JFD_GetHappinessFromMinors
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetHappinessFromMinors(playerID)
	local numHappiness = 0
	if Players[playerID]:HasPolicy(GameInfoTypes["POLICY_JFD_HOLY_ROME_GOLDEN_BULL"]) then
		for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
			local minorCiv = Players[minorPlayerID]
			if minorCiv:GetCapitalCity() and minorCiv:IsAlive() then
				if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
					numHappiness = numHappiness + minorCiv:GetExcessHappiness() * 50 / 100
				elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
					numHappiness = numHappiness + minorCiv:GetExcessHappiness() * 75 / 100
				end
			end
		end
	end

	return math.floor(numHappiness)
end
--=======================================================================================================================
--=======================================================================================================================


