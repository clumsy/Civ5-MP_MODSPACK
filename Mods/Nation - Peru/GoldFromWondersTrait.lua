-- PeruGoldFromWondersTrait
-- Author: Leugi
-- DateCreated: 2/11/2014 7:42:39 PM
--------------------------------------------------------------
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "PeruUA";

function AddYieldonCityBasis (pPlayer, city, iYield, iDelta)
    local iCity = city:GetID()
	local pCity = pPlayer:GetCityByID(iCity)
    local iOldDelta = load(pPlayer, iCity .. "Y" .. iYield)
    save (pPlayer, iCity .. "Y" .. iYield, iDelta)
    if iOldDelta == nil then
        pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta)
    else
        pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta - iOldDelta)
    end
end

function ClearAddYieldonCityBasis (pPlayer, iCity, iYield)
    local pCity = pPlayer:GetCityByID(iCity)
    local iOldDelta = load(pPlayer, iCity .. "Y" .. iYield)
    if iOldDelta == nil then
    elseif iOldDelta > 0 then
        save (pPlayer, iCity .. "Y" .. iYield, 0)
        pCity:ChangeBaseYieldRateFromBuildings(iYield, -iOldDelta)
    end
end

function WonderousGold (iPlayer)
	local pPlayer = Players[iPlayer];
	local GoldBonus = GetWonderGoldBonus(pPlayer);
	print (GoldBonus);
	if GoldBonus ~= -1 then
		for pCity in pPlayer:Cities() do
			local iGold = GameInfo.Yields["YIELD_GOLD"].ID
			local NumWonders = pCity:GetNumWorldWonders()
			print (NumWonders);
			local Bonus = GoldBonus * NumWonders
			--pPlayer:ChangeGold(Bonus)
			AddYieldonCityBasis(pPlayer, pCity, iGold, Bonus)
		end
	end
end

GameEvents.PlayerDoTurn.Add(WonderousGold);



function GetWonderGoldBonus(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return -1;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.PeruGoldFromWonders;
end


function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end