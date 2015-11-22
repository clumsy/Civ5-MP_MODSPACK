-- IndianUA
-- Author: Sukritact
--------------------------------------------------------------

print("loaded")

local iCivType = GameInfoTypes["CIVILIZATION_INDIA"]
local tReligion = {}

for Religion in GameInfo.Religions() do
tReligion[Religion.Type] = Religion.ID
if Religion.ID == GameInfoTypes.RELIGION_PANTHEON then
tReligion[Religion.Type] = nil
end
end

function IndianUA (iPlayer)
local pPlayer = Players[iPlayer]
if (pPlayer:GetCivilizationType() ~= iCivType) then
return
end
for pCity in pPlayer:Cities() do
local iNumReligions = 0
for sKey, iVal in pairs(tReligion) do
if pCity:GetNumFollowers(iVal) >= 1 then
iNumReligions = iNumReligions + 1
end
end
if iNumReligions > 0 then
local iDelta = ((pCity:FoodConsumption(true, 0) + pCity:FoodDifference())*iNumReligions*0.05)
pCity:ChangeFood(iDelta)
end
end
end

GameEvents.PlayerDoTurn.Add(IndianUA)
