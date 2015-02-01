-- Oman Functions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- GetRandom
--------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AddPromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_AddPromotion(unit, promotionType)
	if not unit:IsHasPromotion(GameInfoTypes[promotionType]) then
		unit:SetHasPromotion(GameInfoTypes[promotionType], true)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RemovePromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_RemovePromotion(unit, promotionType)
	if unit:IsHasPromotion(GameInfoTypes[promotionType]) then
		unit:SetHasPromotion(GameInfoTypes[promotionType], false)
	end
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_DomesticTRGold
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetGoldFromDomesticTradeRoutes(player)
	local numDomesticTRSToConqueredCities = 0
	local goldFromDomesticTRS = 0
	local goldFromTradeBuildings = 0
	local tradeRoutes = player:GetTradeRoutes()
	for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
		local domain = tradeRoute.Domain
		local originatingCity = tradeRoute.FromCity
		local targetCity = tradeRoute.ToCity
		if tradeRoute.FromID == tradeRoute.ToID and domain == GameInfoTypes["DOMAIN_SEA"] then
			if targetCity:IsPuppet() or targetCity:IsOccupied() or targetCity:IsHasBuilding(GameInfoTypes["BUILDING_COURTHOUSE"]) then
				numDomesticTRSToConqueredCities = numDomesticTRSToConqueredCities + 1
				if player:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then
					goldFromDomesticTRS = 15
				elseif player:GetCurrentEra() >= GameInfoTypes["ERA_MEDIEVAL"] then
					goldFromDomesticTRS = 10
				else 
					goldFromDomesticTRS = 5
				end
			end
		end
		
		for row in GameInfo.Buildings() do
			local seaGoldBonus = (row.TradeRouteSeaGoldBonus / 100)
			local recipientBonus = row.TradeRouteRecipientBonus
			if seaGoldBonus > 0 or recipientBonus > 0 then
				if originatingCity:IsHasBuilding(row.ID) then
					goldFromTradeBuildings = goldFromTradeBuildings + seaGoldBonus + recipientBonus 
				end
			end
		end
	end
	
	return (numDomesticTRSToConqueredCities * goldFromDomesticTRS) + (goldFromTradeBuildings / 2)
end

function JFD_DomesticTRGold(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OMAN"] then
		local tradeRoutes = player:GetTradeRoutes()
		local goldFromDomesticTradeRoutes = JFD_GetGoldFromDomesticTradeRoutes(player)
		if goldFromDomesticTradeRoutes > 0 then
			player:ChangeGold(goldFromDomesticTradeRoutes)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_DomesticTRGold)

function UpdateGoldTopPanelInfo()
	--Don't start before the TopPanel has loaded
	if Game.GetGameTurn() == 0 then
		return
	end
	
	--Don't continue if the player is not Oman
	local player = Players[Game.GetActivePlayer()]
	if not player:GetCivilizationType() == (GameInfoTypes["CIVILIZATION_OMAN"]) then	
		return
	end
	
	
	local iTotalGold = player:GetGold();
	local iGoldPerTurn
	local goldFromDTRS = JFD_GetGoldFromDomesticTradeRoutes(player)
	if goldFromDTRS > 0 then
		iGoldPerTurn = math.floor(player:CalculateGoldRate() + goldFromDTRS)
	else
		iGoldPerTurn = player:CalculateGoldRate()
	end
	
	local strGoldStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn);

	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetText(strGoldStr);
end
Events.SerialEventGameDataDirty.Add(UpdateGoldTopPanelInfo)
Events.SerialEventTurnTimerDirty.Add(UpdateGoldTopPanelInfo);
Events.SerialEventCityInfoDirty.Add(UpdateGoldTopPanelInfo);

-- Gold Tooltip
local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

