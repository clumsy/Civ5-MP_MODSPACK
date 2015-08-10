print ("Sumer Check")

local SumerID = GameInfoTypes.CIVILIZATION_AKKADIAN_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == SumerID then
			include("Sumer Pop Script")
			break;
		end
	end
end

-- XP
local uVulture = GameInfoTypes.UNIT_AKKADIAN_MOD_VULTURE;

local pHot	= GameInfoTypes.PROMOTION_VULTURE_MOD_RIVERMOVEMENT_II;
local pCold	= GameInfoTypes.PROMOTION_VULTURE_MOD_RIVERMOVEMENT;
local pWood = GameInfoTypes.PROMOTION_WOODSMAN;

local fForest = GameInfoTypes.FEATURE_FOREST;
local fJungle = GameInfoTypes.FEATURE_JUNGLE;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == uVulture) then
				local BaseXP = pUnit:GetExperience()
				if BaseXP == 0 then
					local VultureXP = BaseXP + 10
					pUnit:SetExperience(VultureXP);
				end
			end
		end
	end
end)

-- Movement
GameEvents.UnitSetXY.Add( 
function(iPlayerID, iUnitID, iX, iY)
	local pPlot = Map.GetPlot(iX, iY)
	local pPlayer = Players[iPlayerID]
	local pUnit = pPlayer:GetUnitByID(iUnitID)

	if pPlot then

		if pPlot:IsRiver() then 
			if pUnit:IsHasPromotion(pCold) then
				pUnit:SetHasPromotion(pCold, false)
				pUnit:SetHasPromotion(pHot, true)		
			end

		elseif not pPlot:IsRiver() then
			if pUnit:IsHasPromotion(pHot) then
				pUnit:SetHasPromotion(pHot, false)
				pUnit:SetHasPromotion(pCold, true)

				if pPlot:IsRoughGround() then
					if pUnit:GetMoves() == 60 then
						if not pUnit:IsHasPromotion(pWood) then
							pUnit:ChangeMoves(-60)
						elseif pUnit:IsHasPromotion(pWood) then
							if (pPlot:GetFeatureType() ~= fForest) and (pPlot:GetFeatureType() ~= fJungle) then
								pUnit:ChangeMoves(-60)
							end
						end
					end
				end

			end
		end
	end
end)