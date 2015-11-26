-- Author: Tomatekh

print ("Hittites Scripts")

-- Military Allies & Rival Decay

local pCityState = GameInfoTypes.PROMOTION_HITTITE_CITY_STATE;

function CityStateAllies(pPlayer)
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local cPlayer = Players[i];
		local pID = pPlayer:GetID();
		if (cPlayer:GetMinorCivFriendshipLevelWithMajor(pID) >= 2) then
			for cUnit in cPlayer:Units() do
				if cUnit:IsCombatUnit() and not cUnit:IsEmbarked() then
					if not cUnit:IsHasPromotion(pCityState) then
						cUnit:SetHasPromotion(pCityState,true);
					end
				end
			end
		elseif (cPlayer:GetMinorCivFriendshipLevelWithMajor(pID) < 2) then
			for cUnit in cPlayer:Units() do
				if cUnit:IsCombatUnit() and not cUnit:IsEmbarked() then
					if cUnit:IsHasPromotion(pCityState) then
						cUnit:SetHasPromotion(pCityState,false);
					end
				end
			end
		end
		local HittiteInfluence = cPlayer:GetMinorCivFriendshipWithMajor(pID);
		for iPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local mPlayer = Players[iPlayer];
			local mID = mPlayer:GetID();
			local RivalInfluence = cPlayer:GetMinorCivFriendshipWithMajor(mID);
			local RivalRest = cPlayer:GetMinorCivFriendshipAnchorWithMajor(mID);
			if mPlayer ~= pPlayer then
				if HittiteInfluence >= RivalInfluence then
					if RivalInfluence > RivalRest then
						local gSpeed = Game.GetGameSpeedType();
						local iCurrentTurn = Game.GetGameTurn();
						if gSpeed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
							if not (mPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREECE"]) then
								--cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -1.25)
								if ( iCurrentTurn % 4 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							else
								if ( iCurrentTurn % 8 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
							if not (mPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREECE"]) then
								cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -1)
							else
								if ( iCurrentTurn % 2 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -1);
								end
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
							if not (mPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREECE"]) then
								--cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -0.75)
								if ( iCurrentTurn % 4 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -3);
								end
							else
								if ( iCurrentTurn % 8 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -3);
								end
							end
						elseif gSpeed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
							if not (mPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREECE"]) then
								--cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -0.625)
								if ( iCurrentTurn % 8 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							else
								if ( iCurrentTurn % 16 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							end	
						else
							if not (mPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GREECE"]) then
								--cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -0.625)
								if ( iCurrentTurn % 8 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							else
								if ( iCurrentTurn % 16 ) == 0 then
									cPlayer:ChangeMinorCivFriendshipWithMajor(mID, -5);
								end
							end
						end
					end
				end
			end
		end
	end
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(pCityState) then
			pUnit:SetHasPromotion(pCityState,false);
		end
	end
end

function VeniceCheck(pPlayer)
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(pCityState) then
			pUnit:SetHasPromotion(pCityState,false);
		end
	end
end

function CityStateBonus(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then
			CityStateAllies(pPlayer)
		elseif (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_AUSTRIA"]) or (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VENICE"]) then
			VeniceCheck(pPlayer)
		end
	end
end
GameEvents.PlayerDoTurn.Add(CityStateBonus)

-- AI Handle

local eINDUSTRIAL = GameInfoTypes.ERA_INDUSTRIAL;
local bBLOOM = GameInfoTypes.BUILDING_HITTITE_IRON_FORGE;
local bFORGE = GameInfoTypes.BUILDING_FORGE;
local bcBLOOM = GameInfoTypes.BUILDINGCLASS_FORGE;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then
			if not (pPlayer:IsHuman()) then
				if (Teams[pTeam]:GetCurrentEra() >= eINDUSTRIAL) then
					for pCity in pPlayer:Cities() do
						if pCity:IsHasBuilding(bBLOOM) then
							local BloomRefund = pCity:GetSellBuildingRefund(bBLOOM);
							pCity:SetNumRealBuilding(bBLOOM, 0);
							pPlayer:ChangeGold(BloomRefund);
						end
					end
				end
			end
		end
	end
end)

GameEvents.CityCanConstruct.Add(function(iPlayer, iCity, iBuilding) 
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (iBuilding == bBLOOM) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then
				local iForgeCount = pPlayer:GetBuildingClassCount(bcBLOOM)
				if iForgeCount >= 5 then
					return false
				elseif iForgeCount < 5 then
					if (pPlayer:IsHuman()) then
						return true
					elseif not (pPlayer:IsHuman()) then
						if (Teams[pTeam]:GetCurrentEra() >= eINDUSTRIAL) then
							return false
						elseif (Teams[pTeam]:GetCurrentEra() < eINDUSTRIAL) then
							return true
						end
					end
				end
			else
				return false
			end
		end
	end
	return true
end)

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local plot = Map.GetPlot(iX, iY);	
	local cCity = plot:GetPlotCity();
	local iNewOwner = cCity:GetOwner();
	local iOldOwner = cCity:GetOriginalOwner();
	local iPreviousOwner = cCity:GetPreviousOwner();
	local pPlayer = Players[iNewOwner];
	local oPlayer = Players[iOldOwner];
	local lPlayer = Players[iPreviousOwner];
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HITTITE_MOD) then
		if cCity:IsHasBuilding(bBLOOM) then
			cCity:SetNumRealBuilding(bBLOOM, 0);
		end
		if cCity:IsHasBuilding(bFORGE) then
			cCity:SetNumRealBuilding(bFORGE, 0);
		end
	end
	if (lPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_HITTITE_MOD) then
		if cCity:IsHasBuilding(bFORGE) then
			cCity:SetNumRealBuilding(bFORGE, 0);
		end
	end
end)