-- BarbarianAdjacencyBonus
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

include("PlotIterators")

local iPromotion = GameInfo.UnitPromotions["PROMOTION_ADJACENT_BARBARIAN"].ID
local iDeltaS = 3

function BarbarianAdjacencyBonus(pUnit)
	if pUnit:IsHasPromotion(iPromotion) then
		local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
		local pPlot = pUnit:GetPlot()
		local bBarbarianAdjacent = false

		pUnit:SetBaseCombatStrength(iStrength)

		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if (bBarbarianAdjacent) then
			break
		end
		local iNumUnits = pAdjacentPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
		local pPlotUnit = pAdjacentPlot:GetUnit(iVal)
		if (pPlotUnit:IsBarbarian()) then
			bBarbarianAdjacent = true
		end
	end
end

if (bBarbarianAdjacent) then
	pUnit:SetBaseCombatStrength(iStrength + iDeltaS)
end
end
end

-- End main code

function BarbarianAdjacencyBonusStartTrigger(iPlayer)
local pPlayer = Players[iPlayer]
for pUnit in pPlayer:Units() do
--print("Is Start Trigger")
BarbarianAdjacencyBonus(pUnit)
end
end

function BarbarianAdjacencyBonusMoveTrigger(iPlayer, iUnitID)
local pPlayer = Players[iPlayer]
local pUnit = pPlayer:GetUnitByID(iUnitID)
--print("Is Move Trigger")
BarbarianAdjacencyBonus(pUnit)
end

GameEvents.PlayerDoTurn.Add(BarbarianAdjacencyBonusStartTrigger)
GameEvents.UnitSetXY.Add(BarbarianAdjacencyBonusMoveTrigger)
