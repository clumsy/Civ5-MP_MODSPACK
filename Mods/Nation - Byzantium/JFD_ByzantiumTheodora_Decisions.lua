-- JFD_ByzantiumTheodora_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Theodora) Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumID = GameInfoTypes["CIVILIZATION_BYZANTIUM"]
local eraMedievalID			  = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil 				  = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Normandy: Construct the White Tower
-------------------------------------------------------------------------------------------------------------------------
local policyRenovateTheCapitalID = GameInfoTypes["POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL"]

local Decisions_ByzantiumRenovateTheCapital = {}
	Decisions_ByzantiumRenovateTheCapital.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL"
	Decisions_ByzantiumRenovateTheCapital.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL_DESC"
	HookDecisionCivilizationIcon(Decisions_ByzantiumRenovateTheCapital, "CIVILIZATION_BYZANTIUM")
	Decisions_ByzantiumRenovateTheCapital.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumID then return false, false end
		if load(player, "Decisions_ByzantiumRenovateTheCapital") == true then
			Decisions_ByzantiumRenovateTheCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL_ENACTED_DESC")
			return false, false, true
		end
		
		local playerID = player:GetID()
		local goldCost = mathCeil(800 * iMod)
		Decisions_ByzantiumRenovateTheCapital.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL_DESC", goldCost)
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_ByzantiumRenovateTheCapital.DoFunc = (
	function(player)
		local goldCost = mathCeil(900 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRenovateTheCapitalID, true)
		save(player, "Decisions_ByzantiumRenovateTheCapital", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumID, "Decisions_ByzantiumRenovateTheCapital", Decisions_ByzantiumRenovateTheCapital)
--=======================================================================================================================
--=======================================================================================================================
