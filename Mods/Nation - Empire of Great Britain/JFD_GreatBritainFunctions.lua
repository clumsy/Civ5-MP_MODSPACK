-- JFD_CoreFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_GreatBritainUtilities")
--=======================================================================================================================
-- CORE VICTORIA FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingRedcoatProductionID = GameInfoTypes["BUILDING_JFD_REDCOAT_PRODUCTION"]
local buildingScienceID = GameInfoTypes["BUILDING_JFD_VICTORIAN_SCIENCE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local isGreatBritainCivActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
local unitRedcoatID = GameInfoTypes["UNIT_JFD_REDCOAT"]
local unitPromotionRedcoatID = GameInfoTypes["PROMOTION_JFD_REDCOAT_GARRISON"]

if isGreatBritainCivActive then
	print("Queen Victoria is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_CityStartingGold
--------------------------------------------------------------------------------------------------------------------------
function JFD_CityStartingGold(playerID, iX, iY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local plot = Map.GetPlot(iX, iY)
		local city = plot:GetPlotCity()
		local startingGold = mathFloor(JFD_GetCityStartingGold(playerID, city))
		player:ChangeGold(startingGold)
		if player:IsHuman() then
			local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_VICTORIAN_FUNDS", startingGold, city:GetName())
			Events.GameplayAlertMessage(alertmessage)
		end		
	end 	
end

if isGreatBritainCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_CityStartingGold)
end
--------------------------------------------------------------
-- JFD_RedcoatProduction
--------------------------------------------------------------
function JFD_RedcoatProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		for city in player:Cities() do
			local garrison = city:GetGarrisonedUnit()
			if (garrison and garrison:IsHasPromotion(unitPromotionRedcoatID)) then
				city:SetNumRealBuilding(buildingRedcoatProductionID, JFD_GetProductionPenalty(playerID))
			else
				if city:IsHasBuilding(buildingRedcoatProductionID) then
					city:SetNumRealBuilding(buildingRedcoatProductionID, 0)
				end
			end
		end
	end
end

function JFD_RedcoatProductionCityScreen()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = UI.GetHeadSelectedCity()
		local garrison = city:GetGarrisonedUnit()
		if (garrison and garrison:IsHasPromotion(unitPromotionRedcoatID)) then
			city:SetNumRealBuilding(buildingRedcoatProductionID, JFD_GetProductionPenalty(playerID))
		else
			if city:IsHasBuilding(buildingRedcoatProductionID) then
				city:SetNumRealBuilding(buildingRedcoatProductionID, 0)
			end	
		end
	end
end

if isGreatBritainCivActive then
	GameEvents.UnitSetXY.Add(JFD_RedcoatProduction)
	GameEvents.PlayerDoTurn.Add(JFD_RedcoatProduction)
	Events.SerialEventEnterCityScreen.Add(JFD_RedcoatProductionCityScreen)
end
--------------------------------------------------------------
-- JFD_ScienceFromProduction
--------------------------------------------------------------
function JFD_ScienceFromProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if player:GetCapitalCity() then
			player:GetCapitalCity():SetNumRealBuilding(buildingScienceID, JFD_GetProductionFromCities(playerID))
		end
	end
end

function JFD_ScienceFromProductionCityView()
	local playerID = Game.GetActivePlayer()
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = UI.GetHeadSelectedCity()
		if city == player:GetCapitalCity() then
			city:SetNumRealBuilding(buildingScienceID, JFD_GetProductionFromCities(playerID))
		end
	end
end

if isGreatBritainCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ScienceFromProduction)
	Events.SerialEventEnterCityScreen.Add(JFD_ScienceFromProductionCityView)
end
--==========================================================================================================================
-- CORE ELIZABETH FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationEnglandID = GameInfoTypes["CIVILIZATION_JFD_ENGLAND"]
local isEnglandCivActive = JFD_IsCivilisationActive(civilisationEnglandID)
local isRevisedEnglandActive = JFD_IsRevisedEnglandActive()
local unitPromotionAdmiralID = GameInfoTypes["PROMOTION_GREAT_ADMIRAL"]
local unitPromotionCarrackHealID = GameInfoTypes["PROMOTION_JFD_GRAND_CARRACK_HEAL"]
local unitPromotionCarrackHealInfoID = GameInfoTypes["PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO"]
local unitPromotionGoldenAgeID = GameInfoTypes["PROMOTION_JFD_ELIZABETH_GOLDEN_AGE"]
local unitPromotionGoldenAgeCivilianID = GameInfoTypes["PROMOTION_JFD_ELIZABETH_GOLDEN_AGE_CIVILIAN"]
local unitCombatMeleeNavalID = GameInfoTypes["UNITCOMBAT_NAVALMELEE"]
local unitCombatRangedNavalID = GameInfoTypes["UNITCOMBAT_NAVALMERANGED"]
local unitElizabethanAdmiralID = GameInfoTypes["UNIT_JFD_ELIZABETHAN_ADMIRAL"]
local unitAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]

