-- JFD_BohemiaFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("PlotIterators");
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
-------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_GetVaclav
-------------------------------------------------------------------------------------------------------------------------
local vaclav = nil

function JFD_GetVaclav()
	if vaclav == nil then	
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local player = Players[iPlayer]			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"] then
				vaclav = player
				break
			end
		end
	end
	
	return vaclav
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BOHEMIA"]
local buildingDefenseID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_DEFENSE"]
local buildingReligiousPressureID = GameInfoTypes["BUILDING_JFD_BOHEMIAN_PRESSURE"]
local isBohemiaCivActive = JFD_IsCivilisationActive(civilisationID)
local notificationGreatPersonID = NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"]
local stringTraitShortDescription = Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_BOHEMIA_SHORT")
local unitTaborID = GameInfoTypes["UNIT_JFD_TABOR"]
local unitClassInquisitorID = GameInfoTypes["UNITCLASS_INQUISITOR"]
local unitClassMissionaryID = GameInfoTypes["UNITCLASS_MISSIONARY"]
local unitClassProphetID = GameInfoTypes["UNITCLASS_PROPHET"]
local unitPromotionRivalTerritoryID = GameInfoTypes["PROMOTION_RIVAL_TERRITORY"]
local unitPromotionSightPenaltyID = GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local unitPromotionTaborDefenseID = GameInfoTypes["PROMOTION_JFD_TABOR_DEFENSE_OTHER"]
local unitPromotionTaborRangedID = GameInfoTypes["PROMOTION_JFD_TABOR_RANGED"] 
local unitPromotionUnwelcomeEvangelistID = GameInfoTypes["PROMOTION_UNWELCOME_EVANGELIST"]
local vaclavPlayer = JFD_GetVaclav()

