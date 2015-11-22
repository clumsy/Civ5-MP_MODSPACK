-- JFD_DenmarkNorwayFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
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
--------------------------------------------------------------
-- isUsingNorway|isUsingCivPack1
--------------------------------------------------------------
local norwayModID = "c6ea60cf-6bcd-4b67-b82e-8d879022e175"
local civPack1ModID = "7963015a-f3d0-4ae9-a87c-86115eaf0c87"
local isUsingNorway = false
local isUsingCivPack1 = false

for _, mod in pairs(Modding.GetActivatedMods()) do
  if (mod.ID == norwayModID) then
    isUsingNorway = true
    break
  end  
end

for _, mod in pairs(Modding.GetActivatedMods()) do
  if (mod.ID == civPack1ModID) then
    isUsingCivPack1 = true
    break
  end  
end
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
-------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
--==========================================================================================================================
-- CORE DENARMK-NORWAY FUNCTIONS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_DENMARK_NORWAY"]
local improvementSeaFortressID = GameInfoTypes["IMPROVEMENT_JFD_SEA_FORTRESS"]
local isDenmarkNorwayCivActive = JFD_IsCivilisationActive(civilisationID)
local mathCeil = math.ceil
local unitKontreadmiralID = GameInfoTypes["UNIT_JFD_KONTREADMIRAL"]
local unitTriremeID = GameInfoTypes["UNIT_TRIREME"]
local unitPromotionGreatAdmiralID = GameInfoTypes["PROMOTION_GREAT_ADMIRAL"]
local unitPromotionSkiInfantryMovesID = GameInfoTypes["PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES"]
			
