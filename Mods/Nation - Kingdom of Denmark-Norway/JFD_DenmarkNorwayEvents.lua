-- JFD_DenmarkNorwayEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Denmark-Norway Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
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
local buildingPalaceID = GameInfoTypes["BUILDING_PALACE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_DENMARK_NORWAY"]
local christiania = nil
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local unitKontreadmiralID = GameInfoTypes["UNIT_JFD_KONTREADMIRAL"]
local unitScoutID = GameInfoTypes["UNIT_SCOUT"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
--------------------------------------------------------------------------------------------------------------------------
--  Lost Nordic Settlement
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDDenmarkNorwayLostNordicSettlement = {}
	Event_JFDDenmarkNorwayLostNordicSettlement.Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT"
	Event_JFDDenmarkNorwayLostNordicSettlement.Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_DESC"
	Event_JFDDenmarkNorwayLostNordicSettlement.Weight = 10
	Event_JFDDenmarkNorwayLostNordicSettlement.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() <  eraRenaissanceID		then return false end
			Event_JFDDenmarkNorwayLostNordicSettlement.Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_DESC"
			return true
		end
		)
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1] = {}
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_1"
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_1"
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].Weight = 5
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(555 * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(555 * iMod)
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:ChangeGold(-goldCost)
			player:InitUnit(unitSettlerID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitScoutID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitScoutID, capitalX, capitalY):JumpToNearestValidPlot()
			player:InitUnit(unitKontreadmiralID, capitalX, capitalY):JumpToNearestValidPlot()

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2] = {}
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_2"
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_2"
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].Weight = 2
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDDenmarkNorwayLostNordicSettlement.Outcomes[2].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_LOST_NORDIC_SETTLEMENT"))
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDDenmarkNorwayLostNordicSettlement", Event_JFDDenmarkNorwayLostNordicSettlement)
--------------------------------------------------------------------------------------------------------------------------
--  Pietism
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDDenmarkNorwayPietism = {}
	Event_JFDDenmarkNorwayPietism.Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM"
	Event_JFDDenmarkNorwayPietism.Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_DESC"
	Event_JFDDenmarkNorwayPietism.Weight = 10
	Event_JFDDenmarkNorwayPietism.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() <  eraRenaissanceID		then return false end
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()			
			if religionID <= 0 then return false end
			
			Event_JFDDenmarkNorwayPietism.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_DESC", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFDDenmarkNorwayPietism.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDDenmarkNorwayPietism.Outcomes[1] = {}
	Event_JFDDenmarkNorwayPietism.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_1"
	Event_JFDDenmarkNorwayPietism.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_1"
	Event_JFDDenmarkNorwayPietism.Outcomes[1].Weight = 5
	Event_JFDDenmarkNorwayPietism.Outcomes[1].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(130 * iMod)
			Event_JFDDenmarkNorwayPietism.Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_1")

			Event_JFDDenmarkNorwayPietism.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_1", cultureReward)
			return true
		end
		)
	Event_JFDDenmarkNorwayPietism.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(130 * iMod)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_PIETISM_1")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDDenmarkNorwayPietism.Outcomes[2] = {}
	Event_JFDDenmarkNorwayPietism.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_2"
	Event_JFDDenmarkNorwayPietism.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_2"
	Event_JFDDenmarkNorwayPietism.Outcomes[2].Weight = 2
	Event_JFDDenmarkNorwayPietism.Outcomes[2].CanFunc = (
		function(player)			
			local reward = mathCeil(200 * iMod)
			local yield = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				if JFD_HasStateReligion(player:GetID()) then
					yield = "[ICON_JFD_PIETY] Piety"
					reward = mathCeil(20 * iMod)
				end
			end
			
			Event_JFDDenmarkNorwayPietism.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_2", reward, yield)
			return true
		end
		)
	Event_JFDDenmarkNorwayPietism.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = mathCeil(200 * iMod)
			if isUsingPietyPrestige then
				if JFD_HasStateReligion(playerID) then
					reward = mathCeil(20 * iMod)
					JFD_ChangePiety(playerID, reward)
				end
			else
				player:ChangeFaith(reward)
			end
		
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_PIETISM_2")) 
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_PIETISIM_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_PIETISIM"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDDenmarkNorwayPietism", Event_JFDDenmarkNorwayPietism)
--------------------------------------------------------------------------------------------------------------------------
--  Norwegian Tensions
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDDenmarkNorwayTensions = {}
	Event_JFDDenmarkNorwayTensions.Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"
	Event_JFDDenmarkNorwayTensions.Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_DESC"
	Event_JFDDenmarkNorwayTensions.Weight = 10
	Event_JFDDenmarkNorwayTensions.CanFunc = (
		function(player)			
			if load(player, "Event_JFDDenmarkNorwayTensions") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() <  eraRenaissanceID		then return false end
			
			for city in player:Cities() do
				if city:GetNameKey() == "TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_02" then
					christiania = city
				end
			end

			if christiania == nil then return false end
			Event_JFDDenmarkNorwayTensions.Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_DESC"
			
			
			return true
		end
		)
	Event_JFDDenmarkNorwayTensions.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDDenmarkNorwayTensions.Outcomes[1] = {}
	Event_JFDDenmarkNorwayTensions.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_1"
	Event_JFDDenmarkNorwayTensions.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_1"
	Event_JFDDenmarkNorwayTensions.Outcomes[1].Weight = 2
	Event_JFDDenmarkNorwayTensions.Outcomes[1].CanFunc = (
		function(player)			

			Event_JFDDenmarkNorwayTensions.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDDenmarkNorwayTensions.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(buildingPalaceID, 0)
			capital:ChangeResistanceTurns(5)
			christiania:SetNumRealBuilding(buildingPalaceID, 1)
			christiania:ChangeWeLoveTheKingDayCounter(20)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS")) 
			save(player, "Event_JFDDenmarkNorwayTensions", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDDenmarkNorwayTensions.Outcomes[2] = {}
	Event_JFDDenmarkNorwayTensions.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_2"
	Event_JFDDenmarkNorwayTensions.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_2"
	Event_JFDDenmarkNorwayTensions.Outcomes[2].Weight = 5
	Event_JFDDenmarkNorwayTensions.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDDenmarkNorwayTensions.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDDenmarkNorwayTensions.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			christiania:ChangeWeLoveTheKingDayCounter(10)
			capital:ChangeResistanceTurns(2)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS")) 
			save(player, "Event_JFDDenmarkNorwayTensions", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDDenmarkNorwayTensions.Outcomes[3] = {}
	Event_JFDDenmarkNorwayTensions.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_3"
	Event_JFDDenmarkNorwayTensions.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_3"
	Event_JFDDenmarkNorwayTensions.Outcomes[3].Weight = 4
	Event_JFDDenmarkNorwayTensions.Outcomes[3].CanFunc = (
		function(player)
			Event_JFDDenmarkNorwayTensions.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDDenmarkNorwayTensions.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cityX = christiania:GetX()
			local cityY = christiania:GetY()
			christiania:ChangeWeLoveTheKingDayCounter(5)

			if JFD_GetRandom(1, 100) <= 30 then
				local unitOne = Players[63]:InitUnit(GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN"), cityX, cityY)
				local unitTwo = Players[63]:InitUnit(GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN"), cityX, cityY)
				unitOne:JumpToNearestValidPlot()
				unitTwo:JumpToNearestValidPlot()
				unitOne:SetName("Norwegian Rebel")
				unitTwo:SetName("Norwegian Rebel")
				
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_3_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			end
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(5)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS")) 
		end)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_JFDDenmarkNorwayTensions.Outcomes[4] = {}
	Event_JFDDenmarkNorwayTensions.Outcomes[4].Name = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_4"
	Event_JFDDenmarkNorwayTensions.Outcomes[4].Desc = "TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_4"
	Event_JFDDenmarkNorwayTensions.Outcomes[4].Weight = 4
	Event_JFDDenmarkNorwayTensions.Outcomes[4].CanFunc = (
		function(player)			

			Event_JFDDenmarkNorwayTensions.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_4")
			return true
		end
		)
	Event_JFDDenmarkNorwayTensions.Outcomes[4].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1, 100) <= 50 then
				local cityX = christiania:GetX()
				local cityY = christiania:GetY()
				local unitOne = Players[63]:InitUnit(GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN"), cityX, cityY)
				local unitTwo = Players[63]:InitUnit(GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN"), cityX, cityY)
				unitOne:JumpToNearestValidPlot()
				unitTwo:JumpToNearestValidPlot()
				unitOne:SetName("Norwegian Rebel")
				unitTwo:SetName("Norwegian Rebel")
				
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_4_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS_OUTCOME_RESULT_4_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS"))
			end
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(20)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DENMARK_NORWAY_NORWEGIAN_TENSIONS")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDDenmarkNorwayTensions", Event_JFDDenmarkNorwayTensions)
--=======================================================================================================================
--=======================================================================================================================


