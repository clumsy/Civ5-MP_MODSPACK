--Tomatekh

--Set to false to turn off notifcations piracy notifications.
local ChamNotifications = true;

--Stuff
print ("Champa Mod Scripts")

local tOcean = GameInfoTypes.TERRAIN_OCEAN;
local tCoast = GameInfoTypes.TERRAIN_COAST;

local sWell = GameInfoTypes.IMPROVEMENT_CHAMPA_MOD_WELL;

local uCargo = GameInfoTypes.UNIT_CARGO_SHIP;

local eInd = GameInfoTypes.ERA_INDUSTRIAL;

local uPlusBlockGoldDummy = GameInfo.Units["UNIT_CHAM_PIRATE_DUMMY"].ID;

local bPlusTotalDummy = GameInfo.Buildings["BUILDING_CHAMPA_PLUNDER_TOTAL_DUMMY"].ID;
local bPlusBlockGoldDummy = GameInfo.Buildings["BUILDING_CHAMPA_BLOCKADE_PLUS_DUMMY"].ID;
local bPlusGoldenAgeDummy = GameInfo.Buildings["BUILDING_CHAMPA_GOLDEN_AGE_PLUS_DUMMY"].ID;

function GetChamBlockades(pPlayer, mPlayer, mcCity)	
	local ChamBlockadeCount = 0;
	for mCity in mPlayer:Cities() do
		if mCity:IsBlockaded() then
			local isChamBlockade = 0
			local mCityPlot = mCity:Plot()
			local plotX = mCityPlot:GetX();
			local plotY = mCityPlot:GetY();
			local iRange = 2;
			for iDX = -iRange, iRange do
				for iDY = -iRange, iRange do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
					if pTargetPlot then
						if (pTargetPlot:GetTerrainType() == tCoast) or (pTargetPlot:GetTerrainType() == tOcean) then
							if pTargetPlot:IsUnit() then
								local adjUnit = pTargetPlot:GetUnit(i);
								if (Players[adjUnit:GetOwner()] == pPlayer) then
									if not (adjUnit:IsEmbarked()) and (adjUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
										isChamBlockade = isChamBlockade + 1;
									end
								end
							end
						end
					end
				end
			end
			if isChamBlockade >= 1 then
				ChamBlockadeCount = ChamBlockadeCount + 1;
			end
		end
	end
	return ChamBlockadeCount;
end

function SouthSeaNotifications(pPlayer, mPlayer, PirateCount, BlockadeCount, mcCity)

	if (ChamNotifications == true) then

		local title = "Pirates of the South Sea";
		local descr = "";
		local descr2 = "";
		local BlockadeMessage = "";
		local BlockadedMessage = "";
		local PirateMessage = "You have lost " .. PirateCount .. " [ICON_GOLD] Gold to Cham Pirates!";
		local PlunderMessage = "You have stolen " .. PirateCount .. " [ICON_GOLD] Gold from " .. Locale.ConvertTextKey(mPlayer:GetCivilizationShortDescription()) .. "";
		if PirateCount >= 1 then							
			if (BlockadeCount <= 0) then
				BlockadedMessage = "!";
			elseif (BlockadeCount > 0) and (BlockadeCount < 2) then
				BlockadeMessage = " " .. BlockadeCount .. " of your Cities is under Blockade, increasing the [ICON_GOLD] Gold lost when at war with Champa.";
				BlockadedMessage = " and have " .. BlockadeCount .. " of their Cities under Blockade!";
			elseif BlockadeCount >= 2 then
				BlockadeMessage = " " .. BlockadeCount .. " of your Cities are under Blockade, increasing the [ICON_GOLD] Gold lost when at war with Champa.";
				BlockadedMessage = " and have " .. BlockadeCount .. " of their Cities under Blockade!";								
			end
			descr = "" .. PirateMessage .. "" .. BlockadeMessage .. "";
			descr2 = "" .. PlunderMessage .. "" .. BlockadedMessage .. "";
		elseif PirateCount <= 0 then
			descr = "Cham Pirates have depleted your treasury!";
			descr2 = "The " .. Locale.ConvertTextKey(mPlayer:GetCivilizationAdjective()) .. " treasury has been depleted!";
		end

		--mPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, -1, -1, bPlusBlockGoldDummy, -1);
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr2, title, -1, -1, uPlusBlockGoldDummy, -1);

	end

