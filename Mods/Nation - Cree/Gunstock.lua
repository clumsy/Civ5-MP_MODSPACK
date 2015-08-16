-- Gunstock Mount Up! by Neirai the Forgiven
-- Special thanks to LastSword for being such a Lua pro and helping me fix a CTD.
-- Special thanks to Leugi for helping me figure out how to use Convert() and for his superior design.
function GunstockRidersMountUp(player)
	local pPlayer = Players[player]
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_TELLMEABOUTHORSES) then
			local pPlot = pUnit:GetPlot()
			if pPlot then
				if pPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_HORSEPILLAGE then
					local face = pUnit:GetFacingDirection()
					print("About to spawn unit!")
					local newunit = pPlayer:InitUnit(GameInfoTypes.UNIT_GUNSTOCKRIDER, pPlot:GetX(), pPlot:GetY(), UNITAI_FAST_ATTACK, face)
					pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_TELLMEABOUTHORSES, false)
					newunit:Convert(pUnit)
					local horseCount = (pPlot:GetNumResource())
					pPlot:SetImprovementType(-1)
					pPlot:SetResourceType(-1)
					print("No Resource, right?")
--					if horseCount > 0 then
--						pPlot:SetResourceType(GameInfoTypes.RESOURCE_HORSE, (horseCount - 2))
--					end
					--damage relations!
					print("Was that offensive?")
					local pOffended = Players[pPlot:GetOwner()]
					if pOffended ~= pPlayer then
						print("Damaging Relations!")
						if pOffended:IsMinorCiv() then
							print("Minor Civ detected")
							pOffended:ChangeMinorCivFriendshipWithMajor(pPlayer, -30)
							print("So much hate!")
						elseif not pOffended:IsHuman() then
							print("Major Civ Detected")
							if not pOffended:IsDenouncingPlayer(pPlayer) then
								pOffended:DoForceDenounce(pPlayer)
								print("So much hate!")
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GunstockRidersMountUp)

function GunstockBerserk(player)
	local pPlayer = Players[player]
	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_TELLMEABOUTBERSERK) then
			if unit:GetCurrHitPoints() < 51 then
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_GUNSTOCKBERSERK, true)
			else
				unit:SetHasPromotion(GameInfoTypes.PROMOTION_GUNSTOCKBERSERK, false)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GunstockBerserk)