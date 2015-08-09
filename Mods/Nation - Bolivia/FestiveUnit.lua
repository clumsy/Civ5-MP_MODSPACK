-- FestiveUnit
--------------------------------------------------------------
print ("This is the 'We Love the King Day - Musician' mod script.")
local iComparsaID = GameInfo.Units.UNIT_COMPARSA_FOLKLORICA.ID

local iBuildingWLTKD = GameInfoTypes.BUILDING_BOLIVIAN_BONUS

local promoFestive = GameInfoTypes.PROMOTION_FESTIVE;


SpeedVar = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent / 100)

function GrantFestivePromotion(iPlayer, iUnit)
	local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
		 if pPlayer:GetUnitByID(iUnit) ~= nil then
			pUnit = pPlayer:GetUnitByID(iUnit);
            if (pUnit:GetUnitType() == iComparsaID) then
				pUnit:SetHasPromotion(promoFestive, true);
			end
		end
	end
end

Events.SerialEventUnitCreated.Add(GrantFestivePromotion)



function StartWLTKD(iPlayer, iUnitID, iX, iY)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		local pUnit = pPlayer:GetUnitByID(iUnitID);
		
			local uPlot = pUnit:GetPlot();
			if uPlot ~= nil then
				if uPlot:IsCity() then
					if ( uPlot:GetOwner() == pUnit:GetOwner()) then
						if (pUnit:IsHasPromotion(promoFestive)) then
							local pCity = uPlot:GetPlotCity();

							if (pCity:GetWeLoveTheKingDayCounter() > 0) then
								local iWLTKD = 10 * SpeedVar
								pCity:ChangeWeLoveTheKingDayCounter(iWLTKD);
							else
								local iWLTKD = 10 * SpeedVar
								pCity:SetWeLoveTheKingDayCounter(iWLTKD);
							end
							if (Players[iPlayer]:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BOLIVIA"]) then
								pCity:SetNumRealBuilding(iBuildingWLTKD, 1)
							end
							title =  Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ENTRADA");
							local notiUnit = GameInfo.Units["UNIT_COMPARSA_FOLKLORICA"].ID;
							iCityName = Locale.ConvertTextKey(pCity:GetName());
							iUnitName = pUnit:GetNameNoDesc();
							descr =  Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ENTRADA_DESC", iCityName, iUnitName);
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pX, pY, notiUnit, notiUnit);
							if (pPlayer:IsHuman()) then
								local alert = Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_ENTRADA_DESC", iCityName, iUnitName);
								Events.GameplayAlertMessage(alert)
								for iNames in GameInfo.Unit_UniqueNames() do
									if (iNames.UniqueName == iUnitName) then
										GWType = iNames.GreatWorkType
									end
								end
								for iGreatWorks in GameInfo.GreatWorks() do
									if (iGreatWorks.Type == GWType) then
										GWSound = iGreatWorks.Audio
									end
								end
								Events.AudioPlay2DSound("" .. GWSound .. "")
							end
							GameEvents.UnitSetXY.Remove(StartWLTKD)
							pUnit:Kill(true, -1);
							GameEvents.UnitSetXY.Add(StartWLTKD)
						end
					end
				end
			end
		
	end
end



GameEvents.UnitSetXY.Add(StartWLTKD)





function WeLoveTheKingDayBONUS(pPlayer, pUnit, uCity)
	for _, pPlayer in pairs(Players) do
		local teamID = pPlayer:GetTeam();
		local pTeam = Teams[teamID];
		if (pPlayer:IsAlive()) then
			 if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BOLIVIA) then
				for pCity in pPlayer:Cities() do
					if (pCity:GetWeLoveTheKingDayCounter() > 0) then
						pCity:SetNumRealBuilding(iBuildingWLTKD, 1)
					else
						pCity:SetNumRealBuilding(iBuildingWLTKD, 0)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(WeLoveTheKingDayBONUS)




local HappinessPromotion = GameInfo.UnitPromotions["PROMOTION_SUBORDINATIONCONSTANCE"].ID
local ColoradoBaseCombat = 34

function HappyCombat(iPlayer)
	for _, pPlayer in pairs(Players) do
		if (pPlayer:IsAlive()) then
	
				for pUnit in pPlayer:Units() do
					if (pUnit:IsHasPromotion(HappinessPromotion)) then
						local iHappy = pPlayer:GetHappiness()
						if iHappy > 0 then
							local combatboost = (35)
							pUnit:SetBaseCombatStrength(combatboost)
						else	
							local combatboost = (34)
							pUnit:SetBaseCombatStrength(combatboost)
						end	
					end
				end
		
		end
	end
end

GameEvents.PlayerDoTurn.Add(HappyCombat);







---- Dummy Building Cleanup

local iBuildingBonus1 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_1
local iBuildingBonus2 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_2
local iBuildingBonus4 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_4
local iBuildingBonus0 = GameInfoTypes.BUILDING_BOLIVIAN
function BolDummyCleanUp(pPlayer, pUnit, uCity)
	for _, pPlayer in pairs(Players) do
		local teamID = pPlayer:GetTeam();
		local pTeam = Teams[teamID];
		if (pPlayer:IsAlive()) then
			 if not (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BOLIVIA) then
				for pCity in pPlayer:Cities() do
					pCity:SetNumRealBuilding(iBuildingWLTKD, 0)
					pCity:SetNumRealBuilding(iBuildingBonus1, 0)
					pCity:SetNumRealBuilding(iBuildingBonus2, 0)
					pCity:SetNumRealBuilding(iBuildingBonus4, 0)
					pCity:SetNumRealBuilding(iBuildingBonus0, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(BolDummyCleanUp)