end

function NotChampaGA(pPlayer, iPlayer)
	if (pPlayer:GetNumCities() >= 1) then
		local pcCity = pPlayer:GetCapitalCity();
		local GABonusCount = pcCity:GetNumBuilding(bPlusGoldenAgeDummy);
		local GoldLostCount = pcCity:GetNumBuilding(bPlusBlockGoldDummy);
		local GoldLostUA = pcCity:GetNumBuilding(bPlusTotalDummy);

		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GABonusCount >= 1) then
			Events.GameplayAlertMessage("Square Wells within your territory have generated " .. GABonusCount .. " [ICON_GOLDEN_AGE] Golden Age Points from Trade Routes.");
		end
		
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GoldLostCount >= 1) and (GoldLostUA <= 0) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]Cargo Ships in Cham territory have lost " .. GoldLostCount .. " [ICON_GOLD] Gold due to piracy![ENDCOLOR]");
		elseif (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GoldLostCount <= 0) and (GoldLostUA >= 1) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]You have lost " .. GoldLostUA .. " [ICON_GOLD] Gold to Cham blockades![ENDCOLOR]");
		elseif (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GoldLostCount >= 1) and (GoldLostUA >= 1) then
			Events.GameplayAlertMessage("[COLOR_NEGATIVE_TEXT]You have lost " .. GoldLostUA .. " [ICON_GOLD] Gold to Cham blockades and Cargo Ships in Cham territory have lost " .. GoldLostCount .. " [ICON_GOLD] Gold due to piracy![ENDCOLOR]");
		end

		if pcCity:IsHasBuilding(bPlusGoldenAgeDummy) then
			pcCity:SetNumRealBuilding(bPlusGoldenAgeDummy, 0);
		end
		if pcCity:IsHasBuilding(bPlusBlockGoldDummy) then
			pcCity:SetNumRealBuilding(bPlusBlockGoldDummy, 0);
		end
		if pcCity:IsHasBuilding(bPlusTotalDummy) then
			pcCity:SetNumRealBuilding(bPlusTotalDummy, 0);
		end

	end
end

