--Tomatekh

local bChampa = GameInfoTypes.BUILDINGCLASS_CHAMPA_GOLDEN_AGE_PLUS_DUMMY;
local bChampaPlunder = GameInfoTypes.BUILDINGCLASS_CHAMPA_BLOCKADE_PLUS_DUMMY;
local bChampaBlockade = GameInfoTypes.BUILDINGCLASS_CHAMPA_PLUNDER_TOTAL_DUMMY;

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

function UpdatedGoldenAgeTipHandler( control )
	local strText;	
	if (Game.IsOption(GameOptionTypes.GAMEOPTION_NO_HAPPINESS)) then
		strText = Locale.ConvertTextKey("TXT_KEY_TOP_PANEL_HAPPINESS_OFF_TOOLTIP");
	else
		local iPlayerID = Game.GetActivePlayer();
		local pPlayer = Players[iPlayerID];
		local pTeam = Teams[pPlayer:GetTeam()];
		local pCity = UI.GetHeadSelectedCity();
		if (pPlayer:GetGoldenAgeTurns() > 0) then
			strText = Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_NOW", pPlayer:GetGoldenAgeTurns());
		else
		--
		--Tomatekh Start
		--
			local iChamGA = pPlayer:GetBuildingClassCount(bChampa)
			local iHappiness = pPlayer:GetExcessHappiness();
			strText = "" .. pPlayer:GetGoldenAgeProgressMeter() .. "/" .. pPlayer:GetGoldenAgeProgressThreshold() .. " progress towards the next [ICON_GOLDEN_AGE] Golden Age."		
			if (iHappiness >= 0) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:150:255:150:255]" .. iHappiness .. " total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
				strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. iHappiness .. " from excess [ICON_HAPPINESS_1] Happiness.[/COLOR]";			
			elseif (iHappiness < 0) and (iChamGA >= 1) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:150:255:150:255]0 total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
			end
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
				local speed = Game.GetGameSpeedType();			
				if not pPlayer:IsGoldenAge() then
					if (iChamGA >= 1) then
						strText = strText .. "[NEWLINE][NEWLINE]";
						strText = strText .. "[COLOR:150:255:150:255]" .. Locale.ConvertTextKey("TXT_KEY_TP_CHAMPA_GA_EDIT", iChamGA) .. "[/COLOR]";
					end
				end
			end
			if (iHappiness < 0) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:255:150:150:255]" .. -iHappiness .. " total [ICON_GOLDEN_AGE] Golden Age Points lost per turn from all sources.[/COLOR]";
				strText = strText .. "[COLOR:255:150:150:255][NEWLINE]  [ICON_BULLET]" .. iHappiness .. " from [ICON_HAPPINESS_4] Unhappiness.[/COLOR]"	
			end
		--
		--Tomatekh End
		--
		end
		strText = strText .. "[NEWLINE][NEWLINE]";
		if (pPlayer:IsGoldenAgeCultureBonusDisabled()) then
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_EFFECT_NO_CULTURE");		
		else
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_EFFECT");		
		end		
		if (pPlayer:GetGoldenAgeTurns() > 0 and pPlayer:GetGoldenAgeTourismModifier() > 0) then
			strText = strText .. "[NEWLINE][NEWLINE]";
			strText = strText ..  Locale.ConvertTextKey("TXT_KEY_TP_CARNIVAL_EFFECT");			
		end
	end	
	tipControlTable.TooltipLabel:SetText( strText );
	tipControlTable.TopPanelMouseover:SetHide(false);
    tipControlTable.TopPanelMouseover:DoAutoSize();	
end

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
	--
	--Tomatekh Start
	--
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
		local iChamCargo = pPlayer:GetBuildingClassCount(bChampaPlunder)
		local iChamTotal = pPlayer:GetBuildingClassCount(bChampaBlockade);
		local iChamBonusGold = iChamCargo + iChamTotal;
		if (iChamBonusGold > 0) then
			strText = strText .. "[NEWLINE][NEWLINE][COLOR:150:255:150:255]" .. iChamBonusGold .. " earned through Cham Piracy this turn (not reflected in GPT).[/COLOR]";
			if (iChamCargo > 0) then
				strText = strText .. "[NEWLINE][COLOR:150:255:150:255]  [ICON_BULLET]" .. iChamCargo .. " plundered from foreign Cargo Ships.[/COLOR]"
			end
			if (iChamTotal > 0) then
				strText = strText .. "[NEWLINE][COLOR:150:255:150:255]  [ICON_BULLET]" .. iChamTotal .. " stolen from enemy Civilizations you are at war with.[/COLOR]"
			end
		end
	end
	--
	--Tomatekh End
	--
	local iUnitCost = pPlayer:CalculateUnitCost();
	local iUnitSupply = pPlayer:CalculateUnitSupply();
	local iBuildingMaintenance = pPlayer:GetBuildingGoldMaintenance();
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

function InitUpdatedTooltips()
	if Game.GetGameTurn() == 0 then
		return
	end
	local pPlayer = Players[Game.GetActivePlayer()]
	if not (pPlayer:IsHuman()) then			
		return
	end
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then			
		return
	end
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldenAgeString"):SetToolTipCallback(UpdatedGoldenAgeTipHandler);
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(UpdatedGoldTipHandler);
end
Events.ActivePlayerTurnStart.Add(InitUpdatedTooltips)