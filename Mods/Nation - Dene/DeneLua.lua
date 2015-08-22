-- Yellowknife and Holy Site script
-- Author: Neirai the Forgiven
-- DateCreated: 5/19/2014 3:25:23 PM
--------------------------------------------------------------

local PowTab = {} -- This table idea belongs to the incomparible LastSword.
PowTab[1] = GameInfoTypes.BUILDING_DENETIMER1
PowTab[2] = GameInfoTypes.BUILDING_DENETIMER2
PowTab[3] = GameInfoTypes.BUILDING_DENETIMER3
PowTab[4] = GameInfoTypes.BUILDING_DENETIMER4
PowTab[5] = GameInfoTypes.BUILDING_DENETIMER5
PowTab[6] = GameInfoTypes.BUILDING_DENETIMER6
PowTab[7] = GameInfoTypes.BUILDING_DENETIMER7
PowTab[8] = GameInfoTypes.BUILDING_DENETIMER8

local sUnitType = "UNIT_PROPHET"
local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
local iProphetOverride = GameInfo.Units.UNIT_DENEDRUMMER.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_DENEFIRSTNATION"].ID

function PowWowPlace(pPlayer, pCap)
	local PowNumber = CheckCapitalPow(pCap)
	print("We just checked PowNumber. It is " .. PowNumber)
	if PowNumber > 0 then
		for pCity in pPlayer:Cities() do
			if pCity == pCap then
				if pCity:GetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW) == 0 then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW, 1)
				end
			elseif pPlayer:IsCapitalConnectedToCity(pCity) then
				if pCity:GetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW) == 0 then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW, 1)
				end
			else
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW, 0)
			end
		end
	elseif PowNumber == 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW, 0)
		end
	end
end

function CheckCapitalPow()
	local pPlayer = Players[Game.GetActivePlayer()]
	local pCap = pPlayer:GetCapitalCity()
	for i = 1, 8 do
		if pCap:GetNumRealBuilding(PowTab[i]) > 0 then
			return i
		end
	end
	return 0
end

function PowwowDo(PlayerID)
	local pPlayer = Players[PlayerID]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_DENEFIRSTNATION then
		local pCap = pPlayer:GetCapitalCity()
		print(pCap:GetName())
		local PowNumber = CheckCapitalPow()
		print("Powwow turn number " .. PowNumber)
		print("Powwow number: " .. pCap:GetNumRealBuilding(GameInfoTypes.BUILDING_POWWOW))
		if PowNumber == 8 then
			pCap:SetNumRealBuilding(PowTab[8], 0)
			local pTitle = "The Prophet Dance has Ended."
			local pDesc = "The Prophet Dance has come to an end. Surely the dead hasten in their return to the renew the Earth."
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, pDesc, pTitle, cityX, cityY)
		elseif PowNumber > 0 then
			print("Incrementing " .. PowNumber)
			pCap:SetNumRealBuilding(PowTab[PowNumber], 0)
			PowNumber = PowNumber + 1
			pCap:SetNumRealBuilding(PowTab[PowNumber], 1)
			print("Incremented " .. PowNumber .. ". Building is " .. pCap:GetNumRealBuilding(PowTab[PowNumber]))
		end
		PowWowPlace(pPlayer, pCap)
	end
end
GameEvents.PlayerDoTurn.Add(PowwowDo)

function PowwowOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
				pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
                    local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
                    newUnit:Convert(pUnit);
					local pCap = pPlayer:GetCapitalCity()
					local PowNumber = CheckCapitalPow(pCap)
					if PowNumber > 1 then
						for i = 2, 8 do
							pCap:SetNumRealBuilding(PowTab[i], 0)
						end
					end
					pCap:SetNumRealBuilding(PowTab[1], 1)
					local pTitle = "A Prophet Dance Begun!"
					local pDesc = "The birth of a new Sacred Drummer has beckoned the beginning of a sacred Ndahotsethe ritual. Cities connected to the Capital will gain additional Happiness and increased Great Person generation for the next 8 turns."
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, pDesc, pTitle, cityX, cityY)
					PowWowPlace(pPlayer, pCap)
                end
            end
        end
    end
end
Events.SerialEventUnitCreated.Add(PowwowOverride)

