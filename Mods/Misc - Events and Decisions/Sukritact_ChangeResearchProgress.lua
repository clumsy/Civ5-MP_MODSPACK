-- Sukritact_ChangeResearchProgress
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.Sukritact_ChangeResearchProgress then return end
MapModData.Sukritact_ChangeResearchProgress = true
Events.SequenceGameInitComplete.Add(function() MapModData.Sukritact_ChangeResearchProgress = nil end)
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Sukritact_ChangeResearchProgress";

--=======================================================================================================================
-- Sukritact_ChangeResearchProgress Pseudo-function
--=======================================================================================================================
function ChangeResearchProgress (iPlayer, iDelta)
	local pPlayer = Players[iPlayer]
	
	local iStored = load(pPlayer, "iStored")
	if iStored == nil then iStored = 0 end
	
	save(pPlayer, "iStored", iStored + iDelta)
	ScienceManager(iPlayer)
end

LuaEvents.Sukritact_ChangeResearchProgress.Add(ChangeResearchProgress)
--=======================================================================================================================
-- Science Manager
--=======================================================================================================================

function ScienceManager(iPlayer)
	local pPlayer = Players[iPlayer]
	local iStored = load(pPlayer, "iStored")
	if iStored == nil or iStored == 0 then return end
	
	local iTech = pPlayer:GetCurrentResearch()
	
	if iTech == -1 then return end
	
	local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
	if pTeamTechs:HasTech(iTech) then return end
	local iCanBeAdded = pPlayer:GetResearchCost(iTech) - pPlayer:GetResearchProgress(iTech)
	
	if iStored > iCanBeAdded then
		pTeamTechs:ChangeResearchProgress(iTech, iCanBeAdded, pPlayer:GetID())
		save(pPlayer, "iStored", iStored - iCanBeAdded)
		print("Added: " .. iCanBeAdded .. ", Remaining: " .. iStored - iCanBeAdded)
	else
		pTeamTechs:ChangeResearchProgress(iTech, iStored, pPlayer:GetID())
		save(pPlayer, "iStored", 0)
		print("Added: " .. iStored .. ", Remaining: " .. 0)
	end
end

function ScienceManagerTrigger()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		ScienceManager(iPlayer)
	end
end

GameEvents.PlayerDoTurn.Add(ScienceManager)
Events.SerialEventResearchDirty.Add(ScienceManagerTrigger)
--=======================================================================================================================
--=======================================================================================================================