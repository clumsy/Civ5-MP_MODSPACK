-- Combat Bonus on Pillaged tiles Script
print ("Pillaged Tiles Script thing working")

local pPillageBonus = GameInfoTypes.PROMOTION_PILLAGE_BONUS;
-- Please change these ones to the actual required values.
local BaseCombat = 30
local PillageBonus = 6

function GetPillaged (iPlayer)
	for _, pPlayer in pairs(Players) do
		if (pPlayer:IsAlive()) then
			for pUnit in pPlayer:Units() do
				if (pUnit:IsHasPromotion(pPillageBonus)) then
					local uPlot = pUnit:GetPlot();
						if uPlot:IsImprovementPillaged() then
							local combatboost = (BaseCombat + PillageBonus)
							pUnit:SetBaseCombatStrength(combatboost)
							print ("Combat Bonus on Pillaged thing!");
						else
							pUnit:SetBaseCombatStrength(BaseCombat)
						end
				end
			end
		end
	end
end



GameEvents.PlayerDoTurn.Add(GetPillaged);