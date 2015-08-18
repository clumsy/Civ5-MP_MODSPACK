-- ManxUA
-- Author: calcul8or, with thanks to JFD and Machiavelli
-- DateCreated: 2/13/2015 7:32:11 PM
--------------------------------------------------------------

function ManxPolicyOpener(player)
	print("Thanks to JFD for this script")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CALC_MANX"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_MANXUA"]) then
				--player:SetPolicyBranchUnlocked(GameInfoTypes["POLICY_BRANCH_PIETY"], true)
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_MANXUA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(ManxPolicyOpener)