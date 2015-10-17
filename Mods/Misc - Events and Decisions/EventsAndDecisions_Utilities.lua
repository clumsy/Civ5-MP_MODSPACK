-- Events and Decisions Utilities
-- Author: Sukritact
--=======================================================================================================================
-- Globals
--=======================================================================================================================
include("EventsAndDecisions_Settings.lua")
iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
iGAMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
iMagistrate = GameInfoTypes.RESOURCE_MAGISTRATES
--------------------------------------------------------------------------------------------------------------------------
--Convert Setting Globals
--------------------------------------------------------------------------------------------------------------------------
g_RandomEvents_Enabled 		= g_RandomEvents_Enabled > 0
g_TurnBetweenEvents 		= math.ceil(g_TurnBetweenEvents * 10 * iGAMod)
g_ScheduledEvents_Enabled 	= g_ScheduledEvents_Enabled > 0
g_CoreEvents_Enabled 		= g_CoreEvents_Enabled > 0
g_CoreDecisions_Enabled 	= g_CoreDecisions_Enabled > 0
g_PopupType 				= g_PopupType > 0
--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive: Thanks to JFD for this one!
-------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
-- GetUniqueBuilding
--------------------------------------------------------------------------------------------------------------------------
function GetUniqueBuilding(pPlayer, sClass)
  local sBuilding = nil
  local sCiv = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
 
  for tBuilding in GameInfo.Civilization_BuildingClassOverrides("CivilizationType = \'" .. sCiv .. "\' AND BuildingClassType = \'" .. sClass .. "\'") do
    sBuilding = tBuilding.BuildingType
    break
  end
 
  if (sBuilding == nil) then
    sBuilding = GameInfo.BuildingClasses[sClass].DefaultBuilding
  end
 
  return sBuilding
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end           
-------------------------------------------------------------------------------------------------------------------------
-- CompileCityID
-------------------------------------------------------------------------------------------------------------------------
function CompileCityID(pCity)
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
	local iCityID = ("X" .. pCity:GetX() .. "Y" .. pCity:GetY() .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)
	return iCityID
end
-------------------------------------------------------------------------------------------------------------------------
-- DecompilePlotID
-------------------------------------------------------------------------------------------------------------------------
function DecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end
-------------------------------------------------------------------------------------------------------------------------
-- InitUnitFromCity
-------------------------------------------------------------------------------------------------------------------------
function InitUnitFromCity(pCity, iUnitType, iNum)
	local tUnits = {}
	pPlayer = Players[pCity:GetOwner()]
	for i = 1, iNum do
		pUnit = pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
		if not(pUnit:JumpToNearestValidPlot()) then return tUnits end
		
		table.insert(tUnits, pUnit)
		
		pUnit:SetExperience(pCity:GetDomainFreeExperience(pUnit:GetDomainType()))
		for promotion in GameInfo.UnitPromotions() do
			iPromotion = promotion.ID
				if (pCity:GetFreePromotionCount(iPromotion) > 0 and pUnit:IsPromotionValid(iPromotion)) then
				pUnit:SetHasPromotion(iPromotion, true)
			end
		end
		
	end
	return tUnits
end
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
-- GetMeanTechCost
-------------------------------------------------------------------------------------------------------------------------
function GetMeanTechCost(iPlayer)
	pPlayer = Players[iPlayer] or iPlayer

	local iTotal = 0
	local iNumTotal = 0
	for tTech in GameInfo.Technologies() do
		if pPlayer:CanResearch(tTech.ID) then
			iTotal = iTotal + pPlayer:GetResearchCost(tTech.ID)
			iNumTotal = iNumTotal +1
		end
	end

	return iTotal/iNumTotal
end
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
--=======================================================================================================================
-- Religious Data
--=======================================================================================================================
-- Define Religious Groups
-------------------------------------------------------------------------------------------------------------------------

tReligiousGroups = {}

