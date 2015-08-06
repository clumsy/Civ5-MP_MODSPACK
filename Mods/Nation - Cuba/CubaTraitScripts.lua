-- Whoward's Civ Specific Events

iMyCiv = GameInfoTypes.CIVILIZATION_LEUGI_CUBA



function IsCivInPlay(iCivType)
  for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
    local iSlotStatus = PreGame.GetSlotStatus(iSlot)
    if (iSlotStatus == SlotStatus.SS_TAKEN or iSlotStatus == SlotStatus.SS_COMPUTER) then
      if (PreGame.GetCivilization(iSlot) == iCivType) then
        return true
      end
    end
  end
  
  return false
end

-- CubaTraitScripts
-- Author: Leugi
-- DateCreated: 8/4/2014 12:53:02 PM
--------------------------------------------------------------

GGPolGP = 30
local IsHasIdeologyBuilding = "BUILDING_IDEOLOGY_BONUS"

function GGPolicyPoints(iPlayer, iPolicy)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == iMyCiv) then
		Boost = 0
		local numpol = pPlayer:GetNumPolicies();
		local n = numpol - 1
		local dn = 2 * n
		local Boost = GGPolGP + dn
		if Boost > 150 then
			Boost = 150
		end
		pPlayer:ChangeCombatExperience(Boost)
	end
end



function OnIdeologyChosen(playerID, policyTypeID)
    local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == iMyCiv) then
		local policyLevel = GameInfo.Policies[policyTypeID].Level
		if policyLevel == 1 then
			if not(pPlayer:HasPolicy(GameInfo.Policies["POLICY_CUBAN_GENERALS"].ID)) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				GameEvents.PlayerAdoptPolicy.Remove(GGPolicyPoints);
				pPlayer:SetHasPolicy(GameInfo.Policies["POLICY_CUBAN_GENERALS"].ID, true);
				GameEvents.PlayerAdoptPolicy.Add(GGPolicyPoints);
			end
		end
	end
end



if (IsCivInPlay(iMyCiv)) then
  	GameEvents.PlayerAdoptPolicy.Add(GGPolicyPoints);
	GameEvents.PlayerAdoptPolicyBranch.Add(GGPolicyPoints);
	GameEvents.PlayerAdoptPolicy.Add(OnIdeologyChosen);
	print ("Cuba UA Scripts")
end