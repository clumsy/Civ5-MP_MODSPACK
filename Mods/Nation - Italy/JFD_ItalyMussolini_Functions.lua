-- JFD_ItalyMussolini_Functions
-- Author: JFD
-- DateCreated: 4/28/2014 9:56:46 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--=======================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ITALY"]

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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayer						= Players[Game.GetActivePlayer()]
local civilisationID					= GameInfoTypes["CIVILIZATION_JFD_ITALY"]
local isMussoliniItalyCivActive			= JFD_IsCivilisationActive(civilisationID)
local isMussoliniItalyCivActivePlayer   = activePlayer:GetCivilizationType() == civilisationID
local mathCeil							= math.ceil

if isMussoliniItalyCivActive then
	print("Prime Minister Mussolini is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_RomanProduction
----------------------------------------------------------------------------------------------------------------------------
local buildingItalianProductionID = GameInfoTypes["BUILDING_JFD_ITALIAN_PRODUCTION"]

function JFD_RomanProduction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if (player:GetCivilizationType() == civilisationID) then
			if player:IsGoldenAge() then
				for city in player:Cities() do
					local cityProductionID = city:GetProductionBuilding()
					if (cityProductionID and player:GetCapitalCity():IsHasBuilding(cityProductionID)) then
						if (not city:IsHasBuilding(buildingItalianProductionID)) then
							city:SetNumRealBuilding(buildingItalianProductionID, 1)
						end
					else	
						if city:IsHasBuilding(buildingItalianProductionID) then
							city:SetNumRealBuilding(buildingItalianProductionID, 0)
						end
					end
				end
			else
				for city in player:Cities() do
					if city:IsHasBuilding(buildingItalianProductionID) then
						city:SetNumRealBuilding(buildingItalianProductionID, 0)
					end
				end
			end
		end
	end
end

function JFD_RomanProductionCityView(playerID)
	local player = Players[Game.GetActivePlayer()]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if player:IsGoldenAge() then
			local city = UI.GetHeadSelectedCity()
			if city then
				local cityProductionID = city:GetProductionBuilding()
				if (cityProductionID and player:GetCapitalCity():IsHasBuilding(cityProductionID)) then
					if (not city:IsHasBuilding(buildingItalianProductionID)) then
						city:SetNumRealBuilding(buildingItalianProductionID, 1)
					end
				else	
					if city:IsHasBuilding(buildingItalianProductionID) then
						city:SetNumRealBuilding(buildingItalianProductionID, 0)
					end
				end
			end
		else	
			local city = UI.GetHeadSelectedCity()
			if city:IsHasBuilding(buildingItalianProductionID) then
				city:SetNumRealBuilding(buildingItalianProductionID, 0)
			end
		end
	end
end

if isMussoliniItalyCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_RomanProduction)
	if isMussoliniItalyCivActivePlayer then
		Events.SerialEventEnterCityScreen.Add(JFD_RomanProductionCityView)
		Events.SerialEventExitCityScreen.Add(JFD_RomanProductionCityView)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_GoldenAgeCoastalCities
----------------------------------------------------------------------------------------------------------------------------
function JFD_GoldenAgeCoastalCitiesConquest(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if city:IsCoastal() then
			local currentEra = player:GetCurrentEra() + 1
			local goldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
			local goldenAgeBoost = mathCeil((currentEra * goldenAgeModifier) / 4.5)
			if capital then
				goldenAgeBoost = mathCeil((currentEra * goldenAgeModifier) / 4)
			end

			if player:IsHuman() and goldenAgeBoost > 0 then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_ITALIAN_MARE_NOSTRUM", goldenAgeBoost)
				Events.GameplayAlertMessage(alertmessage)
			end
			
			player:ChangeGoldenAgeProgressMeter(goldenAgeBoost)
		end
	end
end

if isMussoliniItalyCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_GoldenAgeCoastalCitiesConquest)	
end
		
function JFD_GoldenAgeCoastalCitiesSettled(playerID, cityX, cityY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if city:IsCoastal() then
			local currentEra = player:GetCurrentEra() + 1
			local goldenAgeModifier = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
			local goldenAgeBoost = mathCeil((currentEra * goldenAgeModifier) / 3.5)
			if capital then
				goldenAgeBoost = mathCeil((currentEra * goldenAgeModifier) / 3)
			end
			
			if player:IsHuman() and goldenAgeBoost > 0 then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_ITALIAN_MARE_NOSTRUM", goldenAgeBoost)
				Events.GameplayAlertMessage(alertmessage)
			end

			player:ChangeGoldenAgeProgressMeter(goldenAgeBoost)
		end
	end
end

if isMussoliniItalyCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_GoldenAgeCoastalCitiesSettled)	
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CarabineiriResistance
----------------------------------------------------------------------------------------------------------------------------
local promotionCarabineiriID = GameInfoTypes["PROMOTION_JFD_CARABINEIRI_POLICING"]	

function JFD_CarabineiriResistance(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if (city:GetResistanceTurns() > 0 and city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(promotionCarabineiriID)) then
			city:ChangeResistanceTurns(-1)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CarabineiriResistance)
--==========================================================================================================================
--==========================================================================================================================