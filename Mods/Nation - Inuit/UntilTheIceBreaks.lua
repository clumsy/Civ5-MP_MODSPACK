-- Until the Ice Breaks
-- Author: Neirai
-- DateCreated: 8/3/2014 4:30:02 PM
--------------------------------------------------------------
--local NeiraiSeaResourceTable = {}
--NeiraiSeaResourceTable[1] = GameInfoTypes.RESOURCE_PEARLS
--NeiraiSeaResourceTable[2] = GameInfoTypes.RESOURCE_CRAB
--NeiraiSeaResourceTable[3] = GameInfoTypes.RESOURCE_WHALE
--NeiraiSeaResourceTable[4] = GameInfoTypes.RESOURCE_CLSEALS
--NeiraiSeaResourceTable[5] = GameInfoTypes.RESOURCE_CORAL
--NeiraiSeaResourceTable[6] = GameInfoTypes.RESOURCE_JFD_SHELLFISH
--
--function ProductionForSeaTrade(player)
--	local pPlayer = Players[player]
--	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
		--local numberTradedSR = 0
		--for i = 1, 5 do
--			if pPlayer:GetResourceExport(NeiraiSeaResourceTable[i]) ~= nil then
				--numberTradedSR = 1
			--end
		--end
		--if numberTradedSR == 1 then
--			for pCity in pPlayer:Cities() do
				--pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_INUITSEABONUS, 1)
			--end
		--elseif numberTradedSR == 0 then
--			for pCity in pPlayer:Cities() do
				--pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_INUITSEABONUS, 0)
			--end
		--end
	--end
--end
--GameEvents.PlayerDoTurn.Add(ProductionForSeaTrade)

local function CheckForSeals(plot)
	for i = 0, 5 do
		local NeiraiHP = Map.PlotDirection(plot:GetX(), plot:GetY(), i);
		print(NeiraiHP)
		if NeiraiHP ~= nil then
			print("Checking for Seals")
			if NeiraiHP:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or NeiraiHP:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or NeiraiHP:GetFeatureType() == FeatureTypes.FEATURE_ICE then
				print("This should return true")
				return true
			end
		end
	end	
	return false
end

function GiveSealsForFish(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
		for pCity in pPlayer:Cities() do
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pSpecificPlot ~= nil then
					if pSpecificPlot:GetOwner() == pCity:GetOwner() then
						if pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FISHING_BOATS then
							if pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_FISH then
								print("Fish found")
								if CheckForSeals(pSpecificPlot) then
									print("Turn this to Seals!")
									pSpecificPlot:SetImprovementType(-1)
									pSpecificPlot:SetResourceType(-1)
									pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_CLSEALS, 1)
									pSpecificPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_FISHING_BOATS)
									pSpecificPlot:SetOwner(pCity:GetOwner())
									pCity:SetOverflowProduction(pCity:GetOverflowProduction() + 35)
									local pTitle = ("Seals near " .. pCity:GetName() .. "!")
									local pDesc = ("Our expert trappers have lured Seals to eat our fish! Doing so has created 35 [ICON_PRODUCTION] Production in " .. pCity:GetName() .. "!")
									pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, pDesc, pTitle, pCity:GetX(), pCity:GetY())
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GiveSealsForFish)

function CheckIfRemote(plot, player)
	local pPlayer = Players[player]
	for pCity in pPlayer:Cities() do
		local cityPlot = pCity:Plot()
		if Map.PlotDistance(plot:GetX(), plot:GetY(), cityPlot:GetX(), cityPlot:GetY()) < 4 then
			return false
		end
	end
	return true
end

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

function OutOfReachTiles(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
		print("Inuit found for OutOfReachTiles")
		for pCity in pPlayer:Cities() do -- Reset Button!
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS, 0)
		end
		for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(plotLoop)
			if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA or pPlot:GetFeatureType() == FeatureTypes.FEATURE_ICE then
				if pPlot:GetOwner() == player then
					if CheckIfRemote(pPlot, player) then -- every city is out of working range of this plot!
						print("This is a remote tile")
						local pCity = DetermineClosestCity(pPlot, player)
						print("The closest city is " .. pCity:GetName())
						local NumberCultureBuildings = pCity:GetNumBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS)
						NumberCultureBuildings = NumberCultureBuildings + 1
						pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS, NumberCultureBuildings)
					end
				end
			end
		end
		for pCity in pPlayer:Cities() do
			print(pCity:GetName() .. " has " .. pCity:GetNumBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS) .. " secret Culture buildings.")
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS, math.floor(pCity:GetNumBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS) / 2))
			print(pCity:GetName() .. " has " .. pCity:GetNumBuilding(GameInfoTypes.BUILDING_INUITWILDERNESS) .. " secret Culture buildings.")
		end
	end
end
GameEvents.PlayerDoTurn.Add(OutOfReachTiles)