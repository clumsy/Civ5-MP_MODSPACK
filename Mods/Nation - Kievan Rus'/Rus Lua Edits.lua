--Tomatekh

--Stuff
local bVeche = GameInfoTypes.BUILDINGCLASS_KIEVAN_RUS_TRAIT_DUMMY_BUILDING;

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

--Gold
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
	strText = strText .. "+" .. fTotalIncome .. " in total Income."
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_CITY_OUTPUT", fGoldPerTurnFromCities);
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_CITY_CONNECTIONS", math.floor(fCityConnectionGold));
	strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. fTradeRouteGold .. " from [ICON_TURNS_REMAINING] Trade Routes between your Cities and other Civilizations."
	if (math.floor(fTraitGold) > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_TRAITS", math.floor(fTraitGold));
	end
	if (iGoldPerTurnFromOtherPlayers > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_OTHERS", iGoldPerTurnFromOtherPlayers);
	end
	if (iGoldPerTurnFromReligion > 0) then
		strText = strText .. "[NEWLINE]  [ICON_BULLET]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLD_FROM_RELIGION", iGoldPerTurnFromReligion);
	end
	strText = strText .. "[/COLOR]";

	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();

	--
	--Tomatekh Start
	--

	local iBuildingMaintenanceBase = pPlayer:GetBuildingGoldMaintenance();
	local iVecheRefund = pPlayer:GetBuildingClassCount(bVeche);

	local iBuildingMaintenance = iBuildingMaintenanceBase;

	if (iBuildingMaintenanceBase - iVecheRefund) > 0 then
		iBuildingMaintenance = (iBuildingMaintenanceBase - iVecheRefund);
	elseif (iBuildingMaintenanceBase - iVecheRefund) <= 0 then
		iBuildingMaintenance = iBuildingMaintenanceBase;
	end

	--
	--Tomatekh End
	--

	local iImprovementMaintenance = pPlayer:GetImprovementGoldMaintenance();

	local iTotalExpenses = iUnitCost + iUnitSupply + iBuildingMaintenance + iImprovementMaintenance + iGoldPerTurnToOtherPlayers;
		
	strText = strText .. "[NEWLINE]";
	strText = strText .. "[COLOR:255:150:150:255]";
	strText = strText .. "[NEWLINE]-" .. iTotalExpenses .. " in total Expenses."
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
	if (not OptionsManager.IsNoBasicHelp()) then
		strText = strText .. "[NEWLINE][NEWLINE]";
		strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLD_EXPLANATION");
	end	

	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    tipControlTable.TopPanelMouseover:DoAutoSize();	
end

--GPT
function UpdateGoldTopPanelInfo()

	--
	--Tomatekh start
	--

	if Game.GetGameTurn() == 0 then
		return
	end
	local pPlayer = Players[Game.GetActivePlayer()]
	if not (pPlayer:IsHuman()) then			
		return
	end
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KIEVAN_RUS_MOD) then			
		return
	end

	local iVecheRefund = pPlayer:GetBuildingClassCount(bVeche);

	local strGoldStr;
	local iTotalGold = pPlayer:GetGold();

	local iGoldPerTurn = pPlayer:CalculateGoldRate();

	local iGPTBase = pPlayer:CalculateGoldRate();
	if iGPTBase >= 0 then
		iGoldPerTurn = (pPlayer:CalculateGoldRate() + iVecheRefund)
	elseif iGPTBase < 0 then
		if (iGPTBase + iVecheRefund) < 0 then
			iGoldPerTurn = (pPlayer:CalculateGoldRate() + iVecheRefund)
		elseif (iGPTBase + iVecheRefund) >= 0 then 
			iGoldPerTurn = pPlayer:CalculateGoldRate();
		end
	end

	local strGoldStr = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_GOLD", iTotalGold, iGoldPerTurn);		

	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetText(strGoldStr);

	--
	--Tomatekh end
	--

end
Events.SerialEventGameDataDirty.Add(UpdateGoldTopPanelInfo)
Events.SerialEventTurnTimerDirty.Add(UpdateGoldTopPanelInfo);
Events.SerialEventCityInfoDirty.Add(UpdateGoldTopPanelInfo);

--Load
function InitUpdatedTooltips()
	if Game.GetGameTurn() == 0 then
		return
	end
	local pPlayer = Players[Game.GetActivePlayer()]
	if not (pPlayer:IsHuman()) then			
		return
	end
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KIEVAN_RUS_MOD) then			
		return
	end
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(UpdatedGoldTipHandler);
end
Events.ActivePlayerTurnStart.Add(InitUpdatedTooltips)