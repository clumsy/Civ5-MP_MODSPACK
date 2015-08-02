-- JFD_FlandersFunctions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
--------------------------------------------------------------------------------------------------------------------------
local activePlayerID 			= Game.GetActivePlayer()
local activePlayer 				= Players[activePlayerID]
local activePlayerTeam 			= Teams[Game.GetActiveTeam()]
local civilisationID 			= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local isMuscovyCivActive 		= JFD_IsCivilisationActive(civilisationID)
local isMuscovyCivActivePlayer  = activePlayer:GetCivilizationType() == civilisationID
local mathCeil 					= math.ceil

if isMuscovyCivActive then
	print("Grand Prince Ivan IV is in the game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MoscoviteConquests
----------------------------------------------------------------------------------------------------------------------------
function JFD_MoscoviteConquests(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		local cityPlot = Map.GetPlot(cityX, cityY)
        for loopPlot in PlotAreaSpiralIterator(cityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if loopPlot:GetUnit() then
				loopPlot:GetUnit():ChangeDamage(-25)
			end
        end

		local oldPlayer = Players[oldOwnerID]
		for city in oldPlayer:Cities() do
			local damage = city:GetMaxHitPoints() * 33/100
			city:ChangeDamage(damage)
		end
	end
end

if isMuscovyCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_MoscoviteConquests)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MuscoviteRazing
----------------------------------------------------------------------------------------------------------------------------
function JFD_MuscoviteRazing(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local totalGoldenAgeReward = 0 
		for city in player:Cities() do
			if city:IsRazing() then
				local goldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
				local goldenAgeReward = mathCeil((city:GetPopulation() * goldenAgeModifier) / 3)
				totalGoldenAgeReward = totalGoldenAgeReward + goldenAgeReward
				player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
				if player:IsHuman() then 
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", goldenAgeReward))
				end
			end
		end

		if (player:IsHuman() and totalGoldenAgeReward > 0) then 
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_MUSCOVY_ALERT", totalGoldenAgeReward)) 
		end
	end
end

if isMuscovyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_MuscoviteRazing)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_StreltsyAdjacent
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionStreltsyID		= GameInfoTypes["PROMOTION_JFD_STRELTSY"]
local unitPromotionStreltsyInfoID	= GameInfoTypes["PROMOTION_JFD_STRELTSY_INFO"]

function JFD_StreltsyAdjacent(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		for unit in player:Units() do
			if (unit:GetPlot() and (unit:IsHasPromotion(unitPromotionStreltsyID) or unit:IsHasPromotion(unitPromotionStreltsyInfoID))) then
				local plot = unit:GetPlot()
				local adjStreltsy = false
				for loopPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if (loopPlot:IsUnit() and (loopPlot:GetUnit():IsHasPromotion(unitPromotionStreltsyID) or loopPlot:GetUnit():IsHasPromotion(unitPromotionStreltsyInfoID))) then
						adjStreltsy = true
						break
					end
				end
									
				if adjStreltsy then
					if (not unit:IsHasPromotion(unitPromotionStreltsyID)) then
						unit:SetHasPromotion(unitPromotionStreltsyID, true)
						unit:SetHasPromotion(unitPromotionStreltsyInfoID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionStreltsyID) then
						unit:SetHasPromotion(unitPromotionStreltsyID, false)
						unit:SetHasPromotion(unitPromotionStreltsyInfoID, true)
					end
				end
			end
		end
	end
end

if isMuscovyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_StreltsyAdjacent)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SoborCourthouse
----------------------------------------------------------------------------------------------------------------------------
local buildingSoborID				= GameInfoTypes["BUILDING_JFD_SOBOR"]
local buildingSoborCourthouseID		= GameInfoTypes["BUILDING_JFD_SOBOR_COURTHOUSE"]

function JFD_SoborCourthouse(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if buildingID == buildingSoborID then
			local city = player:GetCityByID(cityID)
			if city:IsOccupied() then
				city:SetNumRealBuilding(buildingSoborCourthouseID, 1)
			end
		end
	end
end

function JFD_SoborCourthouseSold(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
		if buildingID == buildingSoborID then
			local city = player:GetCityByID(cityID)
			if city:IsHasBuilding(buildingSoborCourthouseID) then
				city:SetNumRealBuilding(buildingSoborCourthouseID, 0)
			end
		end
	end
end

if isMuscovyCivActive then
	GameEvents.CityConstructed.Add(JFD_SoborCourthouse)
	GameEvents.CitySoldBuilding.Add(JFD_SoborCourthouseSold)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SoborFaithExpansion
--------------------------------------------------------------------------------------------------------------------------
local buildingSoborExpansionID	= GameInfoTypes["BUILDING_JFD_SOBOR_FAITH"]

function JFD_SoborFaithExpansion(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingSoborID) then
				local faithPerTurn = city:GetFaithPerTurn()
				city:SetNumRealBuilding(buildingSoborExpansionID, faithPerTurn)
			else
				if city:IsHasBuilding(buildingSoborExpansionID) then
					city:SetNumRealBuilding(buildingSoborExpansionID, 0)
				end
			end
		end
	end
end

function JFD_SoborFaithExpansionCityView(playerID, cityID, buildingID)
	if (activePlayer:IsEverAlive() and activePlayer:GetCivilizationType() == civilisationID) then
		local city = UI.GetHeadSelectedCity()
		if city then
			if city:IsHasBuilding(buildingSoborID) then
				local faithPerTurn = city:GetFaithPerTurn()
				city:SetNumRealBuilding(buildingSoborExpansionID, faithPerTurn)
			else
				if city:IsHasBuilding(buildingSoborExpansionID) then
					city:SetNumRealBuilding(buildingSoborExpansionID, 0)
				end
			end
		end
	end
end

if isMuscovyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_SoborFaithExpansion)
	if isMuscovyCivActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_SoborFaithExpansionCityView)
	end
end
--==========================================================================================================================
--==========================================================================================================================