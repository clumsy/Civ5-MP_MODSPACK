-- JFD_CoreFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("PlotIterators")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationDidoID = GameInfoTypes["CIVILIZATION_CARTHAGE"]
local civilisationHannibalID = GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]

function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- GetRandom
--------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--==========================================================================================================================
-- CORE DIDO FUNCTIONS
--==========================================================================================================================
--InitDido
-------------------------------------------------------------------------------------------------------------------------
function InitDido(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationDidoID then
			if not player:HasPolicy(GameInfoTypes["POLICY_JFD_DIDO_CARTHAGE"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_JFD_DIDO_CARTHAGE"], true)	
			end
		end
	end 
end

if JFD_IsCivilisationActive(civilisationDidoID) then 
	print("Dido is in this game")
	Events.SequenceGameInitComplete.Add(InitDido) 
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_DidoWaterClaims
----------------------------------------------------------------------------------------------------------------------------
function JFD_DidoWaterClaims(playerID, iX, iY)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationDidoID then
		local playerTeam = player:GetTeam()
		local plot = Map.GetPlot(iX, iY)
		local city = plot:GetPlotCity()
		local cityID = city:GetID()
		for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			x = adjacentPlot:GetX()
			y = adjacentPlot:GetY()
			if adjacentPlot:GetOwner() == -1 and (adjacentPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] or adjacentPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"])  then
				adjacentPlot:SetOwner(playerID, cityID, true, true)
				adjacentPlot:SetRevealed(playerTeam, true)
			end
		end
		
		Sukritact_PlaceResource(city)
	end 	
end

if JFD_IsCivilisationActive(civilisationDidoID) then 
	GameEvents.PlayerCityFounded.Add(JFD_DidoWaterClaims)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_NavalDefense
----------------------------------------------------------------------------------------------------------------------------	
function JFD_NavalDefense(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationDidoID and player:IsAlive() then
		local inCity = false
		local navalUnit
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_COTHON"]) then
				local plot = Map.GetPlot(city:GetX(), city:GetY()) 
				if plot then
					for i = 0, plot:GetNumUnits() - 1 do
						if plot:GetUnit(i):GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALMELEE"] or plot:GetUnit(i):GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALRANGED"] then
							inCity = true
							navalUnit = plot:GetUnit(i)
						end
					end
				end
						
				local didoBuildingID = GameInfoTypes["BUILDING_JFD_DIDO_CARTHAGE"]
				if inCity then
					local unitStrength = navalUnit:GetBaseCombatStrength() * 25 / 100
					if city:GetNumBuilding(didoBuildingID) ~= unitStrength then
						city:SetNumRealBuilding(didoBuildingID, unitStrength)
					end
				else
					if city:IsHasBuilding(didoBuildingID) then
						city:SetNumRealBuilding(didoBuildingID, 0)
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationDidoID) then
	GameEvents.PlayerDoTurn.Add(JFD_NavalDefense) 
	GameEvents.UnitSetXY.Add(JFD_NavalDefense)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_QuinqueremeFriendlyStrength
----------------------------------------------------------------------------------------------------------------------------
function JFD_QuinqueremeFriendlyStrength(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_QUINQUEREME_FRIENDLY_LANDS"]) and Map.GetPlot(unit:GetX(), unit:GetY()) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY()) 
			local baseCombatStrength = GameInfo.Units[unit:GetUnitType()].Combat
			if plot then
				if plot:GetOwner() == playerID then
					unit:SetBaseCombatStrength(baseCombatStrength + baseCombatStrength * 20 / 100)
				else
					unit:SetBaseCombatStrength(baseCombatStrength)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_QuinqueremeFriendlyStrength) 
GameEvents.UnitSetXY.Add(JFD_QuinqueremeFriendlyStrength)
--------------------------------------------------------------
-- Sukritact_PlaceResource
--------------------------------------------------------------
iResource = GameInfoTypes.RESOURCE_JFD_SHELLFISH
iRadius = 3

function Sukritact_PlaceResource(pCity)
    local pPlot = pCity:Plot()
    local tPlots = {}
    local iNumtoPlace = 1
    for pLoopPlot in PlotAreaSweepIterator(pPlot, iRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(tPlots, pLoopPlot)
    end
	
    for iVal = 1, iNumtoPlace do
		local bPlaced = false
		while (not(bPlaced)) and #tPlots > 0 do
			local iRandom = GetRandom(1, #tPlots)
			local pPlot = tPlots[iRandom]
			if pPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] and pPlot:GetFeatureType() ~= GameInfoTypes["FEATURE_ATOLL"] and pPlot:GetFeatureType() ~= GameInfoTypes["FEATURE_ICE"] and not pPlot:IsLake() and pPlot:GetResourceType() == -1 then
				pPlot:SetResourceType(iResource, 1)
				bPlaced = true
			end
			
			table.remove(tPlots, iRandom)
		end
	end
end
--==========================================================================================================================
-- CORE HANNIBAL FUNCTIONS
--==========================================================================================================================
-- JFD_ShophetGreatAdmiral
----------------------------------------------------------------------------------------------------------------------------	
function JFD_ShophetGreatAdmiral(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local shophetIsGeneral = false
	local unit = player:GetUnitByID(unitID)
	if unit and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"]) or unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"]) then
		if Map.GetPlot(unitX, unitY) then
			local plot = Map.GetPlot(unitX, unitY)
			if plot:IsWater() then
				shophetIsGeneral = true
			end
			
			local newUnit		
			if shophetIsGeneral and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"]) then
				newUnit = player:InitUnit(GameInfoTypes["UNIT_GREAT_ADMIRAL"], unitX, unitY)
				unit:SetEmbarked(false)
				newUnit:Convert(unit, false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"], false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_GREAT_GENERAL"], false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET"], false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"], true)
			elseif not shophetIsGeneral and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"]) then
				newUnit = player:InitUnit(GameInfoTypes["UNIT_JFD_SHOPHET"], unitX, unitY)
				newUnit:Convert(unit, false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"], false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_GREAT_ADMIRAL"], false)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"], true)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET"], true)
			end
		end			
	end
