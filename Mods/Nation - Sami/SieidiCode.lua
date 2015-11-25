-- Sieidi Code
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "SieidiCode";
include("PlotIterators")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
function CompileCityID(pCity)
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
	local iCityID = ("X" .. pCity:GetX() .. "Y" .. pCity:GetY() .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)
	return iCityID
end

function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
-------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- Initial processes
--==========================================================================================================================

local iImprovementSieidi = GameInfoTypes.IMPROVEMENT_SIEIDI
local iLandmark = GameInfoTypes.IMPROVEMENT_LANDMARK

local iBuildingSieidi = GameInfoTypes.BUILDING_SAMI_SIEIDI

local iSnow = TerrainTypes.TERRAIN_SNOW
local iTundra = TerrainTypes.TERRAIN_TUNDRA
local iCoast = TerrainTypes.TERRAIN_COAST
local iOcean = TerrainTypes.TERRAIN_OCEAN

local tResources = {}
tResources[GameInfoTypes.RESOURCE_ARTIFACTS] = GameInfoTypes.RESOURCE_ARTIFACTS
tResources[GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS] = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS

local tNumtoPlace = {1, 1, 1, 1, 2, 2, 2, 2, 3}

--Weirdness to ensure that it works in Multiplayer
local iCiv = GameInfoTypes.CIVILIZATION_SAMI
local tSami = {}
for iPlayer, pPlayer in pairs(Players) do
	if (pPlayer:GetCivilizationType() == iCiv) then
		tSami[iPlayer] = pPlayer
	end
end

local pSave = "GAME"

--==========================================================================================================================
-- Main Code
--==========================================================================================================================

function SieidiCode(iPlayer)
	local pPlayer = Players[iPlayer]
    for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iBuildingSieidi) then
		
			local pPlot = pCity:Plot()
			
			local iTurnFounded = pCity:GetGameTurnFounded ()
			local iCityX = pPlot:GetX()
			local iCityY = pPlot:GetY()
			local iCityID = CompileCityID(pCity)
			
			if load(pSave, iCityID) ~= true then
			----------------------------------------------------------------------------------------------------------------------------
			-- First pass
			----------------------------------------------------------------------------------------------------------------------------
				local tPlots = {}
				
				for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local iOwner = pAdjacentPlot:GetOwner()
					local iTerrain = pAdjacentPlot:GetTerrainType()
					local iResource = pAdjacentPlot:GetResourceType()
					local iImprovement = pAdjacentPlot:GetImprovementType()
					
					if iOwner ~= iPlayer then
						--Do Nothing
					elseif (iTerrain == iCoast) or (iTerrain == iOcean) or (pAdjacentPlot:IsMountain()) then
						--Do Nothing
					elseif tResources[iResource] ~= nil then
						--Do Nothing
					elseif (iImprovement ~= -1) then
						--Do Nothing
					else
					
						table.insert(tPlots, pAdjacentPlot)
						if (iTerrain == iSnow) or (iTerrain == iTundra) then table.insert(tPlots, pAdjacentPlot) end
						if (iResource ~= -1) then table.insert(tPlots, pAdjacentPlot) end
					end
				end				
				
				local iNumtoPlace = tNumtoPlace[GetRandom(1, #tNumtoPlace)]
				
				local tIdenticalPlots = {}
				local bPlaced = false
				
				for iVal = 1, iNumtoPlace do
					local bPlacedThisLoop = false
					while (not(bPlacedThisLoop)) and #tPlots > 0 do		
						local iRandom = GetRandom(1, #tPlots)
						local pPlot = tPlots[iRandom]
						
						if not(tIdenticalPlots[pPlot]) then
							pPlot:SetImprovementType(iImprovementSieidi)
							tIdenticalPlots[pPlot] = true
							bPlacedThisLoop = true
							bPlaced = true
						end
						
						table.remove(tPlots, iRandom)
					end
				end
			----------------------------------------------------------------------------------------------------------------------------
			-- Second pass (if none placed on first pass)
			----------------------------------------------------------------------------------------------------------------------------
				if not(bPlaced) then
					local tPlots = {}
					
					for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						local iOwner = pAdjacentPlot:GetOwner()
						local iTerrain = pAdjacentPlot:GetTerrainType()
						local iResource = pAdjacentPlot:GetResourceType()
						local iImprovement = pAdjacentPlot:GetImprovementType()
						
						if iOwner ~= iPlayer and iOwner ~= -1 then
							--Do Nothing
						elseif (iTerrain == iCoast) or (iTerrain == iOcean) or (pAdjacentPlot:IsMountain()) then
							--Do Nothing
						elseif tResources[iResource] ~= nil then
							--Do Nothing
						elseif (iImprovement >= iLandmark) then
							--Do Nothing
						else
						
							table.insert(tPlots, pAdjacentPlot)
							if (iTerrain == iSnow) or (iTerrain == iTundra) then table.insert(tPlots, pAdjacentPlot) end
							if (iResource ~= -1) then table.insert(tPlots, pAdjacentPlot) end
						end
					end				
					
					local iNumtoPlace = tNumtoPlace[GetRandom(1, #tNumtoPlace)]
					
					local tIdenticalPlots = {}
					
					for iVal = 1, iNumtoPlace do
						local bPlacedThisLoop = false
						while (not(bPlacedThisLoop)) and #tPlots > 0 do		
							local iRandom = GetRandom(1, #tPlots)
							local pPlot = tPlots[iRandom]
							
							if not(tIdenticalPlots[pPlot]) then
								pPlot:SetImprovementType(iImprovementSieidi)
								pPlot:SetOwner(iPlayer, pCity:GetID(), true, true);
								tIdenticalPlots[pPlot] = true
								bPlacedThisLoop = true
								bPlaced = true
							end
							
							table.remove(tPlots, iRandom)
						end
					end
				end	
				
				save(pSave, iCityID, true)
				
			end
		end
	end
end

--==========================================================================================================================
-- Triggers
--==========================================================================================================================
if JFD_IsCivilisationActive(iCiv) then

	function SieidiCode1()
		for iPlayer, pPlayer in pairs(tSami) do
			SieidiCode(iPlayer)
		end
	end

	Events.SerialEventCityInfoDirty.Add(SieidiCode1)
	GameEvents.PlayerDoTurn.Add(SieidiCode)
	GameEvents.PlayerAdoptPolicy.Add(SieidiCode)
	
end