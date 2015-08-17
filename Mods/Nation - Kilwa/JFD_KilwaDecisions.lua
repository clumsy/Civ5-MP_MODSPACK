-- Kilwa Decisions
-- Author: JFD
--=======================================================================================================================
print("More Civs' Kilwa Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Kilwa: Foster Market Towns
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FosterMarketTowns = {}
	Decisions_FosterMarketTowns.Name = "TXT_KEY_DECISIONS_JFD_KILWA_FOSTER_MARKET_TOWNS"
	Decisions_FosterMarketTowns.Desc = "TXT_KEY_DECISIONS_JFD_KILWA_FOSTER_MARKET_TOWNS_DESC"
	HookDecisionCivilizationIcon(Decisions_FosterMarketTowns, "CIVILIZATION_MC_KILWA")
	Decisions_FosterMarketTowns.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MC_KILWA"]) then return false, false end
		if load(pPlayer, "Decisions_FosterMarketTowns") == true then
			Decisions_FosterMarketTowns.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KILWA_FOSTER_MARKET_TOWNS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(350 * iMod)
		Decisions_FosterMarketTowns.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KILWA_FOSTER_MARKET_TOWNS_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes["TECH_CURRENCY"])) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_FosterMarketTowns.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(350 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_KILWA_MARKET_TOWNS"], true)
		save(pPlayer, "Decisions_FosterMarketTowns", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MC_KILWA"], "Decisions_FosterMarketTowns", Decisions_FosterMarketTowns)
-------------------------------------------------------------------------------------------------------------------------
-- Belgian: Convene the Brussels Geographic Confederence
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CoralConstruction = {}
	Decisions_CoralConstruction.Name = "TXT_KEY_DECISIONS_JFD_KILWA_CORAL_CONSTRUCTION"
	Decisions_CoralConstruction.Desc = "TXT_KEY_DECISIONS_JFD_KILWA_CORAL_CONSTRUCTION_DESC"
	HookDecisionCivilizationIcon(Decisions_CoralConstruction, "CIVILIZATION_MC_KILWA")
	Decisions_CoralConstruction.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MC_KILWA"]) then return false, false end
		if load(pPlayer, "Decisions_CoralConstruction") == true then
			Decisions_CoralConstruction.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KILWA_CORAL_CONSTRUCTION_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_CoralConstruction.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_KILWA_CORAL_CONSTRUCTION_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if (pPlayer:CountNumBuildings(GameInfoTypes["BUILDING_MC_SWAHILI_CORAL_PORT"]) < 3) then return true, false end 
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra >= GameInfoTypes["ERA_MEDIEVAL"]) then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_CoralConstruction.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_KILWA_CORAL_CONSTRUCTION"], true)
		for city in pPlayer:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_KILWA_CORAL_CONSTRUCTION"], 1)
		end
		save(pPlayer, "Decisions_CoralConstruction", true)
	end
	)

	Decisions_CoralConstruction.Monitors = {}
	Decisions_CoralConstruction.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local pPlayer = Players[playerID]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MC_KILWA"]) then return end
		if load(pPlayer, "Decisions_CoralConstruction") == true then
			for city in pPlayer:Cities() do
				if not city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_KILWA_CORAL_CONSTRUCTION"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_KILWA_CORAL_CONSTRUCTION"], 1)
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MC_KILWA"], "Decisions_CoralConstruction", Decisions_CoralConstruction)
--=======================================================================================================================
--=======================================================================================================================