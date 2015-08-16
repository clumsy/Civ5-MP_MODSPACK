print ("Sri Lanka Fresh Water Production")

local bProductionDummy = GameInfo.Buildings["BUILDING_SRI_LANKA_PRODUCTION"].ID;

function AddWaterBuildings(pCity)	

	pCity:SetNumRealBuilding(bProductionDummy, 0);

	if pCity:GetProductionBuilding() ~= -1 then
		local Building = pCity:GetProductionBuilding();

		local BClass = GameInfo.Buildings[Building].BuildingClass
		local BType = GameInfo.Buildings[Building].Type

		local BWonder = GameInfo.BuildingClasses["" .. BClass .. ""].MaxGlobalInstances
		local BNational = GameInfo.BuildingClasses["" .. BClass .. ""].MaxPlayerInstances

		local FaithCultureCheck = 0;
		if (BWonder == -1) and (BNational == -1) then
			for tRow in GameInfo.Building_YieldChanges() do
				if tRow.BuildingType == BType then
					if (tRow.YieldType == "YIELD_CULTURE") then
						if tRow.Yield >= 1 then
							FaithCultureCheck = 1;
						end
					elseif (tRow.YieldType == "YIELD_FAITH") then
						if tRow.Yield >= 1 then
							FaithCultureCheck = 1;
						end
					end
				end
			end
		end

		local WorkedWaterCount = 0;
		if FaithCultureCheck >= 1 then
			local plotX = pCity:GetX();
			local plotY = pCity:GetY();
			local iRange = 3;
			for iDX = -iRange, iRange do
				for iDY = -iRange, iRange do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
					if pTargetPlot then
						if pTargetPlot:IsFreshWater() and pCity:IsWorkingPlot(pTargetPlot) then
							WorkedWaterCount = WorkedWaterCount + 1;
						end
					end
				end
			end
		end

		pCity:SetNumRealBuilding(bProductionDummy, WorkedWaterCount);

	end

end

function SriLankaWaterProduction(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_LITE_SRI_LANKA) then
			for pCity in pPlayer:Cities() do

				AddWaterBuildings(pCity)

			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(SriLankaWaterProduction)

function SriLankaCityUpdateEnter()
	local pCity = UI.GetHeadSelectedCity();
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_LITE_SRI_LANKA) then
				if (pCity ~= nil) then

					AddWaterBuildings(pCity)

				end
			end
		end
	end
end

Events.SerialEventEnterCityScreen.Add(SriLankaCityUpdateEnter)

function SriLankaCityUpdateExit()
    local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer] 
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_LITE_SRI_LANKA) then
				for pCity in pPlayer:Cities() do

					AddWaterBuildings(pCity)

				end
			end
		end
	end
end

Events.SerialEventExitCityScreen.Add(SriLankaCityUpdateExit)