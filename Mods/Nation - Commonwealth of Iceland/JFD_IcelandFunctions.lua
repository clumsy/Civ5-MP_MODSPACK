-- JFD_IcelandFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("FLuaVector.lua")
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetCityWithWonder
------------------------------------------------------------------------------------------------------------------------
function JFD_GetCityWithWonder(playerID, buildingID)
	local player = Players[playerID]
	local cityWithBuilding
	for city in player:Cities() do
		if city:IsHasBuilding(buildingID) then
			cityWithBuilding = city
		end
	end
	
	return cityWithBuilding or player:GetCapitalCity()
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumTerrainsSettled
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumTerrainsSettled(playerID, city, terrainID)
	local player = Players[playerID]
	local numTerrainsSettled = 0
	for otherCity in player:Cities() do
		if otherCity ~= city then
			if Map.GetPlot(otherCity:GetX(), otherCity:GetY()):GetTerrainType() == terrainID then
				numTerrainsSettled = numTerrainsSettled + 1
			end
		end
	end
	return numTerrainsSettled
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumContinentsSettled
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumContinentsSettled(playerID, city, continentID)
	local player = Players[playerID]
	local numContinentsSettled = 0
	for otherCity in player:Cities() do
		if otherCity ~= city then
			if Map.GetPlot(otherCity:GetX(), otherCity:GetY()):GetContinentArtType() == continentID then
				numContinentsSettled = numContinentsSettled + 1
			end
		end
	end
	return numContinentsSettled
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingIcelandHappinessID = GameInfoTypes["BUILDING_JFD_ICELAND_HAPPINESS"]
local buildingThingsteadID = GameInfoTypes["BUILDING_JFD_THINGSTEAD"]
local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]
local buildingWritingSlotID = GameInfoTypes["BUILDING_JFD_ICELAND_GREAT_WRITING"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ICELAND"]
local isIcelandCivActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
local policyLandnamabokID = GameInfoTypes["POLICY_JFD_LANDNAMABOK"]
local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]
local unitPromotionSkaldID = GameInfoTypes["PROMOTION_JFD_SKALD"]
local unitSkaldID = GameInfoTypes["UNIT_JFD_SKALD"]

if isIcelandCivActive then
	print("Chieftain Ingolfr is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IcelandicGreatWorks
------------------------------------------------------------------------------------------------------------------------
function JFD_IcelandicGreatWorks(playerID, cityX, cityY)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		local capital = player:GetCapitalCity()
		local plot = Map.GetPlot(cityX, cityY)
		local city = plot:GetPlotCity()
		if (plot and city ~= capital) then
			local capitalPlot = Map.GetPlot(capital:GetX(), capital:GetY())
			local capitalContinentID = capitalPlot:GetContinentArtType()
			local capitalTerrainID = capitalPlot:GetTerrainType()
			local cityContinentID = plot:GetContinentArtType()
			local cityTerrainID = plot:GetTerrainType()
			local numContinentsSettled = JFD_GetNumContinentsSettled(playerID, city, cityContinentID)
			local numTerrainSettled = JFD_GetNumTerrainsSettled(playerID, city, cityTerrainID)
			if ((numContinentsSettled == 0 and not player:IsHuman()) or numTerrainSettled == 0) then
				city:SetNumRealBuilding(buildingWritingSlotID, 1)
			end
		end
	end
end

if isIcelandCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_IcelandicGreatWorks)	
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatWriterFromNavalBattle
------------------------------------------------------------------------------------------------------------------------
function JFD_GreatWriterFromNavalBattle(killerID, killedID, killedUnitType)
	local player = Players[killerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local unitCombatClass = GameInfo.Units[killedUnitType].CombatClass
		if (unitCombatClass == "UNITCOMBAT_NAVALRANGED" or unitCombatClass == "UNITCOMBAT_NAVALMELEE") then	
			local reward = mathFloor(GameInfo.Units[killedUnitType].Combat)
			if player:HasPolicy(policyLandnamabokID) then
				reward = mathFloor(reward + (reward * 20 / 100))
			end

			local writersGuildCity = JFD_GetCityWithWonder(killerID, buildingWritersGuildID)
			writersGuildCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, reward*100)
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("+{1_Num} [ICON_GREAT_PEOPLE] [COLOR_POSITIVE_TEXT]Great Writer[ENDCOLOR] points from defeating an enemy naval unit in battle", reward))
			end
		end
	end
