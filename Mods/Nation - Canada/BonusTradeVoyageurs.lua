-- Bonus Furs for Voyageurs
-- Author: John. 
-- DateCreated: 12/19/2013 2:11:59 PM
--------------------------------------------------------------
function HudsonsBayFreeFurs(PlayerID)
	local pPlayer = Players[PlayerID]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
		for pCity in pPlayer:Cities() do
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pSpecificPlot ~= nil then
					if (pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_HUNTFORFURS) then
						if pSpecificPlot:GetResourceType(-1) == (-1) then
							pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
							if pSpecificPlot:GetOwner() == -1 then
								pSpecificPlot:SetOwner(pPlayer)
							end
						else
							local nePlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), NE);
							local ePlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), E);
							local sePlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), SE);
							local swPlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), SW);
							local wPlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), W);
							local nwPlot = Map.PlotDirection(pSpecificPlot:GetX(), pSpecificPlot:GetY(), NW);
							if nePlot:GetResourceType(-1) == (-1) then
								nePlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if nePlot:GetOwner() == -1 then
									nePlot:SetOwner(pPlayer)
								end
							elseif ePlot:GetResourceType(-1) == (-1) then
								ePlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if ePlot:GetOwner() == -1 then
									ePlot:SetOwner(pPlayer)
								end
							elseif sePlot:GetResourceType(-1) == (-1) then
								sePlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if sePlot:GetOwner() == -1 then
									sePlot:SetOwner(pPlayer)
								end
							elseif swPlot:GetResourceType(-1) == (-1) then
								swPlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if swPlot:GetOwner() == -1 then
									swPlot:SetOwner(pPlayer)
								end
							elseif wPlot:GetResourceType(-1) == (-1) then
								wPlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if wPlot:GetOwner() == -1 then
									wPlot:SetOwner(pPlayer)
								end
							elseif nwPlot:GetResourceType(-1) == (-1) then
								nwPlot:SetResourceType(GameInfoTypes.RESOURCE_FUR, 1)
								if nwPlot:GetOwner() == -1 then
									nwPlot:SetOwner(pPlayer)
								end
							end
						end
					pSpecificPlot:SetImprovementType(-1)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HudsonsBayFreeFurs)