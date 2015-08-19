-- FestiveUnit
-- Author: Tomatekh / Modifications by Leugi
-- DateCreated: 7/23/2013 10:52:25 AM
--------------------------------------------------------------

print ("This is the 'Choose GP specialist' mod script.")

local ChooseGPpromo = GameInfoTypes.PROMOTION_CHOOSEGP;
local ChooseGPunit = GameInfoTypes.UNIT_CHOOSEGP;

local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
}

function ChooseGPspec(pPlayer, pUnit, uCity)
	pUnit:Kill();
	pPlayer:ChangeNumFreeGreatPeople(1)
	
end

function ChooseGPPlotCheck(pPlayer)
	for pUnit in pPlayer:Units() do
		if (pUnit:GetUnitType() == ChooseGPunit) then
		
				local uPlot = pUnit:GetPlot();
				if (uPlot:IsCity()) then
					local uCity = uPlot:GetPlotCity();
					ChooseGPspec(pPlayer, pUnit, uCity)
				else
					for loop, direction in ipairs(direction_types) do
						local adjPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction);
						if (adjPlot:IsCity()) then
							local uCity = adjPlot:GetPlotCity();
							ChooseGPspec(pPlayer, pUnit, uCity)
						end
					end
				end
			end

	end
end

function ChooseGPsstart(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
			ChooseGPPlotCheck(pPlayer)
	end
end
GameEvents.PlayerDoTurn.Add(ChooseGPsstart)