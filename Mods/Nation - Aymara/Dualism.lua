-- Dualism
-- Author: Leugi
-- DateCreated: 9/11/2013 12:11:02 PM
--------------------------------------------------------------

--------------------------------------------------------------

print ("Dualism, code, yeah");

local iBuildingQul = GameInfoTypes.BUILDING_QULLANA_BONUS
local iBuildingQulFaith = GameInfoTypes.BUILDING_QULLANA_FAITH
local iCivQullana = GameInfoTypes.CIVILIZATION_QULLANA
local notiUnit = GameInfo.Units["UNIT_NOTIFICATION_QULLANA"].ID;
local qullanapromoID = GameInfo.UnitPromotions["PROMOTION_DUALISM"].ID;

function Dualism (iPlayer)

for _, pPlayer in pairs(Players) do
	local teamID = pPlayer:GetTeam();
	local pTeam = Teams[teamID];
	if (pPlayer:IsAlive()) then
		 if (pPlayer:GetCivilizationType() == iCivQullana) then
			local PlayerPops = pPlayer:GetNumCities();
			if (PlayerPops % 2 == 0) then
				for pCity in pPlayer:Cities() do
					if (pCity:IsCapital()) then
						for unit in pPlayer:Units() do
								if not (unit:IsHasPromotion(qullanapromoID)) then
									unit:SetHasPromotion(qullanapromoID, true);
								end
							end
						if not pCity:IsHasBuilding(iBuildingQul) then
							pCity:SetNumRealBuilding(iBuildingQul, 1)
							local title =  Locale.ConvertTextKey("TXT_KEY_QULLANA_NOTIFICATION_TITLE");
							local descr =  Locale.ConvertTextKey("TXT_KEY_QULLANA_NOTIFICATION");
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pCity:GetX(), pCity:GetY(), notiUnit, notiUnit);
							local unit
							
						end
					end
				end
			else
				for pCity in pPlayer:Cities() do
					if (pCity:IsCapital()) then
						for unit in pPlayer:Units() do
								if (unit:IsHasPromotion(qullanapromoID)) then
									unit:SetHasPromotion(qullanapromoID, false);
								end
							end
						if pCity:IsHasBuilding(iBuildingQul) then
							pCity:SetNumRealBuilding(iBuildingQul, 0)
							local title =  Locale.ConvertTextKey("TXT_KEY_NOT_QULLANA_NOTIFICATION_TITLE");
							local descr =  Locale.ConvertTextKey("TXT_KEY_NOT_QULLANA_NOTIFICATION");
							pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, pCity:GetX(), pCity:GetY(), notiUnit, notiUnit);
							
						end
					end
				end
			end
		 end
	end
end

end



GameEvents.PlayerDoTurn.Add(Dualism)
GameEvents.PlayerCityFounded.Add(Dualism)
