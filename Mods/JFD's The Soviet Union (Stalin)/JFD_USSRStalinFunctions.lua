-- JFD_USSRStalinFunctions
-- Author: JFD
-- DateCreated: 5/6/2014 4:50:19 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
--JFD_GetStalinIdeologyID
-------------------------------------------------------------------------------------------------------------------------
local policyBranchAutocracyID = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local policyBranchFreedomID = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local policyBranchOrderID = GameInfoTypes["POLICY_BRANCH_ORDER"]

function JFD_GetStalinIdeologyID(playerID)
	local stalinIdeologyID 
	local player = Players[playerID]
	if player:IsPolicyBranchUnlocked(policyBranchAutocracyID) then
		stalinIdeologyID = policyBranchAutocracyID
	elseif player:IsPolicyBranchUnlocked(policyBranchFreedomID) then
		stalinIdeologyID = policyBranchFreedomID
	elseif player:IsPolicyBranchUnlocked(policyBranchOrderID) then
		stalinIdeologyID = policyBranchOrderID
	end
	
	return stalinIdeologyID
end
-------------------------------------------------------------------------------------------------------------------------
--JFD_GetStalinPlayerID
------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"]

function JFD_GetStalinPlayerID()
	local stalinPlayerID = nil
	if stalinPlayerID == nil then	
		for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local player = Players[playerID]			
			if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then
				stalinPlayerID = playerID
				break
			end
		end
	end
	
	return stalinPlayerID
end
-------------------------------------------------------------------------------------------------------------------------
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
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingCommissariatID = GameInfoTypes["BUILDING_JFD_STALIN_COMMISSARIAT"]
local buildingSovietSatellitesID = GameInfoTypes["BUILDING_JFD_STALIN_SATELLITES"]
local isUSSRStalinCivActive = JFD_IsCivilisationActive(civilisationID)
local gameSpeedEpicID = GameInfoTypes["GAMESPEED_EPIC"]
local gameSpeedMarathonID = GameInfoTypes["GAMESPEED_MARATHON"]
local gameSpeedQuickID = GameInfoTypes["GAMESPEED_QUICK"]
local gameSpeedStandardID = GameInfoTypes["GAMESPEED_STANDARD"]
local mathMin = math.min
local policyEpicID = GameInfoTypes["POLICY_JFD_STALIN_EPIC"]
local policyMarathonID = GameInfoTypes["POLICY_JFD_STALIN_MARATHON"]
local policyQuickID = GameInfoTypes["POLICY_JFD_STALIN_QUICK"]
local policyStandardID = GameInfoTypes["POLICY_JFD_STALIN_STANDARD"]
local promotionIS2ID = GameInfoTypes["PROMOTION_JFD_STALIN_IS2"]
local promotionIS2InfoID = GameInfoTypes["PROMOTION_JFD_STALIN_IS2_INFO"]
local promotionWarsawPactID = GameInfoTypes["PROMOTION_JFD_WARSAW_PACT"]
local stalinPlayerID = JFD_GetStalinPlayerID()

if isUSSRStalinCivActive then
	print("Premier Stalin is in this game")
end
-------------------------------------------------------------------------------------------------------------------------
--JFD_InitStalin
-------------------------------------------------------------------------------------------------------------------------
function JFD_InitStalin()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			local policySpeeds = {} or policyStandardID
				policySpeeds[gameSpeedQuickID] 		= policyQuickID
				policySpeeds[gameSpeedStandardID] 	= policyStandardID
				policySpeeds[gameSpeedEpicID] 		= policyEpicID
				policySpeeds[gameSpeedMarathonID] 	= policyMarathonID
			
			local policyID = policySpeeds[Game.GetGameSpeedType()]
			if not player:HasPolicy(policyID) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyID, true)	
			end
		end
	end 
end

