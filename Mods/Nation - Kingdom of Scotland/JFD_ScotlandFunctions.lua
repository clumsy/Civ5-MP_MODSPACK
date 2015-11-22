-- JFD_ScotlandFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_AddBuilding
--------------------------------------------------------------
function JFD_AddBuilding(city, buildingID)
	if not city:IsHasBuilding(buildingID) then
		city:SetNumRealBuilding(buildingID, 1) 
	end
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
--------------------------------------------------------------
-- JFD_RemoveBuilding
--------------------------------------------------------------
function JFD_RemoveBuilding(city, buildingID)
	if city:IsHasBuilding(buildingID) then
		city:SetNumRealBuilding(buildingID, 0) 
	end
end	
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingCollegeID = GameInfoTypes["BUILDING_JFD_COLLEGE"]
local buildingCollegeGAModID = GameInfoTypes["BUILDING_JFD_SCOTTISH_COLLEGE"]
local buildingWriter1ID = GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_E"]
local buildingWriter2ID = GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_M"]
local buildingWriter3ID = GameInfoTypes["BUILDING_JFD_SCOTTISH_WRITER_S"]
local buildingClassUniversityID = GameInfoTypes["BUILDINGCLASS_UNIVERSITY"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local greatWorkLiteratureID = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local isScotlandCivActive = JFD_IsCivilisationActive(civilisationID)
local mathMin = math.min
local specialistEngineerID = GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local specialistScientistID = GameInfoTypes["SPECIALIST_SCIENTIST"]
local unitHighlanderID = GameInfoTypes["UNIT_JFD_HIGHLANDER"]
local unitPromotionGreatPeopleID = GameInfoTypes["PROMOTION_JFD_SCOTTISH_GP"]

if isScotlandCivActive then
	print("King James VI is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_ScottishGreatPeoplePoints
------------------------------------------------------------------------------------------------------------------------
function JFD_ScottishGreatPeoplePoints(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			if player:IsGoldenAge() then
				if city:GetSpecialistCount(specialistScientistID) > 0 then
					JFD_AddBuilding(city, buildingWriter3ID)
				end

				if city:GetSpecialistCount(specialistEngineerID) > 0 then
					JFD_AddBuilding(city, buildingWriter1ID)
				end

				if city:GetSpecialistCount(specialistMerchantID) > 0 then
					JFD_AddBuilding(city, buildingWriter2ID)
				end
				
			else
				JFD_RemoveBuilding(city, buildingWriter3ID)
				JFD_RemoveBuilding(city, buildingWriter1ID)
				JFD_RemoveBuilding(city, buildingWriter2ID)
			end
		end
	end
end

if isScotlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ScottishGreatPeoplePoints)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_ScottishGreatPeopleGoldenAges
------------------------------------------------------------------------------------------------------------------------
function JFD_ScottishGreatPeopleGoldenAges(playerID, unitID)
    local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local unit = player:GetUnitByID(unitID)
       	if unit:IsGreatPerson() and not unit:IsHasPromotion(unitPromotionGreatPeopleID) then	
			local goldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
			local goldenAgeBoost = math.ceil(player:GetGoldenAgeProgressThreshold() * 20 / 100)
			player:ChangeGoldenAgeProgressMeter(goldenAgeBoost)
			if player:IsHuman() then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_SCOTLAND", goldenAgeBoost)
				Events.GameplayAlertMessage(alertmessage)
			end
			unit:SetHasPromotion(unitPromotionGreatPeopleID, true)
		end
    end
end

if JFD_IsCivilisationActive(civilisationID) then
	Events.SerialEventUnitCreated.Add(JFD_ScottishGreatPeopleGoldenAges)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_CollegeGoldenAges
------------------------------------------------------------------------------------------------------------------------
function JFD_ScottishGreatPeoplePoints(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			if (city:IsHasBuilding() and city:GetNumGreatWorksInBuilding(buildingClassUniversityID) > 0) then
				if player:CountNumBuildings(buildingCollegeGAModID) < 4 then
					JFD_AddBuilding(city, buildingCollegeGAModID)
				end
			else
				JFD_RemoveBuilding(city, buildingCollegeGAModID)
			end
		end
	end
end

if isScotlandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ScottishGreatPeoplePoints)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_HighlanderXP
------------------------------------------------------------------------------------------------------------------------
function JFD_HighlanderXP(playerID, cityID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		local unit = player:GetUnitByID(unitID)
       	if unit:GetUnitType() == unitHighlanderID then
			local city = player:GetCityByID(cityID)
			local numGreatWorks = mathMin(city:GetNumGreatWorks(greatWorkLiteratureID) * 7, 30)
			if numGreatWorks > 0 then
				unit:ChangeExperience(numGreatWorks)
			end
		end
    end
end

if isScotlandCivActive then
	GameEvents.CityTrained.Add(JFD_HighlanderXP)
end
--==========================================================================================================================
--==========================================================================================================================