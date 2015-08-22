-- Lua Script2
-- Author: DJSHenninger
-- DateCreated: 11/30/2014 12:39:41 AM
--------------------------------------------------------------
function FreePolicyCompleteBranch(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ANDORRA"] and player:IsAlive() then
                for city in player:Cities() do
                        if city:IsCapital() then
                                if player:HasPolicy(GameInfoTypes["POLICY_TRADITION_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY1"], 1)          
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_LIBERTY_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY2"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_HONOR_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY3"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_PIETY_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY4"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_PATRONAGE_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY5"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_AESTHETICS_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY6"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_COMMERCE_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY7"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_EXPLORATION_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY8"], 1)
                                end
                                if player:HasPolicy(GameInfoTypes["POLICY_RATIONALISM_FINISHER"]) then
                                        city:SetNumRealBuilding(GameInfoTypes["BUILDING_ADUMMY9"], 1)
                                end
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(FreePolicyCompleteBranch)

function AndorraGreatWorkBonus(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ANDORRA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_ANDORRA_GREAT_WORK"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_ANDORRA_GREAT_WORK"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(AndorraGreatWorkBonus) 