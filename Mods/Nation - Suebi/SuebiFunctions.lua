function MeleeSack(playerID, unitID)
	local player = Players[playerID]
	local iUnit = player:GetUnitByID(unitID)
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SUEBI"] and player:IsAlive() then
		for iUnit in player:Units() do
			if iUnit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MELEE"] then
				local Plot = iUnit:GetPlot()
				for city in player:Cities() do
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SUEBI_DUMMY"], 0)	
				end
				if Plot:IsCity() then
					local city = Plot:GetPlotCity()
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SUEBI_DUMMY"], 1)
					return
				end
			end
		end	
	end
end
GameEvents.PlayerDoTurn.Add(MeleeSack)

function RaiderPromotion(playerID, unitID)
	local player = Players[playerID]
	local iUnit = player:GetUnitByID(unitID)
	if player:IsAlive() then
		for iUnit in player:Units() do
			if iUnit:GetUnitType() == GameInfoTypes["UNIT_TCM_SUEBI_WARRIOR"] then
				local Plot = iUnit:GetPlot()
				local OnImprovement = false
				local NO_IMPROVEMENT = -1
				if (Plot:GetImprovementType() ~= NO_IMPROVEMENT and Plot:IsImprovementPillaged() == true) then
					OnImprovement = true
				end
				if OnImprovement == true then
					iUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SUEBI_STRENGHT"], true)
				end
				if OnImprovement == false then
					iUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SUEBI_STRENGHT"], false)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RaiderPromotion)
