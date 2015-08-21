-- StartOnSnow
-- Author: Neirai and LastSword (if it looks good, it's LastSword)
-- DateCreated: 1/28/2014 8:37:41 PM
--------------------------------------------------------------
function MoveInuitsToPlot(pPlayer, iPlot)
	local NerSetType = GameInfoTypes.UNIT_SETTLER;
	local NerUnitT = {}
	--local pPlayer = Players[iPlayer];
	for iUnit in pPlayer:Units() do
		NerUnitT[iUnit] = iUnit:GetUnitType()
	end
	local NerX = iPlot:GetX();
	local NerY = iPlot:GetY();
	pPlayer:InitUnit(NerSetType, NerX, NerY);
	NerSetB = false;
	for iUnit, vType in pairs(NerUnitT) do
		if NerSetB or (vType ~= NerSetType) then
			local jUnit = pPlayer:InitUnit(vType, NerX, NerY);
			jUnit:JumpToNearestValidPlot();				
		else
			NerSetB = true;
		end
		iUnit:Kill();
	end
	NerUnitT = nil;
end

local function InvalidInuitStart(pPlot, pPlayer)
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local plot = Map.GetPlotByIndex(plotLoop)
		local unit = plot:GetUnit(0)
		if unit ~= nil then
			if unit:GetOwner() ~= pPlayer then
				if Map.PlotDistance(plot:GetX(), plot:GetY(), pPlot:GetX(), pPlot:GetY()) < 8 then
					print("Distance is " .. Map.PlotDistance(plot:GetX(), plot:GetY(), pPlot:GetX(), pPlot:GetY()))
					print("Enemy Unit too close")
					return false
				end
			end
		end
		if plot:GetFeatureType() ~= nil then
			if plot:GetFeatureType() >= 7 then
				if Map.PlotDistance(plot:GetX(), plot:GetY(), pPlot:GetX(), pPlot:GetY()) < 6 then
					print ("Too close to a Natural Wonder")
					return false
				end
			end
		end
	end
	return true
end
	
local function AuditSnowArea(pPlot, pPlayer)
	print("Auditing a Snow Area!")
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	local range = 1
	local snowplots = 0
	local waterplots = 0
	local iceplots = 0
	local otherplots = 0
	local otherunit = false
	local noplots = 0
	if pPlot:GetPlotType() == PlotTypes.PLOT_MOUNTAIN then
		print("This is a bad plot because it's a mountain!")
		return false
	end
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if (SpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_OCEAN) then
						waterplots = waterplots + 1
					end
					if (SpecificPlot:GetFeatureType() == GameInfoTypes.FEATURE_ICE) then
						iceplots = iceplots + 1
					end
				else
					print("This is a bad plot because it's nil")
					return false
				end
			end
		end
	end
	if waterplots > 4 then
		print("This is a bad plot because it's too wet!")
		return false
	end
	if (iceplots > 2) then
		print ("This is a bad plot because there's too much ice!")
		return false
	end
	waterplots = 0
	iceplots = 0
	range = 3
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if (SpecificPlot:GetTerrainType() ~= nil) and (SpecificPlot:GetTerrainType() ~= TerrainTypes.NO_TERRAIN) then
					if SpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
						snowplots = snowplots + 1
					elseif (SpecificPlot:IsWater()) then
						waterplots = waterplots + 1
					elseif (SpecificPlot:GetFeatureType() == GameInfoTypes.FEATURE_ICE) then
						iceplots = iceplots + 1
					else
						otherplots = otherplots + 1
					end
				else
					noplots = noplots + 1
				end
			end
		end
	end
	if not InvalidInuitStart(pPlot, pPlayer) then
		print("Someone is in this plot")
		return false
	elseif noplots > 4 then
		print("This is a bad plot because there's too much nil around it!")
		return false
	elseif (snowplots > 2) and ((snowplots + otherplots) > waterplots) and (waterplots > (iceplots * 3)) then
		print("This is a good plot!")
		return true
	else
		print("This is a bad plot because it's not snowy enough!")
		return false
	end
end

local ResB = {}
ResB[0] = GameInfoTypes.RESOURCE_WHEAT
ResB[1] = GameInfoTypes.RESOURCE_COW
ResB[2] = GameInfoTypes.RESOURCE_SHEEP
ResB[3] = GameInfoTypes.RESOURCE_DEER
ResB[4] = GameInfoTypes.RESOURCE_BANANA

local ResS = {}
ResS[0] = GameInfoTypes.RESOURCE_IRON
ResS[1] = GameInfoTypes.RESOURCE_HORSE
ResS[2] = GameInfoTypes.RESOURCE_COAL
ResS[3] = GameInfoTypes.RESOURCE_OIL
ResS[4] = GameInfoTypes.RESOURCE_ALUMINUM
ResS[5] = GameInfoTypes.RESOURCE_URANIUM

local LandResL = {}
LandResL[0] = GameInfoTypes.RESOURCE_STONE
LandResL[1] = GameInfoTypes.RESOURCE_GOLD
LandResL[2] = GameInfoTypes.RESOURCE_SILVER
LandResL[3] = GameInfoTypes.RESOURCE_GEMS
LandResL[4] = GameInfoTypes.RESOURCE_MARBLE
LandResL[5] = GameInfoTypes.RESOURCE_IVORY
LandResL[6] = GameInfoTypes.RESOURCE_FUR
LandResL[7] = GameInfoTypes.RESOURCE_DYE
LandResL[8] = GameInfoTypes.RESOURCE_SPICES
LandResL[9] = GameInfoTypes.RESOURCE_SILK
LandResL[10] = GameInfoTypes.RESOURCE_SUGAR
LandResL[11] = GameInfoTypes.RESOURCE_COTTON
LandResL[12] = GameInfoTypes.RESOURCE_WINE
LandResL[13] = GameInfoTypes.RESOURCE_INCENSE
LandResL[14] = GameInfoTypes.RESOURCE_COPPER
LandResL[15] = GameInfoTypes.RESOURCE_SALT
LandResL[16] = GameInfoTypes.RESOURCE_TRUFFLES
LandResL[17] = GameInfoTypes.RESOURCE_COCOA
LandResL[18] = GameInfoTypes.RESOURCE_COFFEE
LandResL[19] = GameInfoTypes.RESOURCE_TEA
LandResL[20] = GameInfoTypes.RESOURCE_TOBACCO
LandResL[21] = GameInfoTypes.RESOURCE_AMBER
LandResL[22] = GameInfoTypes.RESOURCE_JADE
LandResL[23] = GameInfoTypes.RESOURCE_OLIVE
LandResL[24] = GameInfoTypes.RESOURCE_PERFUME
LandResL[25] = GameInfoTypes.RESOURCE_GLASS
LandResL[26] = GameInfoTypes.RESOURCE_LAPIS

local SeaResL = {}
SeaResL[0] = GameInfoTypes.RESOURCE_WHALE
SeaResL[1] = GameInfoTypes.RESOURCE_PEARLS
SeaResL[2] = GameInfoTypes.RESOURCE_CRAB
SeaResL[3] = GameInfoTypes.RESOURCE_CORAL



local function ShuffleTiles(ResourceTable) -- This function brought to you by wikipedia
	local n = #ResourceTable
	while n >= 2 do
		local k = math.random(n)
	    ResourceTable[n], ResourceTable[k] = ResourceTable[k], ResourceTable[n]
		n = n - 1
	end
	n = 2
	print("Shuffled")
	for k,v in pairs(ResourceTable) do print(k,v) end
	return ResourceTable
end

local function PlaceInuitBonusResource(plot)
	local n = #ResB
	local k = math.random(n)
	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		print("Can have Fish")
		plot:SetResourceType(GameInfoTypes.RESOURCE_FISH, 1)
		return true
	elseif ResB[k] == GameInfoTypes.RESOURCE_DEER then
		if plot:GetPlotType() ~= PlotTypes.PLOT_OCEAN then
			print("Can have Deer")
			plot:SetResourceType(ResB[k], 1)
			return true
		else
			print("Can't have Deer")
			return false
		end
	elseif plot:CanHaveResource(ResB[k], false) then
		print("Can have bonus")
		plot:SetResourceType(ResB[k], 1)
		return true
	else
		print("Can't have bonus")
		return false
	end
end

local function PlaceInuitStratResource(plot)
	local n = #ResS
	local k = math.random(n)
	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		print("This can only be Oil")
		local dice = math.random(3)
		if dice < 3 then
			plot:SetResourceType(GameInfoTypes.RESOURCE_OIL, 2)
		else
			plot:SetResourceType(GameInfoTypes.RESOURCE_OIL, 4)
		end
		return true
	elseif plot:CanHaveResource(ResS[k], false) then
		print("Can have strategic")
		local dice = math.random(3)
		if dice < 3 then
			plot:SetResourceType(ResS[k], 2)
		else
			plot:SetResourceType(ResS[k], 4)
		end
		return true
	elseif plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
		print("It's snow.")
		if ResS[k] ~= GameInfoTypes.RESOURCE_HORSE then
			local dice = math.random(3)
			if dice < 3 then
				plot:SetResourceType(ResS[k], 2)
			else
				plot:SetResourceType(ResS[k], 4)
			end
			return true
		end
	else
		print("Can't have strategic")
		return false
	end
end

local function PlaceInuitLuxResource(plot)
	if plot:GetPlotType() == PlotTypes.PLOT_OCEAN then
		local n = #SeaResL
		local k = math.random(n)
		if SeaResL[k] then
			print("Placing Sea Resource")
			plot:SetResourceType(SeaResL[k], 1)
			return true
		end
	else
		if LandResL[k] then
			if plot:CanHaveResource(LandResL[k], false) then
				print("Can have lux")
				plot:SetResourceType(LandResL[k], 1)
				return true
			elseif plot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW then
				if LandResL[k] == GameInfoTypes.RESOURCE_STONE or LandResL[k] == GameInfoTypes.RESOURCE_GOLD or LandResL[k] == GameInfoTypes.RESOURCE_SILVER or LandResL[k] == GameInfoTypes.RESOURCE_GEMS or LandResL[k] == GameInfoTypes.RESOURCE_IVORY or LandResL[k] == GameInfoTypes.RESOURCE_FUR or LandResL[k] == GameInfoTypes.RESOURCE_COPPER or LandResL[k] == GameInfoTypes.RESOURCE_SALT or LandResL[k] == GameInfoTypes.RESOURCE_AMBER or LandResL[k] == GameInfoTypes.RESOURCE_JADE then
					plot:SetResourceType(LandResL[k], 1)
				end
				return true
			else
				print("Can't have lux")
				return false
			end
		else
			print("Invalid Luxury. Please Install More Luxuries")
			return false
		end
	end
end

local function PlaceInuitResource(plot, CodeWord)
	print("placing a resource")
	if CodeWord == "Bonus" then
		print("Bonus")
		local attemptNum = 0
		while plot:GetResourceType(-1) == -1 and attemptNum < 30 do
			PlaceInuitBonusResource(plot)
			attemptNum = attemptNum + 1
		end
	elseif CodeWord == "Strategic" then
		print("Strategic")
		local attemptNum = 0
		while plot:GetResourceType(-1) == -1 and attemptNum < 30 do
			PlaceInuitStratResource(plot)
			attemptNum = attemptNum + 1
		end
	elseif CodeWord == "Luxury" then
		print("Luxury")
		local attemptNum = 0
		while plot:GetResourceType(-1) == -1 and attemptNum < 30 do
			PlaceInuitLuxResource(plot)
			attemptNum = attemptNum + 1
		end
	end
end

local function PopulateSnowStart(pPlot, Bonus, Strategic, Luxury)
	local ResourceTable = {}
	local blankNumber = (Bonus + Strategic + Luxury)
	for tileCount = 1, (Bonus + Strategic + Luxury + blankNumber) do
		if blankNumber > 0 then
			ResourceTable[tileCount] = "Blank"
			blankNumber = blankNumber - 1
		elseif Bonus > 0 then
			ResourceTable[tileCount] = "Bonus"
			Bonus = Bonus - 1
		elseif Strategic > 0 then
			ResourceTable[tileCount] = "Strategic"
			Strategic = Strategic - 1
		elseif Luxury > 0 then
			ResourceTable[tileCount] = "Luxury"
			Luxury = Luxury - 1
		end
	end
	print("placing new resources!")
	local ResSet = ShuffleTiles(ResourceTable)
	local TileNum = #ResSet
	local range = 3
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				if SpecificPlot:GetPlotType() ~= PlotTypes.PLOT_MOUNTAIN and SpecificPlot:GetFeatureType() ~= FeatureTypes.FEATURE_ICE and SpecificPlot ~= pPlot then
					if ResSet[TileNum] == "Blank" then
						SpecificPlot:SetResourceType(-1)
						TileNum = TileNum - 1
					elseif ResSet[TileNum] == "Bonus" then
						PlaceInuitResource(SpecificPlot, "Bonus")
						TileNum = TileNum - 1
					elseif ResSet[TileNum] == "Strategic" then
						PlaceInuitResource(SpecificPlot, "Strategic")
						TileNum = TileNum - 1
					elseif ResSet[TileNum] == "Luxury" then
						PlaceInuitResource(SpecificPlot, "Luxury")
						TileNum = TileNum - 1
					end
				else
					if ResSet[TileNum] == "Blank" then
						SpecificPlot:SetResourceType(-1)
						TileNum = TileNum - 1
					end
				end
			end
		end
	end
end

function FindNewInuitStartPlot(Bonus, Strategic, Luxury, pPlayer)
	print("Finding A Start Plot")
	for plotLoop = Map.GetNumPlots() - 1, 0, -1 do
		local pPlot = Map.GetPlotByIndex(plotLoop)
		if pPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW or pPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
			if AuditSnowArea(pPlot, pPlayer) then
				PopulateSnowStart(pPlot, Bonus, Strategic, Luxury)
				MoveInuitsToPlot(pPlayer, pPlot)
				return true
			end
		end
	end
end

local function CreateInuitStartingLocation(pPlot, pPlayer)
	print("Getting Resource Count")
	--For each plot within 3 squares of this plot, determine what kind of resource it has, and the number.
	local Bonus = 0
	local Strategic = 0
	local Luxury = 0
	local x = pPlot:GetX()
	local y = pPlot:GetY()
	local range = 3
	local team = pPlayer:GetTeam()
	for dx = -range, range do
		for dy = -range, range do
			local SpecificPlot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
			if SpecificPlot then
				local CheckResourceUse = Game.GetResourceUsageType(SpecificPlot:GetResourceType(-1))
				if CheckResourceUse == ResourceUsageTypes.RESOURCEUSAGE_BONUS then
					Bonus = Bonus + 1
				elseif CheckResourceUse == ResourceUsageTypes.RESOURCEUSAGE_STRATEGIC then
					Strategic = Strategic + 1
				elseif CheckResourceUse == ResourceUsageTypes.RESOURCEUSAGE_LUXURY then
					Luxury = Luxury + 1
				end
			end
		end
	end
	print("Bonus: " .. Bonus .. " Strategic: " .. Strategic .. " Luxury: " .. Luxury)
	if FindNewInuitStartPlot(Bonus, Strategic, Luxury, pPlayer) then
		range = range + 1
		for dx = -range, range do
			for dy = -range, range do
				local plot = Map.PlotXYWithRangeCheck(x, y, dx, dy, range)
				if plot then
					plot:SetRevealed(team, false)
				end
			end
		end
	end
end


function FindTheInuit()
	print("Looking For Inuit!")
	--if Game:GetGameTurn() == 0 or Game:GetGameTurn() == 33 or Game:GetGameTurn() == 82 or Game:GetGameTurn() == 122 or Game:GetGameTurn() == 165 or Game:GetGameTurn() == 214 or Game:GetGameTurn() == 264 then
	if Game:GetGameTurn() <= Game.GetStartTurn() then
		for i, possibleInuit in pairs(Players) do
			if possibleInuit:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
				if possibleInuit:GetCapitalCity() == nil then
					print("Inuit are playing this game!")
					for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
						local pPlot = Map.GetPlotByIndex(plotLoop)
						local pUnit = pPlot:GetUnit()
						if pUnit ~= nil then
							if (pUnit:GetUnitType() == GameInfoTypes.UNIT_SETTLER) and (pUnit:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT) then
								if pPlot:GetTerrainType() ~= TerrainTypes.TERRAIN_SNOW then
									print("Inuit Found!")
									CreateInuitStartingLocation(pPlot, possibleInuit)
									break
								end
							end
						end
					end
				end
			end
		end
	end
end
FindTheInuit()