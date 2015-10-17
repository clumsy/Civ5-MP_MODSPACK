-- LuaEvents.PlayerEnteredNewEra
-- Author: Sukritact
--=======================================================================================================================
--[[

LuaEvents.PlayerEnteredNewEra(iPlayer, iCurrentEra)
Fires when a player enters a new era. Unlike "Events.SerialEventEraChanged" this fires immediately upon entry.

]]
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.LuaEvents_PlayerEnteredNewEra then return end
MapModData.LuaEvents_PlayerEnteredNewEra = true
Events.SequenceGameInitComplete.Add(function() MapModData.LuaEvents_PlayerEnteredNewEra = nil end)
--=======================================================================================================================

print("loaded")

--=======================================================================================================================
-- Initial Functions
--=======================================================================================================================
tCurrentEra = {}
for iPlayer, pPlayer in pairs(Players) do
	if pPlayer:IsEverAlive() then
		tCurrentEra[iPlayer] = pPlayer:GetCurrentEra()
	end
end
--=======================================================================================================================
-- Triggers
--=======================================================================================================================
function EraChangeDirty()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		EraChange(iPlayer, pPlayer)
	end
end

function EraChangeTurnStart(iPlayer)
	local pPlayer = Players[iPlayer]
	EraChange(iPlayer, pPlayer)
end


GameEvents.PlayerDoTurn.Add(EraChangeTurnStart)
Events.SerialEventCityInfoDirty.Add(EraChangeDirty)
--=======================================================================================================================
-- Main Function
--=======================================================================================================================
function EraChange(iPlayer, pPlayer)
	local iOldEra = tCurrentEra[iPlayer]
	local iCurrentEra = pPlayer:GetCurrentEra()
	if iOldEra < iCurrentEra then
		LuaEvents.PlayerEnteredNewEra(iPlayer, iCurrentEra)
		tCurrentEra[iPlayer] = iCurrentEra
	end
end
--=======================================================================================================================
--=======================================================================================================================