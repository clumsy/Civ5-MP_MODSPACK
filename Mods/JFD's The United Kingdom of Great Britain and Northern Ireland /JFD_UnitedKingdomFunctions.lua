-- United Kingdom Functions
-- Author: JFD
-- DateCreated: 6/17/2014 10:17:21 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]

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

if JFD_IsCivilisationActive(civilisationID) then
	print("Prime Minister Churchill is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumFriendships
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumFriendships(playerID)
	local player = Players[playerID]
	local numFriendships = 0
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		if Players[iPlayer]:IsDoF(playerID) then
			numFriendships = numFriendships + 1
		end
	end

	return numFriendships
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- JFD_AirAndNavalProduction
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumPledgesofProtection(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local numPledgesofProtection = 0
	
	for iPlayer, cityStatePlayer in pairs(Players) do
		if cityStatePlayer:IsAlive() and cityStatePlayer:IsMinorCiv() then
			if cityStatePlayer:IsProtectedByMajor(playerID) then
				numPledgesofProtection = numPledgesofProtection + 1
			end
		end	
	end
	
	return numPledgesofProtection 
end

function JFD_AirAndNavalProduction(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION"], math.min(10, JFD_GetNumPledgesofProtection(playerID)))
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_AirAndNavalProduction)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SeaTradeRouteProduction
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumSeaTradeRoutesFromCity(playerID, city)
	local player = Players[playerID]
	local numSeaTradeRoutes = 0
	local tradeRoutes = player:GetTradeRoutes()
	for i, v in ipairs(tradeRoutes) do
		local domain = v.Domain
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if city == originatingCity then
			if domain == GameInfoTypes["DOMAIN_SEA"] then
				numSeaTradeRoutes = numSeaTradeRoutes + 1
			end
		end
	end
	
	return numSeaTradeRoutes * ((player:GetCurrentEra() + 1) / 2)
end

function JFD_SeaTradeRouteProduction(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then
		for city in player:Cities() do
			if city:IsCoastal() then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SEA_TRADE_PRODUCTION"], JFD_GetNumSeaTradeRoutesFromCity(playerID, city))
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_SeaTradeRouteProduction)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_TradeRoutesFromDoF
------------------------------------------------------------------------------------------------------------------------
function JFD_TradeRoutesFromDoF(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then
		if player:HasPolicy(GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"]) then
			if JFD_GetNumFriendships(playerID) > 0 then
				player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"], 1)
			else
				if player:GetCapitalCity():IsHasBuilding(GameInfoTypes["BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"]) then
					player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"], 0)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_TradeRoutesFromDoF)
end
--=======================================================================================================================
--=======================================================================================================================