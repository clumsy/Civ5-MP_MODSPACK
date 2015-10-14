-- FaithfromCSRoutes
-- Author: Leugi
-- DateCreated: 8/18/2014 12:35:53 PM
--------------------------------------------------------------
print("loaded")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "FaithfromCSRoutes";

local iBuildingApa = GameInfoTypes.BUILDING_APACHETA

function FaithTradeRoutes(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_QULLANA"] then
		for pCity in pPlayer:Cities() do
			CityID = pCity:GetID()
			for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
				nFaith = 0
				nFood = 0
				local tradeRoutes = pPlayer:GetTradeRoutes()
				for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
					domain = tradeRoute.Domain
					if domain == DomainTypes.DOMAIN_LAND then
						originatingCity = tradeRoute.FromCity
						targetCity = tradeRoute.ToCity
						gold = tradeRoute.FromGPT
						--print (gold);
						local ngold = gold / 100
						icsplayer = targetCity:GetOwner()
						csplayer = Players[icsplayer]
						if pCity == originatingCity then
							if icsplayer == i then
								if ngold ~= 0 then
									bonus = ngold / 3
									if bonus < 1 then
										bonus = 1
									end
									foodbonus = ngold / 4
									if foodbonus < 1 then
										foodbonus = 1
									end
									nFaith = nFaith + bonus
									nFood = nFood + foodbonus
								end
								if nFood > 9 then
									nFood = 10
								end
							end
						end
					end
				end
				icsplayer = i
				iOldFood = load( pPlayer, "" .. CityID .. "QFoodFromRoutes" .. icsplayer .. "")
				save(  pPlayer,  "" .. CityID .. "QFoodFromRoutes" .. icsplayer .. "", nFood)
				if iOldFood == nil then
					pCity:ChangeBaseYieldRateFromBuildings(0, nFood)
				else
					pCity:ChangeBaseYieldRateFromBuildings(0, nFood - iOldFood)
                    		end
				pPlot = pCity:Plot()
				iOldFaith = load ( pPlot, "" .. CityID .. "QFaithFromRoutes" .. icsplayer .. "")
				save(  pPlot,  "" .. CityID .. "QFaithFromRoutes" .. icsplayer .. "", nFaith)
				if iOldFaith == nil then
					Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, nFaith)
				else
					Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, nFaith - iOldFaith)
                    		end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(FaithTradeRoutes)



-- If the city is conquered we must remove the faith and food somehow:


function OnCityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
	CityID = pCity:GetID()
	pPlot = pCity:Plot()
	iOldFaith = load ( pPlot, "" .. CityID .. "QFaithFromRoutes" .. icsplayer .. "")
	iOldFood = load( pPlayer, "" .. CityID .. "QFoodFromRoutes" .. icsplayer .. "")
	local nFaith = 0
	local nFood = 0
	save(  pPlayer,  "" .. CityID .. "QFoodFromRoutes" .. icsplayer .. "", nFood)
	save(  pPlot,  "" .. CityID .. "QFaithFromRoutes" .. icsplayer .. "", nFaith)
	if iOldFaith == nil then
					Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, nFaith)
				else
					Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, nFaith - iOldFaith)
                    		end
							if iOldFood == nil then
					pCity:ChangeBaseYieldRateFromBuildings(0, nFood)
				else
					pCity:ChangeBaseYieldRateFromBuildings(0, nFood - iOldFood)
                    		end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)




-- Apacheta Faith



function ApachetaFaith(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_APACHETA_BONUS"], 0)
			CityID = pCity:GetID()
			for i = 0, GameDefines.MAX_CIV_PLAYERS do 
		
				aFaith = 0
				local tradeRoutes = pPlayer:GetTradeRoutes()
				for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
					domain = tradeRoute.Domain
					if domain == DomainTypes.DOMAIN_LAND then
						originatingCity = tradeRoute.FromCity
						targetCity = tradeRoute.ToCity
				
						ioplayer = targetCity:GetOwner()
						oplayer = Players[ioplayer]
						if pCity == originatingCity then
							if ioplayer == i then
								if pCity:IsHasBuilding(GameInfoTypes["BUILDING_APACHETA"]) then
									pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_APACHETA_BONUS"], 1)
								end
							end
						end
					end
				end
				
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(ApachetaFaith)






local iCaravanID = GameInfo.Units.UNIT_CARAVAN.ID

function OnCanSaveUnit(iPlayer, iUnit)
	--fires for both combat and non-combat death (disband, settler settled, etc)
	--for combat death, fires right before and after OnUnitKilledInCombat; use this to capture unit data before death
	unit = Players[iPlayer]:GetUnitByID(iUnit)
	unitTypeID = unit and unit:GetUnitType()
	pPlayer = Players[iPlayer]
	deadUnit = unit;
	if deadUnit:GetUnitType() == iCaravanID then
		ApachetaFaith(iPlayer)
		FaithTradeRoutes(iPlayer)
	end
end

GameEvents.CanSaveUnit.Add(OnCanSaveUnit)