-- Belgian Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Stalinist Decisions: loaded")
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingCommissariatID = GameInfoTypes["BUILDING_JFD_STALIN_COMMISSARIAT"]
local buildingCommissariatForInternalAffairsID = GameInfoTypes["BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil = math.ceil
local policyCommissariatID = GameInfoTypes["POLICY_JFD_SOVIET_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS"]
local policyCultOfPersonalityID = GameInfoTypes["POLICY_JFD_SOVIET_STALIN_CULT_OF_PERSONALITY"]
local unitStalinArtistID = GameInfoTypes["UNIT_JFD_STALIN_ARTIST"]
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Soviet: Foster Personality Cult
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FosterPersonalityCult = {}
	Decisions_FosterPersonalityCult.Name = "TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY"
	Decisions_FosterPersonalityCult.Desc = "TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY_DESC"
	HookDecisionCivilizationIcon(Decisions_FosterPersonalityCult, "CIVILIZATION_JFD_USSR_STALIN")
	Decisions_FosterPersonalityCult.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_FosterPersonalityCult") == true then
			Decisions_FosterPersonalityCult.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY_ENACTED_DESC")
			return false, false, true
		end
		
		local cultureCost = mathCeil(300 * iMod)
		Decisions_FosterPersonalityCult.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if not(player:GetCurrentEra() >= eraIndustrialID) 			then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_FosterPersonalityCult.DoFunc = (
	function(player)
		local cultureCost = mathCeil(300 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyCultOfPersonalityID, true)
		player:InitUnit(unitStalinArtistID, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
		if player:IsHuman() then Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_JFD_STALIN_ANTHEM") end
		save(player, "Decisions_FosterPersonalityCult", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"], "Decisions_FosterPersonalityCult", Decisions_FosterPersonalityCult)
-------------------------------------------------------------------------------------------------------------------------
-- Soviet: Establish the People's Commissariat for Internal Affairs
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Commissariat = {}
	Decisions_Commissariat.Name = "TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS"
	Decisions_Commissariat.Desc = "TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS_DESC"
	HookDecisionCivilizationIcon(Decisions_Commissariat, "CIVILIZATION_JFD_USSR_STALIN")
	Decisions_Commissariat.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_Commissariat") == true then
			Decisions_Commissariat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(900 * iMod)
		Decisions_Commissariat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 				then return true, false end
		if player:GetGold() < goldCost 											then return true, false end
		if not (player:GetCapitalCity():IsHasBuilding(buildingCommissariatID))  then return true, false end
		if not (player:GetCurrentEra() >= eraIndustrialID)						then return true, false	end
		
		
		return true, true
	end
	)
	
	Decisions_Commissariat.DoFunc = (
	function(player)
		local goldCost = mathCeil(900 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyCommissariatID, true)
		player:GetCapitalCity():SetNumRealBuilding(buildingCommissariatForInternalAffairsID, 1)
		save(player, "Decisions_Commissariat", true)
	end
	)
	
	Decisions_Commissariat.Monitors = {}
	Decisions_Commissariat.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationID then return end
		if load(player, "Decisions_Commissariat") == true then
			if not (player:GetCapitalCity():IsHasBuilding(buildingCommissariatForInternalAffairsID)) then
				player:GetCapitalCity():SetNumRealBuilding(buildingCommissariatForInternalAffairsID, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"], "Decisions_Commissariat", Decisions_Commissariat)
--=======================================================================================================================
--=======================================================================================================================