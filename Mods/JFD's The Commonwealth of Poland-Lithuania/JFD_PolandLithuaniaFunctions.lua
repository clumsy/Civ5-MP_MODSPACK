-- JFD_PolandLithuaniaFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_PolandLithuaniaDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsRevisedPoland
------------------------------------------------------------------------------------------------------------------------
function JFD_IsRevisedPoland()
	for row in GameInfo.Traits("JFD_ProductionBoostFromPolicies == 1") do
		if row.Type == "TRAIT_SOLIDARITY" then
			return true
		end
	end
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
local buildingDucalStablesID = GameInfoTypes["BUILDING_DUCAL_STABLE"]
local buildingDucalStablesProductionID = GameInfoTypes["BUILDING_JFD_POLAND_MILITARY_PRODUCTION"]
local buildingEstateID = GameInfoTypes["BUILDING_JFD_ESTATE"]
local buildingEstateHappinessID = GameInfoTypes["BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS"]
local buildingVoivodeGrowthID = GameInfoTypes["BUILDING_JFD_POLAND_VOIVODE_GROWTH"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_POLAND_LITHUANIA"]
local civilisationPolandID = GameInfoTypes["CIVILIZATION_POLAND"]
local improvementPastureID = GameInfoTypes["IMPROVEMENT_PASTURE"]
local isPolandLithuaniaCivActive = JFD_IsCivilisationActive(civilisationID)
local isPolandCivActive = JFD_IsCivilisationActive(civilisationPolandID)
local isPolandRevisionActive = JFD_IsRevisedPoland()
local mathCeil = math.ceil
local policyPolandLithuaniaID = GameInfoTypes["POLICY_JFD_POLAND_LITHUANIA"]
local resourceCowID = GameInfoTypes["RESOURCE_COW"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local resourceSheepID = GameInfoTypes["RESOURCE_SHEEP"]
local unitVoivodeID = GameInfoTypes["UNIT_JFD_VOIVODE"]
local unitPromotionVoivodeID = GameInfoTypes["PROMOTION_JFD_VOIVODE_GROWTH"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]

if isPolandLithuaniaCivActive then
	print("King Sigismund II is in this game")
end

if isPolandCivActive then
	print("King Casimir is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PolandLithuanianCommonwealth
--------------------------------------------------------------------------------------------------------------------------
function JFD_PolandLithuanianCommonwealth(playerID)
	local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local goldenAgePoints = JFD_GetPolandLithuaniaGAPFromHappiness(playerID)
		player:ChangeGoldenAgeProgressMeter(goldenAgePoints)

		if (player:IsGoldenAge() and not (player:HasPolicy(policyPolandLithuaniaID))) then
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyPolandLithuaniaID, true)
		elseif not (player:IsGoldenAge()) then
			if player:HasPolicy(policyPolandLithuaniaID) then
				player:SetHasPolicy(policyPolandLithuaniaID, false)
			end
		end
	end
end

if isPolandLithuaniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PolandLithuanianCommonwealth)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PolandLithuanianWorkedPastures
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumWorkedPastures(playerID, city)
	local numCow = 0
	local numHorse = 0
	local numSheep = 0
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		local plot = city:GetCityIndexPlot(cityPlot)
		if plot then
			if plot:GetOwner() == playerID then
				if city:IsWorkingPlot(plot) then	
					if plot:GetImprovementType() == improvementPastureID then
						if plot:GetResourceType() == resourceCowID then 
							numCow = 1
						end

						if plot:GetResourceType() == resourceHorseID then 
							numHorse = 1
						end

						if plot:GetResourceType() == resourceSheepID then 
							numSheep = 1
						end
					end
				end
			end
		end
	end

	return numCow + numHorse + numSheep
end

function JFD_PolandLithuanianWorkedPastures(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingEstateID) then
				city:SetNumRealBuilding(buildingEstateHappinessID, JFD_GetNumWorkedPastures(playerID, city)) 
			else
				city:SetNumRealBuilding(buildingEstateHappinessID, 0) 
			end
		end
	end
end

if isPolandLithuaniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PolandLithuanianWorkedPastures)
end
--=======================================================================================================================
-- CORE POLAND FUNCTIONS	
--=======================================================================================================================
-- JFD_PolandDucalStables
--------------------------------------------------------------------------------------------------------------------------
function JFD_PolandDucalStables(playerID)
	local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationPolandID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingDucalStablesID) then
				if Teams[player:GetTeam()]:GetAtWarCount(true) > 0 then
					if not city:IsHasBuilding(buildingDucalStablesProductionID) then
						city:SetNumRealBuilding(buildingDucalStablesProductionID, 1)
					end
				else
					if city:IsHasBuilding(buildingDucalStablesProductionID) then
						city:SetNumRealBuilding(buildingDucalStablesProductionID, 0)
					end
				end
			else		
				if city:IsHasBuilding(buildingDucalStablesProductionID) then
					city:SetNumRealBuilding(buildingDucalStablesProductionID, 0)
				end
			end
		end
	end
