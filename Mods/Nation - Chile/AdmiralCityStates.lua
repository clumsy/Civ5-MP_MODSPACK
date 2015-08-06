-- AdmiralCityStates
-- Author: Tomaketh
-- DateCreated: 6/20/2013 5:53:53 PM
--------------------------------------------------------------

print ("This is the 'GA CS Bonus' mod script.")

function GrantGABonus(pPlayer, GABonus)
	pPlayer:ChangeNavalCombatExperience(GABonus)
end

function ChileCSAllies(iPlayer, iCurrentTurn)
	local pPlayer = Players[iPlayer];
	local GABonus = 0;
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local tPlayer = Players[i];
		if (tPlayer:GetMinorCivFriendshipLevelWithMajor(pPlayer:GetID()) >= 1) then
			GABonus = GABonus + 3
			if (tPlayer:GetMinorCivFriendshipLevelWithMajor(pPlayer:GetID()) == 2) then
				GABonus = GABonus + 3
			end
		end
	end
	GrantGABonus(pPlayer, GABonus)
end

function ChileCSScript(iPlayer)
	local iCurrentTurn = Game.GetGameTurn()
	if (Players[iPlayer]:IsAlive()) then
		if (Players[iPlayer]:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CHILE"]) then
			ChileCSAllies(iPlayer, iCurrentTurn)
		end
	end
end
GameEvents.PlayerDoTurn.Add(ChileCSScript)