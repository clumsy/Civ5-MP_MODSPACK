print("Sioux Scripts")

--Stuff
local iTipi = GameInfoTypes.IMPROVEMENT_SIOUX_TIPI_MOD;
local rBison = GameInfoTypes.RESOURCE_BISON_MOD;
local rBuffalo = GameInfoTypes.RESOURCE_BISON;

local uSioux = GameInfoTypes.UNIT_SIOUX_HORSEMAN_MOD;
local pBuffalo = GameInfoTypes.PROMOTION_BUFFALO_HERDER;

local tPlains = GameInfoTypes.TERRAIN_PLAINS;
local fForest = GameInfoTypes.FEATURE_FOREST;
local fJungle = GameInfoTypes.FEATURE_JUNGLE;
local fOasis = GameInfoTypes.FEATURE_OASIS;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

--Functions
function SiouxAIGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

function sGetClosestCity(pPlayer, pPlot)
	local newCity = nil;
	local newCityDist = 100000000;
    for city in pPlayer:Cities() do
		local dist = Map.PlotDistance(city:GetX(), city:GetY(), pPlot:GetX(), pPlot:GetY());
		if dist < newCityDist then
			newCity = city;
			newCityDist = dist
		end
    end
	return newCity;
end

function sDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function sCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local bisonPlots = {}
local buffaloPlots = {}
local tempPlots = {}

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if pPlot:GetResourceType() == rBison then
		local sKey = sCompilePlotID(pPlot)
		bisonPlots[sKey] = -1
    end
end

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
	if pPlot:GetResourceType() == rBuffalo then
		local sKey = sCompilePlotID(pPlot)
		buffaloPlots[sKey] = -1
    end
end

function sbCompilePlotID(bPlot)
    iX = bPlot:GetX()
    iY = bPlot:GetY()
    return(iX .. "Y" .. iY)
end

--Check Bison Plots
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam()

    if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then

			local gSpeed = Game.GetGameSpeedType();
			local iCurrentTurn = Game.GetGameTurn();
		
			local iRadius = 1;
			local nCheck = 0;
			local nMessage = 0;

			for sKey, tTable in pairs(buffaloPlots) do
				local pPlot = sDecompilePlotID(sKey)

				if (pPlot:GetResourceType() == rBuffalo) then
					if pPlot:GetOwner() ~= -1 then
						if pPlot:GetOwner() == iPlayer then 

							pPlot:SetResourceType(-1)
							pPlot:SetImprovementType(-1)
							pPlot:SetResourceType(rBison, 1)

							local sKey = sCompilePlotID(pPlot)
							
							buffaloPlots[sKey] = nil
							bisonPlots[sKey] = -1

						end
					end
				end

			end
						
			for sKey, tTable in pairs(bisonPlots) do
				local pPlot = sDecompilePlotID(sKey)

				if (pPlot:GetResourceType() == rBison) then

					nCheck = nCheck + 1;

					if pPlot:GetOwner() ~= iPlayer then 

						if pPlot:GetOwner() == -1 then

							pPlot:SetResourceType(-1)
							pPlot:SetImprovementType(-1)
							pPlot:SetResourceType(rBuffalo, 1)

							local sKey = sCompilePlotID(pPlot)
							
							buffaloPlots[sKey] = -1
							bisonPlots[sKey] = nil

						elseif pPlot:GetOwner() ~= -1 then
							local mPlayer = Players[pPlot:GetOwner()];	

							if (mPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SIOUX_MOD) then

								pPlot:SetResourceType(-1)
								local sKey = sCompilePlotID(pPlot)
								bisonPlots[sKey] = nil
		
								local DummyID = GameInfo.Buildings["BUILDING_SIOUX_BISON_DUMMY"].ID
								local title = "Punitive Action";
								local descr = "" .. Locale.ConvertTextKey(mPlayer:GetCivilizationAdjective()) .. " soldiers have slaughtered a [ICON_RES_BISON] Bison!";
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, pPlot:GetX(), pPlot:GetY(), DummyID, -1);

							end
						end
					end

					if pPlot:GetOwner() == iPlayer then 

						if pPlot:IsUnit() then
							local pUnit = pPlot:GetUnit(i);
							if pUnit:IsHasPromotion(pBuffalo) then
								nMessage = nMessage + 1;
							end
						end

						if gSpeed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							if ( iCurrentTurn % 9 ) == 0 then
								MoveCheck(iRadius, pPlayer, pTeam, pPlot, nMessage);
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							if ( iCurrentTurn % 12 ) == 0 then
								MoveCheck(iRadius, pPlayer, pTeam, pPlot, nMessage);
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							if ( iCurrentTurn % 15 ) == 0 then
								MoveCheck(iRadius, pPlayer, pTeam, pPlot, nMessage);
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							if ( iCurrentTurn % 24 ) == 0 then
								MoveCheck(iRadius, pPlayer, pTeam, pPlot, nMessage);
							end
						else
							if ( iCurrentTurn % 24 ) == 0 then
								MoveCheck(iRadius, pPlayer, pTeam, pPlot, nMessage);
							end
						end
					end

				end
			end

			for sKey, tTable in pairs(tempPlots) do
				bisonPlots[sKey] = -1
				tempPlots[sKey] = nil
			end

			if nCheck >= 1 then
				if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
					if gSpeed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
						if ( iCurrentTurn % 9 ) == 0 then
							Events.GameplayAlertMessage("The [ICON_RES_BUFFALO] Wild Bison are migrating to new feeding grounds!");					
						end
					elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
						if ( iCurrentTurn % 12 ) == 0 then
							Events.GameplayAlertMessage("The [ICON_RES_BUFFALO] Wild Bison are migrating to new feeding grounds!");		
						end
					elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
						if ( iCurrentTurn % 15 ) == 0 then
							Events.GameplayAlertMessage("The [ICON_RES_BUFFALO] Wild Bison are migrating to new feeding grounds!");		
						end
					elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
						if ( iCurrentTurn % 24 ) == 0 then
							Events.GameplayAlertMessage("The [ICON_RES_BUFFALO] Wild Bison are migrating to new feeding grounds!");		
						end
					else
						if ( iCurrentTurn % 24 ) == 0 then
							Events.GameplayAlertMessage("The [ICON_RES_BUFFALO] Wild Bison are migrating to new feeding grounds!");	
						end
					end
				end
			end

		end
	end
