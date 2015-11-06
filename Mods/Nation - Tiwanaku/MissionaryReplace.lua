-- MissionaryReplace
-- Author: LastSword
-- DateCreated: 1/8/2014 7:46:16 AM
--------------------------------------------------------------


local sUnitType = "UNIT_MISSIONARY"
local iProphetID = GameInfo.Units.UNIT_MISSIONARY.ID
local iProphetOverride = GameInfo.Units.UNIT_KALLAWAYA.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_TIWANAKU"].ID

function MissionaryOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
		pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
                    local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
                    newUnit:Convert(pUnit);
                end
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(MissionaryOverride)