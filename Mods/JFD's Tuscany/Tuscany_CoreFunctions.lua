-- Tuscany_CoreFunctions
-- Author: Sukritact
--=======================================================================================================================

include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "TuscanUA";
print("Loaded")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive
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

if not(JFD_IsCivilisationActive(GameInfoTypes.CIVILIZATION_TUSCANY)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- IsBuildingReal
-------------------------------------------------------------------------------------------------------------------------
function IsBuildingReal(iBuilding)
    if((GameInfo.Buildings[iBuilding].GreatWorkCount == -1) or ((GameInfo.Buildings[iBuilding].PrereqTech == nil) and ((GameInfo.Buildings[iBuilding].FaithCost == -1) and (GameInfo.Buildings[iBuilding].Cost == -1 )))) then
        return false
    else
        return true
    end
end
--=======================================================================================================================
-- Load Settings
--=======================================================================================================================
local tSettings = {}
for tSetting in GameInfo.MC_Tuscan_Settings() do
	tSettings[tSetting.SettingName] = tSetting.Setting
end

-- Use the alternate UA?
local bUseAlternateUA = tSettings.UseAlternateUA
print("Is using alternate UA:", bUseAlternateUA)
--=======================================================================================================================
-- Tuscan UA: Cradle of the Renaissance
--=======================================================================================================================
-- Cradle of the Renaissance: Initial Processes
-------------------------------------------------------------------------------------------------------------------------
local iCiv = GameInfoTypes.CIVILIZATION_TUSCANY
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

local tGreatPeople = {}
tGreatPeople.GREAT_WORK_SLOT_MUSIC = GameInfoTypes.UNIT_MUSICIAN
tGreatPeople.GREAT_WORK_SLOT_LITERATURE = GameInfoTypes.UNIT_WRITER
tGreatPeople.GREAT_WORK_SLOT_ART_ARTIFACT = GameInfoTypes.UNIT_ARTIST

local tGreatPeopleClass = {}
tGreatPeopleClass.GREAT_WORK_SLOT_MUSIC = GameInfoTypes.UNITCLASS_MUSICIAN
tGreatPeopleClass.GREAT_WORK_SLOT_LITERATURE = GameInfoTypes.UNITCLASS_WRITER
tGreatPeopleClass.GREAT_WORK_SLOT_ART_ARTIFACT = GameInfoTypes.UNITCLASS_ARTIST

local tSpecialist = {}
tSpecialist.GREAT_WORK_SLOT_MUSIC = GameInfoTypes.SPECIALIST_MUSICIAN
tSpecialist.GREAT_WORK_SLOT_LITERATURE = GameInfoTypes.SPECIALIST_WRITER
tSpecialist.GREAT_WORK_SLOT_ART_ARTIFACT = GameInfoTypes.SPECIALIST_ARTIST

local tBuildings = {}
for Building in GameInfo.Buildings() do
    iBuilding = Building.ID
    if (GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass].MaxGlobalInstances > (-1)) then
        tBuildings[iBuilding] = "Wonder"
	elseif (GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass].MaxPlayerInstances > (-1)) then
		--Do nothing
    elseif IsBuildingReal(iBuilding) then
        tBuildings[iBuilding] = GameInfo.Buildings[iBuilding].GreatWorkSlotType
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- Cradle of the Renaissance: Main Code
-------------------------------------------------------------------------------------------------------------------------
function TuscanUA(pPlayer)
	
	local pCity = pPlayer:GetCapitalCity()
	if pCity == nil then
		return
	end
	
	for iBuilding, sVal in pairs(tBuildings) do
		if pCity:IsHasBuilding(iBuilding) then
			if load(pPlayer, iBuilding) ~= true then
			
				if sVal == "Wonder" then
					if bUseAlternateUA then
						local sSlotType = GameInfo.Buildings[iBuilding].GreatWorkSlotType
						if sSlotType then
						
							local iCost = GameInfo.Buildings[iBuilding].Cost
							local iReward = math.ceil((iCost*iMod)/4)
							
							local iDelta = load(pPlayer, sSlotType)
							if not(iDelta) then iDelta = 0 end						
							
							iDelta = iDelta + iReward
							save(pPlayer, sSlotType, iDelta)
							GPPHandler(pPlayer)
						end
					else
						local iCost = GameInfo.Buildings[iBuilding].Cost
						pPlayer:ChangeGoldenAgeProgressMeter((iCost*iMod)/4)
					end
				else
					local iUnitType = tGreatPeople[sVal]
					pPlayer:InitUnit(iUnitType, pCity:GetX(), pCity:GetY())
				end
				
				save(pPlayer, iBuilding, true)
				
			end
		end
	end
end

function TuscanUATrigger1(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == iCiv) then
		TuscanUA(pPlayer)
	end
end

function TuscanUATrigger2(iPlayer, iCity, iType)
	if iType ~= CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION then return end
	
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == iCiv) then
		TuscanUA(pPlayer)
	end
end

if JFD_IsCivilisationActive(iCiv) then
	GameEvents.PlayerDoTurn.Add(TuscanUATrigger1)
	GameEvents.PlayerAdoptPolicy.Add(TuscanUATrigger1)
	Events.SpecificCityInfoDirty.Add(TuscanUATrigger2)
end
-------------------------------------------------------------------------------------------------------------------------
-- Cradle of the Renaissance: GPPHandler
-------------------------------------------------------------------------------------------------------------------------
function GPPHandler(pPlayer)
	local pCity = pPlayer:GetCapitalCity()
	if (pCity == nil) then return end

	for sSlotType, iGPType in pairs(tGreatPeople) do
		local iDelta = load(pPlayer, sSlotType)
		if not(iDelta) then iDelta = 0 end
		
		if iDelta > 0 then
		
			local iThreshold = pCity:GetSpecialistUpgradeThreshold(tGreatPeopleClass[sSlotType])
			local iProgress = pCity:GetSpecialistGreatPersonProgressTimes100(tSpecialist[sSlotType])/100
			
			local iCanAdd = iThreshold - iProgress
			
			pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialist[sSlotType], iDelta * 100)
			iDelta = iDelta - iCanAdd
		end
		
		if iDelta < 0 then iDelta = 0 end
		save(pPlayer, sSlotType, iDelta)
	end
end

if bUseAlternateUA then 
	function PlayerDoTurn_GPPHandler(iPlayer)
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() == iCiv) then
			GPPHandler(pPlayer)
		end
	end
	GameEvents.PlayerDoTurn.Add(PlayerDoTurn_GPPHandler)
end
--=======================================================================================================================
-- Tuscan UU: Condottieri
--=======================================================================================================================
-- Condottieri: Main Code
-------------------------------------------------------------------------------------------------------------------------

local iPromotion = GameInfoTypes.PROMOTION_FREE_COMPANY

function FreeCompanyEffect(iPlayer)
	local pPlayer = Players[iPlayer]
	local iDeltaS = math.floor((pPlayer:CalculateGoldRate() * 0.075 ))
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iPromotion) then
			local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
			if iDeltaS < 0 then
				pUnit:SetBaseCombatStrength(iStrength)
			elseif iDeltaS > 6 then
				pUnit:SetBaseCombatStrength(iStrength + 6)
			else
				pUnit:SetBaseCombatStrength(iStrength + iDeltaS)
			end
		else
		end
	end
end

GameEvents.PlayerDoTurn.Add(FreeCompanyEffect)
--=======================================================================================================================
--=======================================================================================================================