end)

--Bison on Settle
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	local pTeam = pPlayer:GetTeam()

	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then		
			if not pCity:IsCapital() then

				local Plains = 0;
				for loop, direction in ipairs(directions) do
					local tPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);
					if (tPlot:GetTerrainType() == tPlains) or (pPlot:GetTerrainType() == tPlains) then
						Plains = Plains + 1;
						break
					end
				end

				if Plains >= 1 then

					local iRadius = 2;
					PlaceBuffalo(iRadius, pPlayer, pTeam, pPlot, pCity);

					local bCheck = 0;
					local plotX = pCity:GetX();
					local plotY = pCity:GetY();
					for iDX = -2, 2 do
						for iDY = -2, 2 do
							local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 2);
							if pTargetPlot then
								if (pTargetPlot:GetResourceType() == rBison) then
									bCheck = 1;
									break		
								end
							end
						end
					end

					if bCheck ~= 1 then
						iRadius = 3;
						PlaceBuffalo(iRadius, pPlayer, pTeam, pPlot, pCity);
					end			

					for iDX = -3, 3 do
						for iDY = -3, 3 do
							local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 3);
							if pTargetPlot then
								if (pTargetPlot:GetResourceType() == rBison) then
									bCheck = 1;
									break		
								end
							end
						end
					end

					if bCheck <= 0 then
						pCity = pPlayer:GetCapitalCity();
						pPlot = pCity:Plot();
						iRadius = 3;
						PlaceBuffalo(iRadius, pPlayer, pTeam, pPlot, pCity);
					end

				end
			end
			
			if (pPlot:GetResourceType() == rBuffalo) then
				if pPlot:GetOwner() ~= -1 then
					if pPlot:GetOwner() == iPlayer then 

						pPlot:SetResourceType(-1)
						pPlot:SetImprovementType(-1)
						pPlot:SetResourceType(rBison, 1)

						local sKey = sCompilePlotID(pPlot)
							
						buffaloPlots[sKey] = nil
						bisonPlots[sKey] = -1

					end
				end
			end

			for loop, direction in ipairs(directions) do
				local bPlot = Map.PlotDirection(pPlot:GetX(), pPlot:GetY(), direction);

				if (bPlot:GetResourceType() == rBuffalo) then
					if bPlot:GetOwner() ~= -1 then
						if bPlot:GetOwner() == iPlayer then 

							bPlot:SetResourceType(-1)
							bPlot:SetImprovementType(-1)
							bPlot:SetResourceType(rBison, 1)
	
							local sKey = sbCompilePlotID(bPlot)						
							buffaloPlots[sKey] = nil
							bisonPlots[sKey] = -1

						end
					end
				end
			end

		end
	end
