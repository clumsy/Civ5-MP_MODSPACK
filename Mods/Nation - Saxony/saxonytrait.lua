-- saxonytrait
-- Author: Firebug
-- DateCreated: 3/14/2015 10:39:41 AM
--------------------------------------------------------------
function DefenseFromFaithBuildings (playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SAXONY"] and player:IsAlive() then
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_SHRINE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_SHRINE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_TEMPLE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_TEMPLE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_CATHEDRAL"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_CATHEDRAL"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_MONASTERY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_MONASTERY"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_MOSQUE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_MOSQUE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_PAGODA"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_PAGODA"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_GROBER_GARDEN"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_GROBER"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_GRAND_TEMPLE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_GRAND_TEMPLE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_STONEHENGE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_STONEHENGE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_NOTRE_DAME"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_NOTRE_DAME"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_BOROBUDUR"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_BOROBUDUR"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_MOSQUE_OF_DJENNE"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_MOSQUE_OF_DJENNE"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_HAGIA_SOPHIA"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SAXONY_DEFENSE_HAGIA_SOPHIA"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(DefenseFromFaithBuildings)