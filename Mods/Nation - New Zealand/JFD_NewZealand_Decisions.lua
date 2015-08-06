-- JFD_NewZealand_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's New Zealand Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
--------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID 	= GameInfoTypes["CIVILIZATION_JFD_NEW_ZEALAND"]
local mathCeil 			= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- New Zealand: Commemorate the ANZACs
-------------------------------------------------------------------------------------------------------------------------
local eraModernID			= GameInfoTypes["ERA_MODERN"]
local policyANZACID			= GameInfoTypes["POLICY_DECISIONS_JFD_COMMEMORATE_ANZACS"]
local unitPromotionANZACID	= GameInfoTypes["PROMOTION_JFD_ANZAC"]

local Decisions_NewZealandCommemorateANZACS = {}
	Decisions_NewZealandCommemorateANZACS.Name = "TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_COMMEMORATE_ANZACS"
	Decisions_NewZealandCommemorateANZACS.Desc = "TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_COMMEMORATE_ANZACS_DESC"
	HookDecisionCivilizationIcon(Decisions_NewZealandCommemorateANZACS, "CIVILIZATION_JFD_NEW_ZEALAND")
	Decisions_NewZealandCommemorateANZACS.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_NewZealandCommemorateANZACS") == true then
			Decisions_NewZealandCommemorateANZACS.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_COMMEMORATE_ANZACS_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_NewZealandCommemorateANZACS.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_COMMEMORATE_ANZACS_DESC")
		if player:GetCurrentEra() < eraModernID 					then return true, false	end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		return true, true
	end
	)
	
	Decisions_NewZealandCommemorateANZACS.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionANZACID) then
				unit:ChangeExperience(10)
			end
		end
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyANZACID, true)
		save(player, "Decisions_NewZealandCommemorateANZACS", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_NewZealandCommemorateANZACS", Decisions_NewZealandCommemorateANZACS)
-------------------------------------------------------------------------------------------------------------------------
-- New Zealand: Promulgate Imperial Plans
-------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID 		= GameInfoTypes["ERA_INDUSTRIAL"]
local policyImperialPlansID = GameInfoTypes["POLICY_DECISIONS_JFD_PROMULGATE_IMPERIAL_PLANS"]

local Decisions_NewZealandPromulgateImperialPlans = {}
	Decisions_NewZealandPromulgateImperialPlans.Name = "TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_PROMULGATE_IMPERIAL_PLANS"
	Decisions_NewZealandPromulgateImperialPlans.Desc = "TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_PROMULGATE_IMPERIAL_PLANS_DESC"
	HookDecisionCivilizationIcon(Decisions_NewZealandPromulgateImperialPlans, "CIVILIZATION_JFD_NEW_ZEALAND")
	Decisions_NewZealandPromulgateImperialPlans.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_NewZealandPromulgateImperialPlans") == true then
			Decisions_NewZealandPromulgateImperialPlans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_PROMULGATE_IMPERIAL_PLANS_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = player:GetNextPolicyCost()
		Decisions_NewZealandPromulgateImperialPlans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_PROMULGATE_IMPERIAL_PLANS_DESC", cultureCost)
		
		if player:GetCurrentEra() < eraIndustrialID					then return true, false	end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		return true, true
	end
	)
	
	Decisions_NewZealandPromulgateImperialPlans.DoFunc = (
	function(player)
		local cultureCost = player:GetNextPolicyCost()
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyImperialPlansID, true)
		save(player, "Decisions_NewZealandPromulgateImperialPlans", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_NewZealandPromulgateImperialPlans", Decisions_NewZealandPromulgateImperialPlans)
--=======================================================================================================================
--=======================================================================================================================
