-- Ashanti Functions
-- Author: Tomathekh, Sukritact
--=======================================================================================================================

include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "MC_Ashanti";
print("loaded")

--=======================================================================================================================
-- Abrade: Extra Movement
--=======================================================================================================================
local AshantiUU = GameInfoTypes.UNIT_MC_ASHANTI_ABRADE
local UUDummyPromotion = GameInfoTypes.PROMOTION_MC_ASHANTI_EXTRA_MOVES

function AshantiUUMove(iPlayer)
	local iCurrentTurn = Game.GetGameTurn()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MC_ASHANTI) then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == AshantiUU then
					local max = pUnit:MaxMoves()
					if pUnit:GetGameTurnCreated() == iCurrentTurn then				
						if pUnit:GetMoves() == max then
							if not pUnit:IsHasPromotion(UUDummyPromotion) then
								pUnit:SetMoves(max + 120)
								pUnit:SetHasPromotion(UUDummyPromotion,true)
							end
						end
					end
					if pUnit:GetGameTurnCreated() == (iCurrentTurn - 1) then
						if not pUnit:IsHasPromotion(UUDummyPromotion) then
							pUnit:SetMoves(max + 120)
							pUnit:SetHasPromotion(UUDummyPromotion,true)
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AshantiUUMove)
--=======================================================================================================================
-- Drumroll Warrior: Double Spawning
--=======================================================================================================================
local iDrumrollWarrior = GameInfoTypes.UNIT_MC_ASHANTI_DRUMROLL_WARRIOR

function DoubleDrumrollWarrior(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer];
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == iDrumrollWarrior then
		local pNewUnit = pPlayer:InitUnit(iDrumrollWarrior, pUnit:GetX(), pUnit:GetY())

		pNewUnit:SetExperience(pUnit:GetExperience())
	end
end
GameEvents.CityTrained.Add(DoubleDrumrollWarrior)
LuaEvents.MC_GoldenStoolUnitPurchased.Add(DoubleDrumrollWarrior)

--=======================================================================================================================
-- Drumroll Warrior: GSP from Combat
--=======================================================================================================================
local iPromotion = GameInfoTypes.PROMOTION_MC_ASHANTI_GOLDEN_STOOL_POINTS

function GSPGeneration(iPlayer)
	local pPlayer = Players[iPlayer]
		
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(iPromotion) then
			local iUnit = pUnit:GetID()
			local iOldXP = load(pPlayer, iUnit)
			local iXP = pUnit:GetExperience()
			save(pPlayer, iUnit, iXP)
			if iOldXP ~= nil then
				local iDelta = (iXP - iOldXP)
				if iDelta > 0 then
					LuaEvents.ChangeGSP(pPlayer:GetID(), iDelta)
				end
			end
		end
	end

end
GameEvents.PlayerDoTurn.Add(GSPGeneration)

function UnitDestroyed(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit == nil then
		save(pPlayer, iUnit, nil)
	end
end
Events.SerialEventUnitDestroyed.Add(UnitDestroyed)
--=======================================================================================================================
--=======================================================================================================================