end)

--Check if Bison Can Move
function MoveCheck (iRadius, pPlayer, pTeam, pPlot, nMessage)

	local mCheck = 0;
	local plotX = pPlot:GetX();
	local plotY = pPlot:GetY();
	for iDX = -1, 1 do
		for iDY = -1, 1 do
			local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 1);
			if pTargetPlot then
				uCheck = 0;
				if pTargetPlot:IsUnit() then
					local pTargetUnit = pTargetPlot:GetUnit(i);
					if pTargetUnit:IsHasPromotion(pBuffalo) then
						uCheck = uCheck + 1;
					end
				end

				--[[if nMessage >= 1 then

					if (Players[pTargetPlot:GetOwner()] == pPlayer) then
						if (pTargetPlot:GetResourceType() == -1) and not pTargetPlot:IsCity() and not pTargetPlot:IsWater() and not pTargetPlot:IsImpassable() and pTargetPlot:HasYield() and not pTargetPlot:IsHills() then
							if uCheck <= 0 then
								mCheck = 1;
								break	
							end
						end	
					end
			
				else--]]if nMessage <= 0 then

					if (Players[pTargetPlot:GetOwner()] == pPlayer) or (pTargetPlot:GetOwner() == -1) then
						if (pTargetPlot:GetResourceType() == -1) and not pTargetPlot:IsCity() and not pTargetPlot:IsWater() and not pTargetPlot:IsMountain() and not pTargetPlot:IsImpassable() and pTargetPlot:HasYield() and not pTargetPlot:IsHills() then
							if uCheck <= 0 then
								mCheck = 1;
								break	
							end
						end	
					end
				
				end

			end
		end
	end

	if mCheck >= 1 then
		pPlot:SetResourceType(-1)
		local sKey = sCompilePlotID(pPlot)
		bisonPlots[sKey] = nil
		MoveBison(iRadius, pPlayer, pTeam, pPlot, nMessage)
	end

end

