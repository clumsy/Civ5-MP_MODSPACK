-- Inuksuks provide more food when adjacent
-- Author: LastSword, Neirai
-- DateCreated: 3/6/2014 7:24:43 AM
--------------------------------------------------------------
local function DetermineClosestCity(plot, player)
	local pPlayer = Players[player]
	local pCap = pPlayer:GetCapitalCity()
	local pClosestCity = pCap
	local pCapPlot = pCap:Plot()
	local pDistance = Map.PlotDistance(plot:GetX(), plot:GetY(), pCapPlot:GetX(), pCapPlot:GetY())
	for pCity in pPlayer:Cities() do
		local cityPlot = pCity:Plot()
		local pCityDistance = Map.PlotDistance(plot:GetX(), plot:GetY(), cityPlot:GetX(), cityPlot:GetY())
		if pCityDistance < pDistance then
			pDistance = pCityDistance
			pClosestCity = pCity
		end
	end
	return pClosestCity
end

function AdjacentInuksuk(plot)
	if plot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_INUKSUK then
		if plot:IsImprovementPillaged() then
			return false
		end
	else
		for i = 0, 5 do
			local NeiraiHP = Map.PlotDirection(plot:GetX(), plot:GetY(), i);
			if NeiraiHP ~= nil then	
				if not NeiraiHP:IsImprovementPillaged() then
					if NeiraiHP:GetImprovementType() == GameInfoTypes.IMPROVEMENT_INUKSUK then
						return true
					end
				end
			end
		end
	end
	return false
end

function CheckAdjacencyPlz(plot, player)
	print("We're checking for adjacency!")
	local unit = plot:GetUnit(0)
	if unit then
		local owner = unit:GetOwner()
		if owner ~= player then
			if owner then
				if owner:IsPlayerHasOpenBorders(player) then
					for i = 0, 5 do
						local NeiraiHP = Map.PlotDirection(plot:GetX(), plot:GetY(), i);
						if NeiraiHP ~= nil then
							if NeiraiHP:GetOwner() == player then
								return true
							end
						end
					end	
				else
					return false
				end
			end
		end
	else
		for i = 0, 5 do
			local NeiraiHP = Map.PlotDirection(plot:GetX(), plot:GetY(), i);
			if NeiraiHP ~= nil then
				if NeiraiHP:GetOwner() == player then
					return true
				end
			end
		end
	end
	return false
end

function EmpowerColdPlot(plot, player)
	local pTeam = Teams[player]
	if AdjacentInuksuk(plot) then
		if plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or plot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or plot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
			if plot:GetYield(YieldTypes.YIELD_FOOD) == (plot:CalculateNatureYield(YieldTypes.YIELD_FOOD, pTeam, false) + plot:CalculateImprovementYieldChange(plot:GetImprovementType(), YieldTypes.YIELD_FOOD, player)) then
				Game.SetPlotExtraYield(plot:GetX(), plot:GetY(), GameInfoTypes.YIELD_FOOD, 1)
			end
			if plot:GetYield(YieldTypes.YIELD_PRODUCTION) == (plot:CalculateNatureYield(YieldTypes.YIELD_PRODUCTION, pTeam, false) + plot:CalculateImprovementYieldChange(plot:GetImprovementType(), YieldTypes.YIELD_PRODUCTION, player)) then
				Game.SetPlotExtraYield(plot:GetX(), plot:GetY(), GameInfoTypes.YIELD_PRODUCTION, 1)
			end
		end
	else
		if plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or plot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or plot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
			if plot:GetYield(YieldTypes.YIELD_FOOD) > (plot:CalculateNatureYield(YieldTypes.YIELD_FOOD, pTeam, false) + plot:CalculateImprovementYieldChange(plot:GetImprovementType(), YieldTypes.YIELD_FOOD, player)) then
				Game.SetPlotExtraYield(plot:GetX(), plot:GetY(), GameInfoTypes.YIELD_FOOD, -1)
			end
			if plot:GetYield(YieldTypes.YIELD_PRODUCTION) > (plot:CalculateNatureYield(YieldTypes.YIELD_PRODUCTION, pTeam, false) + plot:CalculateImprovementYieldChange(plot:GetImprovementType(), YieldTypes.YIELD_PRODUCTION, player)) then
				Game.SetPlotExtraYield(plot:GetX(), plot:GetY(), GameInfoTypes.YIELD_PRODUCTION, -1)
			end
		end
	end
end

function ExpandInuksukLands(plot, player, city)
	print("Inuksuit are trying to expand your territory!")
	local pPlayer = Players[player]
	local range = 2
	local x = plot:GetX()
	local y = plot:GetY()
	local SpreadChallenge = 0
	if Game.GetGameSpeedType() == 0 then 
		SpreadChallenge = 510
	elseif Game.GetGameSpeedType() == 1 then
		SpreadChallenge = 360
	elseif	Game.GetGameSpeedType() == 2 then
		SpreadChallenge = 240
	else
		SpreadChallenge = 150
	end
	local CityCultureCount = city:GetBaseJONSCulturePerTurn()
	print("Challenge is " .. SpreadChallenge .. " and culture is " .. CityCultureCount .. " in " .. city:GetName())
	for dx = -range, range do
		for dy = -range, range do
			local plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if plot then
				if plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or plot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or plot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
					if plot:GetOwner() == -1 then
						print("We found neutral ground")
						if CheckAdjacencyPlz(plot, player) then
							print("Found adjacent Inuit land")
							if CityCultureCount < SpreadChallenge then
								local DoesItSpread = Game.Rand(SpreadChallenge, "Rolling for Expansion")
								print("DoesItSpread? " .. DoesItSpread)
								if DoesItSpread < CityCultureCount then
									plot:SetOwner(pPlayer, city)
								end
							else
								plot:SetOwner(pPlayer)
							end
						end
					end
				end
			end
		end
	end
end

function Inuksuks(PlayerID)
	local pPlayer = Players[PlayerID]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT and pPlayer == Players[Game.GetActivePlayer()] then
		print("it triggered")
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(plotLoop)
			if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
				if pPlot:GetOwner() == PlayerID then
					if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_INUKSUK then
						print("Inuksuk found!")
						if not pPlot:IsImprovementPillaged() then
							local pCity = DetermineClosestCity(pPlot, PlayerID)
							for i = 0, 5 do
								local NeiraiHP = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), i);
								if NeiraiHP ~= nil then
									EmpowerColdPlot(NeiraiHP, PlayerID)
								end
							end
							ExpandInuksukLands(pPlot, PlayerID, pCity)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Inuksuks)