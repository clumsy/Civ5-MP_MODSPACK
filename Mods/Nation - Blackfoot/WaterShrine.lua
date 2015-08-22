-- WaterShrine: A burst of faith if a Nato-oh Siskoom is built near water!
-- Author: John
-- DateCreated: 11/6/2014 9:12:53 PM
--------------------------------------------------------------
function FindHolyWater(pCity)
	local River = false
	local LakeOrOasis = false
	local RiverMouth = false
	for pCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
		if pSpecificPlot:IsRiver() then
			River = true
			if pSpecificPlot:IsCoastalLand() then
				RiverMouth = true
			end
		elseif pSpecificPlot:IsFreshWater() then
			LakeOrOasis = true
		end
	end
	return River, LakeOrOasis, RiverMouth
end

	

function WaterShrineWorship(player, city, building)
	local pPlayer = Players[player]
	local pCity = pPlayer:GetCityByID(city)
	if building == GameInfoTypes.BUILDING_WATERSHRINE then
		local River = false
		local LakeOrOasis = false
		local RiverMouth = false
		local FaithBurst = 0
		River, LakeOrOasis, RiverMouth = FindHolyWater(pCity)
		if River then
			FaithBurst = FaithBurst + 5
		end
		if LakeOrOasis then
			FaithBurst = FaithBurst + 5
		end
		if RiverMouth then
			FaithBurst = FaithBurst + 5
		end
		if FaithBurst > 0 then
			pPlayer:ChangeFaith(FaithBurst)
			if pPlayer:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_BLACKFOOTFIRSTNATION_WATERSHRINE_NOTIFICATION", pCity:GetName(), FaithBurst))
			end
		end
	end
end

GameEvents.CityConstructed.Add(WaterShrineWorship)