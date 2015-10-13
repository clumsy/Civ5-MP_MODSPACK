-- MisionesJungleBonus
-- Author: Leugi
-- DateCreated: 2/28/2014 1:58:37 PM
--------------------------------------------------------------
local iBuildingJungle = GameInfoTypes.BUILDING_MISIONES_JUNGLEBONUS
local iBuildingNormal = GameInfoTypes.BUILDING_MISIONES


function MisionesJungleCheck (iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer:IsAlive() then
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_PARAGUAY) then
	NumJungles = 0
	for pCity in pPlayer:Cities() do
		local i;
		for i = 0, pCity:GetNumCityPlots() - 1, 1 do
			local plot = pCity:GetCityIndexPlot( i );
			if (plot ~= nil) then
				print ("Paraguayan Plot Check: " .. i)
				if ( plot:GetOwner() == pCity:GetOwner() ) then
					if plot:GetFeatureType() == FeatureTypes.FEATURE_JUNGLE then
						NumJungles = NumJungles + 1
					end
				end
			end
		end
		if NumJungles == 0 then
			if pCity:IsHasBuilding(GameInfoTypes["BUILDING_MISIONES_JUNGLEBONUS"]) then
				pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MISIONES_JUNGLEBONUS"], 0)
				pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MISIONES"], 1)
			end
		elseif NumJungles > 0 then
			if pCity:IsHasBuilding(GameInfoTypes["BUILDING_MISIONES"]) then
				pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MISIONES_JUNGLEBONUS"], 1)
				pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MISIONES"], 0)
			end
		end
		NumJungles = 0
	end

	end
	end
end
GameEvents.PlayerDoTurn.Add(MisionesJungleCheck);
GameEvents.PlayerCityFounded.Add(MisionesJungleCheck);