--Move Bison
function MoveBison (iRadius, pPlayer, pTeam, pPlot, nMessage)

    local rPlots = {}
    local iNumtoPlace = 1

    for pLoopPlot in PlotAreaSweepIterator(pPlot, iRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(rPlots, pLoopPlot)
    end

    for iVal = 1, iNumtoPlace do
        local bPlaced = false

        while (not(bPlaced)) and rPlots[1] do

            local iRandom = bGetRandom(1, #rPlots)
            local pPlot = rPlots[iRandom]

			uCheck = 0;
			if pPlot:IsUnit() then
				local pUnit = pPlot:GetUnit(i);
				if pUnit:IsHasPromotion(pBuffalo) then
					uCheck = uCheck + 1;
				end
			end

			--[[if nMessage >= 1 then

				if (Players[pPlot:GetOwner()] == pPlayer) then
					if (pPlot:GetResourceType() == -1) and not pPlot:IsCity() and not pPlot:IsWater() and not pPlot:IsImpassable() and pPlot:HasYield() and not pPlot:IsHills() then
						if uCheck <= 0 then

							pPlot:SetResourceType(rBison, 1)
							local sKey = sCompilePlotID(pPlot)
							tempPlots[sKey] = -1
	
							bPlaced = true

							if pPlot:GetOwner() == -1 then
								local pID = pPlayer:GetID()
								pPlot:SetOwner(pID, true, true)
								pPlot:SetRevealed(pTeam, true)
							end

						end
					end
				end
			
			else--]]if nMessage <= 0 then

				if (Players[pPlot:GetOwner()] == pPlayer) or (pPlot:GetOwner() == -1) then
					if (pPlot:GetResourceType() == -1) and not pPlot:IsCity() and not pPlot:IsWater() and not pPlot:IsMountain() and not pPlot:IsImpassable() and pPlot:HasYield() and not pPlot:IsHills() then
						if uCheck <= 0 then

							pPlot:SetResourceType(rBison, 1)
							local sKey = sCompilePlotID(pPlot)
							tempPlots[sKey] = -1
	
							bPlaced = true

							if pPlot:GetOwner() == -1 then
								local city = sGetClosestCity(pPlayer, pPlot);
								local scityID = city and city:GetID() or -1;
								local pID = pPlayer:GetID()
								pPlot:SetOwner(pID, scityID, true, true)
								pPlot:SetRevealed(pTeam, true)
							end

						end
					end
				end
			end

			table.remove(rPlots, iRandom)

        end
    end
end

--Place Bison
function PlaceBuffalo (iRadius, pPlayer, pTeam, pPlot, pCity)

	local CityID = pCity:GetID();
    local rPlots = {}
    local iNumtoPlace = 1

    for pLoopPlot in PlotAreaSweepIterator(pPlot, iRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(rPlots, pLoopPlot)
    end

    for iVal = 1, iNumtoPlace do
        local bPlaced = false

        while (not(bPlaced)) and rPlots[1] do

            local iRandom = bGetRandom(1, #rPlots)
            local pPlot = rPlots[iRandom]

			if (Players[pPlot:GetOwner()] == pPlayer) or (pPlot:GetOwner() == -1) then
				if (pPlot:GetResourceType() == -1) and not pPlot:IsCity() and not pPlot:IsWater() and not pPlot:IsMountain() and not pPlot:IsImpassable() and pPlot:HasYield() and not pPlot:IsHills() and (pPlot:GetFeatureType() ~= fForest) and (pPlot:GetFeatureType() ~= fJungle) and (pPlot:GetFeatureType() ~= fOasis) then
											
					pPlot:SetResourceType(rBison, 1)
					local sKey = sCompilePlotID(pPlot)
					bisonPlots[sKey] = -1

					bPlaced = true

					if pPlot:GetOwner() == -1 then
						local pID = pPlayer:GetID()
						pPlot:SetOwner(pID, CityID, true, true)
						pPlot:SetRevealed(pTeam, true)
					end

					local DummyID = GameInfo.Units["UNIT_BUFFALO_DUMMY"].ID;
					local title = "New Hunting Grounds";
					local descr = "A herd of [ICON_RES_BISON] Bison has migrated near " .. Locale.ConvertTextKey(pCity:GetName()) .. "!";				
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pPlot:GetX(), pPlot:GetY(), DummyID, -1);

				end
            end

			table.remove(rPlots, iRandom)

        end
    end
end

--Bison Chivalry Boost
local bIndBuffalo = GameInfoTypes.BUILDING_SIOUX_BISON_DUMMY_TWO;
local tChivalry = GameInfoTypes.TECH_CHIVALRY;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam()
    if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
			if (Teams[pTeam]:IsHasTech(tChivalry)) then
				for pCity in pPlayer:Cities() do
					if not pCity:IsHasBuilding(bIndBuffalo) then
						pCity:SetNumRealBuilding(bIndBuffalo, 1);
					end
				end
			end
		end
	end
end)

--Tipi Capture
GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local cPlot = Map.GetPlot(iX, iY);	
	local cCity = cPlot:GetPlotCity();
	local iPreviousOwner = cCity:GetPreviousOwner();
	local pPlayer = Players[iPreviousOwner];

	local cTipi = 0;
	local plotX = cCity:GetX();
	local plotY = cCity:GetY();
	local iRange = 3;
	for iDX = -iRange, iRange do
		for iDY = -iRange, iRange do
			local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
			if pTargetPlot then
				if (pTargetPlot:GetImprovementType() == iTipi) then
					if ((pTargetPlot:GetOwner()) ~= (cCity:GetPreviousOwner())) then
						--[[if pTargetPlot:IsImprovementPillaged() then
							pTargetPlot:SetImprovementType(-1)
						else--]]if not pTargetPlot:IsImprovementPillaged() then
							pTargetPlot:SetImprovementType(-1)
							cTipi = cTipi + 1;
						end
					end
				end
			end
		end
	end	
			
	local cPop = cCity:GetPopulation();	
	if cTipi >= cPop then
		cTipi = cPop;
	end

	local tBonus = 0;
	for pCity in pPlayer:Cities() do
		if cTipi >= 1 then
			pCity:ChangePopulation(1, true);
			tBonus = tBonus + 1;
			cTipi = cTipi - 1;
		end
	end

	if tBonus >= 1 then
		local DummyID = GameInfo.Buildings["BUILDING_SIOUX_TIPI_DUMMY"].ID
		local title = "Forced Migration";
		local descr = 0;
		if tBonus >= 2 then
			descr = "" .. tBonus .. " [ICON_CITIZEN] Citizens have relocated from the City of " .. Locale.ConvertTextKey(cCity:GetName()) .. ".";
		elseif tBonus <= 1 then
			descr = "" .. tBonus .. " [ICON_CITIZEN] Citizen has relocated from the City of " .. Locale.ConvertTextKey(cCity:GetName()) .. ".";
		end
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), DummyID, -1);	
	end	
		
