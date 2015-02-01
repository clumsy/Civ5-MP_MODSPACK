-- AyyubidUA
-- Author: Sukritact

function AyyubidUA (iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local plot = Map.GetPlot(iX, iY)
	local cCity = plot:GetPlotCity()
	local iNewOwner = cCity:GetOwner();
	local pPlayer = Players[iNewOwner]
	print( tostring(pPlayer:GetCivilizationType()) );
	print( tostring(GameInfoTypes["CIVILIZATION_MC_AYYUBIDS"] ) );
	if ( pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_AYYUBIDS"] ) then
		print (cCity:GetName() .. " Captured")
		local iNewReligion = pPlayer:GetReligionCreatedByPlayer()
		if iNewReligion <= 0 then
			print(Game.GetReligionName(iNewReligion) .. "Not Religion")
			return
		else
			for religion in GameInfo.Religions() do
				cCity:ConvertPercentFollowers(iNewReligion, religion.ID, 50)
				print (Game.GetReligionName(religion.ID) .. " converted to " .. Game.GetReligionName(iNewReligion))
			end
		end
	else
	print("Player " .. tostring(iPlayer) .. " are not the Ayyubids");
	end
end