if isEnglandCivActive then
	print("Queen Elizabeth is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AdjacentToAdmiralHealEnabled
--------------------------------------------------------------------------------------------------------------------------
function JFD_AdjacentToAdmiralHealEnabled(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsEverAlive() and not player:IsBarbarian() and not player:IsMinorCiv()) then
		local admiralAdjacent = false
		local unit = player:GetUnitByID(unitID)
		if (unit:IsHasPromotion(unitPromotionCarrackHealInfoID) or unit:IsHasPromotion(unitPromotionCarrackHealID)) then
			for admiral in player:Units() do
				if (admiral and admiral:IsHasPromotion(unitPromotionAdmiralID)) then
					local admiralX = admiral:GetX()
					local admiralY = admiral:GetY()
					if Map.PlotDistance(unitX, unitY, admiralX, admiralY) <= 1 then
						admiralAdjacent = true
						break
					end
				end
			end
				
			if admiralAdjacent then
				if (unit:IsHasPromotion(unitPromotionCarrackHealInfoID) and not (unit:IsHasPromotion(unitPromotionCarrackHealID))) then
					unit:SetHasPromotion(unitPromotionCarrackHealID, true)
					unit:SetHasPromotion(unitPromotionCarrackHealInfoID, false)
				end
			else
				if (unit:IsHasPromotion(unitPromotionCarrackHealID) and not (unit:IsHasPromotion(unitPromotionCarrackHealInfoID))) then
					unit:SetHasPromotion(unitPromotionCarrackHealID, false)
					unit:SetHasPromotion(unitPromotionCarrackHealInfoID, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_AdjacentToAdmiralHealEnabled)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ElizabethanAdmiral
--------------------------------------------------------------------------------------------------------------------------
function JFD_ElizabethanAdmiralTraining(playerID, unitID)
	local player = Players[playerID]
    if unitID == unitElizabethanAdmiralID then return false end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_ElizabethanAdmiralTraining)

function JFD_ElizabethanAdmiral(playerID, unitID)
    local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationEnglandID then 
	  	 if player:GetUnitByID(unitID):GetUnitType() == unitAdmiralID then
			if player:IsHuman() then
				unit = player:GetUnitByID(unitID)
				local newUnit
				newUnit = player:InitUnit(unitElizabethanAdmiralID, unit:GetX(), unit:GetY())
				
				newUnit:Convert(unit)
			else
				player:ChangeGoldenAgeTurns(4)
			end
	    end
	end
end

if (isEnglandCivActive and isRevisedEnglandActive) then
	Events.SerialEventUnitCreated.Add(JFD_ElizabethanAdmiral)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ElizabethanGoldenAges
--------------------------------------------------------------------------------------------------------------------------
function JFD_ElizabethGoldenAges(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationEnglandID then 
		for unit in player:Units() do
			if player:IsGoldenAge() then
				local unitCombatType = unit:GetUnitCombatType()
				if unit:IsEmbarked() or unit:GetUnitType() == unitElizabethanAdmiralID then
					if not unit:IsHasPromotion(unitPromotionGoldenAgeCivilianID) then
						unit:SetHasPromotion(unitPromotionGoldenAgeCivilianID, true)
					end
				elseif unitCombatType == unitCombatMeleeNavalID or unitCombatType == unitCombatRangedNavalID then
					if not unit:IsHasPromotion(unitPromotionGoldenAgeID) then
						unit:SetHasPromotion(unitPromotionGoldenAgeID, true)
					end
				end
			else
				if unit:IsHasPromotion(unitPromotionGoldenAgeID) then
					unit:SetHasPromotion(unitPromotionGoldenAgeID, false)
				end

				if unit:IsHasPromotion(unitPromotionGoldenAgeCivilianID) then
					unit:SetHasPromotion(unitPromotionGoldenAgeCivilianID, false)
				end
			end
		end
	end
end

if (isEnglandCivActive and isRevisedEnglandActive) then
	GameEvents.PlayerDoTurn.Add(JFD_ElizabethGoldenAges)
	GameEvents.UnitSetXY.Add(JFD_ElizabethGoldenAges) 
end
--==========================================================================================================================
--==========================================================================================================================