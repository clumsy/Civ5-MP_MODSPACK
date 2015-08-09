-- SecondPantheonBelief
-- Author: leugi
-- DateCreated: 7/23/2013 11:17:26 AM
--------------------------------------------------------------

print ("This is the Comparsa from Religions")

local GMunit = GameInfo.Units{Type="UNIT_COMPARSA_FOLKLORICA"}().ID;
local GMspecialist = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID;
local GMBonus = 100;


local iBuildingBonus1 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_1
local iBuildingBonus2 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_2
local iBuildingBonus4 = GameInfoTypes.BUILDING_BOLIVIAN_GM_POINTS_4

function BolivianReligions(iPlayer, iCurrentTurn)
	local pPlayer = Players[iPlayer];
	for pCity in pPlayer:Cities() do
		nBolReligions = 0
		for pReligion in GameInfo.Religions() do
				iReligionID = pReligion.ID;
				if (iReligionID > 0 and pCity:GetNumFollowers(iReligionID) > 0) then
					--pCity:ChangeSpecialistGreatPersonProgressTimes100(GMspecialist, GMBonus)
					nBolReligions = nBolReligions + 1
				end
		
		end
		if nBolReligions == 0 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 0)
			pCity:SetNumRealBuilding(iBuildingBonus2, 0)
			pCity:SetNumRealBuilding(iBuildingBonus4, 0)
			print (nBolReligions)
		elseif nBolReligions == 1 then 
			pCity:SetNumRealBuilding(iBuildingBonus1, 1)
			pCity:SetNumRealBuilding(iBuildingBonus2, 0)
			pCity:SetNumRealBuilding(iBuildingBonus4, 0)
			print (nBolReligions)
		elseif nBolReligions == 2 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 0)
			pCity:SetNumRealBuilding(iBuildingBonus2, 1)
			pCity:SetNumRealBuilding(iBuildingBonus4, 0)
			print (nBolReligions)
		elseif nBolReligions == 3 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 1)
			pCity:SetNumRealBuilding(iBuildingBonus2, 1)
			pCity:SetNumRealBuilding(iBuildingBonus4, 0)
			print (nBolReligions)
		elseif nBolReligions == 4 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 0)
			pCity:SetNumRealBuilding(iBuildingBonus2, 0)
			pCity:SetNumRealBuilding(iBuildingBonus4, 1)
			print (nBolReligions)
		elseif nBolReligions == 5 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 1)
			pCity:SetNumRealBuilding(iBuildingBonus2, 0)
			pCity:SetNumRealBuilding(iBuildingBonus4, 1)
			print (nBolReligions)
		elseif nBolReligions == 6 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 0)
			pCity:SetNumRealBuilding(iBuildingBonus2, 1)
			pCity:SetNumRealBuilding(iBuildingBonus4, 1)
			print (nBolReligions)
		elseif nBolReligions == 7 then
			pCity:SetNumRealBuilding(iBuildingBonus1, 1)
			pCity:SetNumRealBuilding(iBuildingBonus2, 1)
			pCity:SetNumRealBuilding(iBuildingBonus4, 1)
			print (nBolReligions)
		end
	end
	
end

function BolivianFolkloreScript(iPlayer)
	local iCurrentTurn = Game.GetGameTurn()
	if (Players[iPlayer]:IsAlive()) then
		if (Players[iPlayer]:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BOLIVIA"]) then
			BolivianReligions(iPlayer, iCurrentTurn)
		end
	end
end
GameEvents.PlayerDoTurn.Add(BolivianFolkloreScript)
--