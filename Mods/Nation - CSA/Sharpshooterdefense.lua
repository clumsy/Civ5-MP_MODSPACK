-- Sharpshooterdefense
-- Author: ViceVirtuoso
-- DateCreated: 5/19/2014 4:34:53 AM
--------------------------------------------------------------
local iUU = GameInfoTypes.UNIT_CSASHARPSHOOTER

local iPromotion = GameInfoTypes.PROMOTION_SHARPSHOOTDEFENSE

local iImprovement = GameInfoTypes.IMPROVEMENT_ANTEBELLUM



function BoerUniqueUnit(iPlayer, iUnitID)

if iPlayer < GameDefines.MAX_MAJOR_CIVS then

local pPlayer = Players[iPlayer]

local pUnit = pPlayer:GetUnitByID(iUnitID)

if pUnit:GetUnitType() == iUU then

local pPlot = pUnit:GetPlot()

if pPlot:GetImprovementType() == iImprovement then

pUnit:SetHasPromotion(iPromotion, true)

return

end

end

pUnit:SetHasPromotion(iPromotion, false)

end

end



GameEvents.UnitSetXY.Add(BoerUniqueUnit)