end
GameEvents.UnitSetXY.Add(JFD_ShophetGreatAdmiral) 
----------------------------------------------------------------------------------------------------------------------------
-- JFD_HannibalAtTheGates
----------------------------------------------------------------------------------------------------------------------------
function JFD_HannibalAtTheGates(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET"]) then
			local unitX = unit:GetX()
			local unitY = unit:GetY()
			for otherPlayerID, otherPlayer in pairs(Players) do
				if otherPlayer:IsAlive() and otherPlayerID ~= player:GetID() then
					local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
					if otherPlayerTeam:IsAtWar(player:GetTeam()) then
						for city in otherPlayer:Cities() do
							local damage
							if Map.PlotDistance(unitX, unitY, city:GetX(), city:GetY()) < 2 then
								damage = 30
							elseif Map.PlotDistance(unitX, unitY, city:GetX(), city:GetY()) < 3 then
								damage = 20
							end
							
							city:ChangeDamage(damage)
						end
					end
				end
			end
		end
	end		
end	
GameEvents.PlayerDoTurn.Add(JFD_HannibalAtTheGates)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ShophetHealOnDefeat
----------------------------------------------------------------------------------------------------------------------------
function JFD_ShophetHealOnDefeat(playerID)
	local player = Players[playerID]
	local shophetNearby = false
	for unit in player:Units() do
		if unit and unit:IsCombatUnit() then
			for shophet in player:Units() do
				if shophet:GetUnitType() == GameInfoTypes["UNIT_JFD_SHOPHET"] then
					local shophetX = shophet:GetX()
					local shophetY = shophet:GetY() 
					if Map.PlotDistance(unit:GetX(), unit:GetY(), shophetX, shophetY) < 2 then
						shophetNearby = true
					end
				end
			end
			
			local shophetPromotionID = GameInfoTypes["PROMOTION_JFD_SHOPHET_HEAL"]
			if shophetNearby then
				if not unit:IsHasPromotion(shophetPromotionID) then
					unit:SetHasPromotion(shophetPromotionID, true)
				end
			else
				if unit:IsHasPromotion(shophetPromotionID) then
					unit:SetHasPromotion(shophetPromotionID, false)
				end
			end
			
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_ShophetHealOnDefeat) 
GameEvents.PlayerDoTurn.Add(JFD_ShophetHealOnDefeat)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MilitaryGarrisonProduction
----------------------------------------------------------------------------------------------------------------------------	
function JFD_MilitaryGarrisonProduction(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == civilisationHannibalID then
		for city in player:Cities() do
			local hannibalProductionBuildingID = GameInfoTypes["BUILDING_JFD_HANNIBAL_CARTHAGE"]
			if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then
				if city:GetGarrisonedUnit() then
					local unitStrength = city:GetGarrisonedUnit():GetBaseCombatStrength() * 25 / 100
					if city:GetNumBuilding(hannibalProductionBuildingID) ~= unitStrength then
						city:SetNumRealBuilding(hannibalProductionBuildingID, unitStrength)
					end
				else
					if city:IsHasBuilding(hannibalProductionBuildingID) then
						city:SetNumRealBuilding(hannibalProductionBuildingID, 0)
					end
				end
			else
				if city:IsHasBuilding(hannibalProductionBuildingID) then
					city:SetNumRealBuilding(hannibalProductionBuildingID, 0)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationHannibalID) then
	print("Hannibal is in this game")
	GameEvents.PlayerDoTurn.Add(JFD_MilitaryGarrisonProduction)
	GameEvents.UnitSetXY.Add(JFD_MilitaryGarrisonProduction)
end
--==========================================================================================================================
--==========================================================================================================================