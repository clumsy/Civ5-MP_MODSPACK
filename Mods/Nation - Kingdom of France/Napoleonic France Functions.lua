-- Napoleonic France Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
print ("The Kingdom of France begins")
----------------------------------------------------------------------------------------------------------------------------
-- JFD_UnitCourthouse
----------------------------------------------------------------------------------------------------------------------------	
function JFD_UnitCourthouse(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_NAPOLEONIC_FRANCE"] then
		for city in player:Cities() do
			if city:IsOccupied() then
				local marshalIsHere = false
				for city in player:Cities() do
					local plot = city:Plot()
					for i = 0, plot:GetNumUnits() - 1, 1 do
						if plot:GetUnit(i):GetUnitType() == GameInfoTypes["UNIT_JFD_NAPOLEONIC_MARSHAL"] then
							marshalIsHere = true
						end
					end
							
					if marshalIsHere then
						if not city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_DUMMY_COURTHOUSE"]) then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_DUMMY_COURTHOUSE"], 1)
						end
					else
						if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_DUMMY_COURTHOUSE"]) then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_DUMMY_COURTHOUSE"], 0)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_UnitCourthouse)
GameEvents.UnitSetXY.Add(JFD_UnitCourthouse)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FreeWarUnit
----------------------------------------------------------------------------------------------------------------------------	
function GetNapoleon()
	if napoleon == nil then	
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[iPlayer];			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_NAPOLEONIC_FRANCE"] then
				napoleon = player
				break
			end
		end
	end
	
	return napoleon
end

function JFD_FreeWarUnit(teamOne, teamTwo, bWar)
	if bWar then
		local napoleon = GetNapoleon()
		if napoleon then
			if Teams[teamOne]:IsMinorCiv() or Teams[teamOne]:IsBarbarian() then return end
			if Teams[teamTwo]:IsMinorCiv() or Teams[teamTwo]:IsBarbarian() then return end

			if teamOne == napoleon:GetTeam() then
				if Teams[teamOne]:GetAtWarCount() == 1 then
					napoleon:AddFreeUnit(GameInfoTypes["UNIT_JFD_NAPOLEONIC_MARSHAL"], UNITAI_GENERAL)		
				end
			elseif teamTwo == napoleon:GetTeam() then
				if Teams[teamTwo]:GetAtWarCount() == 1 then
					napoleon:AddFreeUnit(GameInfoTypes["UNIT_JFD_NAPOLEONIC_MARSHAL"], UNITAI_GENERAL)		
				end
			end
		end
	end
end
Events.WarStateChanged.Add(JFD_FreeWarUnit)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_StackedGreatGeneralXP
----------------------------------------------------------------------------------------------------------------------------	
function JFD_StackedGreatGeneralXP(playerID)
	local player = Players[playerID]
		for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_IMPERIAL_GUARD"]) then
			local plot = unit:GetPlot()
			for i = 0, plot:GetNumUnits() - 1, 1 do
				if plot:GetUnit(i):GetUnitClassType() == GameInfoTypes["UNITCLASS_GREAT_GENERAL"] then
					unit:ChangeExperience(2)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_StackedGreatGeneralXP)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ExtraStrengthFromDamage
----------------------------------------------------------------------------------------------------------------------------	
function JFD_ExtraStrengthFromDamage(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_BONUS_WHEN_DAMAGED"]) then
			local currentDamage = unit:GetDamage()
			local unitType = unit:GetUnitType()
			local baseStrength = GameInfo.Units[unitType].Combat
			local damageThreshold = 50
			local extraStrength
				if currentDamage >= 90 then extraStrength = 5
				elseif currentDamage >= 80 then extraStrength = 4
				elseif currentDamage >= 70 then extraStrength = 3
				elseif currentDamage >= 60 then extraStrength = 2
				elseif currentDamage >= 50 then extraStrength = 1
				else extraStrength = 0
				end
				
			if baseStrength ~= baseStrength + extraStrength then
				if unit:GetDamage() >= damageThreshold then
					unit:SetBaseCombatStrength(baseStrength + extraStrength)
				else
					unit:SetBaseCombatStrength(baseStrength)
				end
			else	
				unit:SetBaseCombatStrength(baseStrength)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_ExtraStrengthFromDamage) 
GameEvents.PlayerDoTurn.Add(JFD_ExtraStrengthFromDamage)
--==========================================================================================================================
--==========================================================================================================================