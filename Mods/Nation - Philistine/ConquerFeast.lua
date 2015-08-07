-- ConquerFeast
-- Author: Leugi
-- DateCreated: 9/2/2014 7:52:26 PM
--------------------------------------------------------------

local BasePromotion = GameInfo.UnitPromotions["PROMOTION_PHILISTINE_BREWERY"].ID
local HappyPromotion = GameInfo.UnitPromotions["PROMOTION_PHILISTINE_BREWERY_ACTIVE"].ID


function HappyConquer(iPlayer)
	for _, pPlayer in pairs(Players) do
		if (pPlayer:IsAlive()) then	
			if (pPlayer:IsEmpireUnhappy()) or (pPlayer:IsEmpireVeryUnhappy()) or (pPlayer:IsEmpireSuperUnhappy()) then
				for pUnit in pPlayer:Units() do
					if (pUnit:IsHasPromotion(HappyPromotion)) then
						pUnit:SetHasPromotion(BasePromotion,true);
						pUnit:SetHasPromotion(HappyPromotion,false);								
					end
				end
			else
				for pUnit in pPlayer:Units() do
					if (pUnit:IsHasPromotion(BasePromotion)) then
						pUnit:SetHasPromotion(BasePromotion,false);
						pUnit:SetHasPromotion(HappyPromotion,true);										
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(HappyConquer);