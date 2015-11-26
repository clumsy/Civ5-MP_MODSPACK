print ("Hittites Check")

local HittiteID = GameInfoTypes.CIVILIZATION_HITTITE_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == HittiteID then
			include("Hittite Traits Mod")
			break;
		end
	end
end

-- Stagger
local pStagger	= GameInfoTypes.PROMOTION_STAGGER_MOD;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then

		if Teams[pTeam]:GetAtWarCount(true) >= 1 then

			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
					if pUnit:IsCombatUnit() and not pUnit:IsEmbarked() then 
						local uPlot = pUnit:GetPlot()
						for loop, direction in ipairs(directions) do
							local adjPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction);
							if adjPlot:IsUnit() then
								local adjUnit = adjPlot:GetUnit(i);

								if adjUnit:IsHasPromotion(pStagger) then

									if (pUnit:GetOwner() ~= adjUnit:GetOwner()) then
										local adjPlayer = Players[adjUnit:GetOwner()];
										local adjTeam = adjPlayer:GetTeam();
										if Teams[pTeam]:IsAtWar(adjTeam) then
										
											local max = pUnit:MaxMoves();
											pUnit:SetMoves(max - 60);

										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)