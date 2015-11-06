-- MakruiaCode
-- Author: Sukritact
--=======================================================================================================================

print("loaded")

--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- CityPlots
--------------------------------------------------------------
CityPlots = function( city )
	local m = 0
	return function()
		for i = m, g_maximumAcquirePlotArea do
			local plot = city:GetCityIndexPlot( i )
			if plot	and plot:GetWorkingCity() == city
			then
				m = i+1
				return plot
			end
		end
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

--==========================================================================================================================
-- CORE MAKURIA FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local g_activePlayer = Players[Game.GetActivePlayer()]

local iCiv = GameInfoTypes.CIVILIZATION_MC_MAKURIA
local bMakuria = JFD_IsCivilisationActive(iCiv)

local iCoenobium = GameInfoTypes.CIVILIZATION_MC_MAKURIA
local iCoenobium_D = GameInfoTypes.BUILDING_MC_MAKURIAN_CENOBIUM_DUMMY

local iNobatia = GameInfoTypes.UNIT_MC_MAKURIAN_NOBATIAN_SWORDSMAN
local iNobatia_D = GameInfoTypes.BUILDING_MC_MAKURIAN_NOBATIAN_DUMMY
-------------------------------------------------------------------------------------------------------------------------
-- The Baqt: Bonus Defense from Trade Routes
-------------------------------------------------------------------------------------------------------------------------
tFreePromotions = {
	"PROMOTION_MC_THE_BAQT_1",
	"PROMOTION_MC_THE_BAQT_2",
	"PROMOTION_MC_THE_BAQT_3",
	"PROMOTION_MC_THE_BAQT_4",
	"PROMOTION_MC_THE_BAQT_5",
	"PROMOTION_MC_THE_BAQT_6",
	"PROMOTION_MC_THE_BAQT_7",
	"PROMOTION_MC_THE_BAQT_8",
	"PROMOTION_MC_THE_BAQT_9",
	"PROMOTION_MC_THE_BAQT_10",
	"PROMOTION_MC_THE_BAQT_11",
}

function TheBaqtCombat(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	local iNum = pPlayer:GetNumInternationalTradeRoutesUsed()
	if iNum > 11 then iNum = 11 end

	for pUnit in pPlayer:Units() do
		for iKey, sPromotion in pairs(tFreePromotions) do 

			local iPromotion = GameInfoTypes[sPromotion]

			if iKey == iNum then
				pUnit:SetHasPromotion(iPromotion, true)
			else
				pUnit:SetHasPromotion(iPromotion, false)
			end

		end
	end
end
if bMakuria then GameEvents.PlayerDoTurn.Add(TheBaqtCombat) end
-------------------------------------------------------------------------------------------------------------------------
-- Coenobium
-------------------------------------------------------------------------------------------------------------------------
local tLuxuries = {}
for tResource in GameInfo.Resources() do
	local iResource = tResource.ID
	if Game.GetResourceUsageType(iResource) == ResourceUsageTypes.RESOURCEUSAGE_LUXURY then
		local numResourceAvailable = g_activePlayer:GetNumResourceAvailable(iResource, true)
		tLuxuries[iResource] = true
	end
end

function Coenobium(iPlayer)

	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= iCiv then return end
	local iTeam = pPlayer:GetTeam()

	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iCoenobium) then
			local tExistingResources = {}
			local iNumLuxuries = 0

			for pPlot in CityPlots(pCity) do
				local iResource = pPlot:GetResourceType(iTeam)

				if tLuxuries[iResource] and not(tExistingResources[iResource]) then
					iNumLuxuries = iNumLuxuries + 1
					tExistingResources[iResource] = true
				end
			end

			pCity:SetNumRealBuilding(iCoenobium_D, iNumLuxuries)
		else
			pCity:SetNumRealBuilding(iCoenobium_D, 0)
		end

	end
end
if bMakuria then GameEvents.PlayerDoTurn.Add(Coenobium) end

function CoenobiumBuilt(iPlayer, iCity, iBuilding)
	if iBuilding == iCoenobium then
		Coenobium(iPlayer)
	end
end
if bMakuria then GameEvents.CityConstructed.Add(CoenobiumBuilt) end
-------------------------------------------------------------------------------------------------------------------------
-- Nobatian Swordsman
-------------------------------------------------------------------------------------------------------------------------
function Nobatian(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and not pPlayer:IsMinorCiv() and not pPlayer:IsBarbarian() then
		for pCity in pPlayer:Cities() do
			if pCity:GetGarrisonedUnit() and (pCity:GetGarrisonedUnit():GetUnitType() == iNobatia) then
				pCity:SetNumRealBuilding(iNobatia_D, 1)
			else
				if pCity:IsHasBuilding(iNobatia_D) then
					pCity:SetNumRealBuilding(iNobatia_D, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Nobatian)
GameEvents.UnitSetXY.Add(Nobatian)
--=======================================================================================================================
--=======================================================================================================================