-- Sri Lanka Decisions
-- Author: JFD
--=======================================================================================================================
print("Sri Lanka Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Sri Lanka: Renovate Capital
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RenovateCapital = {}
	Decisions_RenovateCapital.Name = "TXT_KEY_DECISIONS_SRI_LANKA_RENOVATE_CAPITAL"
	Decisions_RenovateCapital.Desc = "TXT_KEY_DECISIONS_SRI_LANKA_RENOVATE_CAPITAL_DESC"
	HookDecisionCivilizationIcon(Decisions_RenovateCapital, "CIVILIZATION_LITE_SRI_LANKA")
	Decisions_RenovateCapital.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LITE_SRI_LANKA"]) then return false, false end
		
		local iEra = load(pPlayer, "Decisions_RenovateCapital")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_RenovateCapital", nil)
			else
				Decisions_RenovateCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SRI_LANKA_RENOVATE_CAPITAL_ENACTED_DESC")
				return false, false, true
			end
		end
		
		Decisions_RenovateCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SRI_LANKA_RENOVATE_CAPITAL_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if (pPlayer:GetCapitalCity():GetPopulation() < 10) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra >= GameInfoTypes["ERA_RENAISSANCE"]) then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_RenovateCapital.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGoldenAgeTurns(12)
		save(pPlayer, "Decisions_RenovateCapital", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_SRI_LANKA"], "Decisions_RenovateCapital", Decisions_RenovateCapital)
-------------------------------------------------------------------------------------------------------------------------
-- Sri Lanka: Legalize official use of multilingualism
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetReligionCount(playerID) 
	local player = Players[playerID]
	local numReligions = 0 
	for city in player:Cities() do
		for religion in GameInfo.Religions() do
			if city:GetNumFollowers(religion.ID) > 0 then
				numReligions = numReligions + 1
			end
		end
	end

	return numReligions 
end

local Decisions_Multilingualism = {}
	Decisions_Multilingualism.Name = "TXT_KEY_DECISIONS_SRI_LANKA_MULTILINGUALISM"
	Decisions_Multilingualism.Desc = "TXT_KEY_DECISIONS_SRI_LANKA_MULTILINGUALISME_DESC"
	HookDecisionCivilizationIcon(Decisions_Multilingualism, "CIVILIZATION_LITE_SRI_LANKA")
	Decisions_Multilingualism.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LITE_SRI_LANKA"]) then return false, false end
		if load(pPlayer, "Decisions_Multilingualism") == true then
			Decisions_Multilingualism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SRI_LANKA_MULTILINGUALISM_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(1100 * iMod)
		Decisions_Multilingualism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SRI_LANKA_MULTILINGUALISM_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		print("religion count: " .. JFD_GetReligionCount(pPlayer:GetID()))
		if JFD_GetReligionCount(pPlayer:GetID()) < 1 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Multilingualism.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_SRI_LANKA_MULTILINGUALISM"], true)
		save(pPlayer, "Decisions_Multilingualism", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_SRI_LANKA"], "Decisions_Multilingualism", Decisions_Multilingualism)
--=======================================================================================================================
--=======================================================================================================================