--Buddhism
tReligiousGroups.RELIGION_BUDDHISM = "RELIGIONGROUP_BUDDHISM"
tReligiousGroups.RELIGION_MAHAYANA = "RELIGIONGROUP_BUDDHISM"
tReligiousGroups.RELIGION_VAJRAYANA = "RELIGIONGROUP_BUDDHISM"
--Christianity
tReligiousGroups.RELIGION_CHRISTIANITY = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_ORTHODOXY = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_PROTESTANTISM = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_CHRISTIAN_MORMONISM = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_CHRISTIAN_ANGLICANISM = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_PROTESTANT_CALVINISM = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_PROTESTANT_METHODISM = "RELIGIONGROUP_CHRISTIANITY"
tReligiousGroups.RELIGION_PROTESTANT_BAPTIST = "RELIGIONGROUP_CHRISTIANITY"
--Confucianism
tReligiousGroups.RELIGION_CONFUCIANISM = "RELIGIONGROUP_CONFUCIANISM"
--Judaism
tReligiousGroups.RELIGION_JUDAISM = "RELIGIONGROUP_JUDAISM"
--Islam
tReligiousGroups.RELIGION_ISLAM = "RELIGIONGROUP_ISLAM"
tReligiousGroups.RELIGION_ISLAM_SHIA = "RELIGIONGROUP_ISLAM"
tReligiousGroups.RELIGION_ISLAM_IBADI = "RELIGIONGROUP_ISLAM"
--Hinduism
tReligiousGroups.RELIGION_HINDUISM = "RELIGIONGROUP_HINDUISM"
tReligiousGroups.RELIGION_VISHNU = "RELIGIONGROUP_HINDUISM"
tReligiousGroups.RELIGION_SHIVA = "RELIGIONGROUP_HINDUISM"
tReligiousGroups.RELIGION_SHAKTI = "RELIGIONGROUP_HINDUISM"
tReligiousGroups.RELIGION_VEDIC = "RELIGIONGROUP_HINDUISM"
--Shinto
tReligiousGroups.RELIGION_SHINTO = "RELIGIONGROUP_SHINTO"
--Sikhism
tReligiousGroups.RELIGION_SIKHISM = "RELIGIONGROUP_SIKHISM"
--Tengriism
tReligiousGroups.RELIGION_TENGRIISM = "RELIGIONGROUP_TENGRIISM"
--Taoism
tReligiousGroups.RELIGION_TAOISM = "RELIGIONGROUP_TAOISM"
--Zoroastrianism
tReligiousGroups.RELIGION_ZOROASTRIANISM = "RELIGIONGROUP_ZOROASTRIANISM"

-------------------------------------------------------------------------------------------------------------------------
--Determine if Religions are sected
-------------------------------------------------------------------------------------------------------------------------

bChristianitySect = false
bProtestantSect = false
bBuddhismSect = false
bIslamSect = false
bHinduismSect = false

for Religion in GameInfo.Religions() do
	local sReligion = Religion.Type
	if sReligion == "RELIGION_ORTHODOXY" then
		bChristianitySect = true
	elseif sReligion == "RELIGION_PROTESTANT_BAPTIST" then
		bProtestantSect = true
	elseif sReligion == "RELIGION_MAHAYANA" then
		bBuddhismSect = true
	elseif sReligion == "RELIGION_MAHAYANA" then
		bBuddhismSect = true
	elseif sReligion == "RELIGION_VISHNU" then
		bHinduismSect = true
	end
end

-------------------------------------------------------------------------------------------------------------------------
-- Religious Utility Functions
-------------------------------------------------------------------------------------------------------------------------

function ReturnReligionGroup(iReligion)
	local sReligionGroup = "RELIGIONGROUP_NIL"
	if	iReligion ~= nil then
		if tReligiousGroups[GameInfo.Religions[iReligion].Type] ~= nil then
			sReligionGroup = tReligiousGroups[GameInfo.Religions[iReligion].Type]
		end
	end
	return sReligionGroup
end

function GetMajorityReligionGroup(pPlayer)
	local iReligion = GetPlayerMajorityReligion(pPlayer)
	return ReturnReligionGroup(iReligion)
end

function GetReligionsinEmpire(pPlayer)

	local tReligions = {}
	for row in GameInfo.Religions("Type != 'RELIGION_PANTHEON'") do
	
		local iReligion = row.ID
		for pCity in pPlayer:Cities() do
		
			if (pCity:GetNumFollowers(iReligion) > 1) then
				table.insert(tReligions, iReligion)
				break
			end
			
		end
	end
	
	return tReligions
