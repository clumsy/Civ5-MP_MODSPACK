print ("Harappa Check")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Harappa";

-- Check

local HarappaID = GameInfoTypes.CIVILIZATION_HARAPPA_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == HarappaID then
			include("Harappa Lua Scripts")
			break;
		end
	end
end

-- Stuff

local speed = Game.GetGameSpeedType();
local iLuxuryTrade = GameInfoTypes.IMPROVEMENT_INDUS_EXPORT;
local iRoad = GameInfoTypes.ROUTE_ROAD;
local iRailRoad = GameInfoTypes.ROUTE_RAILROAD;

local uBullockCart = GameInfoTypes.UNIT_HARAPPA_BULLOCK_CART;
local bAqueduct = GameInfoTypes.BUILDING_AQUEDUCT;
local bSewer = GameInfoTypes.BUILDING_HARAPPA_DRAIN;
local bHospital = GameInfoTypes.BUILDING_HOSPITAL;

GameEvents.CityCanConstruct.Add(
function(iPlayer, iCity, iBuilding) 
	local pPlayer = Players[iPlayer];
	local pCity = pPlayer:GetCityByID(iCity);
	local cPlot = pCity:Plot()
  	if (iBuilding == bHospital) then
		if ((pCity:IsHasBuilding(bAqueduct)) or (pCity:IsHasBuilding(bSewer))) then
			return true
		else
			return false
		end
	end
	if (iBuilding == bAqueduct) then
		if ((pCity:IsHasBuilding(bAqueduct)) or (pCity:IsHasBuilding(bSewer))) then
			return false
		else
			return true
		end
	end
	if (iBuilding == bSewer) then
		if ((pCity:IsHasBuilding(bAqueduct)) or (pCity:IsHasBuilding(bSewer))) then
			return false
		else
			return true
		end
	end
	return true
end)

-- Bullock Cart

GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(x, y);

	if pPlot ~= -1 then
		if eImprovement ~= iLuxuryTrade then

			if pPlot:IsUnit() then
				local pUnit = pPlot:GetUnit(i);
				if (pUnit:GetUnitType() == uBullockCart) then
					if (pPlot:GetResourceType() ~= -1) then
						local plotResource = pPlot:GetResourceType(); 
						if GameInfo.Resources[plotResource].Happiness > 0 then
							if (pPlot:GetImprovementType() ~= -1) then
								local plotImprovement = pPlot:GetImprovementType();
								local condition = "ImprovementType = '".. GameInfo.Improvements[plotImprovement].Type .."'";
								for row in GameInfo.Improvement_ResourceTypes(condition) do
									if (row.ResourceType == GameInfo.Resources[plotResource].Type) then	
															
										NCsaveX = pPlot:GetX()
										NCsaveY = pPlot:GetY()

										if (load(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool") ~= true) then

											local IndusGold = 0;
											if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
												IndusGold = 21;
											elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
												IndusGold = 27;
											elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
												IndusGold = 36;
											elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
												IndusGold = 57;
											else
												IndusGold = 57;
											end

											pPlayer:ChangeGold(IndusGold);

											if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
													Events.GameplayAlertMessage("Your Bullock Cart has earned " .. IndusGold .. " [ICON_GOLD] Gold from trading luxury goods!");
											end

											NCsaveX = pPlot:GetX()
											NCsaveY = pPlot:GetY()

											save(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool", true)

										else

											NCsaveX = pPlot:GetX()
											NCsaveY = pPlot:GetY()
										
											if (load(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool") == true) then

												if (eImprovement ~= iRoad) and (eImprovement ~= iRailRoad) then

													if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
														Events.GameplayAlertMessage("Your Bullock Cart has already traded luxury goods from this tile.");
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

		if eImprovement == iLuxuryTrade then

			NCsaveX = pPlot:GetX()
			NCsaveY = pPlot:GetY()

			if (load(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool") ~= true) then
		
				local pNearestCity = nil;
				local iNearestDistance = 1000000;
				local IndusGold = 0;

				for cityIndex = 0, pPlayer:GetNumCities() - 1, 1 do
					local pCity = pPlayer:GetCityByID(cityIndex);

					if (pCity ~= nil) then
						iDistance = Map.PlotDistance(pPlot:GetX(), pPlot:GetY(), pCity:GetX(), pCity:GetY());
						if (iDistance < iNearestDistance) then
							iNearestDistance = iDistance;
							pNearestCity = pCity;
						end
					end

				end

				if (pNearestCity ~= nil) then
					if (iNearestDistance <= 10) then
						if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							IndusGold = 7;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							IndusGold = 9;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							IndusGold = 12;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							IndusGold = 19;
						else
							IndusGold = 19;
						end
					elseif (iNearestDistance > 10) and (iNearestDistance <= 20) then
						if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							IndusGold = 14;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							IndusGold = 18;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							IndusGold = 24;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							IndusGold = 38;
						else
							IndusGold = 38;
						end
					elseif (iNearestDistance > 20) and (iNearestDistance <= 40) then
						if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							IndusGold = 21;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							IndusGold = 27;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							IndusGold = 36;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							IndusGold = 57;
						else
							IndusGold = 57;
						end
					elseif (iNearestDistance > 40) then
						if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							IndusGold = 28;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							IndusGold = 36;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							IndusGold = 48;
						elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							IndusGold = 74;
						else
							IndusGold = 74;
						end
					end
				end
			
				pPlayer:ChangeGold(IndusGold);

				if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
					Events.GameplayAlertMessage("Your Bullock Cart has earned " .. IndusGold .. " [ICON_GOLD] Gold from trading luxury goods!");
				end

				if not (pPlayer:IsHuman()) then
					local AIBonus = math.ceil(IndusGold / 3);
					pPlayer:ChangeGold(AIBonus);
				end

				if pPlot:GetOwner() == -1 then
				
					local PlotResource = 0;
			
					if (pPlot:GetResourceType() ~= -1) then
						PlotResource = pPlot:GetResourceType();
					end 

					for pCity in pPlayer:Cities() do
						if (pCity:GetResourceDemanded(true) ~= -1) then
							local ResourceDemanded = pCity:GetResourceDemanded();
							if PlotResource == ResourceDemanded then
								pCity:SetWeLoveTheKingDayCounter(20)

								local pResourceInfo = GameInfo.Resources[pCity:GetResourceDemanded()];
	
								local title = "" .. Locale.ConvertTextKey(pCity:GetName()) .. " loves the king!";
								local descr = "Your acquisition of " .. Locale.ConvertTextKey(pResourceInfo.Description) .. " causes the city of " .. Locale.ConvertTextKey(pCity:GetName()) .. " to enter 'We Love the King Day', giving the city a [ICON_FOOD] growth bonus!";
						
								local DummyID = GameInfo.Units["UNIT_INDUS_TRADE_DUMMY"].ID;
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), DummyID, -1);

							end
						end
					end

				end

				NCsaveX = pPlot:GetX()
				NCsaveY = pPlot:GetY()

				save(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool", true)

			else

				NCsaveX = pPlot:GetX()
				NCsaveY = pPlot:GetY()
		
				if (load(pPlayer, "HarappaTrade" .. NCsaveX .. "xy" .. NCsaveY .. "bool") == true) then
					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then
						Events.GameplayAlertMessage("Your Bullock Cart has already traded luxury goods from this tile.");
					end
				end

			end

			pPlot:SetImprovementType(-1)

		end
	end
end)