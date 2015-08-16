local iVatadage = GameInfoTypes["BUILDING_VATADAGE"]
local iSriLanka = GameInfoTypes["CIVILIZATION_SRI_LANKA"]
local iBalata = GameInfoTypes["UNIT_BALATA"]
local iPromoBalata = GameInfoTypes["PROMOTION_BALATA_HEAL"] --<EnemyHealChange><NeutralHealChange><FriendlyHealChange>
SriTable = {}
SriTable.SriCityPlotsTb = {}
SriCityPlotsTb = SriTable.SriCityPlotsTb
SriTable.RelBuildingsTb = {}
RelBuildingsTb = SriTable.RelBuildingsTb
RelBuildingsTb[1] = iVatadage
RelBuildingsTb[2] = GameInfoTypes["BUILDING_TEMPLE"]
RelBuildingsTb[3] = GameInfoTypes["BUILDING_CATHEDRAL"]
RelBuildingsTb[4] = GameInfoTypes["BUILDING_MONASTERY"]
RelBuildingsTb[5] = GameInfoTypes["BUILDING_MOSQUE"]
RelBuildingsTb[6] = GameInfoTypes["BUILDING_PAGODA"]
RelBuildingsTb[7] = GameInfoTypes["BUILDING_SHRINE"]
 
 
function LoveKingDipavamsa(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	local pCity = pPlayer:GetCityByID(iCity)
	if pPlayer:GetCivilizationType() == iSriLanka then
		for _, v in pairs(RelBuildingsTb) do
			if v == iBuilding then
				local iKingDays = pCity:GetWeLoveTheKingDayCounter() or 0
				pCity:SetWeLoveTheKingDayCounter(iKingDays + 5)
				pCity:SetResourceDemanded(-1)
				Events.SerialEventCityInfoDirty()
			end
		end
	end
end
 
function SriDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iSriLanka then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iVatadage) then
				local iNumRelBuildings = 0
				for _, v in pairs(RelBuildingsTb) do
					if pCity:IsHasBuilding(v) then
						iNumRelBuildings = iNumRelBuildings + 1
					end
				end
				local iCultureStored = pCity:GetJONSCultureStored()
				local iCultureExtra = math.floor(iCultureStored * (iNumRelBuildings * 0.05)) -- iNumRelBuildings always will be at least 1 from Vatadage
				pCity:ChangeJONSCultureStored(iCultureExtra)
			end
		end
	end
end

--[[function SriIncreaseProdExpansion(iPlayer, iCity, iX, iY, bGold, bFaithOrCulture)
	if Players[iPlayer]:GetCivilizationType() == iSriLanka then
end end]]


function SriBalata(iPlayer, iUnitID, iX, iY)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iSriLanka then
		local pUnit = pPlayer:GetUnitByID(iUnitID)
		if pUnit:GetUnitType() == iBalata then
			local pPlot = Map.GetPlot(iX, iY)
			if pUnit:IsHasPromotion(iPromoBalata) then
				if not pPlot:IsRiver() then
					pUnit:SetHasPromotion(iPromoBalata, false)
				end
			else
				if pPlot:IsRiver() then
					pUnit:SetHasPromotion(iPromoBalata, true)
				end
			end
		end
	end
end


GameEvents.CityBoughtPlot.Add(SriIncreaseProd)
GameEvents.PlayerCityFounded.Add(SriIncreaseProd)
GameEvents.CityConstructed.Add(LoveKingDipavamsa)
GameEvents.PlayerDoTurn.Add(SriDoTurn)
GameEvents.UnitSetXY.Add(SriBalata)