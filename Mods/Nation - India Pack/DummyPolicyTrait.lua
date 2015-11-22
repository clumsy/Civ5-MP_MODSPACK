-- DummyPolicyTrait
-- Author: Leugi
-- DateCreated: 1/18/2014 9:41:08 AM
--------------------------------------------------------------

function TraitPolicyGive (iPlayer)
	local pPlayer = Players[iPlayer];
	local p = GetDummyPolicy(pPlayer);
	if p ~= nil then
		if not(pPlayer:HasPolicy(GameInfo.Policies["" .. p .. ""].ID)) then
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfo.Policies["" .. p .. ""].ID, true);
		end
	end
end


GameEvents.PlayerDoTurn.Add(TraitPolicyGive);
GameEvents.PlayerCityFounded.Add(TraitPolicyGive)


function GetDummyPolicy(pPlayer)
	if pPlayer == nil or not pPlayer:IsAlive() or 
			pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(pPlayer);
	return trait.DummyPolicy;
end


function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end