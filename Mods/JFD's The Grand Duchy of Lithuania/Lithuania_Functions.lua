-- Lithuania_Functions
-- Author: JFD
-- DateCreated: 2/21/2014 12:13:46 AM
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
print ("The Grand Duchy of Lithuania rises")
----------------------------------------------------------------------------------------------------------------------------
-- JFD_HasMostPaganCities
----------------------------------------------------------------------------------------------------------------------------	
function JFD_HasMostPaganCities(player)
	local numCities = math.ceil(player:GetNumCities() / 2)
	local numPaganCities = 1
	for city in player:Cities() do 
		if city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
			numPaganCities = numPaganCities + 1
		end
	end
	
	if numPaganCities < numCities then
		return 
	end
	
	return true
end 
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LithuanianPaganCities
----------------------------------------------------------------------------------------------------------------------------
function JFD_LithuanianPaganCities(ownerID, religionID, iX, iY)
	local player = Players[ownerID] 
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"] then
		local city = Map.GetPlot(iX, iY):GetPlotCity() 
		if JFD_HasMostPaganCities(player) then
			if religionID ~= GameInfoTypes["RELIGION_PANTHEON"] and religionID ~= player:GetReligionCreatedByPlayer() then
				if not city:IsCapital() and not city:IsHolyCityAnyReligion() then
					city:AdoptReligionFully(GameInfoTypes["RELIGION_PANTHEON"]) 
				end				
			end
		end
		
		if religionID ~= GameInfoTypes["RELIGION_PANTHEON"] then
			if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"]) then
				if religionID ~= GameInfoTypes["RELIGION_PANTHEON"] then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"], 0) 
				end
			end
			
			if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_HAPPINESS"]) then
				if religionID ~= GameInfoTypes["RELIGION_PANTHEON"] then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_HAPPINESS"], 0) 
				end
			end
		end
	end
end				
GameEvents.CityConvertsReligion.Add(JFD_LithuanianPaganCities)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LithuanianPaganUnits
----------------------------------------------------------------------------------------------------------------------------
function JFD_LithuanianPaganUnits(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"] then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MELEE"] and not unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_LITHUANIA"]) then
			if Map.GetPlot(unit:GetX(), unit:GetY()):GetPlotCity() then
				local city = Map.GetPlot(unit:GetX(), unit:GetY()):GetPlotCity() 
				if city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_LITHUANIA"], true)
				end
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(JFD_LithuanianPaganUnits)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SamogitianObsoleteOverride
----------------------------------------------------------------------------------------------------------------------------	
function JFD_SamogitianObsoleteOverride(playerID, cityID, unitID)
	local player = Players[playerID]
	if unitID == GameInfoTypes["UNIT_JFD_SAMOGITIAN_WARRIOR"] then
		if Teams[player:GetTeam()]:GetTeamTechs():HasTech(GameInfoTypes[GameInfo.Units["UNIT_SWORDSMAN"].ObsoleteTech]) then
			if player:GetCityByID(cityID):GetReligiousMajority() ~= GameInfoTypes["RELIGION_PANTHEON"] then
				return
			end
		end
	end
	
	return true
end
GameEvents.CityCanTrain.Add(JFD_SamogitianObsoleteOverride)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SamogitianPaganConversion
----------------------------------------------------------------------------------------------------------------------------	
local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
	}
	
function JFD_SamogitianPaganConversion(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"] then
		if player:GetReligionCreatedByPlayer() >= GameInfoTypes["RELIGION_PANTHEON"] then
			for city in player:Cities() do
				if not city:IsHolyCityAnyReligion() then
					if city:GetReligiousMajority() ~= GameInfoTypes["RELIGION_PANTHEON"] and city:GetGarrisonedUnit():GetUnitType() == GameInfoTypes["UNIT_JFD_SAMOGITIAN_WARRIOR"] then 
						local conversionRate = 20
						local plot = Map.GetPlot(city:GetX(), city:GetY())
						for i = 0, plot:GetNumUnits() - 1 do
							if plot:GetUnit(i):GetUnitClassType() == GameInfoTypes["UNITCLASS_PROPHET"] or plot:GetUnit(i):GetUnitClassType() == GameInfoTypes["UNITCLASS_MISSIONARY"] then
								conversionRate = 40
								break
							end
						end
						
						for loop, direction in ipairs(direction_types) do
							local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
							if adjPlot then
								for i = 0, adjPlot:GetNumUnits() - 1 do
									if adjPlot:GetUnit(i):GetUnitClassType() == GameInfoTypes["UNITCLASS_PROPHET"] or adjPlot:GetUnit(i):GetUnitClassType() == GameInfoTypes["UNITCLASS_MISSIONARY"] then
										conversionRate = 40
										break
									end
								end
							end
						end
						
						for religion in GameInfo.Religions() do
							if city:IsReligionInCity(religion.ID) then
								city:ConvertPercentFollowers(GameInfoTypes["RELIGION_PANTHEON"], religion.ID, conversionRate) 
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SamogitianPaganConversion)
						
function JFD_SamogitianPaganConversionAI(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"] and not player:IsHuman() then 
		if player:GetReligionCreatedByPlayer() >= GameInfoTypes["RELIGION_PANTHEON"] then
			local city = Map.GetPlot(iX, iY):GetPlotCity()
			if city:GetGarrisonedUnit():GetUnitType() == GameInfoTypes["UNIT_JFD_SAMOGITIAN_WARRIOR"] then	
				city:AdoptReligionFully(GameInfoTypes["RELIGION_PANTHEON"]) 
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_SamogitianPaganConversionAI)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SacredGrove
----------------------------------------------------------------------------------------------------------------------------	
function JFD_SacredGrove(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_LITHUANIA"] and player:IsAlive() then
		for city in player:Cities() do 
			if city:GetReligiousMajority() == GameInfoTypes["RELIGION_PANTHEON"] then
				if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE"]) then
					if not city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"]) then
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"], 1)
					end
					
					local numHappiness = math.floor(city:GetFaithPerTurn() / 10)
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_HAPPINESS"], numHappiness)
				end
			else
				if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_FAITH"], 0)
				end	
				
				if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_HAPPINESS"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SACRED_GROVE_HAPPINESS"], 0)
				end	
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SacredGrove)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LithuanianAIProphets
----------------------------------------------------------------------------------------------------------------------------
function JFD_LithuanianAIProphets(playerID, unitID)
	local player = Players[playerID]
	if player:IsAlive() and not player:IsHuman() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_BELGIUM"] then 
       	 if player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_PROPHET"] and player:GetCurrentEra() < GameInfoTypes["ERA_RENAISSANCE"] then
			unit = player:GetUnitByID(unitID)
			local newUnit
			newUnit = player:InitUnit(GameInfoTypes["UNIT_JFD_LITHUANIAN_PROPHET"], unit:GetX(), unit:GetY())
			
			newUnit:Convert(unit)
         end
    end
end
Events.SerialEventUnitCreated.Add(JFD_LithuanianAIProphets)
--==========================================================================================================================
--==========================================================================================================================	






