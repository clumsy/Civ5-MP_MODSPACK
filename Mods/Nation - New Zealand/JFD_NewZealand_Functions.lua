-- JFD_NewZealand_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_GetNumInternationalTradeRoutes
--------------------------------------------------------------
function JFD_GetNumInternationalTradeRoutes(playerID)
	local player = Players[playerID]
	local numTradeRoutes = 0 
	local tradeRoutes = player:GetTradeRoutes()
	for _, tradeRoute in ipairs(tradeRoutes) do
		if (tradeRoute.FromCivilizationType ~= tradeRoute.ToCivilizationType) then
			numTradeRoutes = numTradeRoutes + 1
			if numTradeRoutes >= 3 then
				break
			end
		end
	end

	return numTradeRoutes
end
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID  = GameInfoTypes["CIVILIZATION_JFD_NEW_ZEALAND"]
local isCivActive	  = JFD_IsCivilisationActive(civilisationID)
local mathMax		  = math.max

if isCivActive then
	print("Prime Minister Richard Seedon is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_RoyalAcademyConstruction
----------------------------------------------------------------------------------------------------------------------------
local buildingNewZealandGrowthID = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_GROWTH"]
local buildingNewZealandTrade1ID = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_TRADE_1"]
local buildingNewZealandTrade2ID = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_TRADE_2"]

function JFD_NewZealandGrowthAndTrade(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID and player:GetCapitalCity()) then
		local capitalCity = player:GetCapitalCity()
		for city in player:Cities() do
			local numINTradeRoutes = JFD_GetNumInternationalTradeRoutes(playerID)
			city:SetNumRealBuilding(buildingNewZealandGrowthID, numINTradeRoutes)
		end

		local numDefensivePacts = Teams[player:GetTeam()]:GetDefensivePactCount()
		if numDefensivePacts > 0 then
			if (not capitalCity:IsHasBuilding(buildingNewZealandTrade1ID)) then
				capitalCity:SetNumRealBuilding(buildingNewZealandTrade1ID, 1)
				capitalCity:SetNumRealBuilding(buildingNewZealandTrade2ID, 1)
			end
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
					local otherTeam = Teams[otherPlayer:GetTeam()]
					if otherTeam:IsDefensivePact(player:GetTeam()) then
						otherPlayer:GetCapitalCity():SetNumRealBuilding(buildingNewZealandTrade1ID, 1)
					end
				end
			end
		else
			if capitalCity:IsHasBuilding(buildingNewZealandTrade1ID) then
				capitalCity:SetNumRealBuilding(buildingNewZealandTrade1ID, 0)
				capitalCity:SetNumRealBuilding(buildingNewZealandTrade2ID, 0)
			end

			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
					local otherCapitalCity = otherPlayer:GetCapitalCity()
					if otherCapitalCity:IsHasBuilding(buildingNewZealandTrade1ID) then
						otherCapitalCity:SetNumRealBuilding(buildingNewZealandTrade1ID, 0)
					end
				end
			end
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_NewZealandGrowthAndTrade)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_DefenderCargoShipBonuses
----------------------------------------------------------------------------------------------------------------------------
local unitCargoShipID				= GameInfoTypes["UNIT_CARGO_SHIP"]
local unitPromotionDefenderID		= GameInfoTypes["PROMOTION_JFD_DEFENDER"]
local unitPromotionDefenderInfoID	= GameInfoTypes["PROMOTION_JFD_DEFENDER_INFO"]

function JFD_DefenderCargoShipBonuses(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsMinorCiv()) and (not player:IsBarbarian())) then 
		local unit = player:GetUnitByID(unitID)
		local friendlyCityNearby = false
		if (unit and (unit:IsHasPromotion(unitPromotionDefenderID) or unit:IsHasPromotion(unitPromotionDefenderInfoID))) then
			local unitPlot = unit:GetPlot()
			if unitPlot then
				if unitPlot:IsPlayerCityRadius(playerID) then 
					friendlyCityNearby = true
				else
					local playerTeam = Teams[player:GetTeam()]
					for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
						local otherPlayer = Players[otherPlayerID]
						if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then	
							local otherTeamID = otherPlayer:GetTeam()
							if playerTeam:IsDefensivePact(otherTeamID) then
								if unitPlot:IsPlayerCityRadius(otherPlayerID) then 
									friendlyCityNearby = true
									break
								end
							end
						end
					end
				end
			end
			
			if friendlyCityNearby then
				if (not unit:IsHasPromotion(unitPromotionDefenderID)) then
					unit:SetHasPromotion(unitPromotionDefenderID, true)
					unit:SetHasPromotion(unitPromotionDefenderInfoID, false)
				end
			else
				if unit:IsHasPromotion(unitPromotionDefenderID) then
					unit:SetHasPromotion(unitPromotionDefenderID, false)
					unit:SetHasPromotion(unitPromotionDefenderInfoID, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_DefenderCargoShipBonuses)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ANZACForeignHealing
----------------------------------------------------------------------------------------------------------------------------
local unitPromotionANZACID = GameInfoTypes["PROMOTION_JFD_ANZAC"]

function JFD_ANZACForeignHealing(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCapitalCity() and (not player:IsMinorCiv()) and (not player:IsBarbarian())) then 
		local capital = player:GetCapitalCity()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		for unit in player:Units() do
			if unit:GetDamage() > 0 then
				if (unit:IsHasPromotion(unitPromotionANZACID) and unit:GetPlot():GetOwner() ~= playerID) then
					local healFromDistance = mathMax(Map.PlotDistance(capitalX, capitalY, unit:GetX(), unit:GetY()), 30)
					print(healFromDistance)
					unit:ChangeDamage(-healFromDistance)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ANZACForeignHealing)
--==========================================================================================================================
--==========================================================================================================================