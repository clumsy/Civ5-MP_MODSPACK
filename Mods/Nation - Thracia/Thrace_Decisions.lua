-- Thracian Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Thracian Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Thrace: Execute Sub-Kings
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ThraceExecute = {} 
    Decisions_ThraceExecute.Name = "TXT_KEY_DECISIONS_THRACEEXECUTE"
	Decisions_ThraceExecute.Desc = "TXT_KEY_DECISIONS_THRACEEXECUTE_DESC"
	Decisions_ThraceExecute.Weight = 0
	HookDecisionCivilizationIcon(Decisions_ThraceExecute, "CIVILIZATION_MC_THRACE")
	Decisions_ThraceExecute.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_THRACE then return false, false end
		if load(pPlayer, "Decisions_ThraceKings") == "Decisions_ThraceExecute" then
			Decisions_ThraceExecute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THRACEEXECUTE_ENACTED_DESC")
			return false, false, true
		end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() and (pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND) then
				iNumUnits = iNumUnits + 1
			end
		end		
		local iCost = math.ceil(iNumUnits * 10 * iMod)
		Decisions_ThraceExecute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THRACEEXECUTE_DESC", iCost)
		
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ThraceExecute.DoFunc = (
	function(pPlayer)
	
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() and (pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND) then
				iNumUnits = iNumUnits + 1
				pUnit:ChangeExperience(10)
			end
		end		
		local iCost = math.ceil(iNumUnits * 10 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISION_THRACEEXECUTE, true)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISION_THRACERECOGNISE, false)
		
		save(pPlayer, "Decisions_ThraceKings", "Decisions_ThraceExecute")
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_THRACE, "Decisions_ThraceExecute", Decisions_ThraceExecute)
-------------------------------------------------------------------------------------------------------------------------
-- Thrace: Recognise Sub-Kings
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ThraceRecognise = {}
    Decisions_ThraceRecognise.Name = "TXT_KEY_DECISIONS_THRACERECOGNISE"
	Decisions_ThraceRecognise.Desc = "TXT_KEY_DECISIONS_THRACERECOGNISE_DESC"
	HookDecisionCivilizationIcon(Decisions_ThraceRecognise, "CIVILIZATION_MC_THRACE")
	Decisions_ThraceRecognise.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_THRACE then return false, false end
		if load(pPlayer, "Decisions_ThraceKings") == "Decisions_ThraceRecognise" then
			Decisions_ThraceRecognise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THRACERECOGNISE_ENACTED_DESC")
			return false, false, true
		end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() and (pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND) then
				iNumUnits = iNumUnits + 1
			end
		end		
		local iCost = math.ceil(iNumUnits * 10 * iMod)
		Decisions_ThraceRecognise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THRACERECOGNISE_DESC", iCost)
		
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ThraceRecognise.DoFunc = (
	function(pPlayer)
	
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() and (pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND) then
				iNumUnits = iNumUnits + 1
				pUnit:ChangeExperience(10)
			end
		end		
		local iCost = math.ceil(iNumUnits * 10 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISION_THRACERECOGNISE, true)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISION_THRACEEXECUTE, false)
		
		save(pPlayer, "Decisions_ThraceKings", "Decisions_ThraceRecognise")
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_THRACE, "Decisions_ThraceRecognise", Decisions_ThraceRecognise)
--=======================================================================================================================
--=======================================================================================================================