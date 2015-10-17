-- BuildingYieldFromCityStates
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.BuildingYieldFromCityStates then return end
MapModData.BuildingYieldFromCityStates = true
Events.SequenceGameInitComplete.Add(function() MapModData.BuildingYieldFromCityStates = nil end)
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "BuildingYieldFromCityStates";

--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local iCulture = GameInfoTypes["YIELD_CULTURE"]
local iFaith = GameInfoTypes["YIELD_FAITH"]

function BuildingYieldFromCityStates(iPlayer, pPlayer, bIsTurnStart)
	--print(bIsTurnStart)
	for row in GameInfo.Building_YieldFromCityStates() do
		local iBuilding = GameInfo.Buildings[row.BuildingType].ID
		local iYield = YieldTypes[row.YieldType]
		local iDeltaModifier = row.Yield
		local bIncludeFriendly = row.IncludeFriendly
		local iNumCSs = 0
		local iLevel = 2
		if (bIncludeFriendly == true) then
			iLevel = 1
		end
		
		--Get Friendly or Allied CSs
		for i, pLoopPlayer in pairs(Players) do
			if pLoopPlayer:IsAlive() and pLoopPlayer:IsMinorCiv() then
				if pLoopPlayer:GetMinorCivFriendshipLevelWithMajor(iPlayer) >= iLevel then
					iNumCSs = iNumCSs + 1
				end
			end
		end
		local iDelta = iNumCSs * iDeltaModifier

		--Change building yields in cities
		for pCity in pPlayer:Cities() do
			local iCity = pCity:GetID()
			if pCity:IsHasBuilding(iBuilding) then
				if iYield == iCulture then
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture)
					save( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture, iDelta)
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
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, iDelta)
					if iOldDelta == nil then
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta)
					else
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta - iOldDelta)
					end
				end
				
			-- Clear data if Building does not exist --
			
			else
				if iYield == iCulture then
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture, 0)
						pCity:ChangeJONSCulturePerTurnFromBuildings(-iOldDelta)
					end
				elseif iYield == iFaith then
				else
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, 0)
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

function BuildingYieldFromCityStatesTrigger1(iPlayer)
	local pPlayer = Players[iPlayer]
	local bIsTurnStart = true
	BuildingYieldFromCityStates(iPlayer, pPlayer, bIsTurnStart)
end

function BuildingYieldFromCityStatesTrigger2()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	local bIsTurnStart = false
	if pPlayer:IsTurnActive() then
		BuildingYieldFromCityStates(iPlayer, pPlayer, bIsTurnStart)
	end
end

GameEvents.PlayerDoTurn.Add(BuildingYieldFromCityStatesTrigger1)
Events.SerialEventGameDataDirty.Add(BuildingYieldFromCityStatesTrigger2)
--=======================================================================================================================
--=======================================================================================================================