-- Sámi Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Sámi Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Sámi: Establish the Sámediggi
-------------------------------------------------------------------------------------------------------------------------

local Decisions_SamiSamediggi = {}
    Decisions_SamiSamediggi.Name = "TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI"
	Decisions_SamiSamediggi.Desc = "TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI_DESC"
	HookDecisionCivilizationIcon(Decisions_SamiSamediggi, "CIVILIZATION_SAMI")
	Decisions_SamiSamediggi.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SAMI then return false, false end
		if load(pPlayer, "Decisions_SamiSamediggi") == true then
			Decisions_SamiSamediggi.Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(500 * iMod)
		
		Decisions_SamiSamediggi.Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_SCIENTIFIC_THEORY)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_SamiSamediggi.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
	
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		save(pPlayer, "Decisions_SamiSamediggi", true)
		Decisions_SamiSamediggi.Function(pPlayer:GetID())
	end
	)
	
	Decisions_SamiSamediggi.Function = (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() and load(pPlayer, "Decisions_SamiSamediggi") then
		
			local iUnit = GameInfoTypes.UNIT_SAMI_BOAZOVAZZI
			local iBuilding = GameInfoTypes.BUILDING_DECISIONS_SAMISAMEDIGGI
		
			for pCity in pPlayer:Cities() do
				if pCity:GetGarrisonedUnit() and (pCity:GetGarrisonedUnit():GetUnitType() == iUnit) then
					pCity:SetNumRealBuilding(iBuilding, 1)
				else
					if pCity:IsHasBuilding(iBuilding) then
						pCity:SetNumRealBuilding(iBuilding, 0)
					end
				end
			end
		end
	end
	)
	
	Decisions_SamiSamediggi.Monitors = {}
	Decisions_SamiSamediggi.Monitors[GameEvents.PlayerDoTurn] = Decisions_SamiSamediggi.Function
	Decisions_SamiSamediggi.Monitors[GameEvents.UnitSetXY] = Decisions_SamiSamediggi.Function
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SAMI, "Decisions_SamiSamediggi", Decisions_SamiSamediggi)

-------------------------------------------------------------------------------------------------------------------------
-- Sámi: Encourage Fishing
-------------------------------------------------------------------------------------------------------------------------

local Decisions_SamiFishing = {}
    Decisions_SamiFishing.Name = "TXT_KEY_MC_DECISIONS_SAMIFISHING"
	Decisions_SamiFishing.Desc = "TXT_KEY_MC_DECISIONS_SAMIFISHING_DESC"
	Decisions_SamiFishing.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SAMI then return end
		
		for pCity in pPlayer:Cities() do
			if pCity:IsCoastal(11) or pCity:IsCapital() then
				local sKey = "Decisions_SamiFishing" .. CompileCityID(pCity)
				local sName = pCity:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_MC_DECISIONS_SAMIFISHING_DESC"
				tTempDecisions[sKey].Data1 = pCity
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_SAMI")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_SamiFishing" .. CompileCityID(pCity)
					local sName = pCity:GetName()
					local iPop = pCity:GetPopulation()
					
					if load(pPlayer, sKey) or pCity:IsHasBuilding(GameInfoTypes.BUILDING_DECISIONS_SAMIFISHING) then
						if pCity:IsCapital() then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_ENACTED_DESC", sName) .. Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_NOTE")
						else
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_ENACTED_DESC", sName)
						end
						return false, false, true
					end
					
					if pCity:IsCapital() then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_DESC", sName) .. Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_NOTE")
					else
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_MC_DECISIONS_SAMIFISHING_DESC", sName)
					end
					
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
					if not(pCity:IsCoastal(11)) then return true, false end
					
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCity)
					local sKey = "Decisions_SamiFishing" .. CompileCityID(pCity)
					
					pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_SAMIFISHING, 1)
					
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SAMI, "Decisions_SamiFishing", Decisions_SamiFishing)
--=======================================================================================================================
--=======================================================================================================================