function UpdatedGoldTipHandler( control )

	local strText = "";
	local iPlayerID = Game.GetActivePlayer();
	local pPlayer = Players[iPlayerID];
	local pTeam = Teams[pPlayer:GetTeam()];
	local pCity = UI.GetHeadSelectedCity();
	
	local iTotalGold = pPlayer:GetGold();

	local iGoldPerTurnFromOtherPlayers = pPlayer:GetGoldPerTurnFromDiplomacy();
	local iGoldPerTurnToOtherPlayers = 0;
	if (iGoldPerTurnFromOtherPlayers < 0) then
		iGoldPerTurnToOtherPlayers = -iGoldPerTurnFromOtherPlayers;
		iGoldPerTurnFromOtherPlayers = 0;
	end
	
	local iGoldPerTurnFromReligion = pPlayer:GetGoldPerTurnFromReligion();

	local fTradeRouteGold = (pPlayer:GetGoldFromCitiesTimes100() - pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100()) / 100;
	local fGoldPerTurnFromCities = pPlayer:GetGoldFromCitiesMinusTradeRoutesTimes100() / 100;
	local fCityConnectionGold = pPlayer:GetCityConnectionGoldTimes100() / 100;
	--local fInternationalTradeRouteGold = pPlayer:GetGoldPerTurnFromTradeRoutesTimes100() / 100;
	local fTraitGold = pPlayer:GetGoldPerTurnFromTraits();
	local fTotalIncome = fGoldPerTurnFromCities + iGoldPerTurnFromOtherPlayers + fCityConnectionGold + iGoldPerTurnFromReligion + fTradeRouteGold + fTraitGold;
	
	if (pPlayer:IsAnarchy()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_ANARCHY", pPlayer:GetAnarchyNumTurns());
		strText = strText .. "[NEWLINE][NEWLINE]";
	end
	
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. Locale.ConvertTextKey("TXT_KEY_TP_AVAILABLE_GOLD", iTotalGold);
		strText = strText .. "[NEWLINE][NEWLINE]";
	end
	
	strText = strText .. "[COLOR:150:255:150:255]";
	strText = strText .. "+" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_INCOME", math.floor(fTotalIncome));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities);
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_CITY_CONNECTIONS", math.floor(fCityConnectionGold));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_ITR", math.floor(fTradeRouteGold));
	if (math.floor(fTraitGold) > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TRAITS", math.floor(fTraitGold));
	end
	if (iGoldPerTurnFromOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers);
	end
	if (iGoldPerTurnFromReligion > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_RELIGION", iGoldPerTurnFromReligion);
	end
	--===============================
	--More Civ's Oman BEGINS
	--===============================
	local goldFromDTRS = JFD_GetGoldFromDomesticTradeRoutes(pPlayer)
	if goldFromDTRS > 0 then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_JFD_GOLD_FROM_DTRS", goldFromDTRS);
	end
	--===============================
	--More Civ's Oman ENDS
	--===============================
	strText = strText .. "[/COLOR]";
	
	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance();
	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance();
	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers;
	
	strText = strText .. "[NEWLINE]";
	strText = strText .. "[COLOR:255:150:150:255]";
	strText = strText .. "[NEWLINE]-" .. Locale.ConvertTextKey("TXT_KEY_TP_TOTAL_EXPENSES", iTotalExpenses);
	if (iUnitCost ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_UNIT_MAINT", iUnitCost);
	end
	if (iUnitSupply ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_UNIT_SUPPLY", iUnitSupply);
	end
	if (iBuildingMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_BUILDING_MAINT", iBuildingMaintenance);
	end
	if (iImprovementMaintenance ~= 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TILE_MAINT", iImprovementMaintenance);
	end
	if (iGoldPerTurnToOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_TO_OTHERS", iGoldPerTurnToOtherPlayers);
	end
	
	strText = strText .. "[/COLOR]";
	
	if (fTotalIncome + iTotalGold < 0) then
		strText = strText .. "[NEWLINE][COLOR:255:60:60:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_LOSING_SCIENCE_FROM_DEFICIT") .. "[/COLOR]";
	end
	
	-- Basic explanation of Happiness
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLD_EXPLANATION");
	end
	
	--Controls.GoldPerTurn:SetToolTipString(strText);
	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    
    -- Autosize tooltip
    tipControlTable.TopPanelMouseover:DoAutoSize();
	
end

--Initialise the updated Tool-tips
function InitUpdatedTooltips()
	--Don't start before the TopPanel has loaded
	if Game.GetGameTurn() == 0 then
		return
	end
	
	local player = Players[Game.GetActivePlayer()]
	if player:GetCivilizationType(GameInfoTypes["CIVILIZATION_OMAN"]) then	
		ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(UpdatedGoldTipHandler)
	end
end
Events.ActivePlayerTurnStart.Add(InitUpdatedTooltips)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_NavalBonusPerGold
----------------------------------------------------------------------------------------------------------------------------
function JFD_NavalBonusPerGold(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OMAN"] then
		local goldPerTurn = player:CalculateGoldRate()
		if goldPerTurn >= 10 then
			for unit in player:Units() do
				if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALRANGED"] or unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALMELEE"] then
					if goldPerTurn >= 40 then 
						JFD_AddPromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10")
					elseif goldPerTurn >= 30 then 
						JFD_AddPromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10")
					elseif goldPerTurn >= 20 then 
						JFD_AddPromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10")
					elseif goldPerTurn >= 10 then 
						JFD_AddPromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20")
					else
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20")
						JFD_RemovePromotion(unit, "PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10")
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_NavalBonusPerGold)	
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MinaaAttrition
----------------------------------------------------------------------------------------------------------------------------
local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
	}

function JFD_MinaaAttrition(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OMAN"] then
		for city in player:Cities() do
			if city and city:IsHasBuilding(GameInfoTypes["BUILDING_OMANI_MINAA"]) then
				local plot = Map.GetPlot(city:GetX(), city:GetY())
				for loop, direction in ipairs(direction_types) do
					local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
					if adjPlot:GetUnit() and adjPlot:GetUnit():GetOwner() ~= playerID then
						local unit = adjPlot:GetUnit()
						local unitOwner = Players[adjPlot:GetUnit():GetOwner()]
						if Teams[player:GetTeam()]:IsAtWar(unitOwner:GetTeam()) and unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALRANGED"] or unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_NAVALMELEE"] then
							unit:ChangeDamage(15)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_MinaaAttrition)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MinaaNavalProduction
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumDomesticRoutesFromThisCity(player, city)
	local tradeRoutes = player:GetTradeRoutes()
	local numDomesticRoutes = 0
	for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
		local domain = tradeRoute.Domain
		local originatingCity = tradeRoute.FromCity
		local targetCity = tradeRoute.ToCity
		if domain == GameInfoTypes["DOMAIN_SEA"] and targetCity and originatingCity == city then
			numDomesticRoutes = numDomesticRoutes + 1
		end
	end
	
	return numDomesticRoutes
end

function JFD_MinaaNavalProduction(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OMAN"] and player:IsAlive() then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_OMANI_MINAA"]) then
				local numDomesticRoutes = JFD_GetNumDomesticRoutesFromThisCity(player, city)
				if city and city:IsHasBuilding(GameInfoTypes["BUILDING_OMANI_MINAA"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_MINAA_NAVAL_PRODUCTION"], numDomesticRoutes) 
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_MinaaNavalProduction)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BaghlahXP
----------------------------------------------------------------------------------------------------------------------------
function JFD_BaghlahXP(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OMAN"] then 
       	 if player:GetUnitByID(unitID) then 
			local unit = player:GetUnitByID(unitID)
			if player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_OMANI_BAGHLAH"] and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_BAGHLAH"]) then
				local goldRate = math.floor((player:CalculateGoldRate() + player:GetGoldPerTurnFromDiplomacy()) * 33 / 100)
				local experience = math.min(30, goldRate)
				unit:ChangeExperience(experience)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_BAGHLAH"], false)
			end
         end
    end
end
Events.SerialEventUnitCreated.Add(JFD_BaghlahXP)
--==========================================================================================================================
--==========================================================================================================================