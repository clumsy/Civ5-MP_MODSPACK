print ("Goths Check")

local GothsID = GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == GothsID then
			include("Goth Mod Via Appia Script")
			break;
		end
	end
end

-- Heal

function vDecompilePlotID(sKey)
    iBreak = string.find(sKey, "Y")
    iX = tonumber(string.sub(sKey, 1, iBreak - 1))
    iY = tonumber(string.sub(sKey, iBreak + 1))
    pPlot = Map.GetPlot(iX, iY)
    return pPlot
end

function vCompilePlotID(pPlot)
    iX = pPlot:GetX()
    iY = pPlot:GetY()
    return(iX .. "Y" .. iY)
end

local gothPlots = {}
local pPillageHeal = GameInfoTypes.PROMOTION_VISIGOTHS_MOD_HEAL_ON_PILLAGE;

function OnGothPillage(iHexX, iHexY, iContinent1, iContinent2)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))

	local pillageCheck = 0;
	for sKey, tTable in pairs(gothPlots) do
		local vPlot = vDecompilePlotID(sKey)
		if pPlot == vPlot then
			pillageCheck = 1;
			break
		end
	end

	if pillageCheck <= 0 then
		if pPlot:IsImprovementPillaged() then
			if pPlot:IsUnit() then
				local pUnit = pPlot:GetUnit(i);
				if (pUnit:IsHasPromotion(pPillageHeal)) then
					if pUnit:GetOwner() == Game.GetActivePlayer() then
						pUnit:ChangeDamage(-1 * math.min(pUnit:GetDamage(), 25));				
						local sKey = vCompilePlotID(pPlot)
						gothPlots[sKey] = -1
					end
				end
			end
		end
	end

end

Events.SerialEventImprovementCreated.Add(OnGothPillage)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	
	local isGoths = 0;
	for i, player in pairs(Players) do
		if player:IsEverAlive() then
			if player:GetCivilizationType() == GothsID then
				isGoths = 1;
				break;
			end
		end
	end

	if isGoths == 1 then
		local pPlayer = Players[iPlayer];
		local pTeam = pPlayer:GetTeam();
		if (pPlayer:IsAlive()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then
				for sKey, tTable in pairs(gothPlots) do
					gothPlots[sKey] = nil
				end
			end
		end
	elseif isGoths ~= 1 then
		if iPlayer == 63 then
			for sKey, tTable in pairs(gothPlots) do
				gothPlots[sKey] = nil
			end
		end
	end

end)