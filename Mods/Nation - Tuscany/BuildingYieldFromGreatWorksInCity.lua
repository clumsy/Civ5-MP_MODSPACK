-- BuildingYieldFromGreatWorksInCity
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.BuildingYieldFromGreatWorksInCity then return end
MapModData.BuildingYieldFromGreatWorksInCity = true
Events.SequenceGameInitComplete.Add(function() MapModData.BuildingYieldFromGreatWorksInCity = nil end)
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "BuildingYieldFromGreatWorksInCity";

--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local iCulture = GameInfoTypes["YIELD_CULTURE"]
local iFaith = GameInfoTypes["YIELD_FAITH"]

function BuildingYieldFromGreatWorksInCity(pPlayer, bIsTurnStart)
	for row in GameInfo.Building_YieldFromGreatWorksInCity() do
		local iBuilding = GameInfoTypes[row.BuildingType]
		local iYield = GameInfoTypes[row.YieldType]
		local iDeltaModifier = row.Yield
		
		for pCity in pPlayer:Cities() do
		
			local iCity = pCity:GetID()
			local iGreatWorksNum = pCity:GetNumGreatWorks()
			local iDelta = (iGreatWorksNum * iDeltaModifier)
			
			if pCity:IsHasBuilding(iBuilding) then
			-- Building exists, adjust yields
			
				if iYield == iCulture then
					local iOldDelta = load(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					save(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, iDelta)
					if iOldDelta == nil then
						pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta)
					else
						pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta - iOldDelta)
					end
					
				elseif iYield == iFaith then
					if bIsTurnStart == true then
						pPlayer:ChangeFaith(iDelta)
					end
					
				else
					local iOldDelta = load(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					save(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, iDelta)
					if iOldDelta == nil then
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta)
					else
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta - iOldDelta)
					end
				end
			
			else
			-- Clear data if Building does not exist
			
				if iYield == iCulture then
					local iOldDelta = load(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, 0)
						pCity:ChangeJONSCulturePerTurnFromBuildings(-iOldDelta)
					end
					
				elseif iYield == iFaith then
					-- Do Nothing
					
				else
					local iOldDelta = load(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save(pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, 0)
						pCity:ChangeBaseYieldRateFromBuildings(iYield, -iOldDelta)
					end
				end
			end
		end	
	end
end
--=======================================================================================================================
-- Triggers
--=======================================================================================================================
function BuildingYieldFromGreatWorksInCity_TurnStart(iPlayer)
	BuildingYieldFromGreatWorksInCity(Players[iPlayer], true)
end

function BuildingYieldFromGreatWorksInCity_Dirty()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		BuildingYieldFromGreatWorksInCity(pPlayer, false)
	end
end

GameEvents.PlayerDoTurn.Add(BuildingYieldFromGreatWorksInCity_TurnStart)
Events.SerialEventCityInfoDirty.Add(BuildingYieldFromGreatWorksInCity_Dirty)
--=======================================================================================================================
--=======================================================================================================================