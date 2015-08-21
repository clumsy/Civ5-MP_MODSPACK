-- Tomatekh

print ("Goths Scripts")

-- Road

local pROAD = GameInfoTypes.PROMOTION_VISIGOTHS_MOD_ENEMY_ROUTE;
local eINDUSTRIAL = GameInfoTypes.ERA_INDUSTRIAL;
local cMOUNTED = GameInfoTypes.UNITCOMBAT_MOUNTED;
local uCHARIOTARCHER = GameInfoTypes.UNITCLASS_CHARIOT_ARCHER;
local uKNIGHT = GameInfoTypes.UNITCLASS_KNIGHT;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then
			for pUnit in pPlayer:Units() do
				if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) then
					if pUnit:IsCombatUnit() and not pUnit:IsEmbarked() then 
						if (pUnit:GetUnitCombatType() ~= cMOUNTED) then
							if (pUnit:GetUnitClassType() ~= uCHARIOTARCHER) and (pUnit:GetUnitClassType() ~= uKNIGHT) then
								if (Teams[pTeam]:GetCurrentEra() < eINDUSTRIAL) then	
									if not pUnit:IsHasPromotion(pROAD) then
										pUnit:SetHasPromotion(pROAD,true);
									end
								else
									if pUnit:IsHasPromotion(pROAD) then
										pUnit:SetHasPromotion(pROAD,false);
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

-- Golden Age

local Itza = GameInfoTypes.BUILDING_CHICHEN_ITZA;
local Suffrage = GameInfoTypes.POLICY_UNIVERSAL_SUFFRAGE;
local speed = Game.GetGameSpeedType();
local isBNW = (GameInfoTypes.UNITCOMBAT_SUBMARINE ~= nil)

function GoldenAgeMajor(pPlayer, oPlayer)
	if not oPlayer:IsMinorCiv() then
		local GothGABonus = 0;
		local GothGAWonderBonus = 0;
		if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
			GothGABonus = 6;
			GothGAWonderBonus = 3;
		elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
			GothGABonus = 8;
			GothGAWonderBonus = 4;
		elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
			GothGABonus = 10;
			GothGAWonderBonus = 5;
		elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
			GothGABonus = 16;
			GothGAWonderBonus = 8;
		else
			GothGABonus = 16;
			GothGAWonderBonus = 8;
		end
		pPlayer:ChangeGoldenAgeTurns(GothGABonus)
		for iCity in pPlayer:Cities() do
			if iCity:IsHasBuilding(Itza) then
				pPlayer:ChangeGoldenAgeTurns(GothGAWonderBonus)
			end
		end
		if pPlayer:HasPolicy(Suffrage) then
			pPlayer:ChangeGoldenAgeTurns(GothGAWonderBonus)
		end
	end
end

function GoldenAgeMajorBNW(pPlayer, cCity, oPlayer)
	if isBNW then
		local gDummy = GameInfoTypes.BUILDING_GOTH_DUMMY;
		if not cCity:IsHasBuilding(gDummy) then
			cCity:SetNumRealBuilding(gDummy, 1);
			GoldenAgeMajor(pPlayer, oPlayer)
		end
	elseif not isBNW then
		GoldenAgeMajor(pPlayer, oPlayer)
	end
end

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
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then
		if iNewOwner ~= iOldOwner then 
			if cCity:IsOriginalCapital() then
				local gAge = pPlayer:GetNumGoldenAges()
				if iOldOwner == iPreviousOwner then
					GoldenAgeMajorBNW(pPlayer, cCity, oPlayer)
					pPlayer:SetNumGoldenAges(gAge)
				end
			end
		end
	end
end)