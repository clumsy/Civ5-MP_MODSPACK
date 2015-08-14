-- BoerUniqueBuilding
-- Author: ViceVirtuoso
-- DateCreated: 5/7/2014 9:56:58 AM
--------------------------------------------------------------
local iBoers = GameInfoTypes.CIVILIZATION_BOER
local iUB = GameInfoTypes.BUILDING_BOERSTAATSMUSEUM
local iGrowthDummy = GameInfoTypes.BUILDING_BOER_GROWTHDUMMY
local iImprovement = GameInfoTypes.IMPROVEMENT_FARM



function BoerUniqueBuilding(iPlayer)
	if iPlayer < GameDefines.MAX_MAJOR_CIVS then
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == iBoers then
			for pCity in pPlayer:Cities() do
				--Growth Bonus
				local iGrowthMod = math.min((math.floor(pCity:GetBaseTourism() / 2)) * 2, 20)
				pCity:SetNumRealBuilding(iGrowthDummy, iGrowthMod)
				--Golden Age from Farm
				local iNumPlots = pCity:GetNumCityPlots()
				local iTotalFarms = 0;
				for iPlot = 0, iNumPlots - 1 do
					local pPlot = pCity:GetCityIndexPlot(iPlot)
					if pPlot and pPlot:GetOwner() == iPlayer and pPlot:GetImprovementType() == iImprovement then
						iTotalFarms = iTotalFarms + 1
					end
				end
			pPlayer:ChangeGoldenAgeProgressMeter(iTotalFarms)
			end
		end
	end
end



GameEvents.PlayerDoTurn.Add(BoerUniqueBuilding)