end

function GetNumReligionsinEmpire(pPlayer)
	return #(GetReligionsinEmpire(pPlayer))
end

function GetPlayerMajorityReligion(pPlayer)
	local iMajorityReligion = nil
	for row in GameInfo.Religions() do
		local iReligion = row.ID
		if pPlayer:HasReligionInMostCities(iReligion) then
			iMajorityReligion = iReligion
			break
		end
	end
	return iMajorityReligion
end

function GetReligiousUnity(pPlayer, iReligion)
	local iFollowers = 0
	for pCity in pPlayer:Cities() do
		iFollowers = iFollowers	+ pCity:GetNumFollowers(iReligion)
	end
	local iUnity = iFollowers/pPlayer:GetTotalPopulation()
	return iUnity
end

function ConvertPlayerReligion(pPlayer, iReligion, iPercentage)
	for pCity in pPlayer:Cities() do
		pCity:ConvertPercentFollowers(iReligion, -1, iPercentage)
		for row in GameInfo.Religions() do
			local iLoopReligion = row.ID
			pCity:ConvertPercentFollowers(iReligion, iLoopReligion, iPercentage)
		end
	end
end
--=======================================================================================================================
-- Decisions Specific Functions
--=======================================================================================================================
-- Decisions_AddCivilisationSpecific
-------------------------------------------------------------------------------------------------------------------------
function Decisions_AddCivilisationSpecific(iCiv, sKey, tDecision)
	if JFD_IsCivilisationActive(iCiv) then
		tDecision.Type = "Civilization"
		tDecisions[sKey] = tDecision
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- HookDecisionIcon
-------------------------------------------------------------------------------------------------------------------------
function HookDecisionCivilizationIcon(tTable, sCiv)
	tTable.IconAtlas = GameInfo.Civilizations[sCiv].AlphaIconAtlas
	tTable.IconIndex = GameInfo.Civilizations[sCiv].PortraitIndex
end

function HookDecisionReligionIcon(tTable, sReligion)
	tTable.IconAtlas = GameInfo.Religions[sReligion].IconAtlas
	tTable.IconIndex = GameInfo.Religions[sReligion].PortraitIndex
end
--=======================================================================================================================
-- Event Specific Functions
--=======================================================================================================================
-- Events_AddCivilisationSpecific
-------------------------------------------------------------------------------------------------------------------------
function Events_AddCivilisationSpecific(iCiv, sEvent, tEvent)
	if JFD_IsCivilisationActive(iCiv) then
		tEvents[sEvent] = tEvent
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Events_AddCivilisationSpecificScheduled: Adds and schedules an event for a civilization
-------------------------------------------------------------------------------------------------------------------------
function Events_AddCivilisationSpecificScheduled(iCiv, sEvent, tEvent, iNum, bYear)
	if JFD_IsCivilisationActive(iCiv) then
	
		tEvents[sEvent] = tEvent
		if(load("Game", "Initial_Scheduled")) then return end
		
		for iPlayer, pPlayer in pairs(Players) do
			if pPlayer:GetCivilizationType() == iCiv then 
				LuaEvents.ScheduleEvent(iPlayer, sEvent, iNum, bYear)
			end
		end
		
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Events_ScheduleOnce: Schedules an event for a particular player once at the start of the game
-------------------------------------------------------------------------------------------------------------------------
function Events_ScheduleOnce(iPlayer, sEvent, iNum, bYear)
	if not(load("Game", "Initial_Scheduled")) then
		LuaEvents.ScheduleEvent(iPlayer, sEvent, iNum, bYear)
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Events_ScheduleOnceAllPlayers: Schedules an event for all players once at the start of the game
-------------------------------------------------------------------------------------------------------------------------
function Events_ScheduleOnceAllPlayers(sEvent, iNum, bYear)
	if not(load("Game", "Initial_Scheduled")) then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			LuaEvents.ScheduleEvent(iPlayer, sEvent, iNum, bYear)
		end
	end
end
--=======================================================================================================================
--=======================================================================================================================