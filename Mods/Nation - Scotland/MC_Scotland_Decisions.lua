--------------------------------------------------------------------------------------------------------------------------
-- Scotland: The Declaration of Arbroath
--------------------------------------------------------------------------------------------------------------------------
local Decisions_ScotlandArbroath = {}
    Decisions_ScotlandArbroath.Name = "TXT_KEY_DECISIONS_SCOTLANDARBROATH"
	Decisions_ScotlandArbroath.Desc = "TXT_KEY_DECISIONS_SCOTLANDARBROATH_DESC"
	HookDecisionCivilizationIcon(Decisions_ScotlandArbroath, "CIVILIZATION_MC_SCOTLAND")
	Decisions_ScotlandArbroath.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_SCOTLAND then return false, false end
		if load(pPlayer, "Decisions_ScotlandArbroath") == true then
			Decisions_ScotlandArbroath.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SCOTLANDARBROATH_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(100 * iMod)
		Decisions_ScotlandArbroath.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SCOTLANDARBROATH_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_WRITING)) then return true, false end

		local iNumWarsFought = 0
		for iPlayer, pOtherPlayer in pairs(Players) do
			if pPlayer:GetID() ~= iPlayer then
				iNumWarsFought = iNumWarsFought + pPlayer:GetNumWarsFought()
			end
		end
		if iNumWarsFought < 1 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ScotlandArbroath.DoFunc = (
	function(pPlayer)
	
		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeGold(-iCost)		
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_SCOTLANDARBROATH, true)
		
		save(pPlayer, "Decisions_ScotlandArbroath", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_SCOTLAND, "Decisions_ScotlandArbroath", Decisions_ScotlandArbroath)
--------------------------------------------------------------------------------------------------------------------------
-- Scotland: Call the Clans to Arms
--------------------------------------------------------------------------------------------------------------------------
local Decisions_ScotlandClans = {}
    Decisions_ScotlandClans.Name = "TXT_KEY_DECISIONS_SCOTLANDCLANS"
	Decisions_ScotlandClans.Desc = "TXT_KEY_DECISIONS_SCOTLANDCLANS_DESC"
	HookDecisionCivilizationIcon(Decisions_ScotlandClans, "CIVILIZATION_MC_SCOTLAND")
	Decisions_ScotlandClans.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_SCOTLAND then return false, false end
		if load(pPlayer, "Decisions_ScotlandClans") == true then
			Decisions_ScotlandClans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SCOTLANDCLANS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(70 * pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_MC_SCOTTISH_CLAN_CASTLE) * iMod)
		Decisions_ScotlandClans.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SCOTLANDCLANS_DESC", iCost)

		if (iCost < 1) then	return true, false end		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false) < 1) then return true, false end

		return true, true		
	end
	)
	
	Decisions_ScotlandClans.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(70 * pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_MC_SCOTTISH_CLAN_CASTLE) * iMod)
		pPlayer:ChangeGold(-iCost)		
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)		
		
		local iClanCastle = GameInfoTypes.IMPROVEMENT_MC_SCOTTISH_CLAN_CASTLE
		local iPlayer =  pPlayer:GetID()
		local iUnitType = GetStrongestMilitaryUnit(pPlayer, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
		
		for iPlot = 0, Map.GetNumPlots() - 1, 1 do
			local pPlot = Map.GetPlotByIndex(iPlot)
			if pPlot:GetImprovementType() == iClanCastle and pPlot:GetOwner() == iPlayer then
				pPlayer:InitUnit(iUnitType, pPlot:GetX(), pPlot:GetY())
			end
		end
		
		save(pPlayer, "Decisions_ScotlandClans", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_SCOTLAND, "Decisions_ScotlandClans", Decisions_ScotlandClans)
--=======================================================================================================================
--=======================================================================================================================