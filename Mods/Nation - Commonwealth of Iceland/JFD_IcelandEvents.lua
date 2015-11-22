-- JFD_IcelandEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Iceland Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
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
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingIDThingstead = GameInfoTypes["BUILDING_JFD_THINGSTEAD"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ICELAND"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local religionID = nil
local unitBerserkerID = GameInfoTypes["UNIT_DANISH_BERSERKER"]
local unitSkaldID = GameInfoTypes["UNIT_JFD_SKALD"]
--------------------------------------------------------------------------------------------------------------------------
--  Iceland: Religious Hermit
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDIcelandHermit = {}
	Event_JFDIcelandHermit.Name = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT"
	Event_JFDIcelandHermit.Desc = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_DESC"
	Event_JFDIcelandHermit.Weight = 10
	Event_JFDIcelandHermit.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			if load(player, "Event_JFDIcelandHermit") == true then return false end
			if player:GetCurrentEra() > eraMedievalID then return false end

			local religions = {}
			local count = 1
			for religion in GameInfo.Religions() do
				if (Game.GetHolyCityForReligion(religion.ID, -1) and religion.ID ~= player:GetCapitalCity():GetReligiousMajority()) then
					local count = 1
					religions[count]=religion.ID
					count=count+1
				end
			end

			religionID = religions[GetRandom(1, #religions)]
			if religionID == nil then return false end
			
			Event_JFDIcelandHermit.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_DESC", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFDIcelandHermit.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDIcelandHermit.Outcomes[1] = {}
	Event_JFDIcelandHermit.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_1"
	Event_JFDIcelandHermit.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_1"
	Event_JFDIcelandHermit.Outcomes[1].Weight = 1
	Event_JFDIcelandHermit.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDIcelandHermit.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_1", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFDIcelandHermit.Outcomes[1].DoFunc = (
		function(player) 
			player:GetCapitalCity():AdoptReligionFully(religionID)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_1_NOTIFICATION", Game.GetReligionName(religionID)), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDIcelandHermit.Outcomes[2] = {}
	Event_JFDIcelandHermit.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_2"
	Event_JFDIcelandHermit.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_2"
	Event_JFDIcelandHermit.Outcomes[2].Weight = 5
	Event_JFDIcelandHermit.Outcomes[2].CanFunc = (
		function(player)	
			local reward = mathCeil(60 * iMod)
			local yield = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				if JFD_HasStateReligion(player:GetID()) then
					yield = "[ICON_JFD_PIETY] Piety"
					reward = mathCeil(10 * iMod)
				end
			end
			
			Event_JFDIcelandHermit.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_2", reward, yield)
			return true
		end
		)
	Event_JFDIcelandHermit.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = mathCeil(60 * iMod)
			if isUsingPietyPrestige then
				local hasStateReligion = JFD_HasStateReligion(playerID)
				if hasStateReligion then
					reward = mathCeil(10 * iMod)
					JFD_ChangePiety(playerID, reward)
				end
			else
				player:ChangeFaith(reward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_2_NOTIFICATION", Game.GetReligionName(religionID)), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDIcelandHermit.Outcomes[3] = {}
	Event_JFDIcelandHermit.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_3"
	Event_JFDIcelandHermit.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_3"
	Event_JFDIcelandHermit.Outcomes[3].Weight = 2
	Event_JFDIcelandHermit.Outcomes[3].CanFunc = (
		function(player)	
			Event_JFDIcelandHermit.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_RELIGIOUS_HERMIT_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDIcelandHermit.Outcomes[3].DoFunc = (
		function(player) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDIcelandHermit", Event_JFDIcelandHermit)
--------------------------------------------------------------------------------------------------------------------------
-- Iceland: Sturlung Pressures
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDIcelandSturlungs = {}
	Event_JFDIcelandSturlungs.Name = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES"
	Event_JFDIcelandSturlungs.Desc = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_DESC"
	Event_JFDIcelandSturlungs.Weight = 10
	Event_JFDIcelandSturlungs.CanFunc = (
		function(player)			
			if load(player, "Event_JFDIcelandSturlungs") == true then return false end
			Event_JFDIcelandSturlungs.Desc = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_DESC"
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() ~= eraMedievalID then return false end

			return true
		end
		)
	Event_JFDIcelandSturlungs.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDIcelandSturlungs.Outcomes[1] = {}
	Event_JFDIcelandSturlungs.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_1"
	Event_JFDIcelandSturlungs.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_1"
	Event_JFDIcelandSturlungs.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDIcelandSturlungs.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDIcelandSturlungs.Outcomes[1].DoFunc = (
		function(player) 
			local capital = player:GetCapitalCity()
			capital:ChangeWeLoveTheKingDayCounter(10)
			for city in player:Cities() do	
				if (city ~= capital and city:IsHasBuilding(buildingIDThingstead)) then
					city:ChangeWeLoveTheKingDayCounter(10)
				end
			end

			local playerID = player:GetID()
			if JFD_GetRandom(1, 100) <= 30 then
				local plotX = capital:GetX() + 1
				local plotY = capital:GetY() + 1
				local unitID = GameInfoTypes["UNIT_DANISH_BERSERKER"] or GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				local barbPlayer = Players[63]
				local unitOne = barbPlayer:InitUnit(unitID, plotX, plotY)
				local unitTwo = barbPlayer:InitUnit(unitID, plotX, plotY)
				local unitThree = barbPlayer:InitUnit(unitID, plotX, plotY)
				unitOne:JumpToNearestValidPlot()
				unitTwo:JumpToNearestValidPlot()
				unitThree:JumpToNearestValidPlot()
				unitOne:SetName("Sturlung Berserker")
				unitTwo:SetName("Sturlung Berserker")
				unitThree:SetName("Sturlung Berserker")
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES"))
				JFD_SendWorldEvent(playerID, "TXT_KEY_WORLD_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_ALT")
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES"))
				JFD_SendWorldEvent(playerID, "TXT_KEY_WORLD_EVENT_JFD_ICELAND_STURLUNG_PRESSURES")
			end
			save(player, "Event_JFDIcelandSturlungs", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDIcelandSturlungs.Outcomes[2] = {}
	Event_JFDIcelandSturlungs.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_2"
	Event_JFDIcelandSturlungs.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_2"
	Event_JFDIcelandSturlungs.Outcomes[2].CanFunc = (
		function(player)
			Event_JFDIcelandSturlungs.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDIcelandSturlungs.Outcomes[2].DoFunc = (
		function(player) 
			local capital = player:GetCapitalCity()
			local plotX = capital:GetX() + 2
			local plotY = capital:GetY() + 2
			local unitID = unitBerserkerID or GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
			local barbPlayer = Players[63]
			local unitOne = barbPlayer:InitUnit(unitID, plotX, plotY)
			local unitTwo = barbPlayer:InitUnit(unitID, plotX, plotY)
			local unitThree = barbPlayer:InitUnit(unitID, plotX, plotY)
			unitOne:JumpToNearestValidPlot()
			unitTwo:JumpToNearestValidPlot()
			unitThree:JumpToNearestValidPlot()
			unitOne:SetName("Sturlung Berserker")
			unitTwo:SetName("Sturlung Berserker")
			unitThree:SetName("Sturlung Berserker")
			player:InitUnit(unitSkaldID, capital:GetX(), capital:GetY())

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES"))
			JFD_SendWorldEvent(playerID, "TXT_KEY_WORLD_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_ALT")
			save(player, "Event_JFDIcelandSturlungs", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDIcelandSturlungs.Outcomes[3] = {}
	Event_JFDIcelandSturlungs.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_3"
	Event_JFDIcelandSturlungs.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_3"
	Event_JFDIcelandSturlungs.Outcomes[3].CanFunc = (
		function(player)
			local goldReward = mathCeil(250 * iMod)
			local cultureReward = mathCeil(230 * iMod)
			Event_JFDIcelandSturlungs.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_3", goldReward, cultureReward)
			return true
		end
		)
	Event_JFDIcelandSturlungs.Outcomes[3].DoFunc = (
		function(player) 
			local goldReward = mathCeil(250 * iMod)
			local cultureReward = mathCeil(230 * iMod)
			for city in player:Cities() do
				if city:IsHasBuilding(buildingIDThingstead) then
					city:ChangeResistanceTurns(2)
				end
			end
			player:ChangeGold(goldReward)
			player:ChangeJONSCulture(cultureReward)

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ICELAND_STURLUNG_PRESSURES_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ICELAND_STURLUNG_PRESSURES"))
			JFD_SendWorldEvent(playerID, "TXT_KEY_WORLD_EVENT_JFD_ICELAND_STURLUNG_PRESSURES")
			save(player, "Event_JFDIcelandSturlungs", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDIcelandSturlungs", Event_JFDIcelandSturlungs)
--=======================================================================================================================
--=======================================================================================================================


