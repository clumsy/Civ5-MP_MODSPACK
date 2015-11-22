-- JFD_GreatBritainEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Great Britain Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetMountedCount
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetMountedCount(playerID)
	local player = Players[playerID]
	local mountedCount = 0 
	for unit in player:Units() do
		if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
			mountedCount = mountedCount + 1
		end
	end

    return mountedCount
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
local buildingMilitaryAcademyID = GameInfoTypes["BUILDING_MILITARY_ACADEMY"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"] 
local mathCeil = math.ceil
local unitCombatClassMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitLandshipID = GameInfoTypes["UNIT_WWI_TANK"]
--------------------------------------------------------------------------------------------------------------------------
--  Charge of the Light Cavalry
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGreatBritainLightBrigade = {}
	Event_JFDGreatBritainLightBrigade.Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"
	Event_JFDGreatBritainLightBrigade.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_DESC"
	Event_JFDGreatBritainLightBrigade.Weight = 10
	Event_JFDGreatBritainLightBrigade.CanFunc = (
		function (player)			
			Event_JFDGreatBritainLightBrigade.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_DESC"
			if load(player, "Event_JFDGreatBritainLightBrigade") == true then return false end
			if player:GetCivilizationType() ~= civilisationID 		     then return false end
			if player:GetCurrentEra() ~= eraIndustrialID 			     then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(false) == 0 	     then return false end
			if JFD_GetMountedCount(player:GetID()) == 0 			     then return false end
			
			local goldCost = mathCeil(200 * iMod)
			if player:GetGold() < goldCost 								 then return false end
			
			return true
		end
		)
	Event_JFDGreatBritainLightBrigade.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGreatBritainLightBrigade.Outcomes[1] = {}
	Event_JFDGreatBritainLightBrigade.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_1"
	Event_JFDGreatBritainLightBrigade.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1"
	Event_JFDGreatBritainLightBrigade.Outcomes[1].CanFunc = (
		function(player)	
			local numMountedUnits = JFD_GetMountedCount(player:GetID())
			local goldCost = mathCeil((numMountedUnits * 25) * iMod)
			if player:GetGold() < goldCost then return false end
			
			Event_JFDGreatBritainLightBrigade.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1", goldCost)
			return true
		end
		)
	Event_JFDGreatBritainLightBrigade.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numMountedUnits = JFD_GetMountedCount(player:GetID())
			local goldCost = mathCeil((numMountedUnits * 25) * iMod)
			player:ChangeGold(-goldCost)
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatClassMountedID then
					unit:ChangeExperience(10)
				end
			end

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE"))
			save(player, "Event_JFDGreatBritainLightBrigade", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDGreatBritainLightBrigade.Outcomes[2] = {}
	Event_JFDGreatBritainLightBrigade.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_2"
	Event_JFDGreatBritainLightBrigade.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2"
	Event_JFDGreatBritainLightBrigade.Outcomes[2].CanFunc = (
		function(player)			
			local goldCost = mathCeil(200 * iMod)
			if player:GetGold() < goldCost then return false end
			if player:GetCapitalCity():IsHasBuilding(buildingMilitaryAcademyID) then return false end

			Event_JFDGreatBritainLightBrigade.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFDGreatBritainLightBrigade.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(200 * iMod)
			player:ChangeGold(-goldCost)
			player:GetCapitalCity():SetNumRealBuilding(buildingMilitaryAcademyID, 1)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE"))
			save(player, "Event_JFDGreatBritainLightBrigade", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDGreatBritainLightBrigade.Outcomes[3] = {}
	Event_JFDGreatBritainLightBrigade.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_3"
	Event_JFDGreatBritainLightBrigade.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3"
	Event_JFDGreatBritainLightBrigade.Outcomes[3].CanFunc = (
		function(player)		
			local numMountedUnits = JFD_GetMountedCount(player:GetID())
			local goldCost = mathCeil((numMountedUnits * 100) * iMod)
			if player:GetGold() < goldCost then return false end

			Event_JFDGreatBritainLightBrigade.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3", goldCost)
			return true
		end
		)
	Event_JFDGreatBritainLightBrigade.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local numMountedUnits = JFD_GetMountedCount(playerID)
			local goldCost = mathCeil((numMountedUnits * 100) * iMod)
			player:ChangeGold(-goldCost)
			
			local mountedUnits = {}
			local count = 1
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatClassMountedID then 
					mountedUnits[count] = unit
					count = count + 1
				end
			end

			for _, unit in pairs(mountedUnits) do
				local landShip = player:InitUnit(unitLandshipID, unit:GetX(), unit:GetY())
				landShip:Convert(unit)
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_LIGHT_BRIGADE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_LIGHT_BRIGADE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_LIGHT_BRIGADE"))
			save(player, "Event_JFDGreatBritainLightBrigade", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDGreatBritainLightBrigade", Event_JFDGreatBritainLightBrigade)
--------------------------------------------------------------------------------------------------------------------------
-- Jubilee Celebrations
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGreatBritainJubileeCelebrations = {}
	Event_JFDGreatBritainJubileeCelebrations.Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS"
	Event_JFDGreatBritainJubileeCelebrations.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_DESC"
	Event_JFDGreatBritainJubileeCelebrations.Weight = 5
	Event_JFDGreatBritainJubileeCelebrations.CanFunc = (
		function(player)			
			Event_JFDGreatBritainJubileeCelebrations.Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_DESC"
			if player:GetCivilizationType() ~= civilisationID then return false end
			
			return true
		end
		)
	Event_JFDGreatBritainJubileeCelebrations.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGreatBritainJubileeCelebrations.Outcomes[1] = {}
	Event_JFDGreatBritainJubileeCelebrations.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_OUTCOME_1"
	Event_JFDGreatBritainJubileeCelebrations.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_OUTCOME_RESULT_1"
	Event_JFDGreatBritainJubileeCelebrations.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDGreatBritainJubileeCelebrations.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDGreatBritainJubileeCelebrations.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(10)
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GREAT_BRITAIN_JUBILEE_CELEBRATIONS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_JUBILEE_CELEBRATIONS")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDGreatBritainJubileeCelebrations", Event_JFDGreatBritainJubileeCelebrations)
--=======================================================================================================================
--=======================================================================================================================