local HolyTab = {} -- This table idea belongs to the incomparible LastSword.
HolyTab[4] = GameInfoTypes.BUILDING_DENETOURISMWIDGETS1;
HolyTab[3] = GameInfoTypes.BUILDING_DENETOURISMWIDGETS2;
HolyTab[2] = GameInfoTypes.BUILDING_DENETOURISMWIDGETS4;
HolyTab[1] = GameInfoTypes.BUILDING_DENETOURISMWIDGETS8;

local DrumTab = {}
DrumTab[6] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS1;
DrumTab[5] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS2;
DrumTab[4] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS4;
DrumTab[3] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS8;
DrumTab[2] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS16;
DrumTab[1] = GameInfoTypes.BUILDING_DENEFAITHWIDGETS32;

function IsCityTundraPowered(pCity)
	local pPlayer = Players[pCity:GetOwner()]
	if pCity == pPlayer:GetCapitalCity() then
		return true
	else
		for pCityPlot = 0, pCity:GetNumCityPlots() -1, 1 do
			local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
			if pSpecificPlot ~= nil then
				if pSpecificPlot:GetOwner() == pCity:GetOwner() then
					if pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
						if pCity:IsWorkingPlot(pSpecificPlot) then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

function FindDeneImprovements(PlayerID)
	local pPlayer = Players[PlayerID]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_DENEFIRSTNATION then
		for pCity in pPlayer:Cities() do
			local numIronSites = 0
			local numHolySites = 0
			local musicAmount = 0
			local faithAmount = 0
			local pTeam = Teams[pPlayer:GetTeam()]
			for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pSpecificPlot ~= nil then
					if pSpecificPlot:GetOwner() == pCity:GetOwner() then
						if pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_YELLOWKNIFE then
							if pTeam:IsHasTech(GameInfoTypes.TECH_IRON_WORKING) then
								numIronSites = numIronSites + 1
							end
							if pTeam:IsHasTech(GameInfoTypes.TECH_METAL_CASTING) then
								musicAmount = musicAmount + 1
							end
						elseif pSpecificPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_HOLY_SITE then
							if pSpecificPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
								if pCity:IsWorkingPlot(pSpecificPlot) then
									numHolySites = numHolySites + 1
								end
							end
						end
					end
				end
			end
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DENEIRONWIDGETS, numIronSites)
			print(numHolySites .. " Holy Sites found!")
			--find the Shrines and Temples, check to see if the city is on or next to Tundra
			if IsCityTundraPowered(pCity) then
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MUSICSHRINE) and pCity:GetNumGreatWorksInBuilding(GameInfoTypes.BUILDINGCLASS_SHRINE) > 0 then --Thanks, JFD!!
					faithAmount = faithAmount + 1
				end
				if pCity:IsHasBuilding(GameInfoTypes.BUILDING_MUSICTEMPLE) and pCity:GetNumGreatWorksInBuilding(GameInfoTypes.BUILDINGCLASS_TEMPLE) > 0 then
					faithAmount = faithAmount + 1
				end
			end
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DENEGWWIDGETS, faithAmount)
			for i = 1, 6 do --												This portion of the script was taken from LastSword pack IV
				if numHolySites > 0 then
					if not ( numHolySites < math.pow(2,4 - i) ) then --		LS provided it to me
						pCity:SetNumRealBuilding(HolyTab[i], 1); --			 since he is so boss
						numHolySites = numHolySites - math.pow(2,4 - i) --	and is a Lua machine
					else
						pCity:SetNumRealBuilding(HolyTab[i], 0);
					end
				else
					pCity:SetNumRealBuilding(HolyTab[i], 0);
				end --														End LS script.
			end
			for i = 1, 6 do --												This portion of the script was taken from LastSword pack IV
				if musicAmount > 0 then
					if not ( musicAmount < math.pow(2,6 - i) ) then --		LS provided it to me
						pCity:SetNumRealBuilding(DrumTab[i], 1); --			 since he is so boss
						musicAmount = musicAmount - math.pow(2,6 - i) --	and is a Lua machine
					else
						pCity:SetNumRealBuilding(DrumTab[i], 0);
					end
				else
					pCity:SetNumRealBuilding(DrumTab[i], 0);
				end --														End LS script.
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FindDeneImprovements)