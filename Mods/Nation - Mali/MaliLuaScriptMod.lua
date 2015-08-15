-- Mali Lua Script Mod
-- Author: Tomatekh
--------------------------------------------------------------

print("Mali Lua Sripts")

-- Faith from Trade Routes

local bHAJJ = GameInfoTypes.BUILDING_MALI_MOD_DUMMY_BUILDING_1

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then
			for pCity in pPlayer:Cities() do
				if (pCity:GetNumBuilding(bHAJJ) > 0) then
					pCity:SetNumRealBuilding(bHAJJ, 0);
				end
				if (not pCity:IsCapital() and pPlayer:IsCapitalConnectedToCity(pCity) and not pCity:IsBlockaded()) then
					pCity:SetNumRealBuilding(bHAJJ, 1);
				end
			end
		end
	end
end) 

-- Hajj Gold

local speed = Game.GetGameSpeedType();
local pHCS = GameInfoTypes.PROMOTION_MALI_HOLY_CITY_BONUS;
local uPROPHET = GameInfoTypes.UNITCLASS_PROPHET;
--local cPIETY = GameInfoTypes.POLICY_PIETY_FINISHER;
local cPIETY = GameInfoTypes.POLICY_ENTREPRENEURSHIP;

function HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
	adjPlayer:ChangeGold (pGold);
	adjUnit:SetHasPromotion(pHCS,true);
	local descr = "Your " .. Locale.ConvertTextKey(adjUnit:GetName()) .. " has completed their pilgrimage. Their piety has rewarded you " .. pGold .. " [ICON_GOLD] Gold.";
	adjPlayer:AddNotification(NotificationTypes.NOTIFICATION_RELIGION_SPREAD_NATURAL, descr, title, nPlot:GetX(), nPlot:GetY());--, HajjBuildingID, -1);
end

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then
				local iReligionID;
				for pReligion in GameInfo.Religions() do
					iReligionID = pReligion.ID;
					for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
						local tPlayer = Players[iPlayer];
						for pCity in tPlayer:Cities() do
							if (pCity:IsHolyCityForReligion(iReligionID)) then
								local cPlot = pCity:Plot()
								local direction_types = {
									DirectionTypes.DIRECTION_NORTHEAST,
									DirectionTypes.DIRECTION_EAST,
									DirectionTypes.DIRECTION_SOUTHEAST,
									DirectionTypes.DIRECTION_SOUTHWEST,
									DirectionTypes.DIRECTION_WEST,
									DirectionTypes.DIRECTION_NORTHWEST
								}
								for loop, direction in ipairs(direction_types) do
									local adjPlot = Map.PlotDirection( cPlot:GetX(), cPlot:GetY(), direction);
									if ( adjPlot ~= nil ) then
										if adjPlot:IsUnit() then
											local adjUnit = adjPlot:GetUnit(i);
											local adjPlayer = Players[adjUnit:GetOwner()];
											if (adjPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then
												if (adjUnit:GetUnitClassType() == uPROPHET) then
													if not adjUnit:IsHasPromotion(pHCS) then
														if (adjUnit:GetOwner() ~= pCity:GetOwner()) then
															local hPlayer = Players[pCity:GetOwner()];
															local hTeam = hPlayer:GetTeam();
															local aTeam = adjPlayer:GetTeam();
															if not Teams[aTeam]:IsAtWar(hTeam) then
																local title = "Royal Hajj";
																local nPlot = adjUnit:GetPlot()
																if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
																	if not pPlayer:HasPolicy(cPIETY) then
																		local pGold = (100 + ((Teams[aTeam]:GetCurrentEra()) * 33));
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	elseif pPlayer:HasPolicy(cPIETY) then
																		local pGold = (200 + ((Teams[aTeam]:GetCurrentEra()) * 66))
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	end
																elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
																	if not pPlayer:HasPolicy(cPIETY) then
																		local pGold = (150 + ((Teams[aTeam]:GetCurrentEra()) * 50));
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	elseif pPlayer:HasPolicy(cPIETY) then
																		local pGold = (300 + ((Teams[aTeam]:GetCurrentEra()) * 100))
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	end
																elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
																	if not pPlayer:HasPolicy(cPIETY) then
																		local pGold = (225 + ((Teams[aTeam]:GetCurrentEra()) * 75));
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	elseif pPlayer:HasPolicy(cPIETY) then
																		local pGold = (450 + ((Teams[aTeam]:GetCurrentEra()) * 150))
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	end
																elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
																	if not pPlayer:HasPolicy(cPIETY) then
																		local pGold = (450 + ((Teams[aTeam]:GetCurrentEra()) * 150));
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	elseif pPlayer:HasPolicy(cPIETY) then
																		local pGold = (900 + ((Teams[aTeam]:GetCurrentEra()) * 300))
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	end
																else
																	if not pPlayer:HasPolicy(cPIETY) then
																		local pGold = (450 + ((Teams[aTeam]:GetCurrentEra()) * 150));
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
																	elseif pPlayer:HasPolicy(cPIETY) then
																		local pGold = (900 + ((Teams[aTeam]:GetCurrentEra()) * 300))
																		HajjGold(title, nPlot, pGold, adjPlayer, adjUnit)
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
					end
				end
			end
		end
	end
end)

