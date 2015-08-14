print ("Sioux Check")

include("PlotIterators")

local SiouxID = GameInfoTypes.CIVILIZATION_SIOUX_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == SiouxID then
			include("Sioux Lua Scripts")
			break;
		end
	end
end

function bGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local uSioux = GameInfoTypes.UNIT_SIOUX_HORSEMAN_MOD;
local uCavalry = GameInfoTypes.UNITCLASS_CAVALRY;
local pBandLeader = GameInfoTypes.PROMOTION_SIOUX_VETERAN_LEADER;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsAlive()) then
		--if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_SIOUX_MOD) then
			local bandCheck = 0;
			for pUnit in pPlayer:Units() do

				if (pUnit:GetUnitClassType() == uCavalry) then
					--if pUnit:GetName() ~= "" then
						--if pUnit:GetName() == "Rain in the Face" or "Gall" or "Two Bears" or "Thunderhawk" or "Running Antelope" or "Crazy Horse" or "Red Cloud" or "Struck by the Ree" or "Big Head" or "Big Eagle" or "Moccasin Top" or "Good Weasel" then
					pUnit:SetName("");
						--end
					--end
				end

				if (pUnit:GetUnitType() == uSioux) then
					if pUnit:IsHasPromotion(pBandLeader) then
						bandCheck = bandCheck + 1;
						break
					end
				end

			end
			if bandCheck <= 0 then
				local bandAward = 1;
				for pUnit in pPlayer:Units() do
					if pUnit:GetUnitType() == uSioux then
						if bandAward >= 1 then
							pUnit:SetHasPromotion(pBandLeader,true);

							local bRandom = bGetRandom(1, 12)
							if bRandom == 1 then
								pUnit:SetName("Rain in the Face");
							elseif bRandom == 2 then
								pUnit:SetName("Gall");
							elseif bRandom == 3 then
								pUnit:SetName("Two Bears");
							elseif bRandom == 4 then
								pUnit:SetName("Thunderhawk");
							elseif bRandom == 5 then
								pUnit:SetName("Running Antelope");
							elseif bRandom == 6 then
								pUnit:SetName("Crazy Horse");
							elseif bRandom == 7 then
								pUnit:SetName("Red Cloud");
							elseif bRandom == 8 then
								pUnit:SetName("Struck by the Ree");
							elseif bRandom == 9 then
								pUnit:SetName("Big Head");
							elseif bRandom == 10 then
								pUnit:SetName("Big Eagle");
							elseif bRandom == 11 then
								pUnit:SetName("Moccasin Top");
							elseif bRandom == 12 then
								pUnit:SetName("Good Weasel");
							end

							bandAward = bandAward - 1;
							break
						end
					end
				end
			end
		--end
	end
end)