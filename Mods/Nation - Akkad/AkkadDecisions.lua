local Decisions_LITE_SummonArmy = {}
	Decisions_LITE_SummonArmy.Name = "TXT_KEY_DECISIONS_LITE_SUMMONARMY"
	Decisions_LITE_SummonArmy.Desc = "TXT_KEY_DECISIONS_LITE_SUMMONARMY_DESC"
	HookDecisionCivilizationIcon(Decisions_LITE_SummonArmy, "CIVILIZATION_LITE_AKKAD")
	Decisions_LITE_SummonArmy.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LITE_AKKAD"]) then return false, false end
		if load(pPlayer, "Decisions_LITE_SummonArmy") == true then
			Decisions_LITE_SummonArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_SUMMONARMY_ENACTED")
			return false, false, true
		end

		local gold = math.ceil(400 * iMod)
		local faith = math.ceil(120 * iMod)
		Decisions_LITE_SummonArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_SUMMONARMY_DESC", gold, faith)

		if (pPlayer:GetGold() < gold) then return true, false end
		if (pPlayer:GetFaith() < faith) then return true, false end
		if (pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_MEDIEVAL"]) then return true, false end
		return true, true
	end
	)
       
	Decisions_LITE_SummonArmy.DoFunc = (
	function(pPlayer)
		--costs
		local gold = math.ceil(400 * iMod)
		local faith = math.ceil(120 * iMod)
		pPlayer:ChangeGold(-gold)
		pPlayer:ChangeFaith(-faith)
		--rewards
		local capital = pPlayer:GetCapitalCity()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		local unit1 = GameInfoTypes["UNIT_LITE_AKKAD_ONAGER_WAGON"]
		local unit2 = GameInfoTypes["UNIT_LITE_AKKAD_LAPUTTU"]

		pPlayer:InitUnit(unit1, capitalX, capitalY):JumpToNearestValidPlot()
		pPlayer:InitUnit(unit1, capitalX, capitalY):JumpToNearestValidPlot()
		pPlayer:InitUnit(unit2, capitalX, capitalY):JumpToNearestValidPlot()
		pPlayer:InitUnit(unit2, capitalX, capitalY):JumpToNearestValidPlot()

		save(pPlayer, "Decisions_LITE_SummonArmy", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_AKKAD"], "Decisions_LITE_SummonArmy", Decisions_LITE_SummonArmy)

local Decisions_LITE_PostalService = {}
	Decisions_LITE_PostalService.Name = "TXT_KEY_DECISIONS_LITE_POSTALSERVICE"
	Decisions_LITE_PostalService.Desc = "TXT_KEY_DECISIONS_LITE_POSTALSERVICE_DESC"
	HookDecisionCivilizationIcon(Decisions_LITE_PostalService, "CIVILIZATION_LITE_AKKAD")
	Decisions_LITE_PostalService.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LITE_AKKAD"]) then return false, false end
		if load(pPlayer, "Decisions_LITE_PostalService") == true then
			Decisions_LITE_PostalService.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_POSTALSERVICE_ENACTED")
			return false, false, true
		end

		local culture = math.ceil(150 * iMod)
		Decisions_LITE_PostalService.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_POSTALSERVICE_DESC", culture)

		if (pPlayer:GetNumCities() < 4) then return true, false end
		if (pPlayer:GetJONSCulture() < culture) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		return true, true
	end
	)
       
	Decisions_LITE_PostalService.DoFunc = (
	function(pPlayer)
		--costs
		local culture = math.ceil(150 * iMod)
		pPlayer:ChangeJONSCulture(-culture)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		--rewards
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_LITE_AKKAD_POSTALSERVICE"], true)
		
		save(pPlayer, "Decisions_LITE_PostalService", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_AKKAD"], "Decisions_LITE_PostalService", Decisions_LITE_PostalService)