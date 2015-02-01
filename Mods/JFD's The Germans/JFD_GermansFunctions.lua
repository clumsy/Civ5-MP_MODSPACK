-- JFD_GermansFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- Tribal Encampment Names
-- 1 = enabled
-- 0 = disable
-------------------------------------------------------------------------------------------------------------------------
local g_TribalEncampmentNames = 1
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("NewSaveUtils"); MY_MOD_NAME = "TheGermans";
include("PlotIterators")
--==========================================================================================================================
-- MapModData
--==========================================================================================================================
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties;
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_AtPeace
--------------------------------------------------------------
function JFD_AtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(false) == 0 then atPeace = true end

	return atPeace
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

if JFD_IsCivilisationActive(civilisationID) then
	print("Chief Arminius is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit (Sukritact)
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
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUniqueUnit
--------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------
-- JFD_IsWhowardsDLLActive
--------------------------------------------------------------
function JFD_IsWhowardsDLLActive()
	local whowardsDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	local isUsingWhowardsDLL = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == whowardsDLLModID) then
	    isUsingWhowardsDLL = true
	    break
	  end
	end

	return isUsingWhowardsDLL
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GERMANS"]
local eraClassicalID = GameInfoTypes["ERA_CLASSICAL"]
local improvementBarbarianEncampmentID = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]
local improvementEncampmentID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]
local improvementEncampmentUpgradedDeerID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER"]
local improvementEncampmentUpgradedHorseID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE"]
local improvementEncampmentUpgradedIronID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON"]
local isGermansCivActive = JFD_IsCivilisationActive(civilisationID)
local isWhowardsDLLActive = JFD_IsWhowardsDLLActive()
local mathMin = math.min
local resourceDeerID = GameInfoTypes["RESOURCE_DEER"]
local resourceIronID = GameInfoTypes["RESOURCE_IRON"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local resourceJewelleryID = GameInfoTypes["RESOURCE_JEWELRY"]
local playerBarbarian = Players[63]
local unitPromotionBarbarianMarkerID = GameInfoTypes["PROMOTION_JFD_GERMAN_BARB"]
local promotionIgnoresZOCID = GameInfoTypes["PROMOTION_JFD_GERMANS"]
local unitPromotionSlaganzID = GameInfoTypes["PROMOTION_JFD_SLAGANZ"]
local unitPromotionSlaganzInfoID = GameInfoTypes["PROMOTION_JFD_SLAGANZ_INFO"]
local unitPromotionCivilisedBarbarianMarkerID = GameInfoTypes["PROMOTION_JFD_GERMAN_CIVILISED_BARB"]
----------------------------------------------------------------------------------------------------------------------------
-- JFD_InitArminius
----------------------------------------------------------------------------------------------------------------------------
function JFD_InitArminius(player)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationID then
			Teams[player:GetTeam()]:MakePeace(playerBarbarian:GetTeam())
			Teams[player:GetTeam()]:SetPermanentWarPeace(playerBarbarian:GetTeam(), true)
		end
	end 
end

if isGermansCivActive then
	Events.LoadScreenClose.Add(JFD_InitArminius)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_SpawnBarbarians
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetBarbarianUnitToSpawn(playerID, improvementID) 
	local player = Players[playerID]
	local barbarianToSpawn = "UNIT_BARBARIAN_WARRIOR"
	if improvementID == improvementEncampmentID then
		if player:GetCurrentEra() >= eraClassicalID then
			if JFD_GetRandom(1,10) <= 3 then
				barbarianToSpawn = "UNIT_BARBARIAN_AXMAN"
			else
				barbarianToSpawn = "UNIT_BARBARIAN_SPEARMAN"
			end
		end
	else
		if improvementID == improvementEncampmentUpgradedDeerID then
			local strongestMountedUnitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_MOUNTED", "UNITCOMBAT_ARMOR") or "BARBARIAN_HORSEMAN"
			local unitClass = GameInfo.Units[strongestMountedUnitID].Class
			barbarianToSpawn = JFD_GetUniqueUnit(playerBarbarian, unitClass)
		elseif improvementID == improvementEncampmentUpgradedHorseID then
			local strongestRangedUnitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_ARCHER") or "UNIT_BARBARIAN_ARCHER"
			local unitClass = GameInfo.Units[strongestRangedUnitID].Class
			barbarianToSpawn = JFD_GetUniqueUnit(playerBarbarian, unitClass)
		elseif improvementID == improvementEncampmentUpgradedIronID then
			local strongestMeleeUnitID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN") or "BARBARIAN_SWORDSMAN"
			local unitClass = GameInfo.Units[strongestMeleeUnitID].Class
			barbarianToSpawn = JFD_GetUniqueUnit(playerBarbarian, unitClass)
		end
	end
	
	return GameInfoTypes[barbarianToSpawn]
end
			
function JFD_SpawnWeakBarbarians(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then
		for city in player:Cities() do
			local cityX = city:GetX()
			local cityY = city:GetY()
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				local getRandom = JFD_GetRandom(1,100)
				local improvementID = loopPlot:GetImprovementType()
				if ((improvementID == improvementEncampmentID and loopPlot:GetOwner() == playerID) and not (loopPlot:GetUnit())) then
					if getRandom <= 15 then
						local barbarianUnitID = JFD_GetBarbarianUnitToSpawn(playerID, improvementEncampmentID)
						local barbarianUnit = playerBarbarian:InitUnit(barbarianUnitID, loopPlot:GetX(), loopPlot:GetY())
						barbarianUnit:SetHasPromotion(unitPromotionBarbarianMarkerID, true)

						local tribePlot = "X" .. loopPlot:GetX() .. "_Y" .. loopPlot:GetY()
						local newName = Locale.ConvertTextKey(GetPersistentProperty(tribePlot)) .. " " .. barbarianUnit:GetName()
						barbarianUnit:SetName(newName)
					end
				end
			end
		end
	end
end

function JFD_SpawnCivilisedBarbarians(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = Teams[otherTeamID]:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (otherPlayer:GetCivilizationType() == civilisationID and Teams[otherTeamID]:GetAtWarCount(true) <= 1 and not (player:IsMinorCiv())) then
		for city in otherPlayer:Cities() do
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				local improvementID = loopPlot:GetImprovementType()
				if ((improvementID == improvementEncampmentUpgradedDeerID or improvementID == improvementEncampmentUpgradedHorseID or improvementID == improvementEncampmentUpgradedIronID) and Players[plot:GetOwner()]:GetCivilizationType() == civilisationID) then
					local plotResourceID = loopPlot:GetResourceType() 
					local barbarianUnitID = JFD_GetBarbarianUnitToSpawn(otherPlayerID, improvementID)
					local civilisedBarbarianUnit = otherPlayer:InitUnit(barbarianUnitID, loopPlot:GetX(), loopPlot:GetY())
					civilisedBarbarianUnit:SetHasPromotion(unitPromotionCivilisedBarbarianMarkerID, true)

					local tribePlot = "X" .. loopPlot:GetX() .. "_Y" .. loopPlot:GetY()
					local newName = Locale.ConvertTextKey(GetPersistentProperty(tribePlot)) .. " " .. barbarianUnit:GetName()
					civilisedBarbarianUnit:SetName(newName)
				end
			end
		end

		for city in player:Cities() do
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				local improvementID = loopPlot:GetImprovementType()
				if ((improvementID == improvementEncampmentUpgradedDeerID or improvementID == improvementEncampmentUpgradedHorseID or improvementID == improvementEncampmentUpgradedIronID) and Players[plot:GetOwner()]:GetCivilizationType() == civilisationID) then
					local plotResourceID = loopPlot:GetResourceType() 
					local barbarianUnitID = JFD_GetBarbarianUnitToSpawn(otherPlayerID, improvementID, plotResourceID)
					local civilisedBarbarian = otherPlayer:InitUnit(barbarianUnitID, loopPlot:GetX(), loopPlot:GetY())
					civilisedBarbarianUnit:SetHasPromotion(unitPromotionCivilisedBarbarianMarkerID, true)

					local tribePlot = "X" .. loopPlot:GetX() .. "_Y" .. loopPlot:GetY()
					local newName = Locale.ConvertTextKey(GetPersistentProperty(tribePlot)) .. " " .. barbarianUnit:GetName()
					civilisedBarbarianUnit:SetName(newName)
				end
			end
		end
	end
end

if isGermansCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_SpawnWeakBarbarians)
	GameEvents.DeclareWar.Add(JFD_SpawnCivilisedBarbarians)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CleanUpDefectingBarbarians
----------------------------------------------------------------------------------------------------------------------------
function JFD_CleanUpDefectingBarbarians(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionBarbarianMarkerID) then
				local unitLevel = mathMin(unit:GetLevel(), 5)
				local disbandChance = {}
					disbandChance[1] = 20
					disbandChance[2] = 15
					disbandChance[3] = 10
					disbandChance[4] = 5
					disbandChance[5] = 0
					
				local experienceNeeded = unit:ExperienceNeeded()
				local experienceGained = unit:GetExperience()
				if (experienceGained == 0 and unitLevel <= 1 and experienceGained >= (experienceNeeded * 70 / 100)) then return end
				
				local getRandom = JFD_GetRandom(1,100)
				if not (JFD_AtPeace(playerID)) then
					if getRandom <= (disbandChance[unitLevel] / 2) then
						local unitX = unit:GetX()
						local unitY = unit:GetY()
						local unitID = unit:GetUnitType()
						if player:IsHuman() then
							local description = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_DISBANDED_DESCRIPTION")
							local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_DISBANDED_DESCRIPTION_SHORT")
							Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, unitX, unitY, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
						end
						
						local newBarbarian = playerBarbarian:InitUnit(unitID, unitX, unitY)
						newBarbarian:Convert(unit, true)
					end
				else
					if getRandom <= (disbandChance[unitLevel] * 2.5) then
						local unitX = unit:GetX()
						local unitY = unit:GetY()
						local unitID = unit:GetUnitType()
						if player:IsHuman() then
							local description = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_DISBANDED_DESCRIPTION")
							local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_DISBANDED_DESCRIPTION_SHORT")
							Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, unitX, unitY, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
						end
						local newBarbarian = playerBarbarian:InitUnit(unitID, unitX, unitY)
						newBarbarian:Convert(unit, true)
					end
				end
			end
		end
	end
end

if isGermansCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_CleanUpDefectingBarbarians)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CleanUpCivilisedBarbariansOnPeace
----------------------------------------------------------------------------------------------------------------------------
function JFD_CleanUpCivilisedBarbariansOnPeace(teamID, otherTeamID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	local otherPlayerID = Teams[otherTeamID]:GetLeaderID()
	local otherPlayer = Players[otherPlayerID]
	if (player:GetCivilizationType() == civilisationID and JFD_AtPeace(playerID)) then 
		local numDisbanded = 0
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionCivilisedBarbarianMarkerID) then
				unit:Kill(-1)
				numDisbanded = numDisbanded + 1
			end
		end

		if (player:IsHuman() and numDisbanded > 0) then
			local description = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION")
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION_SHORT")
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, -1, -1, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
		end
	elseif (otherPlayer:GetCivilizationType() == civilisationID and JFD_AtPeace(otherPlayerID)) then 
		local numDisbanded = 0
		for unit in otherPlayer:Units() do
			if unit:IsHasPromotion(unitPromotionCivilisedBarbarianMarkerID) then
				unit:Kill(-1)
				numDisbanded = numDisbanded + 1
			end
		end

		if (otherPlayer:IsHuman() and numDisbanded > 0) then
			local description = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION")
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION_SHORT")
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, -1, -1, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
		end
	end
end

function JFD_CleanUpCivilisedBarbariansOnTurn(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and JFD_AtPeace(playerID)) then 
		local numDisbanded = 0 
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionCivilisedBarbarianMarkerID) then
				unit:Kill(-1)
				numDisbanded = numDisbanded + 1
			end
		end

		if (player:IsHuman() and numDisbanded > 0) then
			local description = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION")
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CIVILISED_BARB_DISBANDED_DESCRIPTION_SHORT")
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, -1, -1, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
		end
	end
