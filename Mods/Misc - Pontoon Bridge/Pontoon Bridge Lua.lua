print ("Pontoon Bridge Scripts")

local pBridge = GameInfoTypes.IMPROVEMENT_PONTOON_BRIDGE_MOD;
local pRoad = GameInfoTypes.ROUTE_ROAD;
local tOcean = GameInfoTypes.TERRAIN_OCEAN;
local tCoast = GameInfoTypes.TERRAIN_COAST;
local pNavalPenalty = GameInfoTypes.PROMOTION_PONTOON_PENALTY;

--Roads
function pDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function pCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local bridgePlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if pPlot:GetImprovementType() == pBridge then
		if not pPlot:IsRoute() then
			pPlot:SetRouteType(pRoad);
		end
		local sKey = pCompilePlotID(pPlot)
		bridgePlots[sKey] = -1
    end
end

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);
	if (eImprovement == pBridge) then
		pPlot:SetRouteType(pRoad);	
		local sKey = pCompilePlotID(pPlot)
		bridgePlots[sKey] = -1

		if pPlot:IsUnit() then
			local pUnit = pPlot:GetUnit(i);
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsEmbarked() then
				pUnit:SetEmbarked(false);
			end
		end

	end
end);

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsAlive()) then
		for sKey, tTable in pairs(bridgePlots) do
			local pPlot = pDecompilePlotID(sKey)
			if (pPlot:GetTerrainType() == tCoast) or (pPlot:GetTerrainType() == tOcean) then
				if (pPlot:IsRoute()) and (pPlot:GetImprovementType() ~= pBridge) then
					pPlot:SetRouteType(-1);
					bridgePlots[sKey] = nil
				end
			end
		end
	end

end)

--Penalty
GameEvents.UnitSetXY.Add( 
function(iPlayerID, iUnitID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[iPlayerID]
	local pUnit = pPlayer:GetUnitByID(iUnitID)

	if pPlot then

		if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsCombatUnit() and not pUnit:IsEmbarked() then 

			if (pPlot:GetImprovementType() == pBridge) then

				if not pUnit:IsHasPromotion(pNavalPenalty) then
					pUnit:SetHasPromotion(pNavalPenalty,true);
				end

			elseif (pPlot:GetImprovementType() ~= pBridge) then

				if pUnit:IsHasPromotion(pNavalPenalty) then
					pUnit:SetHasPromotion(pNavalPenalty,false);
				end

			end
		end
	end
end)