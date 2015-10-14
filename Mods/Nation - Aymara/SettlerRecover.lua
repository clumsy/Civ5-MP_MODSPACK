-- SettlerRecover
-- Author: Leugi
-- DateCreated: 7/30/2013 9:05:04 PM
--------------------------------------------------------------
print("The Aymara Mod Lua loaded succesfully")


local iUnitMallku = GameInfo.Units.UNIT_MALLKU_GENERAL.ID
local iUnitMallkuCoca = GameInfo.Units.UNIT_MALLKU_COCA.ID


function ReviveSettler(iPlayer, iCityX, iCityY)
	local xUnit = iCityX
	local yUnit = iCityY
    local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_QULLANA) then
			if (pPlayer:HasPolicy(GameInfo.Policies["POLICY_COCA"].ID)) then
				local newUnit = pPlayer:InitUnit(iUnitMallkuCoca, pCity:GetX(), pCity:GetY(), UNITAI_GENERAL, DirectionTypes.DIRECTION_SOUTH)
				newUnit:FinishMoves()
			else
				local newUnit = pPlayer:InitUnit(iUnitMallku, pCity:GetX(), pCity:GetY(), UNITAI_GENERAL, DirectionTypes.DIRECTION_SOUTH)
				newUnit:FinishMoves()
			end
		end
	end
end

GameEvents.PlayerCityFounded.Add(ReviveSettler)