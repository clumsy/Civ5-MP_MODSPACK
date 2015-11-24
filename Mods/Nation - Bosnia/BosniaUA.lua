-- BosniaUA
-- Author: LastSword, Ben
-- DateCreated: 1/10/2014 4:24:37 PM
--------------------------------------------------------------
HirBosPP = Game.GetActivePlayer();

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[HirBosPP]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KDMBOSNIA then
		for iCity in Players[HirBosPP]:Cities() do
			if HirBosCC(iCity:Plot()) then
				iCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMY_BOSNIA , 1);
			else
				iCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DUMMY_BOSNIA , 0);
			end
		end
	end
	HirBosPP = iPlayer;
end)

function HirBosCC(iPlot)
	if iPlot:GetNumUnits() > 0 then
		for i = 0, iPlot:GetNumUnits() - 1 do
			local iUnit = iPlot:GetUnit(i);
			if iUnit:GetUnitType() == GameInfoTypes.UNIT_MISSIONARY then
				return true;
			end
		end
	end
	return false;
end