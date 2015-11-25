-- JFD_MinoaFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "MC_Minoans";
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingAnaktoraID = GameInfoTypes["BUILDING_MC_MINOAN_ANAKTORA"]
local buildingAnaktoraHappinessID = GameInfoTypes["BUILDING_MC_ANAKTORA_HAPPINESS"]
local buildingAnaktoraScienceID = GameInfoTypes["BUILDING_MC_ANAKTORA_SCIENCE"]
local buildingMinoanCargoShipID = GameInfoTypes["BUILDING_MC_MINOAN_CARGO"]
local buildingMinoanTradeRouteID = GameInfoTypes["BUILDING_MC_MINOAN_TR"]
local civilisationID = GameInfoTypes["CIVILIZATION_MC_MINOA"]
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local isMinoaCivActive = JFD_IsCivilisationActive(civilisationID)

if isMinoaCivActive then
	print("King Minos is in the game")
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_GoldenAgeOnCoastalCityFounded
----------------------------------------------------------------------------------------------------------------------------
function JFD_GoldenAgeOnCoastalCityFounded(playerID, cityX, cityY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if (city:IsCoastal() and not (load(player, "JFD_MinoanGoldenAge"))) then
			player:ChangeGoldenAgeTurns(12)
			city:SetNumRealBuilding(buildingMinoanCargoShipID, 1)
			save(player, "JFD_MinoanGoldenAge", true)
		end

		if city == player:GetCapitalCity() then
			city:SetNumRealBuilding(buildingMinoanTradeRouteID, 1)
		end		
	end
end

if isMinoaCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_GoldenAgeOnCoastalCityFounded)	
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MinoanCargoShipLength
----------------------------------------------------------------------------------------------------------------------------
function JFD_MinoanCargoShipLength(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			if not (city:IsHasBuilding(buildingMinoanCargoShipID)) then
				city:SetNumRealBuilding(buildingMinoanCargoShipID, 1)
			end
		end
	end
end

if isMinoaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_MinoanCargoShipLength)	
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AnaktoraCoastalHappiness
----------------------------------------------------------------------------------------------------------------------------
function JFD_AnaktoraCoastalHappiness(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			if city:IsCoastal() then
				if (city:IsHasBuilding(buildingAnaktoraID) and not (city:IsHasBuilding(buildingAnaktoraHappinessID))) then
					city:SetNumRealBuilding(buildingAnaktoraHappinessID, 1)
				end
			end
		end
	end
end

if isMinoaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AnaktoraCoastalHappiness)
	Events.SerialEventEnterCityScreen.Add(JFD_AnaktoraCoastalHappiness)	
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AnaktoraScience
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumberConnectedSeaTradeRoutes(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutes()
	local numConnectedRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local domain = v.Domain
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if (domain == domainSeaID and (targetCity == city or originatingCity == city)) then
			numConnectedRoutes = numConnectedRoutes + 1
		end
	end
	
	tTradeRoutes = player:GetTradeRoutesToYou()
	for i, v in ipairs(tTradeRoutes) do
		local domain = v.Domain
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if (domain == domainSeaID and (targetCity == city or originatingCity == city)) then
			numConnectedRoutes = numConnectedRoutes + 1
		end
	end
	
	return numConnectedRoutes
end

function JFD_AnaktoraScience(playerID)
	local playerID = playerID or Game.GetActivePlayer()
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if player:IsGoldenAge() then
			for city in player:Cities() do
				if city:IsCoastal() then
					if city:IsHasBuilding(buildingAnaktoraID) then
						city:SetNumRealBuilding(buildingAnaktoraScienceID, JFD_GetNumberConnectedSeaTradeRoutes(playerID, city))
					end
				end
			end
		end
	end
end

if isMinoaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_AnaktoraScience)	
	Events.SerialEventEnterCityScreen.Add(JFD_AnaktoraScience)
end
--==========================================================================================================================
--==========================================================================================================================