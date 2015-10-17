-- Building_ResourcePerEra
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.Building_ResourcePerEra then return end
MapModData.Building_ResourcePerEra = true
Events.SequenceGameInitComplete.Add(function() MapModData.Building_ResourcePerEra = nil end)
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Building_ResourcePerEra";

--=======================================================================================================================
--Era Change Bonus
--=======================================================================================================================

function Building_ResourcePerEra(iPlayer, iEra)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsMinorCiv() or pPlayer:IsBarbarian()) then
		return
	end
	for row in GameInfo.Building_ResourcePerEra() do
		local iBuilding = GameInfoTypes[row.BuildingType]
		local iResource = GameInfoTypes[row.ResourceType]
		local iQuantity = row.Quantity
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iBuilding) then
				pPlayer:ChangeNumResourceTotal(iResource, iQuantity)
			end
		end
	end
end

LuaEvents.PlayerEnteredNewEra.Add(Building_ResourcePerEra)

--=======================================================================================================================
--Initial Construction Bonus
--=======================================================================================================================

function Building_ResourcePerEraBuilt(iPlayer, pPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsMinorCiv() or pPlayer:IsBarbarian()) then
		return
	end
	for row in GameInfo.Building_ResourcePerEra() do
		local iQuantity = row.InitialQuantity
		if iQuantity > 0 then
			local iBuilding = GameInfoTypes[row.BuildingType]
			local iResource = GameInfoTypes[row.ResourceType]
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(iBuilding) then
					local iCity = pCity:GetID()
					local sKey = iCity .. "_B_" .. iBuilding .. "_R_" .. iResource
					if load(pPlayer, sKey) ~= true then
						pPlayer:ChangeNumResourceTotal(iResource, iQuantity)
						save(pPlayer, sKey, true)
					end
				end
			end
		end
	end
end

--=======================================================================================================================
-- Triggers
--=======================================================================================================================

function Building_ResourcePerEraDirty()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		Building_ResourcePerEraBuilt(iPlayer, pPlayer)
	end
end

function Building_ResourcePerEraTurnStart(iPlayer)
	local pPlayer = Players[iPlayer]
	Building_ResourcePerEraBuilt(iPlayer, pPlayer)
end


GameEvents.PlayerDoTurn.Add(Building_ResourcePerEraTurnStart)
Events.SerialEventCityInfoDirty.Add(Building_ResourcePerEraDirty)
--=======================================================================================================================
--=======================================================================================================================