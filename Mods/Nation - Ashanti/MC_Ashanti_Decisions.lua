-- Ashanti Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Ashanti Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Ashanti: Establish the Nkwansrafo
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AshantiNkwansrafo = {}
	Decisions_AshantiNkwansrafo.Name = "TXT_KEY_DECISIONS_ASHANTINKWANSRAFO"
	Decisions_AshantiNkwansrafo.Desc = "TXT_KEY_DECISIONS_ASHANTINKWANSRAFO_DESC"
	HookDecisionCivilizationIcon(Decisions_AshantiNkwansrafo, "CIVILIZATION_MC_ASHANTI")
	Decisions_AshantiNkwansrafo.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ASHANTI then return false, false end

		local iXP = 0
		for pCity in pPlayer:Cities() do
			if pPlayer:IsCapitalConnectedToCity(pCity) or pCity:IsCapital() then
				iXP = iXP + 3
			end
		end
		if iXP > 30 then iXP = 30 end

		if load(pPlayer, "Decisions_AshantiNkwansrafo") == true then
			Decisions_AshantiNkwansrafo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTINKWANSRAFO_ENACTED_DESC", iXP)
			return false, false, true
		end
		Decisions_AshantiNkwansrafo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTINKWANSRAFO_DESC", iXP)

		local pCity = pPlayer:GetCapitalCity()
		if not(pCity) then return true, false end
		if not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE)) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		return true, true
	end
	)
	
	Decisions_AshantiNkwansrafo.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_AshantiNkwansrafo", true)
	end
	)
	Decisions_AshantiNkwansrafo.Monitors = {}
	Decisions_AshantiNkwansrafo.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if not(load(pPlayer, "Decisions_AshantiNkwansrafo")) then return end

		for pCity in pPlayer:Cities() do
			if pPlayer:IsCapitalConnectedToCity(pCity) or pCity:IsCapital() then
				LuaEvents.ChangeGSP(pPlayer:GetID(), 2)
			else
				LuaEvents.ChangeGSP(pPlayer:GetID(), -5)
			end
		end
	end
	)

	Decisions_AshantiNkwansrafo.Monitors[GameEvents.CityTrained] =  (
	function(iPlayer, iCity, iUnit)
		local pPlayer = Players[iPlayer]
		if not(load(pPlayer, "Decisions_AshantiNkwansrafo")) then return end

		local pCity = pPlayer:GetCityByID(iCity)
		if not(pCity:IsCapital()) then return end

		pUnit = pPlayer:GetUnitByID(iUnit)
		local iXP = 0
		for pCity in pPlayer:Cities() do
			if pPlayer:IsCapitalConnectedToCity(pCity) or pCity:IsCapital() then
				iXP = iXP + 3
			end
		end
		if iXP > 30 then iXP = 30 end

		pUnit:ChangeExperience(iXP)
	end
	)
	Decisions_AshantiNkwansrafo.Monitors[LuaEvents.MC_GoldenStoolUnitPurchased] = Decisions_AshantiNkwansrafo.Monitors[GameEvents.CityTrained]

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ASHANTI, "Decisions_AshantiNkwansrafo", Decisions_AshantiNkwansrafo)
-------------------------------------------------------------------------------------------------------------------------
-- Ashanti: Convene the Asantemanhyiamu
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AshantiAsantemanhyiamu = {}
	Decisions_AshantiAsantemanhyiamu.Name = "TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU"
	Decisions_AshantiAsantemanhyiamu.Desc = "TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU_DESC"
	HookDecisionCivilizationIcon(Decisions_AshantiAsantemanhyiamu, "CIVILIZATION_MC_ASHANTI")
	Decisions_AshantiAsantemanhyiamu.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ASHANTI then return false, false end
		if load(pPlayer, "Decisions_AshantAgyina") then return false, false end
		if load(pPlayer, "Decisions_AshantiAsantemanhyiamu") then
			Decisions_AshantiAsantemanhyiamu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU_ENACTED_DESC")
			return false, false, true
		end
		Decisions_AshantiAsantemanhyiamu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU_DESC")
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		return true, true		
	end
	)
	
	Decisions_AshantiAsantemanhyiamu.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_AshantiAsantemanhyiamu", true)
	end
	)
	Decisions_AshantiAsantemanhyiamu.Monitors = {}
	Decisions_AshantiAsantemanhyiamu.Monitors[LuaEvents.PlayerEnteredNewEra] = (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_AshantiAsantemanhyiamu") then
			save(pPlayer, "Decisions_AshantiAsantemanhyiamu", false)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ASHANTI, "Decisions_AshantiAsantemanhyiamu", Decisions_AshantiAsantemanhyiamu)
-------------------------------------------------------------------------------------------------------------------------
-- Ashanti: Convene the Agyina 
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AshantAgyina = {}
	Decisions_AshantAgyina.Name = "TXT_KEY_DECISIONS_ASHANTAGYINA"
	Decisions_AshantAgyina.Desc = "TXT_KEY_DECISIONS_ASHANTAGYINA_DESC"
	HookDecisionCivilizationIcon(Decisions_AshantAgyina, "CIVILIZATION_MC_ASHANTI")
	Decisions_AshantAgyina.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ASHANTI then return false, false end
		if load(pPlayer, "Decisions_AshantiAsantemanhyiamu") then return false, false end
		if load(pPlayer, "Decisions_AshantAgyina") then
			Decisions_AshantAgyina.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTAGYINA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_AshantAgyina.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASHANTAGYINA_DESC")
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		return true, true	
	end
	)
	
	Decisions_AshantAgyina.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_AshantAgyina", true)
	end
	)
	Decisions_AshantAgyina.Monitors = {}
	Decisions_AshantAgyina.Monitors[LuaEvents.PlayerEnteredNewEra] = (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_AshantAgyina") then
			save(pPlayer, "Decisions_AshantAgyina", false)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ASHANTI, "Decisions_AshantAgyina", Decisions_AshantAgyina)
--=======================================================================================================================
--=======================================================================================================================