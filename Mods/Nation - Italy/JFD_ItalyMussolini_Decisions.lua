-- JFD_ItalyMussolini_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Italy (Mussolini) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_ITALY"]
local mathCeil				= math.ceil
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Italy: Blackshirts
-------------------------------------------------------------------------------------------------------------------------
local policyBlackshirtsID	= GameInfoTypes["POLICY_JFD_BLACKSHIRTS"]
local promotionBlackshirtID = GameInfoTypes["PROMOTION_JFD_BLACKSHIRT_GA"]
local techRiflingID			= GameInfoTypes["TECH_RIFLING"]
local unitCombatGunID		= GameInfoTypes["UNITCOMBAT_GUN"]

local Decisions_Blackshirts = {}
	Decisions_Blackshirts.Name = "TXT_KEY_DECISIONS_JFD_ITALY_BLACKSHIRTS"
	Decisions_Blackshirts.Desc = "TXT_KEY_DECISIONS_JFD_ITALY_BLACKSHIRTS_DESC"
	HookDecisionCivilizationIcon(Decisions_Blackshirts, "CIVILIZATION_JFD_ITALY")
	Decisions_Blackshirts.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Blackshirts") == true then
			Decisions_Blackshirts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ITALY_BLACKSHIRTS_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(256 * iMod)
		Decisions_Blackshirts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ITALY_BLACKSHIRTS_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 									then return true, false end
		if player:GetGold() < goldCost 																then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techRiflingID)) 									then return true, false end
		if (not player:GetCapitalCity():GetGarrisonedUnit():GetUnitCombatType() == unitCombatGunID) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Blackshirts.DoFunc = (
	function(player)
		local goldCost = mathCeil(368 * iMod)
		player:GetCapitalCity():GetGarrisonedUnit():SetHasPromotion(promotionBlackshirtID, true)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBlackshirtsID, true)
		save(player, "Decisions_Blackshirts", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Blackshirts", Decisions_Blackshirts)
-------------------------------------------------------------------------------------------------------------------------
-- Italy: Balilla
-------------------------------------------------------------------------------------------------------------------------
local policyBalillaAutocracyID	= GameInfoTypes["POLICY_JFD_BALILLA_A"]
local policyBalillaFreedomID	= GameInfoTypes["POLICY_JFD_BALILLA_F"]
local policyBalillaOrderID		= GameInfoTypes["POLICY_JFD_BALILLA_O"]
local policyBranchAutocracyID	= GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local policyBranchFreedomID		= GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local policyBranchOrderID		= GameInfoTypes["POLICY_BRANCH_ORDER"]

local Decisions_Balilla = {}
	Decisions_Balilla.Name = "TXT_KEY_DECISIONS_JFD_ITALY_BALILLA"
	Decisions_Balilla.Desc = "TXT_KEY_DECISIONS_JFD_ITALY_BALILLA_DESC"
	HookDecisionCivilizationIcon(Decisions_Balilla, "CIVILIZATION_JFD_ITALY")
	Decisions_Balilla.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Balilla") == true then
			Decisions_Balilla.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ITALY_BALILLA_DESC")
			return false, false, true
		end
		
		local cultureCost = mathCeil(400 * iMod)
		Decisions_Balilla.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ITALY_BALILLA_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if ((not player:IsPolicyBranchUnlocked(policyBranchAutocracyID)) and (not player:IsPolicyBranchUnlocked(policyBranchFreedomID)) and (not player:IsPolicyBranchUnlocked(policyBranchOrderID))) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Balilla.DoFunc = (
	function(player)
		local cultureCost = mathCeil(400 * iMod)
		local policyToGiveID = policyBalillaAutocracyID
		if player:IsPolicyBranchUnlocked(policyBranchFreedomID) then
			policyToGiveID = policyBalillaFreedomID
		elseif player:IsPolicyBranchUnlocked(policyBranchOrderID) then
			policyToGiveID = policyBalillaOrderID
		end
		
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeJONSCulture(-cultureCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyToGiveID, true)
		save(player, "Decisions_Balilla", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Balilla", Decisions_Balilla)
--=======================================================================================================================
--=======================================================================================================================