-- CanadianBrotherhoodScript
-- Author: John
-- DateCreated: 12/18/2013 7:26:49 PM
--------------------------------------------------------------
--Each nation checks to see if they are allied with Canada. 
--Then they get a bonus building.
--Then Canada gets a building for each allied civ.
function IsCanadaMyAlly(tPlayer)
	for i, eachPlayer in pairs(Players) do
		if eachPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
			if eachPlayer:IsDoF(tPlayer) then
				return true
			end
		end
	end
	--return false
end

function CanadianBrotherhoodOfNations(cPlayer)
	local pPlayer = Players[cPlayer]
	if pPlayer:IsEverAlive() == true and pPlayer:IsMinorCiv() == false then
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_COLONIALCANADA) and (pPlayer:IsBarbarian() == false) then
			if pPlayer:GetNumCities() > 0 then
				local CapitalCity = pPlayer:GetCapitalCity()
				print(IsCanadaMyAlly(pPlayer))
				if IsCanadaMyAlly(pPlayer) then
					if CapitalCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS) > 0 then
						print(pPlayer:GetName() .. " is already an ally of Canada!")
					elseif (CapitalCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS) == 0 or CapitalCity:GetNumBuilding(BUILDING_CANADABROTHERHOODOFNATIONS) == nil) then
						CapitalCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS, 1)
						print(pPlayer:GetName() .. " became an ally of Canada!")
					end
				else
					if CapitalCity:GetNumBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS) > 0 then
						print(pPlayer:GetName() .. " is no longer an ally of Canada")
						CapitalCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS, 0)
					end
				end
			end
		elseif Players[cPlayer]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_COLONIALCANADA then
			print("Canada detected")
			if Players[cPlayer]:GetCapitalCity() ~= nil then
				local cCity = Players[cPlayer]:GetCapitalCity()
				local canadianAllies = 0
				for i, gPlayer in pairs(Players) do
					if gPlayer:IsDoF(cPlayer) then
						canadianAllies = canadianAllies + 1
					end
				end
				print("The number of Allies Canada has is " .. canadianAllies)
				if canadianAllies > 0 then
					cCity:SetNumRealBuilding(GameInfoTypes.BUILDING_CANADABROTHERHOODOFNATIONS, canadianAllies)
				end
			else
				print("Canada has no Capital!")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CanadianBrotherhoodOfNations)