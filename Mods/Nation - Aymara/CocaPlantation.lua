-- CocaPlantation
-- Author: Leugi
-- DateCreated: 8/18/2014 1:45:10 PM
--------------------------------------------------------------
local coca_ID = GameInfoTypes["RESOURCE_COCA"]

function ToggleImprovement (iPlayer)
	local pPlayer = Players[iPlayer];
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == GameInfoTypes.IMPROVEMENT_COCA_PLANTATION then
							plot:SetImprovementType(-1)
							plot:SetResourceType(-1)
							plot:SetResourceType(GameInfoTypes.RESOURCE_COCA, 1)
							plot:SetImprovementType(GameInfoTypes.IMPROVEMENT_COCA_PLANTATION)
						end
					end
				end
			end
		end
end

GameEvents.PlayerDoTurn.Add(ToggleImprovement);