end

if isPolandCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PolandDucalStables)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_VoivodeCultureBoost
--------------------------------------------------------------------------------------------------------------------------
function JFD_VoivodeCultureBoost(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationPolandID) then 
		local unit = player:GetUnitByID(unitID)
       	if unit:GetUnitType() == unitVoivodeID then 
			if not (unit:IsHasPromotion(unitPromotionVoivodeID)) then
				local cultureBoost = mathCeil(player:GetTotalJONSCulturePerTurn() * 2)
				player:ChangeJONSCulture(cultureBoost)
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), Locale.ConvertTextKey("[COLOR_CULTURE_STORED]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", cultureBoost), 0)
				unit:SetHasPromotion(unitPromotionVoivodeID, true)
			end
		end
    end
end

if isPolandCivActive then
	Events.SerialEventUnitCreated.Add(JFD_VoivodeCultureBoost)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_VoivodeGrowthGarrison
--------------------------------------------------------------------------------------------------------------------------
function JFD_VoivodeGrowthGarrison(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and not (player:IsMinorCiv()) and not (player:IsBarbarian())) then
		for city in player:Cities() do
			if city:IsOccupied() then
				local voivodeIsHere = false
				for city in player:Cities() do
					local plot = city:Plot()
					for i = 0, plot:GetNumUnits() - 1, 1 do
						if plot:GetUnit(i):GetUnitType() == unitVoivodeID then
							voivodeIsHere = true
							break
						end
					end
					
					if voivodeIsHere then
						if not city:IsHasBuilding(buildingVoivodeGrowthID) then
							city:SetNumRealBuilding(buildingVoivodeGrowthID, 1)
						end
					else
						if city:IsHasBuilding(buildingVoivodeGrowthID) then
							city:SetNumRealBuilding(buildingVoivodeGrowthID, 0)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_VoivodeGrowthGarrison)
GameEvents.UnitSetXY.Add(JFD_VoivodeGrowthGarrison)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_VoivodeCultureBoost
--------------------------------------------------------------------------------------------------------------------------
function JFD_PolandProduction(playerID)
	local player = Players[playerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilisationPolandID) then 
		print("so sned it")
		if player:IsHuman() then
			LuaEvents.JFDChooseProductionCity()
		else
			player:GetCapitalCity():ChangeProduction(mathCeil(player:GetCapitalCity():GetBaseYieldRate(yieldProductionID) * 5))
		end
	end
end

if isPolandCivActive and isPolandRevisionActive then
	GameEvents.PlayerAdoptPolicy.Add(JFD_PolandProduction)
	GameEvents.PlayerAdoptPolicyBranch.Add(JFD_PolandProduction)
end
--==========================================================================================================================
--==========================================================================================================================