end)

cityMax = 1;

function largerThan(pCity, cCity)
	return pCity:GetPopulation() > cCity:GetPopulation();
end

--Tipi Build
GameEvents.BuildFinished.Add(function(iPlayer, x, y, eImprovement) 
	local pPlayer = Players[iPlayer];
	local iPlot = Map.GetPlot(x, y);

	if eImprovement == iTipi then

		local iCity = 0;
		for lCity in pPlayer:Cities() do
			if lCity:CanWork(iPlot) then
				iCity = lCity;
				break
			end
		end

		local ePop = 1;
		local plotX = iCity:GetX();
		local plotY = iCity:GetY();
		local iRange = 3;
		for iDX = -iRange, iRange do
			for iDY = -iRange, iRange do
				local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, iRange);
				if pTargetPlot then
					if (pTargetPlot:GetResourceType() == rBison) and ((pTargetPlot:GetOwner()) == (iPlot:GetOwner())) then
						ePop = 2;
						break
					end
				end
			end
		end

		local cities = {};
		local last = 0;
		local bCity = 0;
		for pCity in pPlayer:Cities() do
			local larger = true;
			local i = last;
			while i > 0 and larger do
				larger = largerThan(pCity, cities[i]);
				if i ~= cityMax then
					if larger then
						cities[i+1] = cities[i];
					else
						cities[i+1] = pCity;
					end
				end
				i = i - 1;
			end
			if i == 0 and larger then
				cities[1] = pCity;
			end
			if last < cityMax then
				last = last + 1;
			end
		end
		for i,pCity in ipairs(cities) do
			bCity = pCity;
			break
		end

		local bPop = bCity:GetPopulation();
		if (iCity ~= bCity) and (bPop >= 2) and (ePop >= 2) then
			if (pPlayer:IsHuman()) then
				JFD_ShowSiouxTipiPopup(bCity, iCity, ePop)
			elseif not (pPlayer:IsHuman()) then
				if SiouxAIGetRandom(1,4) == 4 then
					iCity:ChangePopulation(1, true);
				end
			end
		end

	end

end);

--Exit City Screen Update
function UpdatePurchasedBison()
    local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer] 
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then

				for sKey, tTable in pairs(buffaloPlots) do
					local pPlot = sDecompilePlotID(sKey)

					if (pPlot:GetResourceType() == rBuffalo) then
						if pPlot:GetOwner() ~= -1 then
							if pPlot:GetOwner() == iPlayer then 

								pPlot:SetResourceType(-1)
								pPlot:SetImprovementType(-1)
								pPlot:SetResourceType(rBison, 1)

								local sKey = sCompilePlotID(pPlot)
							
								buffaloPlots[sKey] = nil
								bisonPlots[sKey] = -1

							end
						end
					end

				end

			end
		end
	end
end
Events.SerialEventExitCityScreen.Add(UpdatePurchasedBison)

--Pop-Up (JFD)
local cityOne
local cityTwo
local populationChange

function JFD_Yes()
	cityOne:ChangePopulation(-1, true);
	cityTwo:ChangePopulation(1, true);
	JFD_HideSiouxTipiPopup()
end
Controls.YesButton:RegisterCallback(Mouse.eLClick, JFD_Yes)

function JFD_No()
	JFD_HideSiouxTipiPopup()
end
Controls.NoButton:RegisterCallback(Mouse.eLClick, JFD_No)

function JFD_ShowSiouxTipiPopup(bCity, iCity, ePop)
	cityOne = bCity
	cityTwo = iCity
	populationChange = ePop
	Controls.Summary:LocalizeAndSetText("Follow the [ICON_RES_BISON] Bison to new hunting grounds?[NEWLINE][NEWLINE]-1 [ICON_CITIZEN] Population from " .. bCity:GetName() .. " (" .. bCity:GetPopulation() .. "), +1 [ICON_CITIZEN] Population to " .. iCity:GetName() .. " (" .. iCity:GetPopulation() .. ")")
	Controls.ButtonStack:CalculateSize();
	Controls.TomatekhSiouxUI:DoAutoSize();
	Controls.TomatekhSiouxUIBG:SetHide(false)
	Controls.TomatekhSiouxUI:SetHide(false)
