-- HolyRomeDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Holy Rome Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
include("JFD_HolyRomeDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
--  JFD_GetNumAlliedAndFriendlyCS
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumAlliedAndFriendlyCS(playerID)
	local numAlliedAndFriendlyCS = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1 then
			numAlliedAndFriendlyCS = numAlliedAndFriendlyCS + 1
		end
	end

	return numAlliedAndFriendlyCS
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(description)
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end   
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Holy Rome: Issue Golden Bull
-------------------------------------------------------------------------------------------------------------------------
local Decisions_IssueGoldenBull = {}
	Decisions_IssueGoldenBull.Name = "TXT_KEY_DECISIONS_JFD_HOLY_ROME_GOLDEN_BULL"
	Decisions_IssueGoldenBull.Desc = "TXT_KEY_DECISIONS_JFD_HOLY_ROME_GOLDEN_BULL_DESC"
	HookDecisionCivilizationIcon(Decisions_IssueGoldenBull, "CIVILIZATION_JFD_HOLY_ROME")
	Decisions_IssueGoldenBull.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"]) then return false, false end
		if load(pPlayer, "Decisions_IssueGoldenBull") == true then
			Decisions_IssueGoldenBull.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_ROME_GOLDEN_BULL_ENACTED_DESC")
			return false, false, true
		end
		
		local numCSNeeded = 7
		if Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_DUEL"] or Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_TINY"] then
			numCSNeeded = 3
		elseif Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_SMALL"] or Map.GetWorldSize() == GameInfoTypes["WORLDSIZE_STANDARD"] then
			numCSNeeded = 5
		end

		local numCSGot = JFD_GetNumAlliedAndFriendlyCS(pPlayer:GetID())
		Decisions_IssueGoldenBull.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_ROME_GOLDEN_BULL_DESC", numCSNeeded, numCSGot)
		
		if not (pPlayer:GetCapitalCity()) then return true, false end
		if (JFD_GetNumAlliedAndFriendlyCS(pPlayer:GetID()) < numCSNeeded) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end

		return true, true
	end
	)
	
	Decisions_IssueGoldenBull.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
			JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_GOLDEN_BULL")) 
		end
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_HOLY_ROME_GOLDEN_BULL"], true)
		save(pPlayer, "Decisions_IssueGoldenBull", true)
	end
	)

	Decisions_IssueGoldenBull.Monitors = {}
	Decisions_IssueGoldenBull.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local pPlayer = Players[playerID]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"]) then return end
		if load(pPlayer, "Decisions_IssueGoldenBull") == true then
			pPlayer:ChangeGoldenAgeProgressMeter(JFD_GetHappinessFromMinors(playerID))
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"], "Decisions_IssueGoldenBull", Decisions_IssueGoldenBull)
-------------------------------------------------------------------------------------------------------------------------
-- Holy Rome: Fund Conqusitadores
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FundConquistadors = {}
	Decisions_FundConquistadors.Name = "TXT_KEY_DECISIONS_JFD_HOLY_ROME_FUND_CONQUISTADORS"
	Decisions_FundConquistadors.Desc = "TXT_KEY_DECISIONS_JFD_HOLY_ROME_FUND_CONQUISTADORS_DESC"
	HookDecisionCivilizationIcon(Decisions_FundConquistadors, "CIVILIZATION_JFD_HOLY_ROME")
	Decisions_FundConquistadors.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"]) then return false, false end

		if load(pPlayer, "Decisions_FundConquistadors") == true then
			Decisions_FundConquistadors.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_ROME_FUND_CONQUISTADORS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(1500 * iMod)
		Decisions_FundConquistadors.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_HOLY_ROME_FUND_CONQUISTADORS_DESC", iCost)
		
		if not (pPlayer:GetCapitalCity()) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes["TECH_CHIVALRY"])) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end

		return true, true
	end
	)
	
	Decisions_FundConquistadors.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(1500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:InitUnit(GameInfoTypes["UNIT_JFD_HRE_CONQUISTADOR"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
		pPlayer:InitUnit(GameInfoTypes["UNIT_JFD_HRE_CONQUISTADOR"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
		pPlayer:InitUnit(GameInfoTypes["UNIT_JFD_HRE_CONQUISTADOR"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()

		if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
			JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_FUND_CONQUISTADORS")) 
		end
		save(pPlayer, "Decisions_FundConquistadors", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"], "Decisions_FundConquistadors", Decisions_FundConquistadors)
--=======================================================================================================================
--=======================================================================================================================
