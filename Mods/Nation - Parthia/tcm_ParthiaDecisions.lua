local Decisions_TCM_HireGosan = {}
	Decisions_TCM_HireGosan.Name = "TXT_KEY_DECISIONS_TCM_PARTHIA_HIRE_GOSAN"
	Decisions_TCM_HireGosan.Desc = "TXT_KEY_DECISIONS_TCM_PARTHIA_HIRE_GOSAN_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_HireGosan, "CIVILIZATION_PARTHIA")
	Decisions_TCM_HireGosan.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PARTHIA"]) then return false, false end
		local era = load(pPlayer, "Decisions_TCM_HireGosan")
		local currentEra = pPlayer:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(pPlayer, "Decisions_TCM_HireGosan", nil)
			else
				Decisions_TCM_HireGosan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PARTHIA_HIRE_GOSAN_ENACTED")
				return false, false, true
			end
		end
		local iCost = math.ceil((currentEra + 1) * 200 * iMod)
		local iCulture = pPlayer:GetTotalJONSCulturePerTurn() * 5

		Decisions_TCM_HireGosan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PARTHIA_HIRE_GOSAN_DESC", iCulture, iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end

		return true, true
	end
	)
	
	Decisions_TCM_HireGosan.DoFunc = (
	function(pPlayer)

		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 200 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		local iCulture = pPlayer:GetTotalJONSCulturePerTurn() * 5
		pPlayer:ChangeJONSCulture(iCulture)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local pPlot = pPlayer:GetCapitalCity():Plot()
		pPlayer:InitUnit(GameInfoTypes["UNIT_MUSICIAN"], pPlot:GetX(), pPlot:GetY()):SetHasPromotion(GameInfoTypes["PROMOTION_TCM_GOSAN"], true)
		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local unit = pPlot:GetUnit(iVal)
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_GOSAN"]) then
				unit:SetName("Gosan")
			end
		end

		save(pPlayer, "Decisions_TCM_HireGosan", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PARTHIA"], "Decisions_TCM_HireGosan", Decisions_TCM_HireGosan)

local Decisions_TCM_RevivePersianTraditions = {}
	Decisions_TCM_RevivePersianTraditions.Name = "TXT_KEY_DECISIONS_TCM_PARTHIA_REVIVE_PERSIAN_TRADITIONS"
	Decisions_TCM_RevivePersianTraditions.Desc = "TXT_KEY_DECISIONS_TCM_PARTHIA_REVIVE_PERSIAN_TRADITIONS_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_RevivePersianTraditions, "CIVILIZATION_PARTHIA")
	Decisions_TCM_RevivePersianTraditions.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PARTHIA"]) then return false, false end

		if load(pPlayer, "Decisions_TCM_RevivePersianTraditions") == true then
			Decisions_TCM_RevivePersianTraditions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PARTHIA_REVIVE_PERSIAN_TRADITIONS_ENACTED")
			return false, false, true
		end
		
		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 150 * iMod)
		
		local iCulture = math.ceil((iCurrentEra + 1) * 100 * iMod)

		Decisions_TCM_RevivePersianTraditions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_PARTHIA_REVIVE_PERSIAN_TRADITIONS_DESC", iCost, iCulture)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetJONSCulture() < iCulture) then return true, false end
		local hasForeignCapital = false
		for city in pPlayer:Cities() do
			if city:IsOriginalCapital() and city:IsOccupied() then
				hasForeignCapital = true
			end
		end
		if hasForeignCapital == true then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_TCM_RevivePersianTraditions.DoFunc = (
	function(pPlayer)

		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 150 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		local iCulture = math.ceil((iCurrentEra + 1) * 100 * iMod)
		pPlayer:ChangeJONSCulture(-iCulture)

		pPlayer:ChangeNumResourceTotal(iMagistrate, 2)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IRANIAN_REVIVAL"], true)

		save(pPlayer, "Decisions_TCM_RevivePersianTraditions", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PARTHIA"], "Decisions_TCM_RevivePersianTraditions", Decisions_TCM_RevivePersianTraditions)
