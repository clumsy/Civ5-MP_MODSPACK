-- Norway Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Switzerland Decisions: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_SWITZERLAND"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
local policyForeignResearchersID = GameInfoTypes["POLICY_JFD_SWITZERLAND_FOREIGN_RESEARCHERS"]
local techBankingID = GameInfoTypes["TECH_BANKING"]
--------------------------------------------------------------------------------------------------------------------------
-- Switzerland: Enact Bank Secrecy Laws
-------------------------------------------------------------------------------------------------------------------------
local Decisions_BankSecrecy = {}
	Decisions_BankSecrecy.Name = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY"
	Decisions_BankSecrecy.Desc = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_DESC"
	HookDecisionCivilizationIcon(Decisions_BankSecrecy, "CIVILIZATION_JFD_SWITZERLAND")
	Decisions_BankSecrecy.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_BankSecrecy") == true then
			Decisions_BankSecrecy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_BankSecrecy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY_DESC")
		if not (player:GetCapitalCity()) 							then return true, false end
		if not (Teams[player:GetTeam()]:IsHasTech(techBankingID)) 	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end

		return true, true
	end
	)
	
	Decisions_BankSecrecy.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_JFD_SWITZERLAND_SECRECY_LAWS"], true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SWITZERLAND_BANK_SECRECY")) 
		save(player, "Decisions_BankSecrecy", true)
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_BankSecrecy", Decisions_BankSecrecy)
-------------------------------------------------------------------------------------------------------------------------
-- Switzerland: Fund Foreign Researchers
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FundForeignResearchers = {}
	Decisions_FundForeignResearchers.Name = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS"
	Decisions_FundForeignResearchers.Desc = "TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_DESC"
	HookDecisionCivilizationIcon(Decisions_FundForeignResearchers, "CIVILIZATION_JFD_SWITZERLAND")
	Decisions_FundForeignResearchers.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_FundForeignResearchers") == true then
			Decisions_FundForeignResearchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(400 * iMod)
		Decisions_FundForeignResearchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS_DESC", goldCost)
		
		if not (player:GetCapitalCity()) 							then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID 				then return true, false end
		if player:GetGold() < goldCost 								then return true, false end

		return true, true
	end
	)
	
	Decisions_FundForeignResearchers.DoFunc = (
	function(player)
		local goldCost = mathCeil(400 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyForeignResearchersID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SWITZERLAND_FOREIGN_RESEARCHERS")) 
		save(player, "Decisions_FundForeignResearchers", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_FundForeignResearchers", Decisions_FundForeignResearchers)
--=======================================================================================================================
--=======================================================================================================================