if isBohemiaCivActive then
	print("King Vaclav II is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_BohemianHussites
------------------------------------------------------------------------------------------------------------------------
function JFD_BohemianHussites(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
    if player:IsEverAlive() then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[iPlayer]
			if (otherPlayer:IsAlive() and otherPlayer:GetCivilizationType() ~= civilisationID) then
				local plot = Map.GetPlot(unitX, unitY)
				if plot then
					local plotOwner = plot:GetOwner()
					if plotOwner ~= -1 and Players[plotOwner]:GetCivilizationType() == civilisationID then
						local unit = otherPlayer:GetUnitByID(unitID)
						if unit then
							if not (otherPlayer:IsPlayerHasOpenBorders(playerID)) then
								local getRandom = JFD_GetRandom(1,100)
								local unitClass = unit:GetUnitClassType()
								if (unitClass == unitClassMissionaryID or unitClass == unitClassInquisitorID) then
									if getRandom <= 100 then
										local description = Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA", unit:GetName())
										local newUnit = vaclavPlayer:InitUnit(GetStrongestMilitaryUnit(vaclavPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN"), unitX, unitY)
										if vaclavPlayer:IsHuman() then
											vaclavPlayer:AddNotification(notificationGreatPersonID, description, stringTraitShortDescription, unitX, unitY, GameInfo.Units["UNIT_MISSIONARY"].ID, -1)
										end
										newUnit:Convert(unit)
										newUnit:SetHasPromotion(unitPromotionRivalTerritoryID, false)
										newUnit:SetHasPromotion(unitPromotionSightPenaltyID, false)
										newUnit:SetHasPromotion(unitPromotionUnwelcomeEvangelistID, false)
									end
								elseif unitClass == unitClassProphetID then
									if getRandom <= 10 then
										local description = Locale.ConvertTextKey("TXT_KEY_JFD_BOHEMIA", unit:GetName())
										local newUnit = vaclavPlayerInitUnit(unitTaborID, unitX, unitY)
										if vaclavPlayer:IsHuman() then
											vaclavPlayer:AddNotification(notificationGreatPersonID, description, stringTraitShortDescription, unitX, unitY, GameInfo.Units["UNIT_PROPHET"].ID, -1)
										end
										newUnit:Convert(unit)
								 		newUnit:SetHasPromotion(unitPromotionRivalTerritoryID, false)
										newUnit:SetHasPromotion(unitPromotionSightPenaltyID, false)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

if isBohemiaCivActive then
	GameEvents.UnitSetXY.Add(JFD_BohemianHussites)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_BohemianCityStates
------------------------------------------------------------------------------------------------------------------------
function JFD_CountNumCSFollowingReligion(playerID, religionID)
	local numCS = 0
	for iPlayer = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minor = Players[iPlayer]
		if minor:IsEverAlive() then
			if minor:GetCapitalCity() then
				local minorCapital = minor:GetCapitalCity()
				if (minorCapital:GetReligiousMajority() == religionID and religionID > 0) then
					if not minorCapital:IsHasBuilding(buildingReligiousPressureID) then
						minorCapital:SetNumRealBuilding(buildingReligiousPressureID, 1)
					end
					numCS = numCS + 1
				else
					if minorCapital:IsHasBuilding(buildingReligiousPressureID) then
						minorCapital:SetNumRealBuilding(buildingReligiousPressureID, 0)
					end
				end
			end
		end
	end

	return numCS
end

function JFD_BohemianCityStates(playerID)
	local player = Players[playerID]
	if player:GetCapitalCity() then
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_BOHEMIAN_DELEGATES"], JFD_CountNumCSFollowingReligion(playerID, religionID))
		end
	end
end

if isBohemiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_BohemianCityStates)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_BohemianTaborUnitDefense
------------------------------------------------------------------------------------------------------------------------
function JFD_BohemianTaborUnitDefense(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and not player:IsMinorCiv() and not player:IsBarbarian()) then
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				local sameTile = false
				local plot = unit:GetPlot()
				if plot then
					for iVal = 0,(plot:GetNumUnits() - 1) do
						local tabor = plot:GetUnit(iVal)
						if tabor:GetUnitType() == unitTaborID then
							sameTile = true
							break
						end
					end
					
					if sameTile then
						if not unit:IsHasPromotion(unitPromotionTaborDefenseID) then
							unit:SetHasPromotion(unitPromotionTaborDefenseID, true)
						end

						if not unit:IsHasPromotion(unitPromotionTaborRangedID) then
							unit:SetHasPromotion(unitPromotionTaborRangedID, true)
						end
					else
						if unit:IsHasPromotion(unitPromotionTaborDefenseID) then
							unit:SetHasPromotion(unitPromotionTaborDefenseID, false)
						end

						if unit:IsHasPromotion(unitPromotionTaborRangedID) then
							unit:SetHasPromotion(unitPromotionTaborRangedID, false)
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_BohemianTaborUnitDefense)
------------------------------------------------------------------------------------------------------------------------
-- JFD_BohemianTaborCityDefense
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumAdjacentTabors(playerID, city)
	local player = Players[playerID]
	local cityID = city:GetID()
	local playerTeam = player:GetTeam()
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	local numTabors = 0 
	for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		local x = adjacentPlot:GetX()
		local y = adjacentPlot:GetY()
		if adjacentPlot:GetOwner() == playerID then
			for iVal = 0,(adjacentPlot:GetNumUnits() - 1) do
				local adjUnit = adjacentPlot:GetUnit(iVal)
				if (adjUnit:GetUnitType() == unitTaborID and adjUnit:GetOwner() == playerID) then
					numTabors = numTabors + 1
				end
			end
		end
	end

	return numTabors
end

function JFD_BohemianTaborCityDefense(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and not player:IsMinorCiv() and not player:IsBarbarian()) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDefenseID, JFD_GetNumAdjacentTabors(playerID, city))
		end
	end
end	
GameEvents.UnitSetXY.Add(JFD_BohemianTaborCityDefense)
--==========================================================================================================================
--==========================================================================================================================