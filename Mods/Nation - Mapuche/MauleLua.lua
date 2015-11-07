-- MauleLua
-- Author: Leugi
-- DateCreated: 7/16/2014 1:47:33 PM
--------------------------------------------------------------


local ActivePromo = GameInfoTypes.PROMOTION_MAULE_FUNCTIONAL;
local InactivePromo = GameInfoTypes.PROMOTION_MAULE;

local direction_types = {
                        DirectionTypes.DIRECTION_NORTHEAST,
                        DirectionTypes.DIRECTION_EAST,
                        DirectionTypes.DIRECTION_SOUTHEAST,
                        DirectionTypes.DIRECTION_SOUTHWEST,
                        DirectionTypes.DIRECTION_WEST,
                        DirectionTypes.DIRECTION_NORTHWEST
                }


function PromotiononMaule(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			local uPlot = pUnit:GetPlot();
			if uPlot ~= nil then
				if uPlot:IsRiver() then
					if (pUnit:IsHasPromotion(InactivePromo)) then
						pUnit:SetHasPromotion(ActivePromo,true);
						pUnit:SetHasPromotion(InactivePromo,false);
					end
				else
					if (pUnit:IsHasPromotion(ActivePromo)) then
						pUnit:SetHasPromotion(InactivePromo,true);
						pUnit:SetHasPromotion(ActivePromo,false);
					end
					for a, direction in ipairs(direction_types) do
						local pNextPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction)
						if pNextPlot ~= nil then
							if pNextPlot:IsMountain() then
								if (pUnit:IsHasPromotion(InactivePromo)) then
									pUnit:SetHasPromotion(ActivePromo,true);
									pUnit:SetHasPromotion(InactivePromo,false);
								end
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(PromotiononMaule)
GameEvents.UnitSetXY.Add(PromotiononMaule)