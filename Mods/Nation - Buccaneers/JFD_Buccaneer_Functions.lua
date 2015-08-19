-- JFD_Buccaneer_Functions
-- Author: JFD
-- DateCreated: 3/29/2014 10:52:59 PM
 --==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_InitPirates
----------------------------------------------------------------------------------------------------------------------------	
function JFD_InitPirates(player)
	for iPlayer=0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local player = Players[iPlayer]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BUCCANEER"] and player:IsAlive() then
			if not player:HasPolicy(GameInfoTypes["POLICY_JFD_BUCCANEER_GOLD_FROM_KILLS"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_JFD_BUCCANEER_GOLD_FROM_KILLS"], true)	
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_InitPirates)
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_GoldFromCityCapture
----------------------------------------------------------------------------------------------------------------------------	
function JFD_GoldFromCityCapture(oldOwnerID, bIsCapital, iCityX, iCityY, newOwnerID, iPop, bConquest)
	local player = Players[newOwnerID]
	local capturedPlayer = Players[oldOwnerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BUCCANEER"] and player:IsAlive() then
		local city = Map.GetPlot(iCityX, iCityY):GetPlotCity()
		if player ~= capturedPlayer then
			local goldPillaged = math.floor(city:GetBaseYieldRate(GameInfoTypes["YIELD_GOLD"]) * 50 / 100) + 50
			player:ChangeGold(goldPillaged)
			if player:IsHuman() then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_BUCCANEER_PILLAGE_CITY_ALERT", goldPillaged)
				Events.GameplayAlertMessage(alertmessage)
			end
		end 
	end
end
GameEvents.CityCaptureComplete.Add(JFD_GoldFromCityCapture)
--==========================================================================================================================
--==========================================================================================================================
