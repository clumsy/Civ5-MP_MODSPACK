-- Conscription Script, by Leugi


local LandInfantry = { 
	GameInfo.Units.UNIT_MECHANIZED_INFANTRY.ID, 
	GameInfo.Units.UNIT_INFANTRY.ID, 
	GameInfo.Units.UNIT_GREAT_WAR_INFANTRY.ID, 
	GameInfo.Units.UNIT_RIFLEMAN.ID, 
	GameInfo.Units.UNIT_MARATHA_SEPOY.ID, 
	GameInfo.Units.UNIT_PIKEMAN.ID, 
	GameInfo.Units.UNIT_SPEARMAN.ID, 
	GameInfo.Units.UNIT_WARRIOR.ID
	}



local iConscriptionID = GameInfo.Units.UNIT_CONSCRIPTION.ID


function ConscriptionOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
       -- if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
				pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iConscriptionID) then
                    local uPlot = pUnit:GetPlot();
					if (uPlot:IsCity()) then
						local uCity = uPlot:GetPlotCity();
						NumCitizens = uCity:GetPopulation();
						if NumCitizens > 2 then
							for _, iUnit in pairs(LandInfantry) do
								if uCity:CanTrain(iUnit) then
									local newUnit = pPlayer:InitUnit(iUnit, pUnit:GetX(), pUnit:GetY())
									newUnit:Convert(pUnit);
									break
								end
							end
							NumCitizens = NumCitizens - 2;
							uCity:SetPopulation(NumCitizens, true);
						else
							local cost = uCity:GetUnitPurchaseCost(iConscriptionID);
							pUnit:Kill();
							local title =  Locale.ConvertTextKey("TXT_KEY_NOCONSCRIPTION_NOTIFICATION_TITLE");
							local descr =  Locale.ConvertTextKey("TXT_KEY_NOCONSCRIPTION_NOTIFICATION");
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, uCity:GetX(), uCity:GetY());
							pPlayer:ChangeGold (cost);
						end
					end
                end
            end
        --end
    end
end

Events.SerialEventUnitCreated.Add(ConscriptionOverride)