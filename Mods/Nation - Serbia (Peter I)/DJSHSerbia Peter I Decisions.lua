-- Decisions
-- Author: DJSHenninger
-- DateCreated: 3/1/2015 9:15:39 AM
------------------------------------------------------------------------------------------------------------------------
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

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

include("FLuaVector.lua")
--------------------------------------------------------------------------------------------------------------------------
-- Revise the Constitution
--------------------------------------------------------------------------------------------------------------------------
local Decisions_DJSHRevise1888Constitution = {}
	Decisions_DJSHRevise1888Constitution.Name = "TXT_KEY_DECISIONS_DJSH_REVISE_1888_CONSTITUTION"
	Decisions_DJSHRevise1888Constitution.Desc = "TXT_KEY_DECISIONS_DJSH_REVISE_1888_CONSTITUTION_DESC"
	HookDecisionCivilizationIcon(Decisions_DJSHRevise1888Constitution, "CIVILIZATION_DJSH_SERBIA_PETER_I")
	Decisions_DJSHRevise1888Constitution.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"] then 
		return false, false 
		end
		if load(player, "Decisions_DJSHRevise1888Constitution") == true then
			Decisions_DJSHRevise1888Constitution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_REVISE_1888_CONSTITUTION_ENACTED_DESC")
			return false, false, true 
		end

		local cultureReward = math.ceil(450 * iMod)
		Decisions_DJSHRevise1888Constitution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_REVISE_1888_CONSTITUTION_DESC", cultureReward)

		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if player:GetCurrentEra() < GameInfoTypes["ERA_MODERN"]	then return true, false end

		return true, true
	end
	)

Decisions_DJSHRevise1888Constitution.DoFunc = (
	function(player)
		local numHappiness = math.ceil(player:GetTotalPopulation() / 4)
		local cultureReward = math.ceil(450 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeJONSCulture(cultureReward)
		player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_REVISE_1888_CONSTITUTION_1"], numHappiness)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_REVISE_1888_CONSTITUTION")) 
		save(player, "Decisions_DJSHRevise1888Constitution", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"], "Decisions_DJSHRevise1888Constitution", Decisions_DJSHRevise1888Constitution)
--------------------------------------------------------------------------------------------------------------------------
-- Upgrade Grand School of Belgrade
--------------------------------------------------------------------------------------------------------------------------
local Decisions_DJSHUpgradeGrandSchoolBelgrade = {}
	Decisions_DJSHUpgradeGrandSchoolBelgrade.Name = "TXT_KEY_DECISIONS_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE"
	Decisions_DJSHUpgradeGrandSchoolBelgrade.Desc = "TXT_KEY_DECISIONS_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_DJSHUpgradeGrandSchoolBelgrade, "CIVILIZATION_DJSH_SERBIA_PETER_I")
	Decisions_DJSHUpgradeGrandSchoolBelgrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"] then 
		return false, false 
		end
		if load(player, "Decisions_DJSHUpgradeGrandSchoolBelgrade") == true then
			Decisions_DJSHUpgradeGrandSchoolBelgrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE_ENACTED_DESC")
			return false, false, true 
		end

		local goldCost = math.ceil(500 * iMod)
		Decisions_DJSHUpgradeGrandSchoolBelgrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE_DESC", goldCost)

		if player:GetGold() < goldCost 								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetCurrentEra() < GameInfoTypes["ERA_MODERN"] 	then return true, false end
		
		local bCapital = false
		for city in player:Cities() do
			if (city:IsOriginalCapital()) and (city:GetNumBuilding(GameInfoTypes["BUILDING_PALACE"]) > 0) then
				if city:GetNumRealBuilding(GameInfoTypes["BUILDING_UNIVERSITY"]) > 0  then
					bCapital = true
				end
			end
		end
		
		if bCapital then
			return true, true
		else 
			return true, false
		end
	end
	)

Decisions_DJSHUpgradeGrandSchoolBelgrade.DoFunc = (
	function(player)
		local goldCost = math.ceil(500 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE"], 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_UPGRADE_GRAND_SCHOOL_BELGRADE")) 
		save(player, "Decisions_DJSHUpgradeGrandSchoolBelgrade", true)
	end
	)

	Decisions_DJSHUpgradeGrandSchoolBelgrade.Monitors = {}
	Decisions_DJSHUpgradeGrandSchoolBelgrade.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if (player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_DJSH_SERBIA_PETER_I) then return end
		if load(player, "Decisions_DJSHUpgradeGrandSchoolBelgrade") == true then
			local cultureConverted = math.ceil(player:GetCapitalCity():GetYieldRate(GameInfoTypes["YIELD_SCIENCE"]) * 0.15)
			local plot = Map.GetPlot(player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY())
			player:ChangeJONSCulture(cultureConverted)
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+".. cultureConverted .." [ICON_CULTURE][ENDCOLOR]", cultureConverted)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"], "Decisions_DJSHUpgradeGrandSchoolBelgrade", Decisions_DJSHUpgradeGrandSchoolBelgrade)