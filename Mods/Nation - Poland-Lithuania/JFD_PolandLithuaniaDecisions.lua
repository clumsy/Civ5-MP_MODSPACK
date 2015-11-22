-- PolandLithuaniaDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Poland-Lithuania Decisions: loaded")
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
local buildingEstateID = GameInfoTypes["BUILDING_JFD_ESTATE"]
local buildingGreatSjemID = GameInfoTypes["BUILDING_DECISIONS_GREATSEJM"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_POLAND_LITHUANIA"]
local civilisationPolandID = GameInfoTypes["CIVILIZATION_POLAND"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local gameSpeedQuickID = GameInfoTypes["GAMESPEED_QUICK"]
local gameSpeedStandardID = GameInfoTypes["GAMESPEED_STANDARD"]
local gameSpeedEpicID = GameInfoTypes["GAMESPEED_EPIC"]
local gameSpeedMarathonID = GameInfoTypes["GAMESPEED_MARATHON"]
local mathCeil = math.ceil
local policyNihilNoviID = GameInfoTypes["POLICY_JFD_POLAND_LITHUANIA_NIHIL_NOVI"]
local techMetallurgyID = GameInfoTypes["TECH_METALLURGY"]
local unitPolishKnightID = GameInfoTypes["UNIT_JFD_POLISH_KNIGHT"]
local unitPolishLancerID = GameInfoTypes["UNIT_JFD_POLISH_LANCER"]
-------------------------------------------------------------------------------------------------------------------------
-- Poland-Lithuania: Hold the Great Sjem
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_PolandSejm = nil

local Decisions_PolandSejm = {}
	Decisions_PolandSejm.Name = "TXT_KEY_DECISIONS_POLANDSEJM"
	Decisions_PolandSejm.Desc = "TXT_KEY_DECISIONS_POLANDSEJM_DESC"
	HookDecisionCivilizationIcon(Decisions_PolandSejm, "CIVILIZATION_JFD_POLAND_LITHUANIA")
	Decisions_PolandSejm.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_PolandSejm") == true then
			Decisions_PolandSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDSEJM_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(450*iMod)
		Decisions_PolandSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDSEJM_DESC", cultureCost)
		
		if player:GetJONSCulture() < cultureCost 					then return true, false end
		if player:GetCapitalCity() == nil 							then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if not (player:IsGoldenAge())								then return true, false end
		
		local era = player:GetCurrentEra()
		if not(era == eraRenaissanceID or era == eraIndustrialID) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PolandSejm.DoFunc = (
	function(player)
		local cultureCost = mathCeil(450*iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:GetCapitalCity():SetNumRealBuilding(buildingGreatSjemID, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLAND_LITHUANIA_GREAT_SEJM")) 
		save(player, "Decisions_PolandSejm", true)
	end
	)

	Decisions_PolandSejm.Monitors = {}
	Decisions_PolandSejm.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local player = Players[iPlayer]
		if player:GetCivilizationType() ~= GcivilisationID then return end
		if load(player, "Decisions_PolandSejm") == true then
			player:GetCapitalCity():SetNumRealBuilding(buildingGreatSjemID, 1)
		else
			player:GetCapitalCity():SetNumRealBuilding(buildingGreatSjemID, 0)
		end
	end
	)
	
	Decisions_PolandSejm.Monitors[GameEvents.PlayerAdoptPolicy] =  (
	function(iPlayer)
		local player = Players[iPlayer]
		if load(player, "Decisions_PolandSejm") == true then
			local goldReward = mathCeil(player:GetNextPolicyCost() * 0.4)
			player:ChangeGold(goldReward)
		end
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_PolandSejm", Decisions_PolandSejm)
-------------------------------------------------------------------------------------------------------------------------
-- Poland-Lithuania: Pass the Nihil Novi Act
-------------------------------------------------------------------------------------------------------------------------
local Decisions_PassNihilNoviAct = {}
	Decisions_PassNihilNoviAct.Name = "TXT_KEY_DECISIONS_JFD_POLAND_LITHUANIA_NIHIL_NOVI_ACT"
	Decisions_PassNihilNoviAct.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_LITHUANIA_NIHIL_NOVI_ACT_DESC"
	HookDecisionCivilizationIcon(Decisions_PassNihilNoviAct, "CIVILIZATION_JFD_POLAND_LITHUANIA")
	Decisions_PassNihilNoviAct.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_PassNihilNoviAct") == true then
			Decisions_PassNihilNoviAct.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_LITHUANIA_NIHIL_NOVI_ACT_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(100 * player:CountNumBuildings(buildingEstateID) * iMod)
		Decisions_PassNihilNoviAct.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_LITHUANIA_NIHIL_NOVI_ACT_DESC", goldCost)
		
		if not (player:GetCapitalCity()) 							then return true, false end
		if player:CountNumBuildings(buildingEstateID) < 4 			then return true, false end
		if player:GetGold() < goldCost 							then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end

		return true, true
	end
	)
	
	Decisions_PassNihilNoviAct.DoFunc = (
	function(player)
		local goldCost = mathCeil(100 * player:CountNumBuildings(buildingEstateID) * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyNihilNoviID, true)
		player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(20)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLAND_LITHUANIA_NIHIL_NOVI")) 
		save(player, "Decisions_PassNihilNoviAct", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_PassNihilNoviAct", Decisions_PassNihilNoviAct)
--------------------------------------------------------------------------------------------------------------------------
-- Poland: Call the Noble Host
--------------------------------------------------------------------------------------------------------------------------
local Decisions_NobleHost = {}
	Decisions_NobleHost.Name = "TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST"
	Decisions_NobleHost.Desc = "TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST_DESC"
	HookDecisionCivilizationIcon(Decisions_NobleHost, "CIVILIZATION_POLAND")
	Decisions_NobleHost.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationPolandID then return false, false end

		local era = load(player, "Decisions_NobleHost")
		local currentEra = player:GetCurrentEra()
		if currentEra >= eraIndustrialID then
			Decisions_NobleHost.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST_ENACTED_DESC")
			return false, false, true 
		else
			if era ~= nil then
				if era < currentEra then
					save(player, "Decisions_NobleHost", nil)
				else
					Decisions_NobleHost.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST_ENACTED_DESC")
					return false, false, true
				end
			end
		end
		
		local goldCost = mathCeil(400 * iMod)
		local numTurns = {} or 30
		numTurns[gameSpeedQuickID] = 20
		numTurns[gameSpeedStandardID] = 30
		numTurns[gameSpeedEpicID] = 40
		numTurns[gameSpeedMarathonID] = 50
		Decisions_NobleHost.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST_DESC", goldCost, numTurns[Game.GetGameSpeedType()])	
		
		if player:GetGold() < goldCost 								then return true, false end
		if currentEra < eraMedievalID 								then return true, false end
		if currentEra >= eraIndustrialID 							then return true, false end
		if Teams[player:GetTeam()]:GetAtWarCount(false) == 0 		then return true, false end

		return true, true
	end
	)
	
	Decisions_NobleHost.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		local unitType
		if Teams[player:GetTeam()]:IsHasTech(techMetallurgyID) then
			unitType = "UNIT_JFD_POLISH_LANCER"
		else
			unitType = "UNIT_JFD_POLISH_KNIGHT" 
		end
		
		local capital = player:GetCapitalCity()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		player:InitUnit(GameInfoTypes[unitType], capitalX, capitalY)
		player:InitUnit(GameInfoTypes[unitType], capitalX, capitalY)
		player:InitUnit(GameInfoTypes[unitType], capitalX, capitalY)
		player:InitUnit(GameInfoTypes[unitType], capitalX, capitalY)

		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_POLAND_NOBLE_HOST")) 
		save(player, "Decisions_NobleHost", player:GetCurrentEra())
		save(player, "Decisions_NobleHostCavalry", Game.GetGameTurn())
	end
	)

	Decisions_NobleHost.Monitors = {}
	Decisions_NobleHost.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if load(player, "Decisions_NobleHostCavalry") ~= nil then 
			if player:GetCivilizationType() ~= civilisationPolandID then return end
			local numTurns = {} or 30
			numTurns[gameSpeedQuickID] = 20
			numTurns[gameSpeedStandardID] = 30
			numTurns[gameSpeedEpicID] = 40
			numTurns[gameSpeedMarathonID] = 50
					
			if Game.GetGameTurn() >= load(player, "Decisions_NobleHostCavalry") + numTurns[Game.GetGameSpeedType()] then
				for unit in player:Units() do
					if unit:GetUnitType() == unitPolishKnightID or unit:GetUnitType() == unitPolishLancerID then 
						unit:Kill(false, -1)
					end
				end
				if player:IsHuman() then
					player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], "The Nobles who came to your call have done their duty and now return to their estates", Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_POLAND_NOBLE_HOST"), -1, -1)
				end
				save(player, "Decisions_NobleHostCavalry", nil)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationPolandID, "Decisions_NobleHost", Decisions_NobleHost)
--=======================================================================================================================
--=======================================================================================================================
