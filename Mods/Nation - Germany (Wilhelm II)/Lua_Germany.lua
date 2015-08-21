WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "geWilhelmIIGermany";

function GreaterEurope_UBoatSunkShip(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == GameInfoTypes["UNIT_CARGO_SHIP"] then	
		local plot = unit:GetPlot()
		local enemyUnit = plot:GetUnit()
		if enemyUnit:GetUnitType() == GameInfoTypes["UNIT_GE_UBOAT"] then	
			enemyUnit:ChangeExperience(15)
		end
	end
end
GameEvents.CanSaveUnit.Add(GreaterEurope_UBoatSunkShip)

function GreaterEurope_UBoatBlockade(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:GetUnitType() == GameInfoTypes["UNIT_GE_UBOAT"] then	
			local plot = unit:GetPlot()
			local city = plot:GetWorkingCity()	
			if city ~= nil then
				if city:IsPlotBlockaded(plot) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_AFTER_ATTACKING"], true)
				else
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_AFTER_ATTACKING"], false)
				end
			else
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_AFTER_ATTACKING"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GreaterEurope_UBoatBlockade)
GameEvents.PlayerDoTurn.Add(GreaterEurope_UBoatBlockade)

function GreaterEurope_Germany_NoMansLand(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:GetUnitType() == GameInfoTypes["UNIT_GE_STORMTROOPER"] then	
			local plot = unit:GetPlot()
			if not(plot:IsHills()) and not(plot:GetFeatureType() == FeatureTypes["FEATURE_FOREST"]) and not(plot:GetFeatureType() == FeatureTypes["FEATURE_JUNGLE"]) and not(plot:GetFeatureType() == FeatureTypes["FEATURE_MARSH"]) and not(plot:GetTerrainType() == TerrainTypes["TERRAIN_COAST"]) and not(plot:GetTerrainType() == TerrainTypes["TERRAIN_OCEAN"]) then 
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_GE_STORMTROOPER_OPENTERRAIN"], true)
			else
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_GE_STORMTROOPER_OPENTERRAIN"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GreaterEurope_Germany_NoMansLand)

function GreaterEurope_GermanWorkerTrait(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"] then
		if unit:GetUnitType() == GameInfoTypes["UNIT_WORKER"] then	
			local plot = unit:GetPlot()
			local militaryUnit = plot:GetUnit()
			if not(militaryUnit:GetUnitType() == GameInfoTypes["UNIT_WORKER"]) then	
				militaryUnit:SetDamage(0)
				militaryUnit:SetHasPromotion(GameInfoTypes["PROMOTION_GE_GERMANYTRAIT"], true)
			end
		end
	end
end
GameEvents.CanSaveUnit.Add(GreaterEurope_GermanWorkerTrait)

function GetWilhelm()
	if wilhelm == nil then	
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[iPlayer];			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"] then
				wilhelm = player
				break
			end
		end
	end
	
	return wilhelm
end

function GE_GermanyWarTrait(teamOne, teamTwo, bWar)
	if bWar then
		local wilhelm = GetWilhelm()
		local germanyAtWar = false
		if wilhelm then
			if Teams[teamOne]:IsMinorCiv() or Teams[teamOne]:IsBarbarian() then return end
			if Teams[teamTwo]:IsMinorCiv() or Teams[teamTwo]:IsBarbarian() then return end

			if teamOne == wilhelm:GetTeam() then
				if Teams[teamOne]:GetAtWarCount() == 1 then
					germanyAtWar = true
				end
			elseif teamTwo == wilhelm:GetTeam() then
				if Teams[teamTwo]:GetAtWarCount() == 1 then
					germanyAtWar = true
				end
			end 
			local capital = wilhelm:GetCapitalCity()
			if germanyAtWar == true then
				if load(wilhelm, "GEgermanyTimer") == nil then
					save(wilhelm, "GEgermanyTimer", 10)
				end
			end
		end
	end
end
Events.WarStateChanged.Add(GE_GermanyWarTrait)

function GE_GermanyTimer(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"] then
		local timer = load(player, "GEgermanyTimer")
		if timer ~= nil then
			if timer == 10 then
				for unit in player:Units() do
					unit:ChangeMoves(2)
				end
				timerUpdate = timer - 1
				save(player, "GEgermanyTimer", timerUpdate)
			elseif timer > 0 then
				for unit in player:Units() do
					unit:ChangeMoves(1)
				end
				timerUpdate = timer - 1
				save(player, "GEgermanyTimer", timerUpdate)
			end
		end
		if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then
			save(player, "GEgermanyTimer", nil)
			for unit in player:Units() do
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_GE_GERMANYTRAIT"], false)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GE_GermanyTimer)

