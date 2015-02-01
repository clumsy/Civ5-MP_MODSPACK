-- Belgian Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's United Kingdom Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- United Kingdom: Address the British Nation
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AddressBritishNation = {}
	Decisions_AddressBritishNation.Name = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"
	Decisions_AddressBritishNation.Desc = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_DESC"
	HookDecisionCivilizationIcon(Decisions_AddressBritishNation, "CIVILIZATION_JFD_UNITED_KINGDOM")
	Decisions_AddressBritishNation.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]) then return false, false end
		
		local iEra = load(pPlayer, "Decisions_AddressBritishNation")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_AddressBritishNation", nil)
			else
				Decisions_AddressBritishNation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iCost = math.ceil(200 * iMod)
		Decisions_AddressBritishNation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION_DESC", iCost)
		
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:GetAtWarCount(true) > 0) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AddressBritishNation.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		if pPlayer:HasPolicy(GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"]) then
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"], false)
		end
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION"], true)
		save(pPlayer, "Decisions_AddressBritishNation", pPlayer:GetCurrentEra())
		if pPlayer:IsHuman() then Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_JFD_CHURCHILL_SPEECH") end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"], "Decisions_AddressBritishNation", Decisions_AddressBritishNation)
-------------------------------------------------------------------------------------------------------------------------
-- United Kingdom: Special Relationship
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumFriendships(playerID)
	local player = Players[playerID]
	local numFriendships = 0
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		if iPlayer ~= playerID and Players[iPlayer]:IsDoF(playerID) then
			print(Players[iPlayer]:GetName(), player:GetName())
			numFriendships = numFriendships + 1
		end
	end

	print(numFriendships)
	return numFriendships
end

local Decisions_SpecialRelationship = {}
	Decisions_SpecialRelationship.Name = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"
	Decisions_SpecialRelationship.Desc = "TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_DESC"
	HookDecisionCivilizationIcon(Decisions_SpecialRelationship, "CIVILIZATION_JFD_UNITED_KINGDOM")
	Decisions_SpecialRelationship.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"]) then return false, false end
		if load(pPlayer, "Decisions_SpecialRelationship") == true then
			Decisions_SpecialRelationship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_SpecialRelationship.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (JFD_GetNumFriendships(pPlayer:GetID()) < 1) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra >= GameInfoTypes["ERA_MEDIEVAL"]) then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_SpecialRelationship.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(400 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"], true)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP"], 1)
		save(pPlayer, "Decisions_SpecialRelationship", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_UNITED_KINGDOM"], "Decisions_SpecialRelationship", Decisions_SpecialRelationship)
--=======================================================================================================================
--=======================================================================================================================