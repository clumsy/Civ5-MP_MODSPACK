-- SamiUA
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("PlotIterators")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "SamiUA";

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
function CompileCityID(pCity)
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
	local iCityID = ("X" .. pCity:GetX() .. "Y" .. pCity:GetY() .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)
	return iCityID
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
--=======================================================================================================================
-- Globals
--=======================================================================================================================
local iSnow = TerrainTypes.TERRAIN_SNOW
local iTundra = TerrainTypes.TERRAIN_TUNDRA
local iCiv = GameInfoTypes.CIVILIZATION_SAMI
local iFood = GameInfo.Yields.YIELD_FOOD.ID
--=======================================================================================================================
-- Claim resource tiles
--=======================================================================================================================
function SamiUA(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	local bClaim = false
	if (pPlayer:GetCivilizationType() == iCiv) then
		local iTeam = pPlayer:GetTeam()
		local pPlot = Map.GetPlot(iCityX, iCityY)
		local pCity = pPlot:GetPlotCity()
		local iCity = pCity:GetID()
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if ((pAdjacentPlot:GetTerrainType() == iSnow) or (pAdjacentPlot:GetTerrainType() == iTundra)) and not(pAdjacentPlot:IsMountain()) then
				bClaim = true
				break
			end
		end
		print(bClaim)
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			iX = pAdjacentPlot:GetX()
			iY = pAdjacentPlot:GetY()
			--print(iX, iY)
			--print(pAdjacentPlot:GetOwner(), pAdjacentPlot:GetResourceType())
			if (bClaim) and (pAdjacentPlot:GetOwner() == -1) and (pAdjacentPlot:GetResourceType() > -1) then
				pAdjacentPlot:SetOwner(iPlayer, iCity, true, true);
				--print("claimed")
			end
			pAdjacentPlot:SetRevealed(iTeam, true)
		end
	end
end

if JFD_IsCivilisationActive(iCiv) then GameEvents.PlayerCityFounded.Add(SamiUA) end
--=======================================================================================================================
-- Food on Tundra and Snow
--=======================================================================================================================
function SamiTerrainAdjust(pPlot, iMod)
	if (pPlot:GetTerrainType() == iSnow) and not (pPlot:IsMountain()) then
		Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), iFood, 3 * iMod)
	elseif (pPlot:GetTerrainType() == iTundra) and not (pPlot:IsMountain()) then
		Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), iFood, 1 * iMod)
	end
end

function SamiUA2(iOwner, iCityX, iCityY)
	local pPlayer = Players[iOwner]
	local pPlot = Map.GetPlot(iCityX, iCityY)
	local pCity = pPlot:GetPlotCity()
	
	local bSami =(pPlayer:GetCivilizationType() == iCiv)
	local bAltered = load("GAME", CompileCityID(pCity))
	
	if (bSami and not(bAltered)) then
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			SamiTerrainAdjust(pAdjacentPlot, 1)
		end
		save("GAME", CompileCityID(pCity), true)
	end	
	if (not(bSami) and bAltered) then
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			SamiTerrainAdjust(pAdjacentPlot, -1)
		end
		save("GAME", CompileCityID(pCity), nil)
	end
end

if JFD_IsCivilisationActive(iCiv) then

	GameEvents.CityCaptureComplete.Add(
		function(iOldOwner, bIsCapital, iCityX, iCityY, iOwner, iPop, bConquest)
			SamiUA2(iOwner, iCityX, iCityY)
		end
		)
	GameEvents.PlayerCityFounded.Add(SamiUA2)

end
--=======================================================================================================================
--=======================================================================================================================