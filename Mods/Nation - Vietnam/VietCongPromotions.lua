-- Author: LastSword
--------------------------------------------------------------
print("This is the 'Forest Ambusher' promotion  mod script.")

GameEvents.UnitSetXY.Add(function(player, unit, x, y)
local cUnit = Players[player]:GetUnitByID(unit);
	if cUnit:IsHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_GUERILLA ) then
		if Map.GetPlot(x,y) ~= nil then
			local cPlot = Map.GetPlot(x,y);
			if cPlot:GetFeatureType() == GameInfoTypes.FEATURE_FOREST then
				if not cUnit:IsHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ) then
					cUnit:SetHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ,true);
				end
			elseif cPlot:GetFeatureType() == GameInfoTypes.FEATURE_JUNGLE then
				if not cUnit:IsHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ) then
					cUnit:SetHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ,true);
				end
			else
				if cUnit:IsHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ) then
					cUnit:SetHasPromotion( GameInfoTypes.PROMOTION_VIETCONG_INVISIBLE ,false);
				end
			end
		end
	end
end)