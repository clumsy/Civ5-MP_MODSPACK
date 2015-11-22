-- JFD_BavariaFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BAVARIA"]

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
--------------------------------------------------------------
-- JFD_IsWhowardsDLLActive
--------------------------------------------------------------
function JFD_IsWhowardsDLLActive()
	local whowardsDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingWhowardsDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == whowardsDLLModID) then
	    isUsingWhowardsDLL = true
	    break
	  end
	end

	return isUsingWhowardsDLL
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BAVARIA"]
local buildingBavarianCultureID = GameInfoTypes["BUILDING_JFD_BAVARIAN_CULTURE"]
local buildingBavarianMusicID = GameInfoTypes["BUILDING_JFD_BAVARIAN_MUSIC"]
local improvementSchlossID = GameInfoTypes["IMPROVEMENT_JFD_SCHLOSS"]
local improvementSchlossDummyID = GameInfoTypes["IMPROVEMENT_JFD_SCHLOSS_GOLD"]
local isBavariaCivActive = JFD_IsCivilisationActive(civilisationID)
local isWhowardsDLLActive = JFD_IsWhowardsDLLActive()
local specialistMusicianID = GameInfoTypes["SPECIALIST_MUSICIAN"]
local unitPromotionHartschierID = GameInfoTypes["PROMOTION_JFD_HARTSCHIER"]

if isBavariaCivActive then
	print("King Ludwig II is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BavarianCulture
----------------------------------------------------------------------------------------------------------------------------
function JFD_BavarianCulture(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			local cityBuildingProduction = city:GetProductionBuilding()
			if cityBuildingProduction ~= -1 then
				local currentBuildingClass = GameInfo.Buildings[cityBuildingProduction].BuildingClass
				local buildingClass = GameInfo.BuildingClasses[currentBuildingClass]
				if (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1) then
					for row in GameInfo.Building_YieldChanges("YieldType = 'YIELD_CULTURE'") do
						if GameInfoTypes[row.BuildingType] == cityBuildingProduction then
							local culture = row.Yield
							city:SetNumRealBuilding(buildingBavarianCultureID, culture)
						end
					end
				else	
					if city:IsHasBuilding(buildingBavarianCultureID) then
						city:SetNumRealBuilding(buildingBavarianCultureID, 0)
					end
				end
			end
		end
	end
end

if isBavariaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_BavarianCulture)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BavarianMusicSlots
----------------------------------------------------------------------------------------------------------------------------
function JFD_BavarianMusicSlots(playerID, cityID, buildingID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == civilisationID then 
		local currentBuildingClass = GameInfo.Buildings[buildingID].BuildingClass
		local buildingClass = GameInfo.BuildingClasses[currentBuildingClass]
		if (buildingClass.MaxGlobalInstances == 1 or buildingClass.MaxPlayerInstances == 1) then
			local city = player:GetCityByID(cityID)
			if not city:IsHasBuilding(buildingBavarianMusicID) then
				city:SetNumRealBuilding(buildingBavarianMusicID, 1)
			end
		end
	end
end

if isBavariaCivActive then
	GameEvents.CityConstructed.Add(JFD_BavarianMusicSlots)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SchlossGreatMusicianPoints
----------------------------------------------------------------------------------------------------------------------------
function JFD_SchlossGreatMusicianPoints(playerID, improvementX, improvementY, improvementID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		if improvementID == improvementSchlossID then
			local musicianBoost = (player:GetTotalJONSCulturePerTurn() * 2) * 100
			player:GetCapitalCity():ChangeSpecialistGreatPersonProgressTimes100(specialistMusicianID, musicianBoost)
		end
	end
end

if isBavariaCivActive then
	GameEvents.BuildFinished.Add(JFD_SchlossGreatMusicianPoints)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_HartshierSchlossCulture
----------------------------------------------------------------------------------------------------------------------------
function JFD_HartshierSchlossCulture(playerID)
	local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		for city in player:Cities() do
			for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
				local plot = city:GetCityIndexPlot(cityPlot)
				if (plot and plot:GetOwner() == playerID) then
					if (plot:GetImprovementType() == improvementSchlossID and plot:GetUnit()) then 
						if plot:GetUnit():IsHasPromotion(unitPromotionHartschierID) then
							plot:SetImprovementType(improvementSchlossDummyID)
						end
					elseif (plot:GetImprovementType() == improvementSchlossDummyID) then
						if not (plot:GetUnit()) or not (plot:GetUnit():IsHasPromotion(unitPromotionHartschierID)) then
							plot:SetImprovementType(improvementSchlossID)
						end
					end
				end
			end
		end
	end
end

if isBavariaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_HartshierSchlossCulture)
	GameEvents.UnitSetXY.Add(JFD_HartshierSchlossCulture)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ResolveSchlossExploit
----------------------------------------------------------------------------------------------------------------------------
function JFD_ResolveSchlossExploit(plotX, plotY, improvementID)
	local player = Players[playerID]
    if improvementID == improvementSchlossID then 
		local plot = Map.GetPlot(plotX, plotY)
		if plot:IsAdjacentToImprovement(improvementSchlossDummyID) then 
			return false
		end
	end

	return true
end

if isWhowardsDLLActive then
	GameEvents.PlotCanImprove.Add(JFD_ResolveSchlossExploit)
end
--==========================================================================================================================
--==========================================================================================================================