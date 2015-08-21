-- Lua Script1
-- Author: Tarcísio
-- DateCreated: 11/7/2014 9:42:42 PM
--------------------------------------------------------------
local Decisions_SolInvictus = {}
	Decisions_SolInvictus.Name = "TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_SOL_INVICTUS"
	Decisions_SolInvictus.Desc = "TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_SOL_INVICTUS_DESC"
	HookDecisionCivilizationIcon(Decisions_SolInvictus, "CIVILIZATION_TCM_AURELIAN_ROME")
	Decisions_SolInvictus.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"]) then return false, false end
			if load(pPlayer, "Decisions_SolInvictus") == true then
				Decisions_SolInvictus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_SOL_INVICTUS_ENACTED_DESC")
				return false, false, true
			end

			local iCost = math.ceil(250 * iMod)
			Decisions_SolInvictus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_SOL_INVICTUS_DESC", iCost)
			if (pPlayer:GetCurrentEra() < GameInfoTypes["ERA_CLASSICAL"]) then return true, false end
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
			if (pPlayer:GetGold() < iCost) then return true, false end
			if (pPlayer:GetJONSCulture() < iCost) then return true, false end

			return true, true
	end
	)
	
	Decisions_SolInvictus.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_SOL_INVICTUS"], true)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_TEMPLUM_SOLIS"], 1)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_SolInvictus", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"], "Decisions_SolInvictus", Decisions_SolInvictus)

local Decisions_AurelianCorruption = {}
	Decisions_AurelianCorruption.Name = "TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_CORRUPTION"
	Decisions_AurelianCorruption.Desc = "TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_CORRUPTION_DESC"
	HookDecisionCivilizationIcon(Decisions_AurelianCorruption, "CIVILIZATION_TCM_AURELIAN_ROME")
	Decisions_AurelianCorruption.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"]) then return false, false end
			if load(pPlayer, "Decisions_AurelianCorruption") == true then
				Decisions_AurelianCorruption.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_CORRUPTION_ENACTED_DESC")
				return false, false, true
			end

			local iCost = math.ceil(500 * iMod)
			Decisions_AurelianCorruption.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_CORRUPTION_DESC", iCost)
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
			if (pPlayer:GetGold() < iCost) then return true, false end

			return true, true
	end
	)
	
	Decisions_AurelianCorruption.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_CORRUPTION"], true)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_AurelianCorruption", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"], "Decisions_AurelianCorruption", Decisions_AurelianCorruption)