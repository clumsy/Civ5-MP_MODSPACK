-- Nicholas Russia Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("RouteConnections")
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingGuberniyaID = GameInfoTypes["BUILDING_JFD_GUBERNIYA"]
local buildingGuberniyaGrowthID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_GROWTH"]
local buildingGuberniyaProductionID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_PRODUCTION"]
local buildingWeLoveTheKingDayFaithID = GameInfoTypes["BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH"]
local buildingWonderProductionID = GameInfoTypes["BUILDING_JFD_WONDER_PRODUCTION"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
local isNicholasRussiaCivActive = JFD_IsCivilisationActive(civilisationID)
local mathMin = math.min
local unitOpolcheniyeID = GameInfoTypes["UNIT_JFD_OPOLCHENIYE"]
local unitPromotionFriendlyLandsID = GameInfoTypes["PROMOTION_JFD_FRIENDLY_LANDS"]

if isNicholasRussiaCivActive then
	print("Emperor Nicholas II is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FaithtoWonderProduction
----------------------------------------------------------------------------------------------------------------------------
function JFD_FaithtoWonderProduction(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if capital then
			local faithPerTurn = player:GetTotalFaithPerTurn()
			capital:SetNumRealBuilding(buildingWonderProductionID, mathMin(faithPerTurn, 30))
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_FaithtoWonderProduction)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_FaithFromWLTKD
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetWeLoveTheKingDayCounter(player)
	local numCitiesWLTKD = 0
	for city in player:Cities() do
		if city:GetWeLoveTheKingDayCounter() > 0 then
			numCitiesWLTKD = numCitiesWLTKD + 1
		end
	end
	
	return numCitiesWLTKD
end

function JFD_FaithFromWLTKD(playerID)
	local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity()
		if capital then
			local numCitiesWLTKD = JFD_GetWeLoveTheKingDayCounter(player)
			capital:SetNumRealBuilding(buildingWeLoveTheKingDayFaithID, numCitiesWLTKD)
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_FaithFromWLTKD)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GuberniyaGrowth
----------------------------------------------------------------------------------------------------------------------------
function JFD_GuberniyaGrowth(playerID)
	local player = Players[playerID]
    if player:IsEverAlive() and player:GetCivilizationType() == civilisationID then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingGuberniyaID) and city ~= player:GetCapitalCity()	 then
				if isCityConnected(player, player:GetCapitalCity(), city, 'Railroad', false, false, nil) then
					city:SetNumRealBuilding(buildingGuberniyaGrowthID, 1) 
				else
					city:SetNumRealBuilding(buildingGuberniyaGrowthID, 0) 
				end
			else
				city:SetNumRealBuilding(buildingGuberniyaGrowthID, 0) 
			end
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GuberniyaGrowth)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GuberniyaProduction
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumberDomesticRoutesToCapital(player)
	local tradeRoutes = player:GetTradeRoutes()
	local numDomesticRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if targetCity == player:GetCapitalCity() and originatingCity:IsHasBuilding(buildingGuberniyaID) then
			numDomesticRoutes = numDomesticRoutes + 1
		end
	end
	
	return numDomesticRoutes
end

function JFD_GuberniyaProduction(playerID)
	local player = Players[playerID]
    if player:IsEverAlive() and player:GetCivilizationType() == civilisationID then 
		if player:GetCapitalCity() then
			local numDomesticRoutes = JFD_GetNumberDomesticRoutesToCapital(player)
			player:GetCapitalCity():SetNumRealBuilding(buildingGuberniyaProductionID, numDomesticRoutes) 
		end
	end
end

if isNicholasRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GuberniyaProduction)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_DoubleOpolcheniye
----------------------------------------------------------------------------------------------------------------------------
function JFD_DoubleOpolcheniye(playerID, cityID, unitID)
    local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
       	local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitOpolcheniyeID then
			local newUnit = player:InitUnit(unitOpolcheniyeID, unit:GetX(), unit:GetY())
		    unit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
			newUnit:SetHasPromotion(unitPromotionFriendlyLandsID, true)
         end
    end
end

if isNicholasRussiaCivActive then
	GameEvents.CityTrained.Add(JFD_DoubleOpolcheniye)
end
--==========================================================================================================================
--==========================================================================================================================