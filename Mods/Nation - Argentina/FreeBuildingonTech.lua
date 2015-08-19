-- FreeBuildingonTech
-- Author: Leugi
-- DateCreated: 8/7/2013 1:35:40 PM
--------------------------------------------------------------

print("The Free Building on Tech for Argentina Lua loaded succesfully")

local iBuildingArg = GameInfoTypes.BUILDING_ARGENTINA
local iBuildingPrereq = GameInfo.Technologies["TECH_CIVIL_SERVICE"].ID
local iCivArgentina = GameInfoTypes.CIVILIZATION_ARGENTINA

function GiftBuildingArg(iPlayer)
	for _, pPlayer in pairs(Players) do
	local teamID = pPlayer:GetTeam();
	local pTeam = Teams[teamID];
	if (pPlayer:IsAlive()) then
		 if (pPlayer:GetCivilizationType() == iCivArgentina) then
			if (pTeam:IsHasTech(iBuildingPrereq)) then
				for pCity in pPlayer:Cities() do
					pCity:SetNumRealBuilding(iBuildingArg, 1)
				end
			end
		end
	end
	end
end
					



GameEvents.PlayerDoTurn.Add(GiftBuildingArg);
GameEvents.PlayerCityFounded.Add(GiftBuildingArg);