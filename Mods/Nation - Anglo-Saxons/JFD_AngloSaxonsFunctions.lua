-- JFD_AngloSaxonsFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_AngloSaxonDynamicTopPanelSupport")
--------------------------------------------------------------
-- JFD_AddBuilding
--------------------------------------------------------------
function JFD_AddBuilding(city, buildingID)
	if not city:IsHasBuilding(buildingID) then
		city:SetNumRealBuilding(buildingID, 1) 
	end
end	
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
--------------------------------------------------------------
-- JFD_RemoveBuilding
--------------------------------------------------------------
function JFD_RemoveBuilding(city, buildingID)
	if city:IsHasBuilding(buildingID) then
		city:SetNumRealBuilding(buildingID, 0) 
	end
end	
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingAngloSaxonsID = GameInfoTypes["BUILDING_JFD_ANGLO_POLICY"]
local buildingAngloSaxonCultureID = GameInfoTypes["BUILDING_JFD_ANGLO_CULTURE"]
local buildingShireCourtID = GameInfoTypes["BUILDING_JFD_SHIRE_COURT"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
local isAngloSaxonsCivActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
local unitPromotionHuscarlID = GameInfoTypes["PROMOTION_JFD_HUSCARL"]
local unitPromotionHuscarlInfoID = GameInfoTypes["PROMOTION_JFD_HUSCARL_INFO"]

if isAngloSaxonsCivActive then
	print("King Alfred is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AngloSaxonHappiness
----------------------------------------------------------------------------------------------------------------------------
function JFD_AngloSaxonHappiness(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local goldenAgePoints = JFD_GetAngloSaxonGAP(playerID)
		player:ChangeGoldenAgeProgressMeter(goldenAgePoints)
	end
end

if isAngloSaxonsCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AngloSaxonHappiness)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AngloSaxonCulture
----------------------------------------------------------------------------------------------------------------------------
function JFD_AngloSaxonCulture(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if not (capital) then return end
		if player:IsGoldenAge() and player:GetCapitalCity() then
			if not (capital:IsHasBuilding(buildingAngloSaxonsID)) then 
				capital:SetNumRealBuilding(buildingAngloSaxonsID, 1)
			end
		else
			if capital:IsHasBuilding(buildingAngloSaxonsID) then 
				capital:SetNumRealBuilding(buildingAngloSaxonsID, 0)
			end
		end
	end
end

if isAngloSaxonsCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AngloSaxonCulture)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AngloSaxonShireCourt
----------------------------------------------------------------------------------------------------------------------------
function JFD_AngloSaxonShireCourt(playerID)
	local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if not (capital) then return end
		capital:SetNumRealBuilding(buildingAngloSaxonCultureID, player:CountNumBuildings(buildingShireCourtID))
	end
end

function JFD_AngloSaxonShireCourtCityView(playerID)
	local player = Players[Game.GetActivePlayer()]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		capital:SetNumRealBuilding(buildingAngloSaxonCultureID, player:CountNumBuildings(buildingShireCourtID))
	end
end

if isAngloSaxonsCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AngloSaxonShireCourt)
	Events.SerialEventEnterCityScreen.Add(JFD_AngloSaxonShireCourtCityView)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AngloSaxonHuscarl
----------------------------------------------------------------------------------------------------------------------------
function JFD_AngloSaxonHuscarl(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsAlive() and not (player:IsBarbarian()) and not (player:IsMinorCiv())) then 
		local unit = player:GetUnitByID(unitID)
		if (unit:GetPlot() and (unit:IsHasPromotion(unitPromotionHuscarlID) or unit:IsHasPromotion(unitPromotionHuscarlInfoID))) then
			local plot = unit:GetPlot()
			if (plot:IsAdjacentToShallowWater() or plot:IsRiverSide()) then
				if not (unit:IsHasPromotion(unitPromotionHuscarlID)) then	
					unit:SetHasPromotion(unitPromotionHuscarlID, true)
					unit:SetHasPromotion(unitPromotionHuscarlInfoID, false)
				end
			else
				if unit:IsHasPromotion(unitPromotionHuscarlID) then
					unit:SetHasPromotion(unitPromotionHuscarlID, false)
					unit:SetHasPromotion(unitPromotionHuscarlInfoID, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_AngloSaxonHuscarl) 
--==========================================================================================================================
--==========================================================================================================================