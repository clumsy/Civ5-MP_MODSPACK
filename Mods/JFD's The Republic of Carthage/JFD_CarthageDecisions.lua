-- Khazaria Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Carthage Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Carthage: Consult the Tribunal of a Hundred and Four
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TribunalOfHundredAndFour = {}
	Decisions_TribunalOfHundredAndFour.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL"
	Decisions_TribunalOfHundredAndFour.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL_DESC")
	HookDecisionCivilizationIcon(Decisions_TribunalOfHundredAndFour, "CIVILIZATION_JFD_CARTHAGE_HANNIBAL")
	Decisions_TribunalOfHundredAndFour.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]) then
			return false, false
		end
		
		local iEra = load(pPlayer, "Decisions_TribunalOfHundredAndFour")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_TribunalOfHundredAndFour", nil)
			else
				Decisions_TribunalOfHundredAndFour.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL_ENACTED_DESC")
			return false, false, true
			end
		end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then
			return true, false
		end
		pTribunalOfHundredAndFourUnit = nil
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			local iUnitClass = pUnit:GetUnitClassType()
			if (pUnit:GetUnitType() == GameInfoTypes["UNIT_JFD_SHOPHET"]) then
				pTribunalOfHundredAndFourUnit = pUnit
				break
			end
		end
		if pTribunalOfHundredAndFourUnit ~= nil then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_TribunalOfHundredAndFour.DoFunc = (
	function(pPlayer)
		pTribunalOfHundredAndFourUnit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_SHOPHET_TRIBUNAL"], true)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_TribunalOfHundredAndFour", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"], "Decisions_TribunalOfHundredAndFour", Decisions_TribunalOfHundredAndFour)
-------------------------------------------------------------------------------------------------------------------------
-- Carthage: Restore the Power of the Suffetes
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsHasPuppetOrOccupiedCity(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if city:IsPuppet() or city:IsOccupied() then
			return true
		end
	end
end

local Decisions_Suffetes = {}
	Decisions_Suffetes.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES"
	Decisions_Suffetes.Desc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_DESC"
	HookDecisionCivilizationIcon(Decisions_Suffetes, "CIVILIZATION_JFD_CARTHAGE_HANNIBAL")
	Decisions_Suffetes.Weight = nil
	Decisions_Suffetes.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]) then return false, false end
		if load(pPlayer, "Decisions_Suffetes") == true then
			Decisions_Suffetes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(800 * iMod)
		Decisions_Suffetes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if not (pPlayer:GetCapitalCity()) then return true, false end
		if not JFD_IsHasPuppetOrOccupiedCity(pPlayer:GetID()) then return true, false end

		return true, true
	end
	)
	
	Decisions_Suffetes.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_SUFFETES"], true)
		save(pPlayer, "Decisions_Suffetes", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"], "Decisions_Suffetes", Decisions_Suffetes)
--=======================================================================================================================
--=======================================================================================================================
