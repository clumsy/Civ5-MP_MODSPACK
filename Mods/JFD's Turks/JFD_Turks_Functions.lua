-- JFD_Turks_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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

-- JFD_IsCommunityPatchDLL
function JFD_IsCommunityPatchDLL()
	local communityPatchDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingCPDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == communityPatchDLLID) then
			isUsingCPDLL = true
			break
		end
	end

	return isUsingCPDLL
end
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit (Sukritact)
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

-- JFD_GetUniqueUnit (Whoward)
function JFD_GetUniqueUnit(player, unitClass)
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
 
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
 
	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
 
	return unitType
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID		 = Game.GetActivePlayer()
local activePlayer			 = Players[activePlayerID]
local civilizationTurksID	 = GameInfoTypes["CIVILIZATION_JFD_TURKS"]
local isCivTurksActive		 = JFD_IsCivilisationActive(civilizationTurksID)
local isCivTurksActivePlayer = activePlayer:GetCivilizationType() == civilizationTurksID
local isUsingCPDLL			 = JFD_IsCommunityPatchDLL()

if isCivTurksActive then
	print("Sultan Mehmed II is in this game")
end
--==========================================================================================================================
-- UA FUNCTIONS
--==========================================================================================================================
-- TRIBUTE IN BLOOD
----------------------------------------------------------------------------------------------------------------------------
-- JFD_TurksInit
local policyTurksGarrisonedCultureID = GameInfoTypes["POLICY_JFD_TURKS_GARRISON_CULTURE"]

function JFD_TurksInit(playerID, isStart, turns)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationTurksID) then
			if (not player:HasPolicy(policyTurksGarrisonedCultureID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyTurksGarrisonedCultureID, true)
			end
		end
	end 
end
if isCivTurksActive then
	Events.LoadScreenClose.Add(JFD_TurksInit)
end

-- JFD_TurksUnitOnConquest
local unitJannisary		 = "UNIT_OTTOMAN_JANISSARY"
local unitClassMusketman = "UNITCLASS_MUSKETMAN"
local unitCombatGun      = "UNITCOMBAT_GUN"

function JFD_TurksUnitOnConquest(oldOwnerID, capital, plotX, plotY, newOwnerID)
	local player = Players[newOwnerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationTurksID) then
		local otherPlayer = Players[oldOwnerID]
		local strongestUnitID = GetStrongestMilitaryUnit(player, false, unitCombatGun)
		local unitToSpawnClass = GameInfo.Units[strongestUnitID].Class
		local unitToSpawnCombatClass = GameInfo.Units[strongestUnitID].CombatClass
		if unitToSpawnCombatClass == unitCombatGun then
			local unitUniqueType = unitJannisary
			if unitToSpawnClass ~= unitClassMusketman then
				unitUniqueType = JFD_GetUniqueUnit(otherPlayer, unitToSpawnClass)
			end
			if unitUniqueType then
				unitToSpawnID = GameInfoTypes[unitUniqueType]
				player:InitUnit(unitToSpawnID, plotX, plotY)
			end
		end
	end
end
if isCivTurksActive then
	GameEvents.CityCaptureComplete.Add(JFD_TurksUnitOnConquest)
end

-- JFD_TurksUnitsUpgradeForFree
function JFD_TurksUnitsUpgradeForFree(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationTurksID) then
		for unit in player:Units() do
			local unitUpgradeID = unit:GetUpgradeUnitType()
			if player:CanTrain(unitUpgradeID) then
				if isUsingCPDLL then
					unit:Upgrade(unit, true)
				else
					local newUnit = player:InitUnit(unitUpgradeID, unit:GetX(), unit:GetY())
					newUnit:Convert(unit)
				end
			end
		end
	end
end
if isCivTurksActive then
	GameEvents.TeamTechResearched.Add(JFD_TurksUnitsUpgradeForFree)
end
--==========================================================================================================================
--==========================================================================================================================