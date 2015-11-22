-- JFD_FranksDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Franks Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetNumConqueredCities
------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumConqueredCities(playerID)
	local numCities = 0
	for city in Players[playerID]:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			numCities = numCities + 1
		end
	end

	return numCities
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_HasConqueredCapital
------------------------------------------------------------------------------------------------------------------------
function JFD_HasConqueredCapital(playerID)
	for city in Players[playerID]:Cities() do
		if city:IsOriginalCapital() and city:GetOriginalOwner() ~= playerID then
			return true
		end
	end
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
local buildingArmouryID =GameInfoTypes["BUILDING_ARMORY"]
local buildingBarracksID = GameInfoTypes["BUILDING_BARRACKS"]
local buildingCastleID = GameInfoTypes["BUILDING_CASTLE"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_THE_FRANKS"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local policyCarolingianEmpireID = GameInfoTypes["POLICY_JFD_CAROLINGIAN_EMPIRE"]
local techSteelID = GameInfoTypes["TECH_STEEL"]
local techChivalryID = GameInfoTypes["TECH_CHIVALRY"]
--------------------------------------------------------------------------------------------------------------------------
-- Franks: Establish the Carolingian Empire
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CarolingianEmpire = {}
	Decisions_CarolingianEmpire.Name = "TXT_KEY_DECISIONS_JFD_FRANKS_CAROLINGIAN_EMPIRE"
	Decisions_CarolingianEmpire.Desc = "TXT_KEY_DECISIONS_JFD_FRANKS_CAROLINGIAN_EMPIRE_DESC"
	HookDecisionCivilizationIcon(Decisions_CarolingianEmpire, "CIVILIZATION_JFD_THE_FRANKS")
	Decisions_CarolingianEmpire.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_CarolingianEmpire") == true then
			Decisions_CarolingianEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANKS_CAROLINGIAN_EMPIRE_ENACTED_DESC")
			return false, false, true 
		end
		
		local faithCost = mathCeil(200 * iMod)
		Decisions_CarolingianEmpire.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANKS_CAROLINGIAN_EMPIRE_DESC", faithCost)
		
		--if not (JFD_HasConqueredCapital(player:GetID())) 			then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		--if JFD_GetNumConqueredCities(player:GetID()) < 4 			then return true, false end
		if player:GetFaith() < faithCost 								then return true, false end
		
		return true, true
	end
	)
	
	Decisions_CarolingianEmpire.DoFunc = (
	function(player)
		local faithCost = mathCeil(200 * iMod)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyCarolingianEmpireID, true)
		
		local civilisationAdj = Locale.ConvertTextKey("TXT_KEY_JFD_CAROLINGIAN");
		local civilisationDesc =  Locale.ConvertTextKey("TXT_KEY_JFD_CAROLINGIAN_EMPIRE_DESC");
		local leaderName =  Locale.ConvertTextKey("TXT_KEY_JFD_CHARLES_AUGUSTUS");
		local query = {"UPDATE Language_en_US SET Text = '".. leaderName .."' WHERE Tag = 'TXT_KEY_LEADER_JFD_CHARLEMAGNE'",
			"UPDATE Language_en_US SET Text = '".. civilisationAdj .."' WHERE Tag = 'TXT_KEY_CIV_JFD_THE_FRANKS_ADJECTIVE'",
			"UPDATE Language_en_US SET Text = '".. civilisationDesc .."' WHERE Tag = 'TXT_KEY_CIV_JFD_THE_FRANKS_DESC'"}
		for i, iQuery in pairs(query) do
			for result in DB.Query(iQuery) do
			end
		end
		-- refresh UI texts
		Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
		
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_FRANKS_CAROLINGIAN_EMPIRE")) 
		save(player, "Decisions_CarolingianEmpire", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_CarolingianEmpire", Decisions_CarolingianEmpire)
-------------------------------------------------------------------------------------------------------------------------
-- Franks: Create a March
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FranksMarch = {}
	Decisions_FranksMarch.Name = "TXT_KEY_DECISIONS_JFD_FRANKS_MARCH"
	Decisions_FranksMarch.Desc = "TXT_KEY_DECISIONS_JFD_FRANKS_MARCH_DESC"
	HookDecisionCivilizationIcon(Decisions_FranksMarch, "CIVILIZATION_JFD_THE_FRANKS")
	Decisions_FranksMarch.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if not player:GetCapitalCity() then return false, false end

		local era = load(player, "Decisions_FranksMarch")
		local currentEra = player:GetCurrentEra()
		if currentEra >= eraIndustrialID then
			Decisions_FranksMarch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANKS_MARCH_ENACTED_DESC")
			return false, false, true 
		else
			if era ~= nil then
				if era < currentEra then
					save(player, "Decisions_FranksMarch", nil)
				else
					Decisions_FranksMarch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANKS_MARCH_ENACTED_DESC")
					return false, false, true
				end
			end
		end
		
		local goldCost = mathCeil(1600 * iMod)
		Decisions_FranksMarch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_FRANKS_MARCH_DESC", goldCost)
				
		if player:GetGold() < goldCost 									then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 		then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techSteelID)) 		then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techChivalryID)) 		then return true, false end

		return true, true
	end
	)
	
	Decisions_FranksMarch.DoFunc = (
	function(player)
		local goldCost = mathCeil(1600 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		if player:IsHuman() then
			LuaEvents.JFDChooseMarch()
		else
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(buildingArmouryID, 1)
			capital:SetNumRealBuilding(buildingBarracksID, 1)
			capital:SetNumRealBuilding(buildingCastleID, 1)
			capital:SetNumRealBuilding(buildingWallsID, 1)
		end
		save(player, "Decisions_FranksMarch", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_FranksMarch", Decisions_FranksMarch)
--=======================================================================================================================
--=======================================================================================================================
