-- BoazovazziCode
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "BoazovazziCode";

--=======================================================================================================================
-- Utility Functions	
--=======================================================================================================================
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
--------------------------------------------------------------
-- CompilePlotID
--------------------------------------------------------------
function CompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end
--------------------------------------------------------------
-- DecompilePlotID
--------------------------------------------------------------
function DecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end
--------------------------------------------------------------
-- GetNearestCity
--------------------------------------------------------------
function GetNearestCity(pPlayer, iX, iY)
	local iDistance = nil
	local pTargetCity = nil
	for pCity in pPlayer:Cities() do
		if not(iDistance) or iDistance > Map.PlotDistance(iX, iY, pCity:GetX(), pCity:GetY()) then
			pTargetCity = pCity
			iDistance = Map.PlotDistance(iX, iY, pCity:GetX(), pCity:GetY())
		end
	end
	return(pTargetCity)
end
--=======================================================================================================================
-- Initial Defines
--=======================================================================================================================
local iHerd = GameInfoTypes.IMPROVEMENT_SAMI_HERD
local iBoazovazzi = GameInfoTypes.UNIT_SAMI_BOAZOVAZZI
local iMigratory = GameInfoTypes.RESOURCE_MIGRATORY_GROUNDS

local iGolbalTurns = GameInfo.GameSpeeds[Game.GetGameSpeedType()].DealDuration
local iBase = iGolbalTurns/4.5
local tDelta = {iBase*0.5, iBase*0.75, iBase*0.75, iBase, iBase, iBase, iBase, iBase*1.25, iBase*1.25, iBase*1.5}

local bTrigger = false
-------------------------------------------------------------------------------------------------------------------------
-- Boazovazzi Code: Load stored plots
-------------------------------------------------------------------------------------------------------------------------
tPlots = {}
for iPlayer, pPlayer in pairs(Players) do
	tPlots[iPlayer] = {}
end

for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
    if load(pPlot, "iPlayer") then
		local tPlot = {}
		tPlot.iTurns =		load(pPlot, "iTurns")
		tPlot.iResource = 	load(pPlot, "iResource")
	
		tPlots[load(pPlot, "iPlayer")][pPlot] = tPlot
	end
end
--=======================================================================================================================
-- Core Functions: Boazovazzi Code (Herding)
--=======================================================================================================================
function BoazovazziCode(iPlayer, iX, iY, iImprovement)
	if (iImprovement ~= iHerd) then return end
	
	local pPlot = Map.GetPlot(iX, iY)
	local iRes = pPlot:GetResourceType()
	if (iRes == iMigratory) then
		pPlot:SetImprovementType(-1)
		return
	end
	
	local iOwner = pPlot:GetOwner()
	
	local pPlayer = Players[iPlayer]
	local pNearestCity = GetNearestCity(pPlayer, iX, iY)
	if not(pNearestCity) then return end
	
	pPlot:SetImprovementType(-1)
	pPlot:SetResourceType(iMigratory, 1)
	pPlot:SetOwner(-1)
	
	save(pPlot, "iTurns", iGolbalTurns)
	save(pPlot, "iResource", iRes)
	save(pPlot, "iPlayer", iPlayer)
	
	tPlots[iPlayer][pPlot] = {}
	tPlots[iPlayer][pPlot].iTurns =		iGolbalTurns
	tPlots[iPlayer][pPlot].iResource = 	iRes
	
	local iDeltaF = math.ceil(tDelta[GetRandom(1,#tDelta)])
	local iDeltaP = math.ceil(tDelta[GetRandom(1,#tDelta)])
	
	pNearestCity:ChangeFood(DeltaF)
	pNearestCity:SetOverflowProduction(pNearestCity:GetOverflowProduction() + iDeltaP)
	
	if (pPlayer:IsHuman()) then
		sTooltip = Locale.ConvertTextKey("TXT_KEY_MC_BUILD_SAMI_HERD_NOTIFICATION", pNearestCity:GetName(), iDeltaF, iDeltaP)
		sTitle = Locale.ConvertTextKey("TXT_KEY_MC_BUILD_SAMI_HERD_NOTIFICATION_TITLE", pNearestCity:GetName())
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sTooltip, sTitle, pNearestCity:GetX(), pNearestCity:GetY())
	end
	
	pPlot:SetOwner(iOwner)	
end
GameEvents.BuildFinished.Add(BoazovazziCode)
--=======================================================================================================================
-- Core Functions: Boazovazzi Code (Repopulate)
--=======================================================================================================================
function RepopulateCode(iPlayer)
	for pPlot, tTable in pairs(tPlots[iPlayer]) do
		if tTable.iTurns - 1 <= 0 then
			
			local iOwner = pPlot:GetOwner()		
			pPlot:SetOwner(-1)	
			pPlot:SetResourceType(tTable.iResource, 1)
			
			local iCity = nil
			if iOwner ~= -1 then
				local pNearestCity = GetNearestCity(Players[iOwner], pPlot:GetX(), pPlot:GetY())
				if pNearestCity then
					iCity = pNearestCity:GetID()
				end
			end	
			
			tPlots[iPlayer][pPlot] = nil
			
			save(pPlot, "iTurns", nil)
			save(pPlot, "iResource", nil)
			save(pPlot, "iPlayer", nil)
			
			pPlot:SetOwner(iOwner, iCity)
		else
			tTable.iTurns = tTable.iTurns - 1
			save(pPlot, "iTurns", tTable.iTurns - 1)
		end
	end
end
GameEvents.PlayerDoTurn.Add(RepopulateCode)
--=======================================================================================================================
-- Core Functions: Boazovazzi Code (AI)
--=======================================================================================================================
function BoazovazziCode_AI(iPlayer)
	pPlayer = Players[iPlayer]
	if not(pPlayer:IsHuman()) then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iBoazovazzi then
				local pPlot = pUnit:GetPlot()
				if (pPlot:GetOwner() == -1 and pPlot:CanHaveImprovement(iHerd) and pPlot:GetImprovementType() == -1) then
					pUnit:PushMission(GameInfoTypes.MISSION_BUILD, GameInfoTypes.BUILD_SAMI_HERD)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(BoazovazziCode_AI)
--=======================================================================================================================
--=======================================================================================================================