end

if isIcelandCivActive then
	GameEvents.UnitKilledInCombat.Add(JFD_GreatWriterFromNavalBattle)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GreatWriterFromCivilizations
------------------------------------------------------------------------------------------------------------------------
function JFD_GreatWriterFromCivilizations(playerMetID, playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
        local playerMet = Players[playerMetID]
		local majorsMet = Teams[playerMet:GetTeam()]:GetHasMetCivCount(true)
		local speedMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
		local reward
		if playerMet:IsMinorCiv() then reward = 5 else reward = 10 end
        if majorsMet == 1 then reward = reward * 2 end
		reward = reward * speedMod
		
		if player:IsHuman() then
           Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_GREAT_PEOPLE] [COLOR_POSITIVE_TEXT]Great Writer[ENDCOLOR] points from meeting {2_CivName}", reward, playerMet:GetName()))
        end
		
		local writersGuildCity = JFD_GetCityWithWonder(playerID, buildingWritersGuildID)
		writersGuildCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, reward*100)
	end
end
	
if isIcelandCivActive then
	GameEvents.TeamMeet.Add(JFD_GreatWriterFromCivilizations)	
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_ThingsteadHappiness
------------------------------------------------------------------------------------------------------------------------
function JFD_ThingsteadHappiness(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
	     for city in player:Cities() do
			if (city:IsHasBuilding(buildingThingsteadID) and (player:IsCapitalConnectedToCity(city) or city == player:GetCapitalCity())) then
				if not city:IsHasBuilding(buildingIcelandHappinessID) then
					city:SetNumRealBuilding(buildingIcelandHappinessID, 1)
				end
			else
				if city:IsHasBuilding(buildingIcelandHappinessID) then
					city:SetNumRealBuilding(buildingIcelandHappinessID, 0)
				end
			end
		end
	end
end

function JFD_ThingsteadHappinessCityView(playerID)
	local player = Players[Game.GetActivePlayer()]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
	     local city = UI.GetHeadSelectedCity()
		if (city:IsHasBuilding(buildingThingsteadID) and (player:IsCapitalConnectedToCity(city) or city == player:GetCapitalCity())) then
			if not city:IsHasBuilding(buildingIcelandHappinessID) then
				city:SetNumRealBuilding(buildingIcelandHappinessID, 1)
			end
		else
			if city:IsHasBuilding(buildingIcelandHappinessID) then
				city:SetNumRealBuilding(buildingIcelandHappinessID, 0)
			end
		end
	end
end
	
if isIcelandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ThingsteadHappiness)	
	Events.SerialEventEnterCityScreen.Add(JFD_ThingsteadHappinessCityView)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SkaldicMovement
------------------------------------------------------------------------------------------------------------------------
function JFD_SkaldicMovement(playerID)
    local player = Players[playerID]
	if (not player:IsBarbarian()) and not (player:IsMinorCiv()) then    
	  for unit in player:Units() do
	      if unit:IsHasPromotion(unitPromotionSkaldID) then
	          if unit:IsEmbarked() then
	              local movementChange = mathFloor(unit:GetMoves())
	              unit:ChangeMoves(movementChange)
	          end
	      end
	  end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SkaldicMovement)
------------------------------------------------------------------------------------------------------------------------
-- JFD_SkaldicFoundation
------------------------------------------------------------------------------------------------------------------------
function JFD_SkaldicFoundation(playerID, unitID, unitTypeID, unitX, unitY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if unitTypeID == unitSkaldID then
			local plot = Map.GetPlot(unitX, unitY)
			if plot:GetPlotCity() then
				local city = plot:GetPlotCity()
				city:SetNumRealBuilding(buildingWritingSlotID, 1)
			end
		end
	end	 
end

if isIcelandCivActive then
	GameEvents.UnitPrekill.Add(JFD_SkaldicFoundation)
end
--==========================================================================================================================
--==========================================================================================================================