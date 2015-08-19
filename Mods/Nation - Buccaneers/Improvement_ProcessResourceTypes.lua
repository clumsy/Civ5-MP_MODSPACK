-- Improvement_ProcessResourceTypes
-- Author: Sukritact
--------------------------------------------------------------
--[[

To use, ensure that both resources (the one to be improved, and 
the one to be gained), can both be improved by this improvement.

This code will simply replace the "raw resource" with the 
"processed resource". It will keep track of the tiles that have been
saved, and revert the tile back to the original resource if it finds the
required improvement missing.

Resource management (from trade, pillaging, etc), will be handled
by the game as it normally does.

]]
--------------------------------------------------------------

print("loaded")
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Improvement_ProcessResourceTypes";

--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------

function DecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function CompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

--------------------------------------------------------------
-- Initial Processes
--------------------------------------------------------------

--Get the list of improvements and the resources they process
local tReferences = {}
for row in GameInfo.Improvement_ProcessResourceTypes() do
    iImprovement = GameInfoTypes[row.ImprovementType]
    iRawRes = GameInfoTypes[row.RawResourceType]
    iProcessedRes = GameInfoTypes[row.ProcessedResourceType]
    if tReferences[iImprovement] == nil then
        tReferences[iImprovement] = {}
        tReferences[iImprovement][iRawRes] = iProcessedRes
    else
        tReferences[iImprovement][iRawRes] = iProcessedRes
    end
end

--Populate table with previous entries
local tPlots = {}
for iPlot = 0, Map.GetNumPlots() - 1, 1 do
    local pPlot = Map.GetPlotByIndex(iPlot)
    local iRes = load(pPlot, "iRes")
    if iRes ~= nil then
        local iImprovement = load(pPlot, "iImprovement")
        local sKey = CompilePlotID(pPlot)
        tPlots[sKey] = {["iImprovement"] = iImprovement, ["iRes"] = iRes}
    end
end

--------------------------------------------------------------
-- Main Code
--------------------------------------------------------------

function OnImprovementBuilt(iPlayer, iX, iY, iImprovement)
    if tReferences[iImprovement] ~= nil then
        local pPlot = Map.GetPlot(iX, iY)
        local iRes = pPlot:GetResourceType()
        local iProcessedRes = tReferences[iImprovement][iRes]
        if iProcessedRes ~= nil then
            pPlot:SetImprovementType(-1)
            pPlot:SetResourceType(iProcessedRes, pPlot:GetNumResource())
            pPlot:SetImprovementType(iImprovement)
            
            save(pPlot, "iImprovement", iImprovement)
            save(pPlot, "iRes", iRes)
            
            local sKey = CompilePlotID(pPlot)
            tPlots[sKey] = {["iImprovement"] = iImprovement, ["iRes"] = iRes}
        end
    end
end
GameEvents.BuildFinished.Add(OnImprovementBuilt)

function CheckTiles()
    for sKey, tTable in pairs(tPlots) do
        local pPlot = DecompilePlotID(sKey)
        local iImprovement = pPlot:GetImprovementType()
        local iRes = tTable.iRes
        if iImprovement ~= tTable.iImprovement then
            --Check if has converted to a different resource
            local iProcessedRes = nil
            if tReferences[iImprovement] ~= nil then
                iProcessedRes = tReferences[iImprovement][iRes]
            end
            if iProcessedRes ~= nil then
                pPlot:SetImprovementType(-1)
                pPlot:SetResourceType(iProcessedRes, pPlot:GetNumResource())
                pPlot:SetImprovementType(iImprovement)
            
                tPlots[sKey]["iImprovement"] = iImprovement
                save(pPlot, "iImprovement", iImprovement)
            else
                pPlot:SetResourceType(iRes, pPlot:GetNumResource())
                
                save(pPlot, "iImprovement", nil)
                save(pPlot, "iRes", nil)
                
                tPlots[sKey] = nil
            end
        end
    end
end
Events.SerialEventCityInfoDirty.Add(CheckTiles)
GameEvents.PlayerDoTurn.Add(CheckTiles)
