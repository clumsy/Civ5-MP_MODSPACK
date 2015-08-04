-- JFD_ByzantiumTheodora_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationByzantiumID	= GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local isCivByzantiumActive		= JFD_IsCivilisationActive(civilizationByzantiumID)

if isCivByzantiumActive then
	print("Emperor Theodora is in this game")
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- PATRIARCHATE OF CONSTANTINOPLE
--------------------------------------------------------------------------------------------------------------------------
local techTheologyID = GameInfoTypes["TECH_THEOLOGY"]
local unitProphetID	 = GameInfoTypes["UNIT_PROPHET"]

function JFD_ByzantiumGreatProphet(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID] 
	if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumID) then
		if techID == techTheologyID then
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			player:InitUnit(unitProphetID, capitalX, capitalY)
		end
	end
end
if isCivByzantiumActive then
	GameEvents.TeamTechResearched.Add(JFD_ByzantiumGreatProphet)
end
--==========================================================================================================================
-- UB FUNCTIONS
--==========================================================================================================================
-- LANTERNAS
--------------------------------------------------------------------------------------------------------------------------
local buildingStoudionID			= GameInfoTypes["BUILDING_JFD_STOUDION"]
local unitPromotionExtraMovesID		= GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]
local unitPromotionSightPenaltyID	= GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local unitMissionaryID				= GameInfoTypes["UNIT_MISSIONARY"]

function JFD_ByzantiumMissionaries(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationByzantiumID) then 
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingStoudionID) then
			local unit = player:GetUnitByID(unitID)
			if unit:GetUnitType() == unitMissionaryID then
				unit:SetHasPromotion(unitPromotionExtraMovesID, true)
				unit:SetHasPromotion(unitPromotionSightPenaltyID, false)
			end
		end
	end
end
if isCivByzantiumActive then
	GameEvents.CityTrained.Add(JFD_ByzantiumMissionaries)
end
--==========================================================================================================================
--==========================================================================================================================