-- Golden Age from Treasury

local bMINT = GameInfoTypes.BUILDINGCLASS_MINT;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
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
				local cMint = pPlayer:GetBuildingClassCount(bMINT);
				local ReserveGold = pPlayer:GetGold();
				if ReserveGold >= (GAThreshold) and ReserveGold < (GAThreshold * 2) then	
					local GAPoints = (1 * cMint);
					pPlayer:ChangeGoldenAgeProgressMeter(GAPoints);
				elseif ReserveGold >= (GAThreshold * 2) and ReserveGold < (GAThreshold * 4) then
					local GAPoints = (2 * cMint);
					pPlayer:ChangeGoldenAgeProgressMeter(GAPoints);
				elseif ReserveGold >= (GAThreshold * 4) then
					local GAPoints = (3 * cMint);
					pPlayer:ChangeGoldenAgeProgressMeter(GAPoints);
				end
			end
		end
	end
end)

-- AI Bonus

local eClass = GameInfoTypes.ERA_CLASSICAL;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then
			if not (pPlayer:IsHuman()) then
				if (Teams[pTeam]:GetCurrentEra() >= eClass) then
					for pUnit in pPlayer:Units() do
						if (pUnit:GetUnitClassType() == uPROPHET) then
							if not pUnit:IsHasPromotion(pHCS) then
								if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
									if not pPlayer:HasPolicy(cPIETY) then
										local pGold = (100 + ((Teams[pTeam]:GetCurrentEra()) * 33));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);							
									elseif pPlayer:HasPolicy(cPIETY) then
										local pGold = (200 + ((Teams[pTeam]:GetCurrentEra()) * 66));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);	
									end
								elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
									if not pPlayer:HasPolicy(cPIETY) then
										local pGold = (150 + ((Teams[pTeam]:GetCurrentEra()) * 50));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);							
									elseif pPlayer:HasPolicy(cPIETY) then
										local pGold = (300 + ((Teams[pTeam]:GetCurrentEra()) * 100));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);	
									end
								elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
									if not pPlayer:HasPolicy(cPIETY) then
										local pGold = (225 + ((Teams[pTeam]:GetCurrentEra()) * 75));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);							
									elseif pPlayer:HasPolicy(cPIETY) then
										local pGold = (450 + ((Teams[pTeam]:GetCurrentEra()) * 150));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);	
									end
								elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
									if not pPlayer:HasPolicy(cPIETY) then
										local pGold = (450 + ((Teams[pTeam]:GetCurrentEra()) * 150));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);							
									elseif pPlayer:HasPolicy(cPIETY) then
										local pGold = (900 + ((Teams[pTeam]:GetCurrentEra()) * 300));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);	
									end
								else
									if not pPlayer:HasPolicy(cPIETY) then
										local pGold = (450 + ((Teams[pTeam]:GetCurrentEra()) * 150));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);							
									elseif pPlayer:HasPolicy(cPIETY) then
										local pGold = (900 + ((Teams[pTeam]:GetCurrentEra()) * 300));
										pPlayer:ChangeGold (pGold);
										pUnit:SetHasPromotion(pHCS,true);	
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)