if isDenmarkNorwayCivActive then
	print("King Christian IV is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_GreatAdmiralPoints
----------------------------------------------------------------------------------------------------------------------------
function JFD_GreatAdmiralPointsConquest(oldOwnerID, capital, cityX, cityY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local city = Map.GetPlot(cityX, cityY):GetPlotCity()
		if city:IsCoastal() then
			local speedMod = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
			local greatAdmiralPoints = mathCeil((1*speedMod) / 3)
			if capital then
				greatAdmiralPoints = mathCeil((2*speedMod) / 3)
			end

			if (player:IsHuman() and greatAdmiralPoints > 0) then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_DANO_NORWEGIAN_GREAT_ADMIRAL_POINTS", greatAdmiralPoints)
				Events.GameplayAlertMessage(alertmessage)
			end
			
			player:ChangeNavalCombatExperience(greatAdmiralPoints)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityCaptureComplete.Add(JFD_GreatAdmiralPointsConquest)	
end
		
function JFD_GreatAdmiralPointsSettled(playerID, plotX, plotY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if city:IsCoastal() then
			local speedMod = GameInfo.GameSpeeds[Game:GetGameSpeedType()].GoldenAgePercent
			local greatAdmiralPoints = mathCeil((0.8*speedMod) / 3)
			if city:IsOriginalCapital() then
				greatAdmiralPoints = mathCeil((1.5*speedMod) / 3)
			end
			
			if (player:IsHuman() and greatAdmiralPoints > 0) then
				local alertmessage = Locale.ConvertTextKey("TXT_KEY_JFD_DANO_NORWEGIAN_GREAT_ADMIRAL_POINTS", greatAdmiralPoints)
				Events.GameplayAlertMessage(alertmessage)
			end

			player:ChangeNavalCombatExperience(greatAdmiralPoints)
		end
	end
end

if isDenmarkNorwayCivActive then
	GameEvents.PlayerCityFounded.Add(JFD_GreatAdmiralPointsSettled)	
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_KontreadmiralConversion
----------------------------------------------------------------------------------------------------------------------------
 function JFD_KontreadmiralConversion(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
    if player:IsAlive() then 
		if improvementID == improvementSeaFortressID then
			local plot = Map.GetPlot(plotX, plotY)
			if plot:GetUnit():GetUnitType() == unitKontreadmiralID then
				local kontreadmiral = plot:GetUnit()
				local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_NAVALMELEE", "UNITCOMBAT_NAVALRANGED") or unitTriremeID
				local newUnit = player:InitUnit(unitID, plotX, plotY)
				newUnit:Convert(kontreadmiral)
				newUnit:SetHasPromotion(unitPromotionGreatAdmiralID, false)
				newUnit:ChangeExperience(30)
			end			
		end
	end
end

if isDenmarkNorwayCivActive then
	GameEvents.BuildFinished.Add(JFD_KontreadmiralConversion)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SkiInfantryMovement
----------------------------------------------------------------------------------------------------------------------------
function JFD_SkiInfantryMovement(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and not (player:IsBarbarian()) and not (player:IsMinorCiv())) then 
		for unit in player:Units() do
			local combatStrength = 34
			if (unit:GetPlot():IsHills() and unit:IsHasPromotion(unitPromotionSkiInfantryMovesID)) then
				unit:ChangeMoves(unit:GetMoves() + 1)
				unit:SetBaseCombatStrength(combatStrength + combatStrength * 20 / 100)
			else
				if unit:IsHasPromotion(unitPromotionSkiInfantryMovesID) then
					unit:SetBaseCombatStrength(combatStrength)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SkiInfantryMovement)
--=======================================================================================================================
-- CORE DENMARK FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local techCompassID = GameInfoTypes["TECH_COMPASS"]
local unitLongboatID = GameInfoTypes["UNIT_JFD_LONGBOAT"]
local unitLongboatUpgradedID = GameInfoTypes["UNIT_JFD_LONGBOAT_UPGRADE"]
local unitDomainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitPromotionLongboatBonusID = GameInfoTypes["PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT"]
local unitPromotionLongboatLandBonusID = GameInfoTypes["PROMOTION_JFD_LAND_UNIT_BONUS"]
--------------------------------------------------------------------------------------------------------------------------
-- JFD_LongboatCombatBonus
--------------------------------------------------------------------------------------------------------------------------
function JFD_LongboatCombatBonus(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local longboatNearby = false
	local unit = player:GetUnitByID(unitID)
	if (unit and unit:IsCombatUnit() and unit:GetDomainType() == unitDomainLandID and not unit:IsEmbarked()) then
		for longboat in player:Units() do
			if longboat:IsHasPromotion(unitPromotionLongboatBonusID) then
				local longboatX = longboat:GetX()
				local longboatY = longboat:GetY()
				if Map.PlotDistance(unitX, unitY, longboatX, longboatY) < 3 then
					longboatNearby = true
					break
				end
			end
		end
		
		if longboatNearby then
			if not unit:IsHasPromotion(unitPromotionLongboatLandBonusID) then
				unit:SetHasPromotion(unitPromotionLongboatLandBonusID, true)
			end
		else
			if unit:IsHasPromotion(unitPromotionLongboatLandBonusID) then
				unit:SetHasPromotion(unitPromotionLongboatLandBonusID, false)
			end
		end
	else
		if unit:IsHasPromotion(unitPromotionLongboatLandBonusID) then
			unit:SetHasPromotion(unitPromotionLongboatLandBonusID, false)
		end
	end
end

if (not (isUsingNorway) and not (isUsingCivPack1)) then
	GameEvents.UnitSetXY.Add(JFD_LongboatCombatBonus) 
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_LongboatUpgrade
--------------------------------------------------------------------------------------------------------------------------
function JFD_LongboatUpgrade(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if techID == techCompassID then
		for unit in player:Units() do
			if unit:GetUnitType() == unitLongboatID then
				local longboat = unit
				local newUnit
				newUnit = player:InitUnit(unitLongboatUpgradedID, unit:GetX(), unit:GetY())
				newUnit:Convert(longboat)
			end
		end
	end
end

if (not (isUsingNorway) and not (isUsingCivPack1)) then
	GameEvents.TeamTechResearched.Add(JFD_LongboatUpgrade)
end
--==========================================================================================================================
--==========================================================================================================================