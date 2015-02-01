-- Hungary_Functions
-- Author: JFD
-- DateCreated: 1/17/2014 12:14:14 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_HungaryDynamicTopPanelSupport")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end
--=======================================================================================================================
-- CORE HUNGARY FUNCTIONS	
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local buildingVegvarID = GameInfoTypes["BUILDING_JFD_VEGVAR"]
local buildingVegvarAttritionID = GameInfoTypes["BUILDING_JFD_VEGVAR_ATTRITION"]
local buildingVegvarFaithID = GameInfoTypes["BUILDING_JFD_VEGVAR_FAITH"]
local buildingVegvarPressureID = GameInfoTypes["BUILDING_JFD_VEGVAR_PRESSURE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_HUNGARY"]
local isHungaryCivActive = JFD_IsCivilisationActive(civilisationID)
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()

if isHungaryCivActive then
	print("Apostolic King Stephen is in this game")
end

if isUsingPietyPrestige then
	include("PietyUtils.lua")
end
-------------------------------------------------------------------------------------------------------------------------
-- JFD_FaithtoGoldenAgePoints
----------------------------------------------------------------------------------------------------------------------------
function JFD_FaithtoGoldenAgePoints(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if (player:GetCapitalCity() and player:GetCapitalCity():GetReligiousMajority() > 0) then
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if isUsingPietyPrestige then religionID = JFD_GetStateReligion(playerID) end
			
			if religionID then
				if player:HasReligionInMostCities(religionID) then
					local goldenAgeBonusPerTurn = JFD_GetHungaryGAPFromFPT(playerID)
					player:ChangeGoldenAgeProgressMeter(goldenAgeBonusPerTurn)
					for city in player:Cities() do
						if (city:IsOccupied() or city:IsPuppet()) then
							city:ConvertPercentFollowers(religionID, -1, 20)
							for row in GameInfo.Religions() do
								city:ConvertPercentFollowers(religionID, row.ID, 20)
							end
						end
					end
				end
			end
		end
	end
end

if isHungaryCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_FaithtoGoldenAgePoints)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_HungarianVegvar
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumDefensiveBuildings(city)
	local numDefensiveBuildings = 0
	for row in GameInfo.Buildings("Defense > 0 AND Cost > 0") do
		if city:IsHasBuilding(row.ID) then
			numDefensiveBuildings = numDefensiveBuildings + 1
		end
	end
	
	return numDefensiveBuildings
end
		
function JFD_HungarianVegvar(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
		if isUsingPietyPrestige then religionID = JFD_GetStateReligion(playerID) end
		
		for city in player:Cities() do
			if city:IsHasBuilding(buildingVegvarID) and religionID > -1 and city:GetReligiousMajority() == religionID then
				city:SetNumRealBuilding(buildingVegvarFaithID, JFD_GetNumDefensiveBuildings(city))
				city:SetNumRealBuilding(buildingVegvarPressureID, 1)
				city:SetNumRealBuilding(buildingVegvarAttritionID, 1)
			else
				if city:IsHasBuilding(buildingVegvarPressureID) then
					city:SetNumRealBuilding(buildingVegvarPressureID, 0)
				end

				if city:IsHasBuilding(buildingVegvarFaithID) then
					city:SetNumRealBuilding(buildingVegvarFaithID, 0)
				end

				if city:IsHasBuilding(buildingVegvarAttritionID) then
					city:SetNumRealBuilding(buildingVegvarAttritionID, 0)
				end
			end
		end
	end
	
	if player:IsAlive() and not player:IsMinorCiv() and not player:IsBarbarian() then
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1 do
			if Players[iPlayer]:GetCivilizationType() == civilisationID and player:IsAlive() then
				if Teams[player:GetTeam()]:IsAtWar(iPlayer) then
					for city in player:Cities() do
						if city:IsHasBuilding(buildingVegvarAttritionID) and religionID > -1 and city:GetReligiousMajority() == religionID then
							city:ChangeDamage(30)
						end
					end
				end
			end
		end
	end
end

function JFD_HungarianVegvarCityView()
	local player = Players[Game.GetActivePlayer()]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
		if isUsingPietyPrestige then religionID = JFD_GetStateReligion(playerID) end
		
		local city = UI.GetHeadSelectedCity()
		if city:IsHasBuilding(buildingVegvarID) and religionID > -1 and city:GetReligiousMajority() == religionID then
			city:SetNumRealBuilding(buildingVegvarFaithID, JFD_GetNumDefensiveBuildings(city))
			city:SetNumRealBuilding(buildingVegvarPressureID, 1)
			city:SetNumRealBuilding(buildingVegvarAttritionID, 1)
		else
			if city:IsHasBuilding(buildingVegvarPressureID) then
				city:SetNumRealBuilding(buildingVegvarPressureID, 0)
			end

			if city:IsHasBuilding(buildingVegvarFaithID) then
				city:SetNumRealBuilding(buildingVegvarFaithID, 0)
			end

			if city:IsHasBuilding(buildingVegvarAttritionID) then
				city:SetNumRealBuilding(buildingVegvarAttritionID, 0)
			end
		end
	end
end

if isHungaryCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_HungarianVegvar)
	Events.SerialEventEnterCityScreen.Add(JFD_HungarianVegvarCityView)
end
--==========================================================================================================================
-- CORE AUSTRIA FUNCTIONS
--==========================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local buildingTourism1ID = GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM"]
local buildingTourism2ID = GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2"]
local unitPromotionDragoonID = GameInfoTypes["PROMOTION_JFD_CEREMONIAL_DRAGOONS"]
--------------------------------------------------------------------------------------------------------------------------
-- JFD_DragoonCulture
--------------------------------------------------------------------------------------------------------------------------
function JFD_DragoonTourism(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() then
		for city in player:Cities() do
			if city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(unitPromotionDragoonID) then
				local unit = city:GetGarrisonedUnit()
				if unit:GetLevel() >= 4 then 
					if not city:IsHasBuilding(buildingTourism2ID) then
						city:SetNumRealBuilding(buildingTourism2ID, 1)
						city:SetNumRealBuilding(buildingTourism1ID, 0)
					end
				elseif unit:GetLevel() >= 2 then
					if not city:IsHasBuilding(buildingTourism1ID) then
						city:SetNumRealBuilding(buildingTourism1ID, 1)
						city:SetNumRealBuilding(buildingTourism2ID, 0)
					end
				else
					if city:IsHasBuilding(buildingTourism2ID) or city:IsHasBuilding(buildingTourism1ID) then
						city:SetNumRealBuilding(buildingTourism2ID, 0)
						city:SetNumRealBuilding(buildingTourism1ID, 0)
					end
				end
			else
				if city:IsHasBuilding(buildingTourism2ID) or city:IsHasBuilding(buildingTourism1ID) then
					city:SetNumRealBuilding(buildingTourism1ID, 0)
					city:SetNumRealBuilding(buildingTourism2ID, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_DragoonTourism)
GameEvents.UnitSetXY.Add(JFD_DragoonTourism)
--==========================================================================================================================
--==========================================================================================================================

