-- FakeJungleBias
-- Author: Tomatekh
-- DateCreated: 1/20/2014 11:26:09 AM
--------------------------------------------------------------


print("Tupi: Add Jungles")

local uSettler = GameInfoTypes.UNITCLASS_SETTLER;
local tJungle = GameInfoTypes.FEATURE_JUNGLE;
local tPlains = GameInfoTypes.TERRAIN_PLAINS;
local rUranium = GameInfoTypes.RESOURCE_URANIUM;
local rGems = GameInfoTypes.RESOURCE_GEMS;

function TupiAddJungle(pPlayer, iCurrentTurn)
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitClassType() == uSettler then
			local uPlot = pUnit:GetPlot();
			local plotX = uPlot:GetX();
			local plotY = uPlot:GetY();
			local iRange = 2;
			for iDX = -iRange, iRange do
				for iDY = -iRange, iRange do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
					if pTargetPlot then
						if not pTargetPlot:IsUnit() then
							if not pTargetPlot:IsMountain() then
								if pTargetPlot:GetFeatureType() == -1 then
									if pTargetPlot:GetTerrainType() == tPlains then
										if pTargetPlot:GetResourceType() == -1 then
											pTargetPlot:SetFeatureType(tJungle);
										elseif pTargetPlot:GetResourceType() == rUranium or pTargetPlot:GetResourceType() == rGems then	
											pTargetPlot:SetFeatureType(tJungle);
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
								
function TupiJungleScript()
	local iCurrentTurn = Game.GetGameTurn()
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[mPlayer];
		if pPlayer:IsAlive() then
			if pPlayer:GetNumCities() < 1 then
				if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_PARAGUAY) then
					TupiAddJungle(pPlayer, iCurrentTurn)
				end
			end
		end
	end
end

Events.LoadScreenClose.Add(TupiJungleScript)