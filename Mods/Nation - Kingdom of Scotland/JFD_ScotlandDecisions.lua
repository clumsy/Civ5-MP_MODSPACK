-- JFD_ScotlandDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Scotland Decisions: loaded")
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
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingRoyalSocietyID = GameInfoTypes["BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SCOTLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local specialistScientistID = GameInfoTypes["SPECIALIST_SCIENTIST"]
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
--------------------------------------------------------------------------------------------------------------------------
-- Scotland: Translate Holy Scriptures
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TranslateScriptures = {}
	Decisions_TranslateScriptures.Name = "TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES"
	Decisions_TranslateScriptures.Desc = "TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_DESC"
	HookDecisionCivilizationIcon(Decisions_TranslateScriptures, "CIVILIZATION_JFD_SCOTLAND")
	Decisions_TranslateScriptures.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		local reward = mathCeil(70 * iMod)
		local yield = "[ICON_PEACE] Faith"
		local religionType = "majority religion"
		if isUsingPietyPrestige then
			religionType = "State Religion"
			yield = "[ICON_JFD_PIETY] Piety"
			reward = mathCeil(25 * iMod)
		end

		if load(player, "Decisions_TranslateScriptures") == true then
			Decisions_TranslateScriptures.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_ENACTED_DESC", yield)
			return false, false, true
		end
		
		local goldCost = mathCeil(120 * iMod)
		Decisions_TranslateScriptures.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_TRANSLATE_HOLY_SCRIPTURES_DESC", religionType, goldCost, reward, yield)
		
		if isUsingPietyPrestige then
			if not (JFD_HasStateReligion(player:GetID())) then return true, false end
		else
			if not (GetPlayerMajorityReligion(player)) then return true, false end
		end

		if not (player:GetCapitalCity()) 							then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end

		return true, true
	end
	)
	
	Decisions_TranslateScriptures.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil(120 * iMod)
		player:ChangeGold(-goldCost)
		
		local reward = mathCeil(50 * iMod)
		if isUsingPietyPrestige then
			if JFD_HasStateReligion(playerID) then
				reward = mathCeil(10 * iMod)
				JFD_ChangePiety(playerID, reward)
			end
		else
			player:ChangeFaith(reward)
		end			
			
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		player:InitUnit(unitMissionaryID, capitalX, capitalY)
		player:InitUnit(unitMissionaryID, capitalX, capitalY)
		player:ChangeNumResourceTotal(iMagistrate, 1)
		save(player, "Decisions_TranslateScriptures", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_TranslateScriptures", Decisions_TranslateScriptures)
-------------------------------------------------------------------------------------------------------------------------
-- Scotland: Found the Royal Society
-------------------------------------------------------------------------------------------------------------------------
local Decisions_RoyalSociety = {}
	Decisions_RoyalSociety.Name = "TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY"
	Decisions_RoyalSociety.Desc = "TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_DESC"
	Decisions_RoyalSociety.Pedia = "TXT_KEY_BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH"
	HookDecisionCivilizationIcon(Decisions_RoyalSociety, "CIVILIZATION_JFD_SCOTLAND")
	Decisions_RoyalSociety.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_RoyalSociety") == true then
			Decisions_RoyalSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(400 * iMod)
		Decisions_RoyalSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SCOTLAND_ROYAL_SOCIETY_DESC", goldCost)
		
		if not (player:GetCapitalCity()) 											then return true, false end
		if player:GetCapitalCity():GetSpecialistCount(specialistScientistID) == 0 	then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 					then return true, false end
		if player:GetGold() < goldCost 												then return true, false end

		return true, true
	end
	)
	
	Decisions_RoyalSociety.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingRoyalSocietyID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SCOTLAND_ROYAL_SOCIETY")) 
		save(player, "Decisions_RoyalSociety", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_RoyalSociety", Decisions_RoyalSociety)
--=======================================================================================================================
--=======================================================================================================================