function ChampaCargoPlunder(pPlayer, iPlayer, pcCity)
	if (pPlayer:GetNumCities() >= 1) then
		local GABonusCount = pcCity:GetNumBuilding(bPlusGoldenAgeDummy);
		local GoldPlunderCount = pcCity:GetNumBuilding(bPlusBlockGoldDummy);													
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GoldPlunderCount >= 1) and (GABonusCount == 0) then
			Events.GameplayAlertMessage("You have plundered " .. GoldPlunderCount .. " [ICON_GOLD] Gold from Cargo Ships in your territory!");
		end
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GABonusCount >= 1) and (GoldPlunderCount == 0) then
			Events.GameplayAlertMessage("Square Wells have generated " .. GABonusCount .. " [ICON_GOLDEN_AGE] Golden Age Points!");
		end
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) and (GABonusCount >= 1) and (GoldPlunderCount >= 1) then
			Events.GameplayAlertMessage("You have generated " .. GABonusCount .. " [ICON_GOLDEN_AGE] Golden Age Points and plundered " .. GoldPlunderCount .. " [ICON_GOLD] Gold from foreign Cargo Ships!");
		end
	end
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then

		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
		
			-- Other Notifications
			NotChampaGA(pPlayer, iPlayer)

		elseif (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
			
			local pcCity = pPlayer:GetCapitalCity();
			if pcCity:IsHasBuilding(bPlusGoldenAgeDummy) then
				pcCity:SetNumRealBuilding(bPlusGoldenAgeDummy, 0);
			end
			if pcCity:IsHasBuilding(bPlusBlockGoldDummy) then
				pcCity:SetNumRealBuilding(bPlusBlockGoldDummy, 0);
			end

			-- Cargo Ship Functions
			CargoShipBonus(iPlayer, pPlayer, pcCity)
				
			for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
				local mPlayer = Players[mPlayer];
				if mPlayer ~= pPlayer then
					if (mPlayer:IsAlive()) then			
						local mTeam = mPlayer:GetTeam();
						if Teams[mTeam]:IsAtWar(pTeam) then
							local mcCity = mPlayer:GetCapitalCity();

							local BlockadeCount = GetChamBlockades(pPlayer, mPlayer, mcCity);

							local mGPT = (mPlayer:CalculateGoldRate());
							local GPTBonus = 0;
							if mGPT >= 1 then
								GPTBonus = (mGPT / 10); -- Get 10% GPT
							end
							local PirateGPT = 0;
							if BlockadeCount >= 6 then  
								PirateGPT = (GPTBonus * 8); -- Cap at 80% 
							elseif BlockadeCount <= 5 then
								PirateGPT = (GPTBonus * ((BlockadeCount * 1) + 2)); -- Steal 20% GPT, +10% per Blockade
							end
							local mReserves = (mPlayer:GetGold());
							local ReservesPirate = (((2 + (BlockadeCount * 1)) * mReserves) / 100); -- Steal 2% Gold Reserves, +1% per Blockade						
							local aiReservesPirate = ((1 * mReserves) / 100);
							local PirateCount = math.ceil((PirateGPT + ReservesPirate)); -- Total

							--
							--
							local pTotal = PirateCount;
							local mEraCount = (Teams[mTeam]:GetCurrentEra());
							if mEraCount == 0 then
								PirateCount = math.ceil(pTotal / 2);
							end
							if mEraCount == 1 then
								PirateCount = math.ceil(2 * (pTotal / 3));
							end
							if BlockadeCount == 0 then			
								if PirateCount >= 22 then
									PirateCount = 22;
								end
							elseif BlockadeCount == 1 then
								if PirateCount >= 33 then
									PirateCount = 33;
								end
							elseif BlockadeCount == 2 then
								if PirateCount >= 44 then
									PirateCount = 44;
								end
							elseif BlockadeCount == 3 then
								if PirateCount >= 55 then
									PirateCount = 55;
								end
							elseif BlockadeCount >= 4 then
								if PirateCount >= 66 then
									PirateCount = 66;
								end
							end
							--
							--

							-- Pirate Notifications
							SouthSeaNotifications(pPlayer, mPlayer, PirateCount, BlockadeCount, mcCity)

							mPlayer:ChangeGold(-PirateCount);
							pPlayer:ChangeGold(PirateCount);

							if pcCity:IsHasBuilding(bPlusTotalDummy) then
								pcCity:SetNumRealBuilding(bPlusTotalDummy, 0);
							end
							local ChampaTotal = pcCity:GetNumBuilding(bPlusTotalDummy);													
							pcCity:SetNumRealBuilding(bPlusTotalDummy, ChampaTotal + PirateCount);

							local mcCity = mPlayer:GetCapitalCity();
							local mGoldUATotal = mcCity:GetNumBuilding(bPlusTotalDummy);													
							mcCity:SetNumRealBuilding(bPlusTotalDummy, mGoldUATotal + PirateCount);

							-- AI Handicap (No Penalty to Human)
							local aiPirateBonus = math.ceil(((GPTBonus * 1) + aiReservesPirate));
							if not (pPlayer:IsHuman()) and (Teams[mTeam]:GetCurrentEra() >= eInd) then
								pPlayer:ChangeGold(aiPirateBonus);
							end

						end
					end
				end
			end
			
		end
	end
end)

