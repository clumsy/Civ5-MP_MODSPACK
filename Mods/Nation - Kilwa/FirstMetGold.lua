print("Kilwa 2")

function FirstMetGold( iPlayerMet, iPlayerActive )
	local pPlayerActive = Players[iPlayerActive];
	local pPlayerMet = Players[iPlayerMet];
	--print(pPlayerActive:GetCivilizationShortDescription() .. " met " .. pPlayerMet:GetCivilizationShortDescription());
	-- good candidates?
	if not IsMajorCiv( pPlayerActive ) or 
		not IsMinorCiv( pPlayerMet ) then return end
	-- has UA?
	local trait = GetMajorTrait( pPlayerActive );
	if trait.CityStateMetFirstBonus ~= 0 then
		-- ok go on!
		local iMajorsMet = Teams[pPlayerMet:GetTeam()]:GetHasMetCivCount(true);
		local bFirstMajorCiv = iMajorsMet == 1;
		local goldGift = CalculateGoldBonus( trait, pPlayerActive:GetTeam(), bFirstMajorCiv );
		pPlayerActive:ChangeGold( goldGift );
	end
end
GameEvents.TeamMeet.Add( FirstMetGold );


function GetMajorTrait( pPlayer )
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end

function CalculateGoldBonus( trait, iTeamActive, bFirstMajorCiv )
	local goldGift = 0;
	if bFirstMajorCiv then
		goldGift = trait.CityStateMetFirstBonus;
	else
		goldGift = trait.CityStateMetSubsequentBonus;
	end
	if HasEnhanceTech( trait, iTeamActive )	then
		if bFirstMajorCiv then
			goldGift = goldGift + trait.CityStateMetFirstBonusEnhanced;
		else
			goldGift = goldGift + trait.CityStateMetSubsequentBonusEnhanced;
		end
	end
	return goldGift;
end

function HasEnhanceTech( trait, iTeamActive )
	if trait.EnhanceTech == nil then
		return false;
	end
	local tech = GameInfo.Technologies[trait.EnhanceTech];
	return Teams[iTeamActive]:IsHasTech(tech.ID);
end

-- Thalassicus
function IsValidPlayer(player)
	return player ~= nil and player:IsAlive() and not player:IsBarbarian();
end

function IsMinorCiv(player)
	return IsValidPlayer(player) and player:IsMinorCiv();
end

function IsMajorCiv(player)
	return IsValidPlayer(player) and player:GetID() <= GameDefines.MAX_MAJOR_CIVS-1;
end