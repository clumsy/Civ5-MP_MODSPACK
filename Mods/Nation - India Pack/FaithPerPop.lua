-- FaithPerPop
-- Author: Sukritact
--------------------------------------------------------------
print("loaded")

local iFaith = GameInfo.Yields["YIELD_FAITH"].ID

function FaithPerPop(iPlayer)
	local pPlayer = Players[iPlayer]
	for row in GameInfo.Building_YieldChangesPerPop() do
--Define info
local iBuilding = GameInfo.Buildings[row.BuildingType].ID
local iYield = GameInfo.Yields[row.YieldType]
local iDeltaModifier = (row.Yield)/100
--Change Faith in cities
if iYield == iFaith then
for pCity in pPlayer:Cities() do
if pCity:IsHasBuilding(iBuilding) then
local iPop = pCity:GetPopulation()
local iDelta = math.floor(iPop*iDeltaModifier)
pPlayer:ChangeFaith(iDelta)
end
end
end
end
end
-- End of Main Code --

GameEvents.PlayerDoTurn.Add(FaithPerPop)
