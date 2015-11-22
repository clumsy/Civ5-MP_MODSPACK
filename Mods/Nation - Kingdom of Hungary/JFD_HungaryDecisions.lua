-- JFD_HungaryDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Hungary Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end
--------------------------------------------------------------------------------------------------------------------------
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
local buildingCathedralID = GameInfoTypes["BUILDING_CATHEDRAL"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_HUNGARY"]
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local policyArchdioceseID = GameInfoTypes["POLICY_JFD_HUNGARY_ARCHDIOCESE"]
local policyBlackArmyID = GameInfoTypes["POLICY_JFD_HUNGARY_BLACK_ARMY"]
local techGunpowderID = GameInfoTypes["TECH_GUNPOWDER"]
local unitMusketmanID = GameInfoTypes["UNIT_MUSKETMAN"]

if isUsingPietyPrestige then
	include("JFD_PietyUtils.lua")
end
-------------------------------------------------------------------------------------------------------------------------
-- Hungary: Establish an Archdiocese
-------------------------------------------------------------------------------------------------------------------------
local Decisions_HungaryArchdiocese = {}
	Decisions_HungaryArchdiocese.Name = "TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE"
	Decisions_HungaryArchdiocese.Desc = "TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE_DESC"
	HookDecisionCivilizationIcon(Decisions_HungaryArchdiocese, "CIVILIZATION_JFD_HUNGARY")
	Decisions_HungaryArchdiocese.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if not (player:GetCapitalCity()) then return false, false end

		local religionType = "majority religion"
		if isUsingPietyPrestige then
			religionType = "State Religion"
		end
		
		if load(player, "Decisions_HungaryArchdiocese") == true then
			Decisions_HungaryArchdiocese.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE_ENACTED_DESC", religionType)
			return false, false, true 
		end
		
		local cultureCost = mathCeil(200 * iMod)
		Decisions_HungaryArchdiocese.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE_DESC", religionType, cultureCost)
				
		if not (GetPlayerMajorityReligion(player)) then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_HungaryArchdiocese.DoFunc = (
	function(player)
		local cultureCost = mathCeil(200 * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyArchdioceseID, true)
		
		local religionType = GetPlayerMajorityReligion(player)
		if isUsingPietyPrestige then
			religionType = JFD_GetStateReligion(player:GetID())
		end
		ConvertPlayerReligion(player, religionType, 100)
		
		if player:IsHuman() then
			LuaEvents.JFDChooseArchdiocese()
		else
			player:GetCapitalCity():SetNumRealBuilding(GbuildingCathedralID, 1)
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HUNGARY_ARCHDIOCESE")) 
		end
		
		save(player, "Decisions_HungaryArchdiocese", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_HungaryArchdiocese", Decisions_HungaryArchdiocese)
-------------------------------------------------------------------------------------------------------------------------
-- Hungary: Create the Black Army
-------------------------------------------------------------------------------------------------------------------------
local Decisions_HungaryBlackArmy = {}
	Decisions_HungaryBlackArmy.Name = "TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY"
	Decisions_HungaryBlackArmy.Desc = "TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY_DESC"
	HookDecisionCivilizationIcon(Decisions_HungaryBlackArmy, "CIVILIZATION_JFD_HUNGARY")
	Decisions_HungaryBlackArmy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_HungaryBlackArmy") == true then
			Decisions_HungaryBlackArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(500 * iMod)
		Decisions_HungaryBlackArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 		then return true, false end
		if player:GetGold() < goldCost 									then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techGunpowderID)) 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_HungaryBlackArmy.DoFunc = (
	function(player)
		local goldCost = mathCeil(500 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyBlackArmyID, true)
		player:InitUnit(unitMusketmanID, capitalX, capitalY)
		player:InitUnit(unitMusketmanID, capitalX, capitalY)
		player:InitUnit(unitMusketmanID, capitalX, capitalY)
		player:InitUnit(unitMusketmanID, capitalX, capitalY)
		save(player, "Decisions_HungaryBlackArmy", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_HungaryBlackArmy", Decisions_HungaryBlackArmy)
--=======================================================================================================================
--=======================================================================================================================
