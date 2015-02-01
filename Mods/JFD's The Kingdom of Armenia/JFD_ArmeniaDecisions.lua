-- JFD_ArmeniaDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Armenia Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
include("JFD_ArmeniaDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
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
local buildingGrandTempleID = GameInfoTypes["BUILDING_GRAND_TEMPLE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ARMENIA"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraModernID = GameInfoTypes["ERA_MODERN"]
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local policyArmenianApostolicChurchID = GameInfoTypes["POLICY_JFD_ARMENIAN_APOSTOLIC_CHURCH"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local unitMamikonian = nil
local unitMamikonianID = GameInfoTypes["UNIT_JFD_MAMIKONIAN"]
local unitPromotionSparapetID = GameInfoTypes["PROMOTION_JFD_ARMENIA_SPARAPET"]
-------------------------------------------------------------------------------------------------------------------------
-- Armenia: Establish the Armenian Apostolic Church
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ArmenianApostolicChurch = {}
	Decisions_ArmenianApostolicChurch.Name = "TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH"
	Decisions_ArmenianApostolicChurch.Desc = "TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH_DESC"
	HookDecisionCivilizationIcon(Decisions_ArmenianApostolicChurch, "CIVILIZATION_JFD_ARMENIA")
	Decisions_ArmenianApostolicChurch.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
				
		if not (JFD_GetFirstWorldReligion()) then return false, false end
		local religionName = Game.GetReligionName(JFD_GetFirstWorldReligion())
		local religionType = "majority religion"
		local faithCost = mathCeil(250 * iMod)
		local reward = "TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH_REWARD"
		if isUsingPietyPrestige then
			religionType = "State Religion"
			faithCost = faithCost + 100
			reward = "TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH_PIETY_REWARD"
		end

		if load(player, "Decisions_ArmenianApostolicChurch") == true then
			Decisions_ArmenianApostolicChurch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH_ENACTED_DESC", reward)
			return false, false, true 
		end
		
		Decisions_ArmenianApostolicChurch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH_DESC", religionName, religionType, faithCost, reward)
		
		if not (isUsingPietyPrestige) then
			if not (GetPlayerMajorityReligion(player) == JFD_GetFirstWorldReligion())	then return true, false end
		else	
			if JFD_GetStateReligion(player:GetID()) ~= JFD_GetFirstWorldReligion()		then return true, false end
		end
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1			then return true, false end
		if player:GetFaith() < faithCost 									then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ArmenianApostolicChurch.DoFunc = (
	function(player)
		local faithCost = mathCeil(250 * iMod)
		if isUsingPietyPrestige then
			faithCost = faithCost + 100
		end
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingGrandTempleID, 1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyArmenianApostolicChurchID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_APOSTOLIC_CHURCH")) 
		save(player, "Decisions_ArmenianApostolicChurch", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_ArmenianApostolicChurch", Decisions_ArmenianApostolicChurch)
-------------------------------------------------------------------------------------------------------------------------
-- Armenia: Approve the Sparapet
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Sparapet = {}
	Decisions_Sparapet.Name = "TXT_KEY_DECISIONS_JFD_ARMENIA_SPARAPET"
	Decisions_Sparapet.Desc = "TXT_KEY_DECISIONS_JFD_ARMENIA_SPARAPET_DESC"
	HookDecisionCivilizationIcon(Decisions_Sparapet, "CIVILIZATION_JFD_ARMENIA")
	Decisions_Sparapet.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		local era = load(player, "Decisions_Sparapet")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_Sparapet", nil)
			else
				Decisions_Sparapet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARMENIA_SPARAPET_ENACTED_DESC")
				return false, false, true
			end
		end
		
		Decisions_Sparapet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ARMENIA_SPARAPET_DESC")
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local plot = player:GetCapitalCity():Plot()
		for iVal = 0,(plot:GetNumUnits() - 1) do
			local unit = plot:GetUnit(iVal)
			if unit:GetUnitType() == unitMamikonianID then
				unitMamikonian = unit
				break
			end
		end

		if unitMamikonian ~= nil then
			return true, true
		else
			return true, false
		end
		
		return true, true
	end
	)
	
	Decisions_Sparapet.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeNumResourceTotal(resourceHorseID, 2)
		unitMamikonian:SetHasPromotion(unitPromotionSparapetID, true)
		unitMamikonian:SetName(unitMamikonian:GetName() .. " (Sparapet)")
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_SPARAPET")) 
		save(player, "Decisions_Sparapet", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Sparapet", Decisions_Sparapet)
--=======================================================================================================================
--=======================================================================================================================