function CargoShipBonus(iPlayer, pPlayer, pcCity)
	for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local mPlayer = Players[mPlayer];
		if (mPlayer:IsAlive()) then
			for mUnit in mPlayer:Units() do			
				if mUnit:GetUnitType() == uCargo then
					local uPlot = mUnit:GetPlot()

					-- Steal Gold Function
					CargoShipStealGold(iPlayer, pPlayer, mPlayer, mUnit, uPlot, pcCity)

					local plotX = uPlot:GetX();
					local plotY = uPlot:GetY();
					local iRange = 2;
					for iDX = -iRange, iRange do
						for iDY = -iRange, iRange do
							local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
							if pTargetPlot then
								if pTargetPlot:GetImprovementType() == sWell then
									local nPlayer = Players[mUnit:GetOwner()];		
									
									-- Champa	
									if (nPlayer:IsAlive()) then
										if (nPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
											if not pPlayer:IsGoldenAge() then
												
												pPlayer:ChangeGoldenAgeProgressMeter(1); -- 1 Default

												local GABonusCount = pcCity:GetNumBuilding(bPlusGoldenAgeDummy);													
												pcCity:SetNumRealBuilding(bPlusGoldenAgeDummy, GABonusCount + 1);
												
												if (pTargetPlot:GetOwner() == -1) and (pPlayer:IsHuman()) then		

													pPlayer:ChangeGoldenAgeProgressMeter(1); -- 2 Neutral Territory

													local GABonusCountTwo = pcCity:GetNumBuilding(bPlusGoldenAgeDummy);													
													pcCity:SetNumRealBuilding(bPlusGoldenAgeDummy, GABonusCountTwo + 1);

												end

												-- AI Handicap
												if not (pPlayer:IsHuman()) then								
													pPlayer:ChangeGoldenAgeProgressMeter(1);
												end

											end
										end
									end

									-- Not Champa
									if pTargetPlot:GetOwner() ~= -1 then							
										local sPlayer = Players[pTargetPlot:GetOwner()];
										if (sPlayer:IsAlive()) then
											if (sPlayer ~= nPlayer) and (sPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CHAMPA_MOD) then
												if not sPlayer:IsGoldenAge() then
													sPlayer:ChangeGoldenAgeProgressMeter(1);									
													
													local scCity = sPlayer:GetCapitalCity();												
													local GABonusCount = scCity:GetNumBuilding(bPlusGoldenAgeDummy);													
													scCity:SetNumRealBuilding(bPlusGoldenAgeDummy, GABonusCount + 1);
																																																									
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
	end

	ChampaCargoPlunder(pPlayer, iPlayer, pcCity)

end

function CargoShipStealGold(iPlayer, pPlayer, mPlayer, mUnit, uPlot, pcCity)
	local tradecheck = 0;
	local tradedata = pPlayer:GetTradeRoutesToYou();
	for i,v in ipairs(tradedata) do
		if v.FromCity:GetOwner() ~= iPlayer then
			fPlayer = Players[v.FromCity:GetOwner()];
			if fPlayer == mPlayer then
				tradecheck = 1;
				break
			end
		end
	end
	if (mPlayer ~= pPlayer) and (tradecheck == 0) and not mPlayer:IsMinorCiv() then
		if uPlot:GetOwner() ~= -1 then
			if (Players[uPlot:GetOwner()] == pPlayer) then

				local mTeam = mPlayer:GetTeam();
				local EraCount = ((Teams[mTeam]:GetCurrentEra()) + 3);

				mPlayer:ChangeGold(-EraCount);
				pPlayer:ChangeGold(EraCount);

				local GoldPlunderCount = pcCity:GetNumBuilding(bPlusBlockGoldDummy);													
				pcCity:SetNumRealBuilding(bPlusBlockGoldDummy, GoldPlunderCount + EraCount);

				-- Not Champa

				--if (ChamNotifications == true) then
				--	local title = "Unfriendly Waters";
				--	local descr = "Your Cargo Ship lost " .. LostCount .. " [ICON_GOLD] Gold to Cham Pirates! Establish a [ICON_TURNS_REMAINING] Trade Route to Champa to avoid piracy in Cham waters.";
				--	mPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, uPlot:GetX(), uPlot:GetY(), bPlusTotalDummy, -1);
				--end

				local mcCity = mPlayer:GetCapitalCity();
				local mGoldPlunderCount = mcCity:GetNumBuilding(bPlusBlockGoldDummy);													
				mcCity:SetNumRealBuilding(bPlusBlockGoldDummy, mGoldPlunderCount + EraCount);
				
				-- AI Handicap (No Penalty to Human)
				if not (pPlayer:IsHuman()) then	
					pPlayer:ChangeGold(1);
				end

			end
		end
	end
end