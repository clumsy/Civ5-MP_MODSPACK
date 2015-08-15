--Tomatekh

local bMali = GameInfoTypes.BUILDINGCLASS_MINT;

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
			local iMaliGA = pPlayer:GetBuildingClassCount(bMali)
			local speed = Game.GetGameSpeedType();
			local mGAPoints = 0;
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then			
				local GAThreshold = 0;
				if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
					GAThreshold = 150;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
					GAThreshold = 200;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
					GAThreshold = 250;
				elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
					GAThreshold = 400;
				else
					GAThreshold = 400;
				end
				if not pPlayer:IsGoldenAge() then
					if (iMaliGA >= 1) then
						local ReserveGold = pPlayer:GetGold();
						if ReserveGold >= (GAThreshold) and ReserveGold < (GAThreshold * 2) then
							mGAPoints = (1 * iMaliGA);
						elseif ReserveGold >= (GAThreshold * 2) and ReserveGold < (GAThreshold * 4) then
							mGAPoints = (2 * iMaliGA);
						elseif ReserveGold >= (GAThreshold * 4) then
							mGAPoints = (3 * iMaliGA);
						end
					end
				end
			end
			local iHappiness = pPlayer:GetExcessHappiness();
			local MaliTotal = iHappiness + mGAPoints;
			strText = "" .. pPlayer:GetGoldenAgeProgressMeter() .. "/" .. pPlayer:GetGoldenAgeProgressThreshold() .. " progress towards the next [ICON_GOLDEN_AGE] Golden Age."	
			if (iHappiness >= 0) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:150:255:150:255]" .. MaliTotal .. " total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
				if (iHappiness > 0) then
					strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. iHappiness .. " from excess [ICON_HAPPINESS_1] Happiness.[/COLOR]";	
				end
				if (mGAPoints > 0) then
					strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. mGAPoints .. " from your [ICON_GOLD] Gold Reserves.[/COLOR]";
				end
			elseif (iHappiness < 0) and (mGAPoints >= 1) then
				strText = strText .. "[NEWLINE][NEWLINE]";
				strText = strText .. "[COLOR:150:255:150:255]" .. mGAPoints .. " total [ICON_GOLDEN_AGE] Golden Age Points added per turn from all sources.[/COLOR]";
				strText = strText .. "[COLOR:150:255:150:255][NEWLINE]  [ICON_BULLET]+" .. mGAPoints .. " from your [ICON_GOLD] Gold Reserves.[/COLOR]";
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

function InitUpdatedTooltips()
	if Game.GetGameTurn() == 0 then
		return
	end
	local pPlayer = Players[Game.GetActivePlayer()]
	if not (pPlayer:IsHuman()) then			
		return
	end
	if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then			
		return
	end
	ContextPtr:LookUpControl("/InGame/TopPanel/GoldenAgeString"):SetToolTipCallback(UpdatedGoldenAgeTipHandler);
end
Events.ActivePlayerTurnStart.Add(InitUpdatedTooltips)