end

function JFD_HideSiouxTipiPopup()
	Controls.TomatekhSiouxUIBG:SetHide(true)
	Controls.TomatekhSiouxUI:SetHide(true)
end

--Blackfoot
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION) then
			for pUnit in pPlayer:Units() do
				if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_COUNTSCOUP1) then
					local pPlot = pUnit:GetPlot()
					if pPlot:GetResourceType() == rBison then
						pUnit:ChangeExperience(2)
					end
				end
			end
		end
	end
end)

function CheckifBuffaloPlotStored(pTargetPlot)	
	local BCheck = 0;
	for sKey, tTable in pairs(buffaloPlots) do
		local pPlot = sDecompilePlotID(sKey)
		if pPlot == pTargetPlot then
			BCheck = 1;
			break
		end
	end
	return BCheck;
end

function CheckBlackfootgame()
	local BlackFootID = GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION;
	local BlackfootYes = 0;
	for i, player in pairs(Players) do
		if player:IsEverAlive() then
			if player:GetCivilizationType() == BlackFootID then
				BlackfootYes = 1;
				break;
			end
		end
	end
	return BlackfootYes;
end

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local plot = Map.GetPlot(iX, iY);	
	local cCity = plot:GetPlotCity();
	local iNewOwner = cCity:GetOwner();
	local iPreviousOwner = cCity:GetPreviousOwner();
	local pPlayer = Players[iNewOwner];
	local lPlayer = Players[iPreviousOwner];
	local cplotX = cCity:GetX();
	local cplotY = cCity:GetY();

	local BlackFoot = CheckBlackfootgame();
	if BlackFoot == 1 then

		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
			for iDX = -3, 3 do
				for iDY = -3, 3 do
					local pTargetPlot = Map.PlotXYWithRangeCheck(cplotX, cplotY, iDX, iDY, 3)
					if pTargetPlot then

						if (pTargetPlot:GetResourceType() == rBuffalo) then
							local BisonCheck = CheckifBuffaloPlotStored(pTargetPlot);

							if BisonCheck == 0 then

								if (pTargetPlot:GetOwner() == -1) then
									pPlot = pTargetPlot
									local sKey = sCompilePlotID(pPlot)
									buffaloPlots[sKey] = -1
								else
									local sPlayer = Players[pTargetPlot:GetOwner()];				
									if (sPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
										pPlot = pTargetPlot
										local sKey = sCompilePlotID(pPlot)
										buffaloPlots[sKey] = -1					
									elseif (sPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
										pTargetPlot:SetResourceType(-1)
										pTargetPlot:SetImprovementType(-1)
										pTargetPlot:SetResourceType(rBison, 1)
										pPlot = pTargetPlot
										local sKey = sCompilePlotID(pPlot)
										bisonPlots[sKey] = -1
									end
								end	

							end
						end
					end
				end
			end

		end
	end
end)

--ExCE
local isExCE = (GameInfoTypes.BUILDING_JFD_TRADE_RESOURCE_BISON ~= nil)
local tTrapping = GameInfoTypes.TECH_TRAPPING;

function WildBisonTrade(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
			if (Teams[pTeam]:IsHasTech(tTrapping)) then
				local CurrBison = pPlayer:GetNumResourceTotal(rBuffalo, true);
				local WildBisonCount = 0;
				for sKey, tTable in pairs(bisonPlots) do
					local pPlot = sDecompilePlotID(sKey)
					if (pPlot:GetResourceType() == rBison) then
						if pPlot:GetOwner() ~= -1 then
							if pPlot:GetOwner() == iPlayer then 
								WildBisonCount = WildBisonCount + 1;
							end
						end
					end
				end
				if CurrBison ~= WildBisonCount then
					if CurrBison > WildBisonCount then
						local BisonChange = (CurrBison - WildBisonCount);
						pPlayer:ChangeNumResourceTotal(rBuffalo, -BisonChange);
					elseif CurrBison < WildBisonCount then
						local BisonChange = (WildBisonCount - CurrBison);
						pPlayer:ChangeNumResourceTotal(rBuffalo, BisonChange);
					end
				end
			end
		end
	end
end

--if isExCE then
GameEvents.PlayerDoTurn.Add(WildBisonTrade)
--end