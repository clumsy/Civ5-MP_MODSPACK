-- ThebesFunctions
-- Author: DJSHenninger/Firebug/JFD
-- DateCreated: 3/22/2015 11:55:52 AM
--------------------------------------------------------------
 
-------------------------------------------------------------------------------------------------
--ThebesTrait
-------------------------------------------------------------------------------------------------
 
function CountNumAlliedCSThebes(playerID)
	local player = Players[playerID]
	local numCS = 0
	for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
			numCS = numCS + 1
		end
	end
	
	 return numCS
end

local buildingThebesCultureID 			 = GameInfoTypes["BUILDING_THEBES_PEACE_CULTURE"]
local buildingThebesMilitaryProductionID = GameInfoTypes["BUILDING_THEBES_WAR_MILITARY"]
local civilizationID 					 = GameInfoTypes["CIVILIZATION_THEBES"]
local mathMin 							 = math.min
function ThebesTrait(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCapitalCity() and player:GetCivilizationType() == civilizationID) then
		local playerTeam = Teams[player:GetTeam()]
		local atPeace = true
		if playerTeam:GetAtWarCount(true) > 0 then
			atPeace = false
		end
		
		local numCSAllies = mathMin(CountNumAlliedCSThebes(playerID), 5)
		for city in player:Cities() do
			if atPeace then
				city:SetNumRealBuilding(buildingThebesCultureID, numCSAllies)
				if city:IsHasBuilding(buildingThebesMilitaryProductionID) then
					city:SetNumRealBuilding(buildingThebesMilitaryProductionID, 0)
				end
			else
				city:SetNumRealBuilding(buildingThebesMilitaryProductionID, numCSAllies)
				if city:IsHasBuilding(buildingThebesCultureID) then
					city:SetNumRealBuilding(buildingThebesCultureID, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ThebesTrait)
