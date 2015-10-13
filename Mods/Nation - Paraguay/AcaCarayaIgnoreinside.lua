-- AcaCarayaIgnoreinside
-- Author: Leugi
-- DateCreated: 2/28/2014 2:10:29 PM
--------------------------------------------------------------
local UnFriendlyPromo = GameInfoTypes.PROMOTION_CARAYA_OUT;
local FriendlyPromo = GameInfoTypes.PROMOTION_CARAYA;


function PromotiononFriendly(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			local uPlot = pUnit:GetPlot();
			if uPlot ~= nil then
			if (uPlot:GetOwner() == pUnit:GetOwner()) then
				if (pUnit:IsHasPromotion(UnFriendlyPromo)) then
					pUnit:SetHasPromotion(FriendlyPromo,true);
					pUnit:SetHasPromotion(UnFriendlyPromo,false);
				end
			else
				if (pUnit:IsHasPromotion(FriendlyPromo)) then
					pUnit:SetHasPromotion(UnFriendlyPromo,true);
					pUnit:SetHasPromotion(FriendlyPromo,false);
				end
			end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(PromotiononFriendly)
GameEvents.UnitSetXY.Add(PromotiononFriendly)