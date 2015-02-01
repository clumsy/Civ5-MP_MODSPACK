-- JFD_MilanEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Milan Events: loaded")
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
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
-- Civ Specific Events
--=======================================================================================================================
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local playerBarbarian = Players[63]
local policyMachiavelliID = GameInfoTypes["POLICY_JFD_MILAN_MACHIAVELLI"]
--------------------------------------------------------------------------------------------------------------------------
--  Feud
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDMilanFeud = {}
	Event_JFDMilanFeud.Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD"
	Event_JFDMilanFeud.Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_DESC"
	Event_JFDMilanFeud.CanFunc = (
		function(player)			
			if load(player, "Event_JFDMilanFeud") == true		then return false end
			if player:GetCivilizationType() ~= civilisationID	then return false end
			if player:GetCurrentEra() < eraRenaissanceID		then return false end

			return true
		end
		)
	Event_JFDMilanFeud.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMilanFeud.Outcomes[1] = {}
	Event_JFDMilanFeud.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_1"
	Event_JFDMilanFeud.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_1"
	Event_JFDMilanFeud.Outcomes[1].CanFunc = (
		function(player)	
			local reward = mathCeil(123 * iMod)
			local rewardType = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				reward = mathCeil(23 * iMod)
				rewardType = "[ICON_JFD_PIETY] Piety"
			end
			
			Event_JFDMilanFeud.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_1", reward, rewardType)
			return true
		end
		)
	Event_JFDMilanFeud.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = mathCeil(123 * iMod)
			local rewardType = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				reward = mathCeil(23 * iMod)
				rewardType = "[ICON_JFD_PIETY] Piety"
				JFD_ChangePiety(playerID, reward)
			else
				player:ChangeFaith(reward)
			end
			
			if JFD_GetRandom(1,100) <= 50 then
				local capitalX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,2)
				local capitalY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,2)
				local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				playerBarbarian:InitUnit(unitToSpawnID, capitalX, capitalY):SetName("Ghibelle Mercenaries")
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MILAN_FEUD_1"))
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			save(player, "Event_JFDMilanFeud", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMilanFeud.Outcomes[2] = {}
	Event_JFDMilanFeud.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_2"
	Event_JFDMilanFeud.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_2"
	Event_JFDMilanFeud.Outcomes[2].CanFunc = (
		function(player)	
			local goldenAgeReward = mathCeil(152 * iMod)
			Event_JFDMilanFeud.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFDMilanFeud.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = mathCeil(152 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			if JFD_GetRandom(1,100) <= 50 then
				local capitalX = player:GetCapitalCity():GetX() + JFD_GetRandom(1,2)
				local capitalY = player:GetCapitalCity():GetY() + JFD_GetRandom(1,2)
				local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				playerBarbarian:InitUnit(unitToSpawnID, capitalX, capitalY):SetName("Guelph Mercenaries")
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MILAN_FEUD_2"))
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			save(player, "Event_JFDMilanFeud", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDMilanFeud", Event_JFDMilanFeud)
--------------------------------------------------------------------------------------------------------------------------
--  Treatise by Machiavelli
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDMilanMachiavelli = {}
	Event_JFDMilanMachiavelli.Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"
	Event_JFDMilanMachiavelli.Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_DESC"
	Event_JFDMilanMachiavelli.Weight = 2
	Event_JFDMilanMachiavelli.CanFunc = (
		function(player)			
			if load(player, "Event_JFDMilanMachiavelli") == true	then return false end
			if player:GetCivilizationType() ~= civilisationID		then return false end
			if player:GetCurrentEra() < eraRenaissanceID			then return false end

			return true
		end
		)
	Event_JFDMilanMachiavelli.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDMilanMachiavelli.Outcomes[1] = {}
	Event_JFDMilanMachiavelli.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_1"
	Event_JFDMilanMachiavelli.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1"
	Event_JFDMilanMachiavelli.Outcomes[1].CanFunc = (	
		function(player)	
			Event_JFDMilanMachiavelli.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDMilanMachiavelli.Outcomes[1].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"))
			save(player, "Event_JFDMilanMachiavelli", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDMilanMachiavelli.Outcomes[2] = {}
	Event_JFDMilanMachiavelli.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_2"
	Event_JFDMilanMachiavelli.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_2"
	Event_JFDMilanMachiavelli.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDMilanMachiavelli.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDMilanMachiavelli.Outcomes[2].DoFunc = (
		function(player) 
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyMachiavelliID, true)

			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitToSpawnID, capitalX, capitalY):JumpToNearestValidPlot()

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"))
			save(player, "Event_JFDMilanMachiavelli", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDMilanMachiavelli", Event_JFDMilanMachiavelli)
--=======================================================================================================================
--=======================================================================================================================


