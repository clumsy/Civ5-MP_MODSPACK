--Tomatekh

--Stuff
local bZhou = GameInfoTypes.BUILDINGCLASS_ZHOU_DYNASTY_DUMMY;
local bSui = GameInfoTypes.BUILDINGCLASS_SUI_DYNASTY_DUMMY;

local sArtist = GameInfo.Specialists.SPECIALIST_ARTIST.ID
local sScientist = GameInfo.Specialists.SPECIALIST_SCIENTIST.ID
local sMerchant = GameInfo.Specialists.SPECIALIST_MERCHANT.ID
local sEngineer = GameInfo.Specialists.SPECIALIST_ENGINEER.ID
local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID
local sMusician = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID
local sMonk = GameInfoTypes.SPECIALIST_JFD_MONK;

local isShang = (GameInfoTypes.BUILDING_XIA_SHANG_SWITCH ~= nil)

local tipControlTable = {};
TTManager:GetTypeControlTable( "TooltipTypeTopPanel", tipControlTable );

--Golden Age
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
			local iHappiness = pPlayer:GetExcessHappiness();
			strText = Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_PROGRESS", pPlayer:GetGoldenAgeProgressMeter(), pPlayer:GetGoldenAgeProgressThreshold());
			if (iHappiness >= 0) then
				strText = strText .. "[NEWLINE]" .. Locale.ConvertTextKey("TXT_KEY_TP_GOLDEN_AGE_ADDITION", iHappiness);
			end

		--
		--Tomatekh Start
		--

			local iXiaGA = pPlayer:GetBuildingClassCount(bZhou)
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then

				local xZhouSpecialists = 0;
				if iXiaGA >= 1 then
					for bCity in pPlayer:Cities() do
						local Artist = bCity:GetSpecialistCount(sArtist);
						local Scientist = bCity:GetSpecialistCount(sScientist);
						local Merchant = bCity:GetSpecialistCount(sMerchant);
						local Engineer = bCity:GetSpecialistCount(sEngineer);
						local Writer = bCity:GetSpecialistCount(sWriter);
						local Musician = bCity:GetSpecialistCount(sMusician);
						local Monk = bCity:GetSpecialistCount(sMonk);
						local cSpecialists = (Artist + Scientist + Merchant + Engineer + Writer + Musician + Monk);
						xZhouSpecialists = xZhouSpecialists + cSpecialists;
					end
				end

				if not pPlayer:IsGoldenAge() then

					local iHappiness = pPlayer:GetExcessHappiness();
					local XiaTotal = iHappiness + xZhouSpecialists;

					strText = "" .. pPlayer:GetGoldenAgeProgressMeter() .. "/" .. pPlayer:GetGoldenAgeProgressThreshold() .. " progress towards the next [ICON_GOLDEN_AGE] Golden Age."	
					if (iHappiness >= 0) then
						strText = strText .. "[NEWLINE][NEWLINE]";
						strText = strText .. "[COLOR:150:255:150:255]" .. XiaTotal .. " total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
						if (iHappiness > 0) then
							strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. iHappiness .. " from excess [ICON_HAPPINESS_1] Happiness.[/COLOR]";	
						end
						if (xZhouSpecialists > 0) then
							strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. xZhouSpecialists .. " from Specialists.[/COLOR]";
						end
					elseif (iHappiness < 0) and (xZhouSpecialists >= 1) then
						strText = strText .. "[NEWLINE][NEWLINE]";
						strText = strText .. "[COLOR:150:255:150:255]" .. xZhouSpecialists .. " total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
						strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. xZhouSpecialists .. " from Specialists.[/COLOR]";
					end
					if (iHappiness < 0) then
						strText = strText .. "[NEWLINE][NEWLINE]";
						strText = strText .. "[COLOR:255:150:150:255]" .. -iHappiness .. " total [ICON_GOLDEN_AGE] Golden Age Points lost per turn from all sources.[/COLOR]";
						strText = strText .. "[COLOR:255:150:150:255][NEWLINE]  [ICON_BULLET]" .. iHappiness .. " from [ICON_HAPPINESS_4] Unhappiness.[/COLOR]"	
					end
				end
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
	local iSuiRefund = pPlayer:GetBuildingClassCount(bSui);

	local iBuildingMaintenance = iBuildingMaintenanceBase;

	if (iBuildingMaintenanceBase - iSuiRefund) > 0 then
		iBuildingMaintenance = (iBuildingMaintenanceBase - iSuiRefund);
	elseif (iBuildingMaintenanceBase - iSuiRefund) <= 0 then
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
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then			
		return
	end

	local iSuiRefund = pPlayer:GetBuildingClassCount(bSui);

	local strGoldStr;
	local iTotalGold = pPlayer:GetGold();

	local iGoldPerTurn = pPlayer:CalculateGoldRate();

	local iGPTBase = pPlayer:CalculateGoldRate();
	if iGPTBase >= 0 then
		iGoldPerTurn = (pPlayer:CalculateGoldRate() + iSuiRefund)
	elseif iGPTBase < 0 then
		if (iGPTBase + iSuiRefund) < 0 then
			iGoldPerTurn = (pPlayer:CalculateGoldRate() + iSuiRefund)
		elseif (iGPTBase + iSuiRefund) >= 0 then 
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
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_ERLITOU_MOD) then			
		return
	end
	if isShang then
		return
	end
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldenAgeString"):SetToolTipCallback(UpdatedGoldenAgeTipHandler);
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldPerTurn"):SetToolTipCallback(UpdatedGoldTipHandler);
end
Events.ActivePlayerTurnStart.Add(InitUpdatedTooltips)