-- JFD_RussiaPeterFunctions
-- Author: JFD
-- DateCreated: 3/12/2014 9:35:16 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_PeterDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
local buildingKrepostID = GameInfoTypes["BUILDING_KREPOST"]
local buildingKrepostExpansionID = GameInfoTypes["BUILDING_JFD_PETRINE_EXPANSION"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PETRINE_RUSSIA"]
local improvementCitadelID = GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementFortID = GameInfoTypes["IMPROVEMENT_FORT"]
local isPetersRussiaCivActive = JFD_IsCivilisationActive(civilisationID)
local mathMin = math.min
local policyPetrineRussiaID = GameInfoTypes["POLICY_JFD_PETRINE_RUSSIA"]
local unitPromotionStreltsyID = GameInfoTypes["PROMOTION_JFD_STRETLSY"]
local unitPromotionStreltsyDefenseID = GameInfoTypes["PROMOTION_JFD_STRETLSY_DEFENSE"]

if isPetersRussiaCivActive then
	print("Emperor Peter is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
--InitPeter
----------------------------------------------------------------------------------------------------------------------------
function InitPeter(player)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			if not (player:HasPolicy(policyPetrineRussiaID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyPetrineRussiaID, true)	
			end
		end
	end 
end

if isPetersRussiaCivActive then
	Events.SequenceGameInitComplete.Add(InitPeter)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ScientificDiffusion
----------------------------------------------------------------------------------------------------------------------------	
function JFD_ScientificDiffusion(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local playerTeam = Teams[player:GetTeam()]
			local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer ~= player and otherPlayer:IsAlive() then
				local otherTeam = Teams[otherPlayer:GetTeam()]
				if otherPlayer:IsDoF(playerID) then
					for row in GameInfo.Technologies() do
						if otherTeam:IsHasTech(row.ID) and player:GetCurrentResearch() == row.ID then
							local modifier = JFD_GetScienceFromDoF(playerID)
							teamTechs:ChangeResearchProgress(row.ID, modifier, playerID)
						end
					end
				end
			end
		end
	end
end

if isPetersRussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ScientificDiffusion)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_KrepostExpansion
----------------------------------------------------------------------------------------------------------------------------	
function JFD_KrepostExpansion(playerID, cityID, buildingID)
	local player = Players[playerID]
    if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		if buildingID == buildingKrepostID then
			local city = player:GetCityByID(cityID)
			if not (city:IsHasBuilding(buildingKrepostExpansionID)) then
				local capital = player:GetCapitalCity()
				local capitalX = capital:GetX()
				local capitalY = capital:GetY()
				local cityX = city:GetX()
				local cityY = city:GetY()
				local distance = Map.PlotDistance(cityX, cityY, capitalX, capitalY)
				city:SetNumRealBuilding(buildingKrepostExpansionID, mathMin(100, distance))
			end
		end
	end
end

if isPetersRussiaCivActive then
	GameEvents.CityConstructed.Add(JFD_KrepostExpansion)
end	
----------------------------------------------------------------------------------------------------------------------------
-- JFD_StreltsyDefense
----------------------------------------------------------------------------------------------------------------------------	
function JFD_StreltsyDefense(playerID, unitID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		local unit = player:GetUnitByID(unitID)
		if unit:IsHasPromotion(unitPromotionStreltsyID) or unit:IsHasPromotion(unitPromotionStreltsyDefenseID) then
			if Map.GetPlot(unit:GetX(), unit:GetY()) then
				local plot = Map.GetPlot(unit:GetX(), unit:GetY())
				local giveDefense = false
				if plot:GetPlotCity() and plot:GetPlotCity():IsHasBuilding(buildingKrepostID) then
					giveDefense = true
				elseif plot:GetImprovementType() == improvementCitadelID or plot:GetImprovementType() == improvementFortID then
					giveDefense = true
				end

				if giveDefense then
					if unit:IsHasPromotion(unitPromotionStreltsyID) then
						unit:SetHasPromotion(unitPromotionStreltsyDefenseID, true)
						unit:SetHasPromotion(unitPromotionStreltsyID, false)
					end
				else
					unit:SetHasPromotion(unitPromotionStreltsyDefenseID, false)
					unit:SetHasPromotion(unitPromotionStreltsyID, true)
				end
			end
		end				
	end
end

function JFD_StreltsyDefenseTurn(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for unit in player:Units() do
			if (unit:IsHasPromotion(unitPromotionStreltsyID) or unit:IsHasPromotion(unitPromotionStreltsyDefenseID)) then
				if Map.GetPlot(unit:GetX(), unit:GetY()) then
					local plot = Map.GetPlot(unit:GetX(), unit:GetY())
					local giveDefense = false
					if plot:GetPlotCity() and plot:GetPlotCity():IsHasBuilding(buildingKrepostID) then
						giveDefense = true
						break
					elseif plot:GetImprovementType() == improvementCitadelID or plot:GetImprovementType() == improvementFortID then
						giveDefense = true
						break
					end

					if giveDefense then
						if unit:IsHasPromotion(unitPromotionStreltsyID) then
							unit:SetHasPromotion(unitPromotionStreltsyDefenseID, true)
							unit:SetHasPromotion(unitPromotionStreltsyID, false)
						end
					else
						unit:SetHasPromotion(unitPromotionStreltsyDefenseID, false)
						unit:SetHasPromotion(unitPromotionStreltsyID, true)
					end
				end
			end
		end				
	end
end

if isPetersRussiaCivActive then
	GameEvents.UnitSetXY.Add(JFD_StreltsyDefense)	
	GameEvents.CityTrained.Add(JFD_StreltsyDefense)
	GameEvents.PlayerDoTurn.Add(JFD_StreltsyDefenseTurn)
end
--==========================================================================================================================
--==========================================================================================================================