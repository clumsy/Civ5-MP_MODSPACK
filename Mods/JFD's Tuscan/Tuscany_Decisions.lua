-- Tuscan Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Tuscan Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Tuscany: Become Patron of the Arts
-------------------------------------------------------------------------------------------------------------------------

local Decisions_TuscanSantaMaria = {}
	Decisions_TuscanSantaMaria.Name = "TXT_KEY_DECISIONS_TUSCANSANTAMARIA"
	Decisions_TuscanSantaMaria.Desc = "TXT_KEY_DECISIONS_TUSCANSANTAMARIA_DESC"
	Decisions_TuscanSantaMaria.Pedia = "TXT_KEY_BUILDING_TUSCANSANTAMARIA_DESC"
	HookDecisionCivilizationIcon(Decisions_TuscanSantaMaria, "CIVILIZATION_TUSCANY")
	Decisions_TuscanSantaMaria.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TUSCANY) then return false, false end
		if load(pPlayer, "Decisions_TuscanSantaMaria") == true then
			Decisions_TuscanSantaMaria.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TUSCANSANTAMARIA_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(800 * iMod)
		Decisions_TuscanSantaMaria.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TUSCANSANTAMARIA_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_MEDIEVAL) then return true, false	end
		
		if pPlayer:IsGoldenAge() then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_TuscanSantaMaria.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_TUSCANSANTAMARIA, 1)
		save(pPlayer, "Decisions_TuscanSantaMaria", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TUSCANY, "Decisions_TuscanSantaMaria", Decisions_TuscanSantaMaria)

-------------------------------------------------------------------------------------------------------------------------
-- Tuscany: Found the Medici Bank
-------------------------------------------------------------------------------------------------------------------------

local Decisions_TuscanBank = {}
	Decisions_TuscanBank.Name = "TXT_KEY_DECISIONS_TUSCANBANK"
	Decisions_TuscanBank.Desc = "TXT_KEY_DECISIONS_TUSCANBANK_DESC"
	HookDecisionCivilizationIcon(Decisions_TuscanBank, "CIVILIZATION_TUSCANY")
	Decisions_TuscanBank.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TUSCANY) then return false, false end
		if load(pPlayer, "Decisions_TuscanBank") == true then
			Decisions_TuscanBank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TUSCANBANK_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(350 * iMod)
		Decisions_TuscanBank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TUSCANBANK_DESC", iCost)
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_MEDIEVAL) then return true, false	end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		if pPlayer:GetJONSCulture() >= iCost then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_TuscanBank.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(350 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_TUSCANBANK, 1)
		save(pPlayer, "Decisions_TuscanBank", true)
	end
	)
	
	Decisions_TuscanBank.Monitors = {}
	Decisions_TuscanBank.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_TuscanBank") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_TUSCANBANK, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_TUSCANY, "Decisions_TuscanBank", Decisions_TuscanBank)
--=======================================================================================================================
--=======================================================================================================================