if isUSSRStalinCivActive then
	Events.LoadScreenClose.Add(JFD_InitStalin)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SatelliteStates
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumCSConnections(playerID, city)
	local player = Players[playerID]
	local numCSConnections = 0
	local tradeRoutes = player:GetTradeRoutes()
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		local targetCity = v.ToCity
		if city == originatingCity then
			if Players[targetCity:GetOwner()]:IsMinorCiv() then
				numCSConnections = numCSConnections + 1
			end
		end
	end
	
	return numCSConnections
end

function JFD_SatelliteStatesProductionBonus(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for city in player:Cities() do
			if city:IsHasBuilding(buildingCommissariatID) then 
				city:SetNumRealBuilding(buildingSovietSatellitesID, mathMin(JFD_GetNumCSConnections(playerID, city), 3))
			end
		end
	end
end

if isUSSRStalinCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_SatelliteStatesProductionBonus)
	Events.SerialEventEnterCityScreen.Add(JFD_SatelliteStatesProductionBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_WarsawPact
----------------------------------------------------------------------------------------------------------------------------
function JFD_IsPlayerAtWarWithStalin(playerID)
	local isAtWarWithStalin = false
	if playerID ~= stalinPlayerID then
		local player = Players[playerID]
		local stalinPlayer = Players[stalinPlayerID]
		if Teams[player:GetTeam()]:IsAtWar(stalinPlayer:GetTeam()) then
			isAtWarWithStalin = true
		end
	end
	
	return isAtWarWithStalin
end

function JFD_IsPlotBelongToSovietUnion(plot)
	local stalinistIdeologyID = JFD_GetStalinIdeologyID(stalinPlayerID)
	local isPlotSovietUnion = false
	if plot:GetOwner() > -1 then
		local player = Players[plot:GetOwner()]
		if ((player:IsMinorCiv() and player:GetMinorCivFriendshipLevelWithMajor(stalinPlayerID) >= 1) or (stalinistIdeologyID and player:IsPolicyBranchUnlocked(stalinistIdeologyID))) then
			isPlotSovietUnion = true
		end
	end
	
	return isPlotSovietUnion
end

function JFD_WarsawPact(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsEverAlive() and JFD_IsPlayerAtWarWithStalin(playerID)) then
		local isUnitInSovietTerritory = false
		local unit = player:GetUnitByID(unitID)
		local plot = unit:GetPlot()
		if (plot and (plot:GetOwner() == stalinPlayerID or JFD_IsPlotBelongToSovietUnion(plot))) then
			isUnitInSovietTerritory = true
		end
		
		unit:SetHasPromotion(promotionWarsawPactID, isUnitInSovietTerritory)
	end
end

if isUSSRStalinCivActive then
	GameEvents.UnitSetXY.Add(JFD_WarsawPact)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IS2Bonuses
----------------------------------------------------------------------------------------------------------------------------
function JFD_IS2Bonuses(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:IsAlive() and not (player:IsBarbarian()) and not (player:IsMinorCiv())) then 
		local unit = player:GetUnitByID(unitID)
		local isUnitInSovietTerritory = false
		if (unit and (unit:IsHasPromotion(promotionIS2InfoID) or unit:IsHasPromotion(promotionIS2ID))) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY())
			if (plot and (plot:GetOwner() == stalinPlayerID or JFD_IsPlotBelongToSovietUnion(plot))) then
				isUnitInSovietTerritory = true
			end
		end
		
		if isUnitInSovietTerritory then
			if unit:IsHasPromotion(promotionIS2InfoID) then
				unit:SetHasPromotion(promotionIS2InfoID, false)
				unit:SetHasPromotion(promotionIS2ID, true)	
			end
		else
			if unit:IsHasPromotion(promotionIS2ID) then
				unit:SetHasPromotion(promotionIS2InfoID, true)
				unit:SetHasPromotion(promotionIS2ID, false)	
			end
		end		
	end
end
GameEvents.UnitSetXY.Add(JFD_IS2Bonuses)		
--=======================================================================================================================
--=======================================================================================================================