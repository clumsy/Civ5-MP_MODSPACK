-- Khazaria Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Khazaria Decisions: loaded")
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
local buildingIsinglassTradeID = GameInfoTypes["BUILDING_JFD_ISINGLASS_TRADE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_KHAZARIA"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local unitKhaganBekID = GameInfoTypes["UNIT_JFD_KHAGAN_BEK"]
-------------------------------------------------------------------------------------------------------------------------
-- Khazaria: Consolidate the Khaganate
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ConsolidateKhaganate = {}
	Decisions_ConsolidateKhaganate.Name = "TXT_KEY_DECISIONS_JFD_KHAZARIA_CONSOLIDATE_KHAGANATE"
	Decisions_ConsolidateKhaganate.Desc = "TXT_KEY_DECISIONS_JFD_KHAZARIA_CONSOLIDATE_KHAGANATE_DESC"
	HookDecisionCivilizationIcon(Decisions_ConsolidateKhaganate, "CIVILIZATION_JFD_KHAZARIA")
	Decisions_ConsolidateKhaganate.Weight = nil
	Decisions_ConsolidateKhaganate.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_ConsolidateKhaganate") == true then
			Decisions_ConsolidateKhaganate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KHAZARIA_CONSOLIDATE_KHAGANATE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(500 * iMod)
		local cultureCost = mathCeil(225 * iMod)
		Decisions_ConsolidateKhaganate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KHAZARIA_CONSOLIDATE_KHAGANATE_DESC", goldCost, cultureCost)
		
		if player:GetNumCities() 	< 3 				then return true, false end
		if player:GetGold()			< goldCost 			then return true, false end
		if player:GetJONSCulture()	< cultureCost 		then return true, false end
		
		if player:GetCurrentEra() 	< eraMedievalID 	then return true, false end

		return true, true
	end
	)
	
	Decisions_ConsolidateKhaganate.DoFunc = (
	function(player)
		local goldCost = mathCeil(500 * iMod)
		local cultureCost = mathCeil(225 * iMod)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = 
		player:ChangeGold(-goldCost)
		player:ChangeJONSCulture(-cultureCost)
		player:InitUnit(unitKhaganBekID, capitalX, capitalY)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CONSOLIDATE_KHAGANATE"))
		save(player, "Decisions_ConsolidateKhaganate", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_ConsolidateKhaganate", Decisions_ConsolidateKhaganate)
-------------------------------------------------------------------------------------------------------------------------
-- Khazaria: Isinglass Trade
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsHasCoastalCity(playerID)
	local player = Players[playerID]
	local hasCoastalCity = false
	for city in player:Cities() do
		if city:IsCoastal() then
			hasCoastalCity = true
		end
	end

	return hasCoastalCity
end

local Decisions_IsinglassTrade = {}
	Decisions_IsinglassTrade.Name = "TXT_KEY_DECISIONS_JFD_KHAZARIA_ENCOURAGE_ISINGLASS_TRADE"
	Decisions_IsinglassTrade.Desc = "TXT_KEY_DECISIONS_JFD_KHAZARIA_ENCOURAGE_ISINGLASS_TRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_IsinglassTrade, "CIVILIZATION_JFD_KHAZARIA")
	Decisions_IsinglassTrade.Weight = nil
	Decisions_IsinglassTrade.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_IsinglassTrade") == true then
			Decisions_IsinglassTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KHAZARIA_ENCOURAGE_ISINGLASS_TRADE_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = math.ceil(300 * iMod)
		Decisions_IsinglassTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KHAZARIA_ENCOURAGE_ISINGLASS_TRADE_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if not (player:GetCapitalCity()) 							then return true, false end
		if not (JFD_IsHasCoastalCity(player:GetID())) 				then return true, false end

		return true, true
	end
	)
	
	Decisions_IsinglassTrade.DoFunc = (
	function(player)
		local iCost = math.ceil(300 * iMod)
		player:ChangeGold(-iCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(buildingIsinglassTradeID, 1)
		save(player, "Decisions_IsinglassTrade", true)
	end
	)

	Decisions_IsinglassTrade.Monitors = {}
	Decisions_IsinglassTrade.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationID then return end
		if load(player, "Decisions_IsinglassTrade") == true then
			if player:CountNumBuildings(buildingIsinglassTradeID) == 0 then
				player:GetCapitalCity():SetNumRealBuilding(buildingIsinglassTradeID, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_IsinglassTrade", Decisions_IsinglassTrade)
--=======================================================================================================================
--=======================================================================================================================
