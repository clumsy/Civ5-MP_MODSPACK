local Decisions_TCM_Banknotes = {}
	Decisions_TCM_Banknotes.Name = "TXT_KEY_DECISIONS_TCM_BANKNOTES"
	Decisions_TCM_Banknotes.Desc = "TXT_KEY_DECISIONS_TCM_BANKNOTES_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Banknotes, "CIVILIZATION_TCM_SONG")
	Decisions_TCM_Banknotes.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_SONG"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_Banknotes") == true then
			Decisions_TCM_Banknotes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BANKNOTES_ENACTED")
			return false, false, true
		end
		local specialistNum = 0
		for city in pPlayer:Cities() do
			specialistNum = specialistNum + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ENGINEER"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_SCIENTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_MUSICIAN"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ARTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_WRITER"])
		end
		local specialistReward = specialistNum * 50
		if specialistReward > 700 then
			specialistReward = 700
		end
		local culture = math.ceil((pPlayer:GetNextPolicyCost() / 100) * 75)
		local gold = specialistReward
		Decisions_TCM_Banknotes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_BANKNOTES_DESC", culture, gold)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetJONSCulture () < culture) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfoTypes["ERA_MEDIEVAL"]) then return true, false end
		if (pPlayer:GetNumPolicyBranchesFinished() < 1) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Banknotes.DoFunc = (
	function(pPlayer)
		--costs
		local culture = math.ceil((pPlayer:GetNextPolicyCost() / 100) * 75)
		pPlayer:ChangeJONSCulture(-culture)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		--rewards
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_SONG_DECISION"], true);
		pPlayer:SetNumFreePolicies(1)
		local specialistNum = 0
		for city in pPlayer:Cities() do
			specialistNum = specialistNum + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ENGINEER"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_SCIENTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_MUSICIAN"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ARTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_WRITER"])
		end
		local specialistReward = specialistNum * 50
		if specialistReward > 700 then
			specialistReward = 700
		end
		pPlayer:ChangeGold(specialistReward)

		save(pPlayer, "Decisions_TCM_Banknotes", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_SONG"], "Decisions_TCM_Banknotes", Decisions_TCM_Banknotes)

local Decisions_TCM_StandingNavy = {}
	Decisions_TCM_StandingNavy.Name = "TXT_KEY_DECISIONS_TCM_STANDINGNAVY"
	Decisions_TCM_StandingNavy.Desc = "TXT_KEY_DECISIONS_TCM_STANDINGNAVY_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_StandingNavy, "CIVILIZATION_TCM_SONG")
	Decisions_TCM_StandingNavy.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_SONG"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_StandingNavy") == true then Decisions_TCM_StandingNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_STANDINGNAVY_ENACTED")
			return false, false, true
		end
		local gold = math.ceil(500 * iMod)
		Decisions_TCM_StandingNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_STANDINGNAVY_DESC", gold)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold () < gold) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_StandingNavy.DoFunc = (
	function(pPlayer)
		--costs
		local gold = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-gold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		--rewards
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_SONG_NAVAL_DECISION"], true);
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_HARBOR"]) then 
				local prodBonus = math.ceil(city:GetYieldRate(YieldTypes.YIELD_PRODUCTION) * 5)
				city:ChangeProduction(prodBonus)
			end
		end
		save(pPlayer, "Decisions_TCM_StandingNavy", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_SONG"], "Decisions_TCM_StandingNavy", Decisions_TCM_StandingNavy)



