-- RCMPHappiness
-- Author: John
-- DateCreated: 12/17/2013 8:15:28 AM
--------------------------------------------------------------
--------------------------------------------------------------
function RCMPHappinessPower(PlayerID)
	local pPlayer = Players[PlayerID]
	local pCiv = pPlayer:GetCivilizationType()
	
	if pCiv == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
		for pCity in pPlayer:Cities() do
			print(pCity:GetName())
			--local CityX = pCity:GetX()
			--local CityY = pCity:GetY()
			local standOnGuardForThee = false
			local pPlot = pCity:Plot()
			--check each city to see if there is a Shado-Pan Monk
			for i = 0, pPlot:GetNumUnits() - 1, 1 do
				local pUnit = pPlot:GetUnit(i)
				if (pUnit ~= nil and pUnit:IsDelayedDeath() == false and pUnit:IsCargo() == false) then
					if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_ROYALCANADIANMOUNTIES) then
						--set standOnGuardForThee to YES
						standOnGuardForThee = true
						--otherwise do nothing
					end
				end
			end
			if standOnGuardForThee == true then
				if pCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADIANRCMPHAPPINESS) > 0  then
				elseif (pCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADIANRCMPHAPPINESS) == 0 or pCity:GetNumBuilding(BUILDING_CANADIANRCMPHAPPINESS) == nil) then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CANADIANRCMPHAPPINESS, 1)
				end
			elseif (standOnGuardForThee == false) or (standOnGuardForThee == nil) then
				if pCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADIANRCMPHAPPINESS) > 0  then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CANADIANRCMPHAPPINESS, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RCMPHappinessPower)