end

if isGermansCivActive then
	GameEvents.MakePeace.Add(JFD_CleanUpCivilisedBarbariansOnPeace)
	GameEvents.PlayerDoTurn.Add(JFD_CleanUpCivilisedBarbariansOnTurn)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_BuildTribalEncampment
----------------------------------------------------------------------------------------------------------------------------
function JFD_BuildTribalEncampment(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		local plot = Map.GetPlot(plotX, plotY)
		if improvementID == improvementEncampmentID then
			if g_TribalEncampmentNames == 1 then
				JFD_PlaceTribalEncampmentName(playerID, plot)
			end

			local barbarianUnitID = JFD_GetBarbarianUnitToSpawn(improvementEncampmentID)
			local barbarianUnit = playerBarbarian:InitUnit(barbarianUnitID, plotX, plotY)
			barbarianUnit:SetHasPromotion(unitPromotionBarbarianMarkerID, true)
			
			local tribePlot = "X" .. plotX .. "_Y" .. plotY
			local newName = Locale.ConvertTextKey(GetPersistentProperty(tribePlot)) .. " " .. barbarianUnit:GetName()
			barbarianUnit:SetName(newName)
		elseif improvementID == improvementEncampmentUpgradedDeerID then
			plot:SetImprovementType(-1)
			plot:SetResourceType(resourceDeerID, 1)
			plot:SetImprovementType(improvementEncampmentUpgradedDeerID)
		elseif improvementID == improvementEncampmentUpgradedHorseID then
			plot:SetImprovementType(-1)
			plot:SetResourceType(resourceHorseID, 1)
			plot:SetImprovementType(improvementEncampmentUpgradedHorseID)
		elseif improvementID == improvementEncampmentUpgradedIronID then
			plot:SetImprovementType(-1)
			plot:SetResourceType(resourceIronID, 1)
			plot:SetImprovementType(improvementEncampmentUpgradedIronID)
		end
	end
end

if isGermansCivActive then
	GameEvents.BuildFinished.Add(JFD_BuildTribalEncampment)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_GermanBarbAlliance
----------------------------------------------------------------------------------------------------------------------------
function JFD_GermanBarbAlliance(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if ((player:GetCivilizationType() == civilisationID or otherPlayer:GetCivilizationType() == civilisationID) and not (player:IsMinorCiv()) and not (otherPlayer:IsMinorCiv())) then
		local numBarbsMarked = 0
		for unit in playerBarbarian:Units() do
			if unit:IsHasPromotion(unitPromotionBarbarianMarkerID) then
				local unitID = unit:GetUnitType()
				local unitX = unit:GetX()
				local unitY = unit:GetY()
				local plot = Map.GetPlot(unitX, unitY)
				numBarbsMarked = numBarbsMarked + 1
				if player:GetCivilizationType() == civilisationID then
					local newBarbarian = player:InitUnit(unitID, unitX, unitY)
					plot:SetRevealed(player:GetTeam(), true)
					newBarbarian:Convert(unit, true)
					newBarbarian:SetHasPromotion(unitPromotionBarbarianMarkerID, true)
				elseif otherPlayer:GetCivilizationType() == civilisationID then
					local newBarbarian = otherPlayer:InitUnit(unitID, unitX, unitY)
					plot:SetRevealed(player:GetTeam(), true)
					newBarbarian:Convert(unit, true)
					newBarbarian:SetHasPromotion(unitPromotionBarbarianMarkerID, true)
				end
			end
		end
		

		if (numBarbsMarked > 0 and player:IsHuman() or otherPlayer:IsHuman()) then
			local description = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_CALL_DESCRIPTION")
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_BARB_CALL_DESCRIPTION_SHORT")
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"], description, descriptionShort, -1, -1, GameInfo.Units["UNIT_BARBARIAN_WARRIOR"].ID, -1)
		end
	end
end

if isGermansCivActive then
	GameEvents.DeclareWar.Add(JFD_GermanBarbAlliance)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_SlaganzBarbBonus
----------------------------------------------------------------------------------------------------------------------------	
function JFD_SlaganzBarbBonus(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local unit = player:GetUnitByID(unitID)
		if (unit:IsHasPromotion(unitPromotionSlaganzID) or unit:IsHasPromotion(unitPromotionSlaganzInfoID)) then
			local plot = Map.GetPlot(unitX, unitY)
			local nearbyBarb = false
			for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:GetUnit() and loopPlot:GetUnit():GetOwner() == 63) then
					nearbyBarb = true
					break
				end
			end
			
			if nearbyBarb then
				if not unit:IsHasPromotion(unitPromotionSlaganzID) then
					unit:SetHasPromotion(unitPromotionSlaganzID, true) 
					unit:SetHasPromotion(unitPromotionSlaganzInfoID, false) 
				end
			else
				if unit:IsHasPromotion(unitPromotionSlaganzID) then
					unit:SetHasPromotion(unitPromotionSlaganzID, false) 
					unit:SetHasPromotion(unitPromotionSlaganzInfoID, true) 
				end
			end
		end
	end
end

if isGermansCivActive then
	GameEvents.UnitSetXY.Add(JFD_SlaganzBarbBonus) 
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ResolveBarbarianExploit
----------------------------------------------------------------------------------------------------------------------------
function JFD_ResolveSchlossExploit(plotX, plotY, improvementID)
	local player = Players[playerID]
    if (improvementID == improvementEncampmentID or improvementID == improvementEncampmentUpgradedDeerID or improvementID == improvementEncampmentUpgradedHorseID or improvementID == improvementEncampmentUpgradedIronID) then 
		local plot = Map.GetPlot(plotX, plotY)
		if (plot:IsAdjacentToImprovement(improvementEncampmentID) or plot:IsAdjacentToImprovement(improvementEncampmentUpgradedDeerID) or plot:IsAdjacentToImprovement(improvementEncampmentUpgradedHorseID) or plot:IsAdjacentToImprovement(improvementEncampmentUpgradedIronID)) then 
			return false
		end
	end

	return true
end

if isWhowardsDLLActive then
	GameEvents.PlotCanImprove.Add(JFD_ResolveSchlossExploit)
end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
--Thank you whoward!
include("FLuaVector")
include("InstanceManager")
local g_EncampmentManager = InstanceManager:new("Encampment", "Anchor", Controls.EncampmentContainer)
local g_WorldOffset = {x=0, y=-15, z=0}

local g_TopPanelToolTip = {}
TTManager:GetTypeControlTable("TooltipTypeTopPanel", g_TopPanelToolTip)
----------------------------------------------------------------------------------------------------------------------------
--JFD_GetTribalName
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetTribalName()
	local tribalName = ""
	for row in GameInfo.Civilization_JFD_TribalNames("CivilizationType = 'CIVILIZATION_JFD_GERMANS'") do
		if not (GetPersistentProperty(row.TribalName)) then
			tribalName = row.TribalName
			break
		end
	end

	return tribalName
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_GetWorldPosition
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetWorldPosition(plot)
	return HexToWorld(ToHexFromGrid({x=plot:GetX(), y=plot:GetY()}))
end
----------------------------------------------------------------------------------------------------------------------------
--OnEnterCityScreen
----------------------------------------------------------------------------------------------------------------------------
function OnEnterCityScreen()
	Controls.EncampmentContainer:SetHide(true)
end
Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)
----------------------------------------------------------------------------------------------------------------------------
--OnExitCityScreen
----------------------------------------------------------------------------------------------------------------------------
function OnExitCityScreen()
	Controls.EncampmentContainer:SetHide(false)
end
Events.SerialEventExitCityScreen.Add(OnExitCityScreen)
----------------------------------------------------------------------------------------------------------------------------
--JFD_PlaceInWorld
----------------------------------------------------------------------------------------------------------------------------
function JFD_PlaceInWorld(control, world)
	control:SetWorldPosition(VecAdd(world, g_WorldOffset))
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_PlaceTribalEncampmentName
----------------------------------------------------------------------------------------------------------------------------
function JFD_PlaceTribalEncampmentName(playerID, plot)
	local instance = g_EncampmentManager:GetInstance()
	local tribalName = JFD_GetTribalName()
	if (tribalName and g_TribalEncampmentNames == 1) then
		instance.EncampmentName:SetText(Locale.ConvertTextKey(tribalName))
		JFD_PlaceInWorld(instance.Anchor, JFD_GetWorldPosition(plot))

		local tribalNameX = tribalName .. "X"
		local tribalNameY = tribalName .. "Y"
		local tribePlot = "X" .. plot:GetX() .. "_Y" .. plot:GetY()
		SetPersistentProperty(tribalName, true)
		SetPersistentProperty(tribePlot, tribalName)
		SetPersistentProperty(tribalNameX, plot:GetX())
		SetPersistentProperty(tribalNameY, plot:GetY())
	end
end

function JFD_RestoreTribalEncampmentNames()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			for city in player:Cities() do
				local plot = Map.GetPlot(city:GetX(), city:GetY())
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local improvementID = loopPlot:GetImprovementType()
					if ((improvementID == improvementEncampmentID or improvementID == improvementEncampmentUpgradedDeerID or improvementID == improvementEncampmentUpgradedHorseID or improvementID == improvementEncampmentUpgradedIronID) and plot:GetOwner() == playerID) then
						local instance = g_EncampmentManager:GetInstance()
						local tribePlot = "X" .. loopPlot:GetX() .. "_Y" .. loopPlot:GetY()
						local tribalName = GetPersistentProperty(tribePlot)
						instance.EncampmentName:SetText(Locale.ConvertTextKey(tribalName))
						JFD_PlaceInWorld(instance.Anchor, JFD_GetWorldPosition(loopPlot))
					end
				end
			end	
		end
	end
end
Events.LoadScreenClose.Add(JFD_RestoreTribalEncampmentNames)
--==========================================================================================================================
--==========================================================================================================================