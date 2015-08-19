-- JFD_ByzantiumAlexios_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Byzantium (Alexios) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsHasConqueredCity
function JFD_IsHasConqueredCity(playerID)
	local player = Players[playerID]
	local numConqueredCapitals = 0
	for city in player:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			return true
		end
	end
end

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationByzantiumAlexiosID  = GameInfoTypes["CIVILIZATION_JFD_BYZANTIUM_ALEXIOS"]
local eraClassicalID				  = GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID					  = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil 						  = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Alexios): Establish the Laws of Porphyrogennetos
-------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_ByzantiumPorphyrogennetos = nil
local Decisions_ByzantiumPorphyrogennetos = {}
	Decisions_ByzantiumPorphyrogennetos.Name = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS"
	Decisions_ByzantiumPorphyrogennetos.Desc = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC"
	HookDecisionCivilizationIcon(Decisions_ByzantiumPorphyrogennetos, "CIVILIZATION_JFD_BYZANTIUM_ALEXIOS")
	Decisions_ByzantiumPorphyrogennetos.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false, false end
		if load(player, "Decisions_ByzantiumPorphyrogennetos") == true then
			Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = math.ceil(400 * iMod)
		Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC", goldCost)
		if player:GetNumPolicyBranchesFinished() < 1 then return true, false end
		local currentEra = player:GetCurrentEra()
		if ((currentEra == eraClassicalID or currentEra == eraMedievalID) and (player:GetGold() >= goldCost) and (player:IsGoldenAge())) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ByzantiumPorphyrogennetos.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, 2)
		save(player, "Decisions_ByzantiumPorphyrogennetos", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Decisions_ByzantiumPorphyrogennetos", Decisions_ByzantiumPorphyrogennetos)
-------------------------------------------------------------------------------------------------------------------------
-- Byzantium (Alexios): Reform the Thematic System
-------------------------------------------------------------------------------------------------------------------------
local policyByzantiumAlexiosThematicSystemID = GameInfoTypes["POLICY_DECISIONS_JFD_REFORM_THEMATIC_SYSTEM"]

local Decisions_ByzantiumAlexiosReformThematicSystem = {}
	Decisions_ByzantiumAlexiosReformThematicSystem.Name = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM"
	Decisions_ByzantiumAlexiosReformThematicSystem.Desc = "TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_DESC"
	HookDecisionCivilizationIcon(Decisions_ByzantiumAlexiosReformThematicSystem, "CIVILIZATION_JFD_BYZANTIUM_ALEXIOS")
	Decisions_ByzantiumAlexiosReformThematicSystem.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationByzantiumAlexiosID then return false, false end
		if load(player, "Decisions_ByzantiumAlexiosReformThematicSystem") == true then
			Decisions_ByzantiumAlexiosReformThematicSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_ENACTED_DESC")
			return false, false, true 
		end
		local playerID = player:GetID()
		local goldCost = mathCeil((50 * player:GetNumCities()) * iMod)
		Decisions_ByzantiumAlexiosReformThematicSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		local currentEra = player:GetCurrentEra()
		if ((currentEra >= eraMedievalID) and (player:GetGold() >= goldCost) and (player:IsGoldenAge())) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ByzantiumAlexiosReformThematicSystem.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local goldCost = mathCeil((50 * player:GetNumCities()) * iMod)
		player:ChangeGold(-goldCost)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyByzantiumAlexiosThematicSystemID, true)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		save(player, "Decisions_ByzantiumAlexiosReformThematicSystem", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationByzantiumAlexiosID, "Decisions_ByzantiumAlexiosReformThematicSystem", Decisions_ByzantiumAlexiosReformThematicSystem)
--=======================================================================================================================
--=======================================================================================================================
