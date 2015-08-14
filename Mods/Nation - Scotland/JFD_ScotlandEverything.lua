------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
include("PlotIterators")

local civilisationID = GameInfoTypes["CIVILIZATION_MC_SCOTLAND"]

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

if JFD_IsCivilisationActive(civilisationID) then
	print("King Robert the Bruce is in this game")
end

function JFD_GetUniqueUnit(player, unitClass)
  local unitType = nil
  local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
 
  for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
    unitType = uniqueUnit.UnitType
    break
  end
 
  if (unitType == nil) then
    unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
  end
 
  return unitType
end
------------------------------------------------------------------------------------------------------------------------
-- Swarmed Combat Bonus
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumEnemyUnits(playerID, unit)
	local numEnemyUnits = 0
	local plot = Map.GetPlot(unit:GetX(), unit:GetY())
	for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if adjacentPlot:GetUnit() then
			local enemyUnit = adjacentPlot:GetUnit()
			if enemyUnit:GetOwner() ~= playerID and Teams[Players[enemyUnit:GetOwner()]:GetTeam()]:IsAtWar(Players[playerID]:GetTeam()) then
				numEnemyUnits = numEnemyUnits + 1
			end
		end
	end

	return numEnemyUnits
end

function JFD_RobertBruceFlankingEnemiesBonus(playerID)
	local player = Players[playerID]
	local flankingEnemies = false
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		for unit in player:Units() do
			local flankingEnemiesPromotionID = GameInfoTypes["PROMOTION_JFD_LAND_OF_THE_FREE"]
			local flankingEnemiesPromotionInfoID = GameInfoTypes["PROMOTION_JFD_LAND_OF_THE_FREE_INFO"]
			if unit and unit:IsHasPromotion(flankingEnemiesPromotionInfoID) and not unit:IsEmbarked() then
				if JFD_GetNumEnemyUnits(playerID, unit) > 1 then
					flankingEnemies = true
				end
			end
				
			if flankingEnemies then
				if not unit:IsHasPromotion(flankingEnemiesPromotionID) then
					unit:SetHasPromotion(flankingEnemiesPromotionID, true)
					unit:SetHasPromotion(flankingEnemiesPromotionInfoID, false)
				end
			else
				if unit:IsHasPromotion(flankingEnemiesPromotionID) then
					unit:SetHasPromotion(flankingEnemiesPromotionID, false)
					unit:SetHasPromotion(flankingEnemiesPromotionInfoID, true)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.UnitSetXY.Add(JFD_RobertBruceFlankingEnemiesBonus)
	GameEvents.PlayerDoTurn.Add(JFD_RobertBruceFlankingEnemiesBonus)
end
------------------------------------------------------------------------------------------------------------------------
-- Clan Castle Stuff
------------------------------------------------------------------------------------------------------------------------
local scottishClans = {}
  scottishClans.ERA_ANCIENT = "UNITCLASS_WARRIOR"
  scottishClans.ERA_CLASSICAL = "UNITCLASS_SPEARMAN"
  scottishClans.ERA_MEDIEVAL = "UNITCLASS_PIKEMAN"
  scottishClans.ERA_RENAISSANCE = "UNITCLASS_MUSKETMAN"
  scottishClans.ERA_ENLIGHTENMENT = "UNITCLASS_LINE_INFANTRY"
  scottishClans.ERA_INDUSTRIAL = "UNITCLASS_RIFLEMAN"
  scottishClans.ERA_MODERN = "UNITCLASS_GREAT_WAR_INFANTRY"
  scottishClans.ERA_POSTMODERN = "UNITCLASS_INFANTRY"
  scottishClans.ERA_FUTURE = "UNITCLASS_INFANTRY"

function JFD_SpawnScottishClans(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		for plotID = 0, city:GetNumCityPlots() - 1, 1 do
			local plot = city:GetCityIndexPlot(plotID)
			if plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_MC_SCOTTISH_CLAN_CASTLE"] and plot:GetOwner() == playerID then
				local unitClass = scottishClans[GameInfo.Eras[player:GetCurrentEra()].Type]
				local unitType = JFD_GetUniqueUnit(player, unitClass)
				player:InitUnit(GameInfoTypes[unitType], plot:GetX(), plot:GetY())
			end
		end
	end
end

function JFD_GetRobertBruce()
	local robert = nil
	if robert == nil then	
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[iPlayer]			
			if player and player:GetCivilizationType() == civilisationID then
				robert = player
				break
			end
		end
	end
	
	return robert
end

local warTable = {}
	
function JFD_ScottishClanDefense(teamOne, teamTwo, war)
	local robert = JFD_GetRobertBruce()
	if war then
		if (warTable[teamOne] ~= nil) then
			warTable[teamOne] = nil
		else
			warTable[teamTwo] = teamOne
			for attackingPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do			
				for defendingPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
					attackingPlayer = Players[attackingPlayerID]
					defendingPlayer = Players[defendingPlayerID]
					if attackingPlayer:IsAlive() and not attackingPlayer:IsMinorCiv() and defendingPlayer:IsAlive() and not defendingPlayer:IsMinorCiv() then
						if attackingPlayer:GetTeam() == teamOne and defendingPlayer:GetTeam() == teamTwo then
							if defendingPlayer:GetCivilizationType() == civilisationID and Teams[defendingPlayer:GetTeam()]:GetAtWarCount(true) <= 1 then 
								JFD_SpawnScottishClans(defendingPlayerID)
							end
						end
					end
				end	
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	Events.WarStateChanged.Add(JFD_ScottishClanDefense)
end
------------------------------------------------------------------------------------------------------------------------
-- Scottish Culture From Hills
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumAdjacentHills(playerID, city)
	local numAdjacentHills = 0
	local plot = Map.GetPlot(city:GetX(), city:GetY())
    for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local x = adjacentPlot:GetX()
		local y = adjacentPlot:GetY()
		if adjacentPlot:GetOwner() == playerID and adjacentPlot:IsHills() then
			numAdjacentHills = numAdjacentHills + 1
		end
	end

    return numAdjacentHills     
end

function JFD_ScottishCultureFromHills(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_SCOTTISH_CULTURE"], math.ceil(JFD_GetNumAdjacentHills(playerID, city) / 2))
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_ScottishCultureFromHills)
	GameEvents.PlayerCityFounded.Add(JFD_ScottishCultureFromHills)
end