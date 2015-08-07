-- MishkehFeastScript
-- Author: Leugi
-- DateCreated: 8/31/2014 10:56:48 PM
--------------------------------------------------------------

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "PhilstineFeasts";
print ("Philistine UA Scripts Working!")

local iCivPhilistine = GameInfoTypes.CIVILIZATION_LEUGI_PHILISTINE
local notiUnit = GameInfo.Units["UNIT_NOTIFICATION_MISHKEH_FEAST"].ID;


SpeedGold = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldPercent / 100)
SpeedFaith = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].FaithPercent / 100)


function GrantMishkehFeast(pPlayer, ResourceDesc, pX, pY)
	print ("Mishkeh Feast!")
	title =  Locale.ConvertTextKey("TXT_KEY_FEAST_NOTIFICATION_TITLE");
	if (pPlayer:GetCurrentEra() == 0) or (pPlayer:GetCurrentEra() == 1)  then
		iGold = 50
		iFaith = 20
	elseif (pPlayer:GetCurrentEra() == 2) or (pPlayer:GetCurrentEra() == 3) then
		iGold = 100
		iFaith = 40
	elseif (pPlayer:GetCurrentEra() == 4) or (pPlayer:GetCurrentEra() == 5) then
		iGold = 150
		iFaith = 60
	else
		iGold = 200
		iFaith = 80
	end
	iGold = iGold * SpeedGold
	iFaith = iFaith * SpeedFaith
	i = 0
	for pCity in pPlayer:Cities() do
		if i < 6 then
			if not pCity:IsRazing() then
				i = i + 1
			end
		end
	end
	fGold = iGold * i
	fFaith = iFaith * i
	if i == 1 then
		if ResourceDesc == nil then
			descr =  Locale.ConvertTextKey("TXT_KEY_FEAST_CONQUEST_SINGLECITY_NOTIFICATION", iGold, iFaith);
		else
			descr =  Locale.ConvertTextKey("TXT_KEY_FEAST_RESOURCE_SINGLECITY_NOTIFICATION", ResourceDesc, iGold, iFaith);
		end
	else
		if ResourceDesc == nil then
			descr =  Locale.ConvertTextKey("TXT_KEY_FEAST_CONQUEST_NOTIFICATION", i, iGold, iFaith);
		else
			descr =  Locale.ConvertTextKey("TXT_KEY_FEAST_RESOURCE_NOTIFICATION", ResourceDesc, i, iGold, iFaith);
		end
	end
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pX, pY, notiUnit, notiUnit);
	pPlayer:ChangeGold(fGold)
	pPlayer:ChangeFaith(fFaith)
end

function OnCityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
  --print("A city has been acquired by someone ...")
	local pNewOwner = Players[iNewOwner]
	local plotCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
	pCity = plotCity:GetID()
	if (pNewOwner:GetCivilizationType() == iCivPhilistine) then
	
			WasCapturedBefore = load ( pPlayer, "PhilistineCapture" .. iCityX .. iCityY .. "")
			if (WasCapturedBefore ~= true) or (pCity:GetOriginalOwner() ~= pPlayer) then
				local ResourceDesc = nil
				save ( pPlayer, "PhilistineCapture" .. iCityX .. iCityY .. "", true)
				GrantMishkehFeast( pNewOwner, ResourceDesc, iCityX, iCityY )
			end	
		end

end

function ResourceCheck(iPlayer)
	local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
		 if (pPlayer:GetCivilizationType() == iCivPhilistine) then
			for pResource in GameInfo.Resources() do
				local ResourceType = pResource.Type
				--print ("Checking Resource: " .. ResourceType .. "")
				if (pResource.Happiness ~= 0) then
					--print ("Checking Luxury!")
					iNumTotal = pPlayer:GetNumResourceTotal(GameInfoTypes["" .. ResourceType .. ""], true);
					--print ("iNumTotal")
					iResourceCheck = load ( pPlayer, "PhilistineHasResource:" .. ResourceType .. "bool")
					if (iNumTotal > 0) then
						if (iResourceCheck ~= true) then
							save( pPlayer, "PhilistineHasResource:" .. ResourceType .. "bool", true)
							local ResourceDesc = pResource.Description
							local isResourceFest = true
							for pCity in pPlayer:Cities() do
								if (pCity:IsCapital()) then
									pX = pCity:GetX()
									pY = pCity:GetY()
								end
							end
							GrantMishkehFeast( pPlayer, ResourceDesc, pX, pY )
						end
					end
				end
			end
		 end
	end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)
GameEvents.PlayerDoTurn.Add(ResourceCheck)