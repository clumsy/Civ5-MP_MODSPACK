-- JFD_GermansDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Germans Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingBurghalID = GameInfoTypes["BUILDING_JFD_BURGHAL"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GERMANS"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local improvementEncampmentID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]
local improvementVillageID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED"]
local mathCeil = math.ceil
local policyWeregildID = GameInfoTypes["POLICY_JFD_GERMANS_WEREGILD"]
--------------------------------------------------------------------------------------------------------------------------
-- The Germans: Suebi Knot
-------------------------------------------------------------------------------------------------------------------------
local Decisions_GermansSuebiKnot = {}
	Decisions_GermansSuebiKnot.Name = "TXT_KEY_DECISIONS_JFD_GERMANS_SUEBI_KNOT"
	Decisions_GermansSuebiKnot.Desc = "TXT_KEY_DECISIONS_JFD_GERMANS_SUEBI_KNOT_DESC"
	HookDecisionCivilizationIcon(Decisions_GermansSuebiKnot, "CIVILIZATION_JFD_GERMANS")
	Decisions_GermansSuebiKnot.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_GermansSuebiKnot") == true then
			Decisions_GermansSuebiKnot.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANS_SUEBI_KNOT_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_GermansSuebiKnot.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANS_SUEBI_KNOT_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if (player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]) < 2 and player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADE"]) < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_GermansSuebiKnot.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_JFD_GERMANS_SUEBI_KNOT"], true)
		save(player, "Decisions_GermansSuebiKnot", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_GermansSuebiKnot", Decisions_GermansSuebiKnot)
-------------------------------------------------------------------------------------------------------------------------
-- The Germans: Institutionalise the Weregild
-------------------------------------------------------------------------------------------------------------------------
local Decisions_GermansWeregild = {}
	Decisions_GermansWeregild.Name = "TXT_KEY_DECISIONS_JFD_GERMANS_WEREGILD"
	Decisions_GermansWeregild.Desc = "TXT_KEY_DECISIONS_JFD_GERMANS_WEREGILD_DESC"
	HookDecisionCivilizationIcon(Decisions_GermansWeregild, "CIVILIZATION_JFD_GERMANS")
	Decisions_GermansWeregild.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_GermansWeregild") == true then
			Decisions_GermansWeregild.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANS_WEREGILD_ENACTED_DESC")
			return false, false, true
		end
		
		local encampmentCount = player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]) + player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADE"])
		local cultureCost = mathCeil(50 * encampmentCount * iMod)
		Decisions_GermansWeregild.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GERMANS_WEREGILD_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 			then return true, false end
		if player:GetJONSCulture() < cultureCost 							then return true, false end	
		if (player:GetImprovementCount(improvementEncampmentID) < 3 and player:GetImprovementCount(improvementVillageID) < 3) then return true, false end
		return true, true
	end
	)
	
	Decisions_GermansWeregild.DoFunc = (
	function(player)
		local encampmentCount = player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT"]) + player:GetImprovementCount(GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADE"])
		local cultureCost = mathCeil(50 * encampmentCount * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyWeregildID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_GERMANS_WEREGILD")) 
		save(player, "Decisions_GermansWeregild", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_GermansWeregild", Decisions_GermansWeregild)
--=======================================================================================================================
--=======================================================================================================================
