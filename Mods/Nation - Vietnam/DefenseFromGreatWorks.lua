-- DefenseFromGreatWorks
-- Author: LastSword
-- DateCreated: 4/30/2014 6:51:31 PM
--------------------------------------------------------------

print("Validate Vietnam Plz")

local defB = GameInfoTypes.BUILDING_VIETNAM_WATER_DEFENSE;
local LiteratureNight = GameInfoTypes.BUILDING_WATER_THEATER;
local DurID = GameInfoTypes.CIVILIZATION_VIETNAM;

--Comment: DurID is ID of your Civilization, LiteratureNight is Unique BuildingType
--defB is dummy building with 5 defense

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[iPlayer]:GetCivilizationType() == DurID then
		for dCity in Players[iPlayer]:Cities() do
			if dCity:IsHasBuilding(LiteratureNight) then
				dCity:SetNumRealBuilding(defB, dCity:GetNumGreatWorks());
			else
				dCity:SetNumRealBuilding(defB, 0);
			end
		end
	end
end)