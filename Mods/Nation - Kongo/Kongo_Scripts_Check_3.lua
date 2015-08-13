print ("Kongo Check")

local KongoID = GameInfoTypes.CIVILIZATION_KONGO_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == KongoID then
			include("Kongo_Scripts_4")
			break;
		end
	end
end

local uPombo = GameInfoTypes.UNIT_KONGO_POMBO_MOD;
local cMounted = GameInfoTypes.UNITCOMBAT_MOUNTED;
local rHorse = GameInfoTypes.RESOURCE_HORSE;
local eModern = GameInfoTypes.ERA_MODERN;

directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive() and Teams[pTeam]:GetCurrentEra() < eModern) then
			for pUnit in pPlayer:Units() do
				if (pUnit:GetUnitType() == uPombo and not pUnit:IsEmbarked()) then 
						local uPlot = pUnit:GetPlot();
						for loop, direction in ipairs(directions) do
							local pPlot = Map.PlotDirection(uPlot:GetX(), uPlot:GetY(), direction);
							if pPlot:IsUnit() then
								local adjUnit = pPlot:GetUnit(i);
								if (adjUnit:GetUnitCombatType() == cMounted and not adjUnit:IsEmbarked()) then
											local mMoves = adjUnit:MaxMoves();
											pUnit:SetMoves(mMoves);
									
								end
							end
						end
					
				end
			end
		
	end
end)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive() and Teams[pTeam]:GetCurrentEra() < eModern and not (pPlayer:IsHuman()) and Teams[pTeam]:GetAtWarCount(true) == 0) then
					for pUnit in pPlayer:Units() do
						if (pUnit:GetUnitType() == uPombo and not pUnit:IsEmbarked() and pUnit:GetMoves() <= 120) then
									local max = pUnit:MaxMoves();
									pUnit:SetMoves(max + 60);
								
							
						end
					end
				
			
		
	end
end)