-- Civ Specific Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Civ Specific Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Siam: Create the Thai Alphabet
-------------------------------------------------------------------------------------------------------------------------

local Decisions_ThaiAlphabet = {}
	Decisions_ThaiAlphabet.Name = "TXT_KEY_DECISIONS_THAIALPHABET"
	Decisions_ThaiAlphabet.Desc = "TXT_KEY_DECISIONS_THAIALPHABET_DESC"
	HookDecisionCivilizationIcon(Decisions_ThaiAlphabet, "CIVILIZATION_SIAM")
	Decisions_ThaiAlphabet.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SIAM) then
			return false, false
		end
		if load(pPlayer, "Decisions_ThaiAlphabet") == true then
			Decisions_ThaiAlphabet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THAIALPHABET_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(250 * iMod)
		Decisions_ThaiAlphabet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THAIALPHABET_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		local bWats = true
		local bCities = false
		for pCity in pPlayer:Cities() do
			bCities = true
			if not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_WAT)) then
				bWats = false
			end
		end
		
		if bWats and bCities and (pPlayer:GetJONSCulture() >= iCost) then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_ThaiAlphabet.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250) * iMod
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_THAIALPHABET, 1)
		save(pPlayer, "Decisions_ThaiAlphabet", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SIAM, "Decisions_ThaiAlphabet", Decisions_ThaiAlphabet)

--------------------------------------------------------------------------------------------------------------------------
-- Siam: Send out Embassies
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SiamEmbassies = {}
	Decisions_SiamEmbassies.Name = "TXT_KEY_DECISIONS_SIAMEMBASSIES"
	Decisions_SiamEmbassies.Desc = "TXT_KEY_DECISIONS_SIAMEMBASSIES_DESC"
	Decisions_SiamEmbassies.Data1 = {}
	Decisions_SiamEmbassies.Data2 = {10, 10, 20, 20, 20, 30, 30, 30, 40, 40}
	HookDecisionCivilizationIcon(Decisions_SiamEmbassies, "CIVILIZATION_SIAM")
	Decisions_SiamEmbassies.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SIAM) then
			return false, false
		end
		if load(pPlayer, "Decisions_SiamEmbassies") == true then
			Decisions_SiamEmbassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SIAMEMBASSIES_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(1000 * iMod)
		Decisions_SiamEmbassies.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SIAMEMBASSIES_DESC", iCost)
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false)) > 0 then return true, false end
		
		Decisions_SiamEmbassies.Data1 = {}
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam())) then
				table.insert(Decisions_SiamEmbassies.Data1, iCS)
			end
		end
		if #Decisions_SiamEmbassies.Data1 < 4 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_SiamEmbassies.DoFunc = (
	function(pPlayer, tCSSiam, tChance)
		local iCost = math.ceil(1000 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iPlayer = pPlayer:GetID()
		for iKey, iCS in pairs(tCSSiam) do
			Players[iCS]:ChangeMinorCivFriendshipWithMajor(iPlayer, tChance[GetRandom(1, #tChance)])
		end
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_SIAMEMBASSIES, true)
		save(pPlayer, "Decisions_SiamEmbassies", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SIAM, "Decisions_SiamEmbassies", Decisions_SiamEmbassies)

--------------------------------------------------------------------------------------------------------------------------
-- Venice: Rescue the Relics of St Mark
--------------------------------------------------------------------------------------------------------------------------

local Decisions_VeniceStMark = {}
	Decisions_VeniceStMark.Name = "TXT_KEY_DECISIONS_STMARK"
	Decisions_VeniceStMark.Desc = "TXT_KEY_DECISIONS_STMARK_DESC"
	HookDecisionCivilizationIcon(Decisions_VeniceStMark, "CIVILIZATION_VENICE")
	Decisions_VeniceStMark.Pedia = "TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC"
	Decisions_VeniceStMark.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_VENICE) then
			return false, false
		end
		if load(pPlayer, "Decisions_VeniceStMark") == true then
			Decisions_VeniceStMark.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_STMARK_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(600 * iMod)
		Decisions_VeniceStMark.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_STMARK_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end		
		
		local tCSVenice = {}
		iCSVenice = nil
		
		local tTradeRoutes = pPlayer:GetTradeRoutes()
        for i,v in ipairs(tTradeRoutes) do
			if v.FromID ~= v.ToID then
			    local pToCiv = Players[v.ToID]
                if pToCiv:IsMinorCiv() then
					table.insert(tCSVenice, v.ToID)
				end
			end
		end
		
		iCSVenice = tCSVenice[GetRandom(1, #tCSVenice)]
		
		if (iCSVenice ~= nil) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_VeniceStMark.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(600) * iMod
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_SAN_MARCO_BASILICA, 1)
		Players[iCSVenice]:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -30)
		save(pPlayer, "Decisions_VeniceStMark", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_VENICE, "Decisions_VeniceStMark", Decisions_VeniceStMark)

--------------------------------------------------------------------------------------------------------------------------
-- Venice: Found the Arsenale
--------------------------------------------------------------------------------------------------------------------------

local Decisions_VenetianArsenale = {}
	Decisions_VenetianArsenale.Name = "TXT_KEY_DECISIONS_VENETIANARSENALE"
	Decisions_VenetianArsenale.Desc = "TXT_KEY_DECISIONS_VENETIANARSENALE_DESC"
	HookDecisionCivilizationIcon(Decisions_VenetianArsenale, "CIVILIZATION_VENICE")
	Decisions_VenetianArsenale.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_VENICE) then
			return false, false
		end
		if load(pPlayer, "Decisions_VenetianArsenale") == true then
		Decisions_VenetianArsenale.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VENETIANARSENALE_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(800 * iMod)
		Decisions_VenetianArsenale.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VENETIANARSENALE_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetNumInternationalTradeRoutesUsed() < pPlayer:GetNumInternationalTradeRoutesAvailable()) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_COMPASS)) then return true, false end
		
		local pTargetCity = nil
		for pCity in pPlayer:Cities() do 
			if pCity:IsCoastal() then  pTargetCity = pCity break end
		end
		if pTargetCity == nil then return true, false end  
		
		return true, true
	end
	)
	
	Decisions_VenetianArsenale.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-iCost)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_VENETIANARSENALE, true)
		
		local pTargetCity = nil
		for pCity in pPlayer:Cities() do 
			if pCity:IsCoastal() then  pTargetCity = pCity break end
		end		
		
		InitUnitFromCity(pTargetCity, GameInfoTypes.UNIT_VENETIAN_GALLEASS, 3)
		save(pPlayer, "Decisions_VenetianArsenale", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_VENICE, "Decisions_VenetianArsenale", Decisions_VenetianArsenale)

--------------------------------------------------------------------------------------------------------------------------
-- Poland: Hold the Great Sjem
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PolandSejm = {}
	Decisions_PolandSejm.Name = "TXT_KEY_DECISIONS_POLANDSEJM"
	Decisions_PolandSejm.Desc = "TXT_KEY_DECISIONS_POLANDSEJM_DESC"
	HookDecisionCivilizationIcon(Decisions_PolandSejm, "CIVILIZATION_POLAND")
	Decisions_PolandSejm.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_POLAND then return false, false end
		if load(pPlayer, "Decisions_PolandSejm") == true then
			Decisions_PolandSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDSEJM_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(450*iMod)
		Decisions_PolandSejm.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDSEJM_DESC", iCost)
		
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if pPlayer:GetCapitalCity() == nil then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:IsGoldenAge() then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PolandSejm.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(450*iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_GREATSEJM, 1)
		save(pPlayer, "Decisions_PolandSejm", true)
	end
	)

	Decisions_PolandSejm.Monitors = {}
	Decisions_PolandSejm.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_POLAND) then return end
		if load(pPlayer, "Decisions_PolandSejm") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_GREATSEJM, 1)
		else
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_GREATSEJM, 0)
		end
	end
	)
	
	Decisions_PolandSejm.Monitors[GameEvents.PlayerAdoptPolicy] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_PolandSejm") == true then
			local iReward = math.ceil(pPlayer:GetNextPolicyCost() * 0.4)
			pPlayer:ChangeGold(iReward)
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_POLAND, "Decisions_PolandSejm", Decisions_PolandSejm)

--------------------------------------------------------------------------------------------------------------------------
-- Poland: Establish the Main Crown School
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PolandUniversity = {}
	Decisions_PolandUniversity.Name = "TXT_KEY_DECISIONS_POLANDUNIVERSITY"
	Decisions_PolandUniversity.Desc = "TXT_KEY_DECISIONS_POLANDUNIVERSITY_DESC"
	Decisions_PolandUniversity.Pedia = "TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY"
	HookDecisionCivilizationIcon(Decisions_PolandUniversity, "CIVILIZATION_POLAND")
	Decisions_PolandUniversity.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_POLAND then return false, false end
		if load(pPlayer, "Decisions_PolandUniversity") == true then
			Decisions_PolandUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDUNIVERSITY_ENACTED_DESC")
			return false, false, true
		end
		
		local pCity = pPlayer:GetCapitalCity()
		if not(pCity) then return false, false end
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_UNIVERSITY)) * 1.5)
		Decisions_PolandUniversity.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLANDUNIVERSITY_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_MEDIEVAL) then return true, false end
		
		return true, true		
	end
	)
	
	Decisions_PolandUniversity.DoFunc = (
	function(pPlayer)
		local pCity = pPlayer:GetCapitalCity()
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_UNIVERSITY)) * 1.5)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_POLANDUNIVERSITY, 1)
		save(pPlayer, "Decisions_PolandUniversity", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_POLAND, "Decisions_PolandUniversity", Decisions_PolandUniversity)

--------------------------------------------------------------------------------------------------------------------------
-- Inca: Hire Quipucamayocs
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IncanQuipucamayocs = {}
    Decisions_IncanQuipucamayocs.Name = "TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS"
	Decisions_IncanQuipucamayocs.Desc = "TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS_DESC"
	HookDecisionCivilizationIcon(Decisions_IncanQuipucamayocs, "CIVILIZATION_INCA")
	Decisions_IncanQuipucamayocs.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INCA then return false, false end
		local iEra = load(pPlayer, "Decisions_IncanQuipucamayocs")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_IncanQuipucamayocs", nil)
			else
				Decisions_IncanQuipucamayocs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iReward = math.ceil(iMod * 50 * (pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_TERRACE_FARM) + pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_FARM)))
		Decisions_IncanQuipucamayocs.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS_DESC", iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MATHEMATICS)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_IncanQuipucamayocs.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
				
		local iReward = math.ceil(iMod * 50 * (pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_TERRACE_FARM) + pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_FARM)))
		pPlayer:ChangeGold(iReward)
		
		save(pPlayer, "Decisions_IncanQuipucamayocs", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INCA, "Decisions_IncanQuipucamayocs", Decisions_IncanQuipucamayocs)

--------------------------------------------------------------------------------------------------------------------------
-- Inca: Establish the Chasqui System
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IncanChasquis = {}
	Decisions_IncanChasquis.Name = "TXT_KEY_DECISIONS_INCANCHASQUIS"
	Decisions_IncanChasquis.Desc = "TXT_KEY_DECISIONS_INCANCHASQUIS_DESC"
	Decisions_IncanChasquis.Data1 = nil
	HookDecisionCivilizationIcon(Decisions_IncanChasquis, "CIVILIZATION_INCA")
	Decisions_IncanChasquis.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INCA) then
			return false, false
		end
		if load(pPlayer, "Decisions_IncanChasquis") == true then
			Decisions_IncanChasquis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INCANCHASQUIS_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_IncanChasquis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INCANCHASQUIS_DESC")
		
		Decisions_IncanChasquis.Data1 = nil
		local bConnected = true
		local bCities = false
		for pCity in pPlayer:Cities() do
			if pCity:IsCapital() then
				--Worker Check
				local pPlot = pCity:Plot()
				local iNumUnits = pPlot:GetNumUnits()
				for iVal = 0,(iNumUnits - 1) do
					local pUnit = pPlot:GetUnit(iVal)
					if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_WORKER) then
						Decisions_IncanChasquis.Data1 = pUnit
						break
					end
				end			
			else
				--City Connection Check
				bCities = true
				if not(pPlayer:IsCapitalConnectedToCity(pCity)) then
					bConnected = false
				end
			end
		end
		
		if not(Decisions_IncanChasquis.Data1) then return true, false end
		if not(bConnected) then return true, false end
		if not(bCities) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_IncanChasquis.DoFunc = (
	function(pPlayer, pUnit)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pUnit:Kill()
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_INCANCHASQUIS, true)		
		
		save(pPlayer, "Decisions_IncanChasquis", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INCA, "Decisions_IncanChasquis", Decisions_IncanChasquis)

--------------------------------------------------------------------------------------------------------------------------
-- Spain: Fund Columbus's Expedition
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SpainColumbus = {}
    Decisions_SpainColumbus.ID = "Decisions_SpainColumbus"
	Decisions_SpainColumbus.Name = "TXT_KEY_DECISIONS_SPAINCOLUMBUS"
	Decisions_SpainColumbus.Desc = "TXT_KEY_DECISIONS_SPAINCOLUMBUS_DESC"
	HookDecisionCivilizationIcon(Decisions_SpainColumbus, "CIVILIZATION_SPAIN")
	Decisions_SpainColumbus.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SPAIN) then
			return false, false
		end
		if load(pPlayer, "Decisions_SpainColumbus") == true then
		Decisions_SpainColumbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPAINCOLUMBUS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_SpainColumbus.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPAINCOLUMBUS_DESC", iCost)
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ASTRONOMY)) and (pPlayer:GetGold() >= iCost) and (pPlayer:GetCapitalCity() ~= nil) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_SpainColumbus.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		local tCaravels = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_CARAVEL, 2)
		tCaravels[1]:SetName("Pinta")
		tCaravels[2]:SetName("Niña")
		local tAdmiral = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_ADMIRAL, 1)
		tAdmiral[1]:SetName("Cristóbal Colón")
		pPlayer:ChangeGold(-iCost)
		save(pPlayer, "Decisions_SpainColumbus", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SPAIN, "Decisions_SpainColumbus", Decisions_SpainColumbus)

--------------------------------------------------------------------------------------------------------------------------
-- Spain: The Spanish Inquisition
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SpanishInquisition = {}
	Decisions_SpanishInquisition.Name = "TXT_KEY_DECISIONS_SPANISHINQUISITION"
	Decisions_SpanishInquisition.Desc = "TXT_KEY_DECISIONS_SPANISHINQUISITION_DESC"
	HookDecisionCivilizationIcon(Decisions_SpanishInquisition, "CIVILIZATION_SPAIN")
	Decisions_SpanishInquisition.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SPAIN) then
			return false, false
		end
		if load(pPlayer, "Decisions_SpanishInquisition") == true then
		Decisions_SpanishInquisition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPANISHINQUISITION_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(pPlayer:GetTotalPopulation() * 5 * iMod)
		local iReward = math.ceil(pPlayer:GetTotalPopulation() * 10 * iMod)
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		Decisions_SpanishInquisition.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SPANISHINQUISITION_DESC", iCost, iReward)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end		
		
		if (pPlayer:GetGold() >= iCost) and (iReligion ~= nil) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_SpanishInquisition.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(pPlayer:GetTotalPopulation() * 5 * iMod)
		local iReward = math.ceil(pPlayer:GetTotalPopulation() * 10 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeFaith(iReward)
		
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		for pCity in pPlayer:Cities() do
		for row in GameInfo.Religions() do
				local iLoopReligion = row.ID
				if (iLoopReligion ~= GameInfo.Religions.RELIGION_PANTHEON.ID and iLoopReligion ~= iReligion) then
					pCity:ConvertPercentFollowers(-1, iLoopReligion, 100)
				end
			end
		end
		
		save(pPlayer, "Decisions_SpanishInquisition", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SPAIN, "Decisions_SpanishInquisition", Decisions_SpanishInquisition)

--------------------------------------------------------------------------------------------------------------------------
-- Netherlands: Found the Amsterdamsche Wisselbank
--------------------------------------------------------------------------------------------------------------------------

local Decisions_DutchWisselbank = {}
	Decisions_DutchWisselbank.Name = "TXT_KEY_DECISIONS_DUTCHWISSELBANK"
	Decisions_DutchWisselbank.Desc = "TXT_KEY_DECISIONS_DUTCHWISSELBANK_DESC"
	HookDecisionCivilizationIcon(Decisions_DutchWisselbank, "CIVILIZATION_NETHERLANDS")
	Decisions_DutchWisselbank.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NETHERLANDS) then
			return false, false
		end
		if load(pPlayer, "Decisions_DutchWisselbank") == true then
			Decisions_DutchWisselbank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUTCHWISSELBANK_ENACTED_DESC")
			return false, false, true
		end
		
		local iCostC = math.ceil(200 * iMod)
		local iCostG = math.ceil(300 * iMod)
		Decisions_DutchWisselbank.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUTCHWISSELBANK_DESC", iCostC, iCostG)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_INDUSTRIAL) and (pPlayer:GetJONSCulture() >= iCostC) and (pPlayer:GetGold() >= iCostG) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_DutchWisselbank.DoFunc = (
	function(pPlayer)
		local iCostC = math.ceil(200 * iMod)
		local iCostG = math.ceil(300 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeJONSCulture(-iCostC)
		pPlayer:ChangeGold(-iCostG)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_DUTCHWISSELBANK, 1)
		save(pPlayer, "Decisions_DutchWisselbank", true)
	end
	)

	Decisions_DutchWisselbank.Monitors = {}
	Decisions_DutchWisselbank.Monitors[GameEvents.PlayerDoTurn] = (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_DutchWisselbank") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_DUTCHWISSELBANK, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_NETHERLANDS, "Decisions_DutchWisselbank", Decisions_DutchWisselbank)

--------------------------------------------------------------------------------------------------------------------------
-- Netherlands: Modernise the Merchant Navy
--------------------------------------------------------------------------------------------------------------------------

local Decisions_DutchNavy = {}
	Decisions_DutchNavy.Name = "TXT_KEY_DECISIONS_DUTCHNAVY"
	Decisions_DutchNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUTCHNAVY_DESC")
	HookDecisionCivilizationIcon(Decisions_DutchNavy, "CIVILIZATION_NETHERLANDS")
	Decisions_DutchNavy.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NETHERLANDS) then
			return false, false
		end
		if load(pPlayer, "Decisions_DutchNavy") == true then
			Decisions_DutchNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DUTCHNAVY_ENACTED_DESC")
			return false, false, true
		end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra ~= GameInfoTypes.ERA_RENAISSANCE) and (iEra ~= GameInfoTypes.ERA_INDUSTRIAL) then
			return true, false
		end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then
			return true, false
		end
		pDutchNavyUnit = nil
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			local iUnitClass = pUnit:GetUnitClassType()
			if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_MERCHANT) or (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_GREAT_ADMIRAL) then
				pDutchNavyUnit = pUnit
				break
			end
		end
		if pDutchNavyUnit ~= nil then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_DutchNavy.DoFunc = (
	function(pPlayer)
		pDutchNavyUnit:Kill()
		local pCity = pPlayer:GetCapitalCity()
		local pPlot = pCity:Plot()
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:InitUnit(GameInfoTypes.UNIT_CARGO_SHIP, pPlot:GetX(), pPlot:GetY())
		pPlayer:InitUnit(GameInfoTypes.UNIT_CARGO_SHIP, pPlot:GetX(), pPlot:GetY())
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_DUTCHNAVY, 1)
		save(pPlayer, "Decisions_DutchNavy", true)
	end
	)

	Decisions_DutchNavy.Monitors = {}
	Decisions_DutchNavy.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_NETHERLANDS) then
			return
		end
		if load(pPlayer, "Decisions_DutchNavy") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_DUTCHNAVY, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_NETHERLANDS, "Decisions_DutchNavy", Decisions_DutchNavy)

--------------------------------------------------------------------------------------------------------------------------
-- Germany: Consolidate the German Confederation
--------------------------------------------------------------------------------------------------------------------------

local Decisions_GermanConfederation = {}
	Decisions_GermanConfederation.Name = "TXT_KEY_DECISIONS_GERMANCONFEDERATION"
	Decisions_GermanConfederation.Desc = "TXT_KEY_DECISIONS_GERMANCONFEDERATION_DESC"
	Decisions_GermanConfederation.Pedia = "TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION"
	HookDecisionCivilizationIcon(Decisions_GermanConfederation, "CIVILIZATION_GERMANY")
	Decisions_GermanConfederation.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_GERMANY) then
			return false, false
		end
		if load(pPlayer, "Decisions_GermanConfederation") == true then
		Decisions_GermanConfederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GERMANCONFEDERATION_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_GermanConfederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GERMANCONFEDERATION_DESC")
		
		local iNumAllies = 0
		for iLPlayer, pLPlayer in pairs(Players) do
			if (pLPlayer:IsAlive() and pLPlayer:IsMinorCiv() and pLPlayer:GetAlly() == pPlayer:GetID()) then
				iNumAllies = iNumAllies + 1
			end
		end
		if iNumAllies < 4 then
			return true, false
		end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra ~= GameInfoTypes.ERA_MODERN) and (iEra ~= GameInfoTypes.ERA_INDUSTRIAL) then
			return true, false
		end

		return true, true
	end
	)
	
	Decisions_GermanConfederation.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_GERMANCONFEDERATION, 1)
		save(pPlayer, "Decisions_GermanConfederation", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_GERMANY, "Decisions_GermanConfederation", Decisions_GermanConfederation)

--------------------------------------------------------------------------------------------------------------------------
-- Germany: Thurn und Taxis
--------------------------------------------------------------------------------------------------------------------------

local Decisions_GermanThurnUndTaxis = {}
	Decisions_GermanThurnUndTaxis.Name = "TXT_KEY_DECISIONS_GERMANTHURNUNDTAXIS"
	Decisions_GermanThurnUndTaxis.Desc = "TXT_KEY_DECISIONS_GERMANTHURNUNDTAXIS_DESC"
	HookDecisionCivilizationIcon(Decisions_GermanThurnUndTaxis, "CIVILIZATION_GERMANY")
	Decisions_GermanThurnUndTaxis.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_GERMANY) then
			return false, false
		end
		if load(pPlayer, "Decisions_GermanThurnUndTaxis") == true then
		Decisions_GermanThurnUndTaxis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GERMANTHURNUNDTAXIS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_GermanThurnUndTaxis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GERMANTHURNUNDTAXIS_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_INDUSTRIAL) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_GermanThurnUndTaxis.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		save(pPlayer, "Decisions_GermanThurnUndTaxis", true)
		Decisions_GermanThurnUndTaxis.Monitors[GameEvents.PlayerDoTurn](pPlayer:GetID())
	end
	)

	Decisions_GermanThurnUndTaxis.Monitors = {}
	Decisions_GermanThurnUndTaxis.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_GermanThurnUndTaxis") == true then
			pCity = pPlayer:GetCapitalCity()
			local iCity = pCity:GetID()
			local sKey = (iCity .. "Decisions_GermanThurnUndTaxis")
			local iDelta = (pPlayer:GetNumInternationalTradeRoutesUsed() * 2)
			local iOldDelta = load( pPlayer, sKey)
			save (pPlayer, sKey, iDelta)
			
			if iOldDelta == nil then
				pCity:ChangeBaseYieldRateFromBuildings(GameInfo.Yields.YIELD_SCIENCE.ID, iDelta)
			else
				pCity:ChangeBaseYieldRateFromBuildings(GameInfo.Yields.YIELD_SCIENCE.ID, iDelta - iOldDelta)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_GERMANY, "Decisions_GermanThurnUndTaxis", Decisions_GermanThurnUndTaxis)

--------------------------------------------------------------------------------------------------------------------------
-- Rome: Introduce Concrete
--------------------------------------------------------------------------------------------------------------------------

local Decisions_RomanConcrete = {}
	Decisions_RomanConcrete.Name = "TXT_KEY_DECISIONS_ROMANCONCRETE"
	Decisions_RomanConcrete.Desc = "TXT_KEY_DECISIONS_ROMANCONCRETE_DESC"
	HookDecisionCivilizationIcon(Decisions_RomanConcrete, "CIVILIZATION_ROME")
	Decisions_RomanConcrete.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ROME) then
			return false, false
		end
		if load(pPlayer, "Decisions_RomanConcrete") == true then
			Decisions_RomanConcrete.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ROMANCONCRETE_ENACTED_DESC")
			return false, false, true
		end
		if not(pPlayer:GetCapitalCity()) then return true, false end
		
		local iTech = GameInfoTypes.TECH_ENGINEERING
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech) * 0.5)
		Decisions_RomanConcrete.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ROMANCONCRETE_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCurrentResearch() == -1) then return true, false end
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(iTech)) and (pPlayer:GetResearchProgress(pPlayer:GetCurrentResearch()) >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_RomanConcrete.DoFunc = (
	function(pPlayer)
		local iTech = GameInfoTypes.TECH_ENGINEERING
		local iCost = math.ceil(pPlayer:GetResearchCost(iTech) * 0.5)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		pTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), -iCost, pPlayer:GetID())
		
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ROMANCONCRETE, 1)
		save(pPlayer, "Decisions_RomanConcrete", true)
	end
	)

	Decisions_RomanConcrete.Monitors = {}
	Decisions_RomanConcrete.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		
		if not(pPlayer:GetCapitalCity()) then return end
		
		if load(pPlayer, "Decisions_RomanConcrete") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ROMANCONCRETE, 1)
		else
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ROMANCONCRETE, 0)
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ROME, "Decisions_RomanConcrete", Decisions_RomanConcrete)

--------------------------------------------------------------------------------------------------------------------------
-- Rome: Panem et Circenses
--------------------------------------------------------------------------------------------------------------------------

local Decisions_RomanPanem = {}
	Decisions_RomanPanem.Name = "TXT_KEY_DECISIONS_ROMANPANEM"
	Decisions_RomanPanem.Desc = "TXT_KEY_DECISIONS_ROMANPANEM_DESC"
	HookDecisionCivilizationIcon(Decisions_RomanPanem, "CIVILIZATION_ROME")
	Decisions_RomanPanem.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ROME) then
			return false, false
		end
		
		local iEra = load(pPlayer, "Decisions_RomanPanem")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_RomanPanem", nil)
			else
				Decisions_RomanPanem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ROMANPANEM_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iCost = math.ceil((iCurrentEra + 1) * 100 * iMod)
		Decisions_RomanPanem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ROMANPANEM_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		if (pPlayer:GetGold() >= iCost) and (pPlayer:GetNumCities() > 0) and (iCurrentEra > GameInfoTypes.ERA_ANCIENT)  then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_RomanPanem.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local iCost = math.ceil((pPlayer:GetCurrentEra() + 1) * 100 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		local iTurns = math.ceil(20 * iGAMod)
		for pCity in pPlayer:Cities() do
			pCity:ChangeWeLoveTheKingDayCounter(iTurns)
		end
		
		save(pPlayer, "Decisions_RomanPanem", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ROME, "Decisions_RomanPanem", Decisions_RomanPanem)

--------------------------------------------------------------------------------------------------------------------------
-- Polynesia: Kānāwai Māmalahoe
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PolynesiaPaddle = {}
	Decisions_PolynesiaPaddle.Name = "TXT_KEY_DECISIONS_POLYNESIAPADDLE"
	Decisions_PolynesiaPaddle.Desc = "TXT_KEY_DECISIONS_POLYNESIAPADDLE_DESC"
	HookDecisionCivilizationIcon(Decisions_PolynesiaPaddle, "CIVILIZATION_POLYNESIA")
	Decisions_PolynesiaPaddle.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_POLYNESIA) then
			return false, false
		end
		if load(pPlayer, "Decisions_PolynesiaPaddle") == true then
			Decisions_PolynesiaPaddle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIAPADDLE_ENACTED_DESC")
			return false, false, true
		end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				iNumUnits = iNumUnits + 1
			end
		end
		local iCost = math.ceil(100 * iMod)
		local iTurns = math.ceil(10 * iGAMod)
		if iNumUnits < 5 then
			Decisions_PolynesiaPaddle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIAPADDLE_DESC", iCost, iTurns)
			return true, false
		end
		iCost = math.ceil(20 * iNumUnits * iMod)
		iTurns = math.ceil(iNumUnits * 2 * iGAMod)
		Decisions_PolynesiaPaddle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIAPADDLE_DESC", iCost, iTurns)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_PolynesiaPaddle.DoFunc = (
	function(pPlayer)
		local iNumUnits = pPlayer:GetNumMilitaryUnits()
		local iCost = math.ceil(20 * iNumUnits * iMod)
		local iTurns = math.ceil(iNumUnits * 2 * iGAMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGoldenAgeTurns(iTurns)
		save(pPlayer, "Decisions_PolynesiaPaddle", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_POLYNESIA, "Decisions_PolynesiaPaddle", Decisions_PolynesiaPaddle)

--------------------------------------------------------------------------------------------------------------------------
-- Polynesia: Revive the Runanga
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PolynesiaRunanga = {}
	Decisions_PolynesiaRunanga.Name = "TXT_KEY_DECISIONS_POLYNESIARUNANGA"
	Decisions_PolynesiaRunanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIARUNANGA_DESC")
	HookDecisionCivilizationIcon(Decisions_PolynesiaRunanga, "CIVILIZATION_POLYNESIA")
	Decisions_PolynesiaRunanga.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_POLYNESIA) then
			return false, false
		end
		if load(pPlayer, "Decisions_PolynesiaRunanga") == true then
			Decisions_PolynesiaRunanga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_POLYNESIARUNANGA_ENACTED_DESC")
			return false, false, true
		end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_MODERN or iEra == GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then return true, false end
		pMaoriUnit = nil
		local iPromotion = GameInfoTypes.PROMOTION_HAKA_WAR_DANCE
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			if pUnit:IsHasPromotion(iPromotion) then
				pMaoriUnit = pUnit
				break
			end
		end
		
		if pMaoriUnit ~= nil then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_PolynesiaRunanga.DoFunc = (
	function(pPlayer)
		pMaoriUnit:Kill()
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeNumFreePolicies(1)
		save(pPlayer, "Decisions_PolynesiaRunanga", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_POLYNESIA, "Decisions_PolynesiaRunanga", Decisions_PolynesiaRunanga)

--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EgyptianNome = {}
	Decisions_EgyptianNome.Name = "TXT_KEY_DECISIONS_EGYPTIANNOME"
	Decisions_EgyptianNome.Desc = "TXT_KEY_DECISIONS_EGYPTIANNOME_DESC"
	HookDecisionCivilizationIcon(Decisions_EgyptianNome, "CIVILIZATION_EGYPT")
	Decisions_EgyptianNome.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		if load(pPlayer, "Decisions_EgyptianNome") == true then
			Decisions_EgyptianNome.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANNOME_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(50 * iMod)
		Decisions_EgyptianNome.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANNOME_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EgyptianNome.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iCost = math.ceil(50 * iMod)
		pPlayer:ChangeFaith(-iCost)
		pPlayer:ChangeGold(-iCost)
		save(pPlayer, "Decisions_EgyptianNome", true)
	end
	)

	Decisions_EgyptianNome.Monitors = {}
	Decisions_EgyptianNome.Monitors[LuaEvents.DecisionEnacted] =  (
	function(iPlayer, sDecision)
		local pPlayer = Players[iPlayer]
		print(sDecision)
		
		if sDecision == "Decisions_EgyptianNomarch" or sDecision == "Decisions_EgyptianPharaoh" then return end
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		
		local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * iMod * 75)
		
		local sEmpowered = load(pPlayer, "Decisions_EgyptianEmpower")
		if sEmpowered == "Decisions_EgyptianPharaoh" then
			pPlayer:ChangeFaith(iReward)
		elseif sEmpowered == "Decisions_EgyptianNomarch" then
			pPlayer:ChangeGold(iReward)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_EGYPT, "Decisions_EgyptianNome", Decisions_EgyptianNome)

--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes (Empower the Pharaoh)
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EgyptianPharaoh = {}
	Decisions_EgyptianPharaoh.Name = "TXT_KEY_DECISIONS_EGYPTIANPHARAOH"
	Decisions_EgyptianPharaoh.Desc = "TXT_KEY_DECISIONS_EGYPTIANPHARAOH_DESC"
	HookDecisionCivilizationIcon(Decisions_EgyptianPharaoh, "CIVILIZATION_EGYPT")
	Decisions_EgyptianPharaoh.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		if load(pPlayer, "Decisions_EgyptianNome") ~= true then return false, false end
		
		local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * iMod * 75)
		
		if load(pPlayer, "Decisions_EgyptianEmpower") == "Decisions_EgyptianPharaoh" then
			Decisions_EgyptianPharaoh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANPHARAOH_ENACTED_DESC", pPlayer:GetName(), iReward)
			return false, false, true
		end
		Decisions_EgyptianPharaoh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANPHARAOH_DESC", pPlayer:GetName(), iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EgyptianPharaoh.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_EgyptianEmpower", "Decisions_EgyptianPharaoh")
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_EGYPT, "Decisions_EgyptianPharaoh", Decisions_EgyptianPharaoh)

--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Establish the Nomes (Empower the Nomarchs)
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EgyptianNomarch = {}
	Decisions_EgyptianNomarch.Name = "TXT_KEY_DECISIONS_EGYPTIANNOMARCH"
	Decisions_EgyptianNomarch.Desc = "TXT_KEY_DECISIONS_EGYPTIANNOMARCH_DESC"
	Decisions_EgyptianNomarch.Weight = 0
	HookDecisionCivilizationIcon(Decisions_EgyptianNomarch, "CIVILIZATION_EGYPT")
	Decisions_EgyptianNomarch.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		if load(pPlayer, "Decisions_EgyptianNome") ~= true then return false, false end
		
		local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * iMod * 75)
		
		if load(pPlayer, "Decisions_EgyptianEmpower") == "Decisions_EgyptianNomarch" then
			Decisions_EgyptianNomarch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANNOMARCH_ENACTED_DESC", iReward)
			return false, false, true
		end
		Decisions_EgyptianNomarch.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTIANNOMARCH_DESC", iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EgyptianNomarch.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_EgyptianEmpower", "Decisions_EgyptianNomarch")
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_EGYPT, "Decisions_EgyptianNomarch", Decisions_EgyptianNomarch)

--------------------------------------------------------------------------------------------------------------------------
-- Egypt: Excavate the Valley of the Kings
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EgyptValleyOfTheKings = {}
	Decisions_EgyptValleyOfTheKings.Name = "TXT_KEY_DECISIONS_EGYPTMONUMENTS"
	Decisions_EgyptValleyOfTheKings.Desc = "TXT_KEY_DECISIONS_EGYPTMONUMENTS_DESC"

	Decisions_EgyptValleyOfTheKings.Wonders = {}
	for tBuilding in GameInfo.Buildings() do

		local iBuilding = tBuilding.ID
		local sBuildingClass = tBuilding.BuildingClass

		if GameInfo.BuildingClasses[sBuildingClass].MaxGlobalInstances == 1 or GameInfo.BuildingClasses[sBuildingClass].MaxPlayerInstances == 1 then

			local iCulture = 0
			local iFaith = 0
			for tRow in GameInfo.Building_YieldChanges() do
				if GameInfoTypes[tRow.BuildingType] == iBuilding then
					if tRow.YieldType == "YIELD_CULTURE" then
						iCulture = iCulture + tRow.Yield
					elseif tRow.YieldType == "YIELD_FAITH" then
						iFaith = iFaith + tRow.Yield
					end
				end
			end

			Decisions_EgyptValleyOfTheKings.Wonders[iBuilding] = {Culture = iCulture, Faith = iFaith}
			print(tBuilding.Type, iCulture, iFaith)
		end
	end

	HookDecisionCivilizationIcon(Decisions_EgyptValleyOfTheKings, "CIVILIZATION_EGYPT")
	Decisions_EgyptValleyOfTheKings.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_EGYPT then return false, false end
		if load(pPlayer, "Decisions_EgyptValleyOfTheKings") == true then
			Decisions_EgyptValleyOfTheKings.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTMONUMENTS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(250 * iMod)
		Decisions_EgyptValleyOfTheKings.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_EGYPTMONUMENTS_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MASONRY)) then return true, false end

		return true, true
	end
	)
	
	Decisions_EgyptValleyOfTheKings.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		Decisions_EgyptValleyOfTheKings.Monitors[GameEvents.PlayerDoTurn](pPlayer:GetID())

		save(pPlayer, "Decisions_EgyptValleyOfTheKings", true)
	end
	)

	Decisions_EgyptValleyOfTheKings.Monitors = {}
	Decisions_EgyptValleyOfTheKings.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_EgyptValleyOfTheKings") == true then
			for pCity in pPlayer:Cities() do
				local iProduction = pCity:GetProductionBuilding()
				if Decisions_EgyptValleyOfTheKings.Wonders[iProduction] then
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F, Decisions_EgyptValleyOfTheKings.Wonders[iProduction].Faith)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C, Decisions_EgyptValleyOfTheKings.Wonders[iProduction].Culture)
				else
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F, 0)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C, 0)	
				end
			end
		end
	end
	)

	Decisions_EgyptValleyOfTheKings.Monitors[Events.SerialEventCityInfoDirty] =  (
	function()
		Decisions_EgyptValleyOfTheKings.Monitors[GameEvents.PlayerDoTurn](Game.GetActivePlayer())
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_EGYPT, "Decisions_EgyptValleyOfTheKings", Decisions_EgyptValleyOfTheKings)

--------------------------------------------------------------------------------------------------------------------------
-- Sweden: Indelningsverket
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SwedenIndelningsverket = {}
	Decisions_SwedenIndelningsverket.Name = "TXT_KEY_DECISIONS_SWEDENINDELNINGSVERKET"
	Decisions_SwedenIndelningsverket.Desc = "TXT_KEY_DECISIONS_SWEDENINDELNINGSVERKET_DESC"
	HookDecisionCivilizationIcon(Decisions_SwedenIndelningsverket, "CIVILIZATION_SWEDEN")
	Decisions_SwedenIndelningsverket.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SWEDEN then return false, false end
		if load(pPlayer, "Decisions_SwedenIndelningsverket") == true then
			Decisions_SwedenIndelningsverket.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SWEDENINDELNINGSVERKET_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_SwedenIndelningsverket.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SWEDENINDELNINGSVERKET_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RIFLING)) and (pPlayer:GetGold() >= iCost) and (pPlayer:GetCapitalCity() ~= nil) then
			return true, true
		else
			return true, false
		end
	end
	)

	Decisions_SwedenIndelningsverket.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-iCost)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SWEDISH_CAROLEAN, 3)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SWEDISH_HAKKAPELIITTA, 1)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_GENERAL, 1)
		save(pPlayer, "Decisions_SwedenIndelningsverket", true)		
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SWEDEN, "Decisions_SwedenIndelningsverket", Decisions_SwedenIndelningsverket)
	
--------------------------------------------------------------------------------------------------------------------------
-- Sweden: Kung och Riksdag
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SwedishRiksdag = {}
	Decisions_SwedishRiksdag.Name = "TXT_KEY_DECISIONS_SWEDISHRIKSDAG"
	Decisions_SwedishRiksdag.Desc = "TXT_KEY_DECISIONS_SWEDISHRIKSDAG_DESC"
	HookDecisionCivilizationIcon(Decisions_SwedishRiksdag, "CIVILIZATION_SWEDEN")
	Decisions_SwedishRiksdag.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SWEDEN then return false, false end
		if load(pPlayer, "Decisions_SwedishRiksdag") == true then
			Decisions_SwedishRiksdag.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SWEDISHRIKSDAG_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(450 * iMod)
		Decisions_SwedishRiksdag.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SWEDISHRIKSDAG_DESC", iCost)
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_INDUSTRIAL) then
			return true, false
		end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end		
		if pPlayer:GetJONSCulture() < iCost then return true, false end
		if pPlayer:IsGoldenAge() then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_SwedishRiksdag.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(450 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeJONSCulture(-iCost)
		
		local tGreatPeople = {}
		local tInclude = {["UNITCLASS_SCIENTIST"] = 1, ["UNITCLASS_ENGINEER"] = 1, ["UNITCLASS_MERCHANT"] = 1, ["UNITCLASS_GREAT_GENERAL"] = 1, ["UNITCLASS_WRITER"] = 1}
		for Unit in GameInfo.Units() do
			if Unit.Special == "SPECIALUNIT_PEOPLE" and tInclude[Unit.Class] == 1 then
				table.insert(tGreatPeople, Unit.ID)
			end
		end	
		local pPlot = pPlayer:GetCapitalCity():Plot()
		pPlayer:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], pPlot:GetX(), pPlot:GetY())
		pPlayer:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], pPlot:GetX(), pPlot:GetY())
		
		save(pPlayer, "Decisions_SwedishRiksdag", true)				
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SWEDEN, "Decisions_SwedishRiksdag", Decisions_SwedishRiksdag)

--------------------------------------------------------------------------------------------------------------------------
-- Russia: Found the Streltsy
--------------------------------------------------------------------------------------------------------------------------

local Decisions_RussianStreltsy = {}
	Decisions_RussianStreltsy.Name = "TXT_KEY_DECISIONS_RUSSIANSTRELTSY"
	Decisions_RussianStreltsy.Desc = "TXT_KEY_DECISIONS_RUSSIANSTRELTSY_DESC"
	HookDecisionCivilizationIcon(Decisions_RussianStreltsy, "CIVILIZATION_RUSSIA")
	Decisions_RussianStreltsy.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_RUSSIA then return false, false end
		if load(pPlayer, "Decisions_RussianStreltsy") == true then
			Decisions_RussianStreltsy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIANSTRELTSY_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_RussianStreltsy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIANSTRELTSY_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUNPOWDER)) and (pPlayer:GetGold() >= iCost) and (pPlayer:GetCapitalCity() ~= nil) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_RussianStreltsy.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_MUSKETMAN, 6)
		save(pPlayer, "Decisions_RussianStreltsy", true)		
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_RUSSIA, "Decisions_RussianStreltsy", Decisions_RussianStreltsy)

--------------------------------------------------------------------------------------------------------------------------
-- Russia: Unleash the Oprichniki (City-Based)
--------------------------------------------------------------------------------------------------------------------------

local Decisions_RussiaOprichnina = {}
	Decisions_RussiaOprichnina.Name = "TXT_KEY_DECISIONS_RUSSIAOPRICHNINA"
	Decisions_RussiaOprichnina.Desc = "TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_DESC"
	Decisions_RussiaOprichnina.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_RUSSIA then return end
		if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MODERN then return end
		
		--Generate Decisions
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE) or pCity:IsCapital() then
				local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
				local sName = pCity:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_DESC"
				tTempDecisions[sKey].Data1 = pCity
				tTempDecisions[sKey].Weight = 0
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_RUSSIA")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local sName = pCity:GetName()
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					if load(pPlayer, sKey) == true then
						if pCity:IsCapital() then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_ENACTED_DESC", sName) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_NOTE")
						else
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_ENACTED_DESC", sName)
						end
						return false, false, true
					end
					
					if pCity:IsCapital() then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_DESC", sName, iReward) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_NOTE")
					else
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RUSSIAOPRICHNINA_DESC", sName, iReward)
					end
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
					if not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE)) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
					pPlayer:ChangeGold(iReward)
					pPlayer:ChangeJONSCulture(iReward)
					
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_RUSSIA, "Decisions_RussiaOprichnina", Decisions_RussiaOprichnina)

--------------------------------------------------------------------------------------------------------------------------
-- Shoshone: Form the Comanche Nation
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ShoshoneComanche = {}
	Decisions_ShoshoneComanche.Name = "TXT_KEY_DECISIONS_SHOSHONECOMANCHE"
	Decisions_ShoshoneComanche.Desc = "TXT_KEY_DECISIONS_SHOSHONECOMANCHE_DESC"
	HookDecisionCivilizationIcon(Decisions_ShoshoneComanche, "CIVILIZATION_SHOSHONE")
	Decisions_ShoshoneComanche.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SHOSHONE then return false, false end
		if load(pPlayer, "Decisions_ShoshoneComanche") == true then
			Decisions_ShoshoneComanche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONECOMANCHE_ENACTED_DESC")
			return false, false, true
		end
		
		local iReward = math.ceil((pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_HORSE, false) + 5) * 30 * iMod)
		Decisions_ShoshoneComanche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONECOMANCHE_DESC", iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra >= GameInfoTypes.ERA_INDUSTRIAL) and (pPlayer:GetCapitalCity() ~= nil) then 
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_ShoshoneComanche.DoFunc = (
	function(pPlayer)
		local iReward = math.ceil((pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_HORSE, false) + 5) * 30 * iMod)
		
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_HORSE, 5)
		pPlayer:ChangeJONSCulture(iReward)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SHOSHONE_COMANCHE_RIDERS, 3)
		save(pPlayer, "Decisions_ShoshoneComanche", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SHOSHONE, "Decisions_ShoshoneComanche", Decisions_ShoshoneComanche)

--------------------------------------------------------------------------------------------------------------------------
-- Shoshone: Explore the Wilderness
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ShoshoneWilderness = {}
	Decisions_ShoshoneWilderness.Name = "TXT_KEY_DECISIONS_SHOSHONEWILDERNESS"
	Decisions_ShoshoneWilderness.Desc = "TXT_KEY_DECISIONS_SHOSHONEWILDERNESS_DESC"
	HookDecisionCivilizationIcon(Decisions_ShoshoneWilderness, "CIVILIZATION_SHOSHONE")
	Decisions_ShoshoneWilderness.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SHOSHONE then return false, false end
		if load(pPlayer, "Decisions_ShoshoneWilderness") == true then
			Decisions_ShoshoneWilderness.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONEWILDERNESS_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(20*iMod)
		Decisions_ShoshoneWilderness.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SHOSHONEWILDERNESS_DESC", iCost)
		local iEra = pPlayer:GetCurrentEra()
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (iEra == GameInfoTypes.ERA_ANCIENT) and (pPlayer:GetCapitalCity() ~= nil) then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_ShoshoneWilderness.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(20*iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SHOSHONE_PATHFINDER, 2)
		save(pPlayer, "Decisions_ShoshoneWilderness", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SHOSHONE, "Decisions_ShoshoneWilderness", Decisions_ShoshoneWilderness)

--------------------------------------------------------------------------------------------------------------------------
-- Iroquois: Call a Mourning War
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IroquoisWar = {}
	Decisions_IroquoisWar.Name = "TXT_KEY_DECISIONS_IROQUOISWAR"
	Decisions_IroquoisWar.Desc = "TXT_KEY_DECISIONS_IROQUOISWAR_DESC"
	Decisions_IroquoisWar.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_IROQUOIS then return false, false end
		
		if load(pPlayer, "Decisions_IroquoisWar") == nil then
			save(pPlayer, "Decisions_IroquoisWar", 0)
		end
		
		local tTable = {}
		local iChance = 40
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity then
		
			local pTargetUnit = nil
			local iMelee = GameInfo.UnitCombatInfos.UNITCOMBAT_MELEE.ID
		
			local pPlot = pCity:Plot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				local iUnitClass = pUnit:GetUnitClassType()
				if pUnit:GetUnitCombatType() == iMelee then
					pTargetUnit = pUnit
					break
				end
			end
			
			tTable.Unit = pTargetUnit
			if pTargetUnit then
				iChance = iChance - (pTargetUnit:GetLevel() * 10)
			end
		end
		
		if iChance < 10 then iChance = 10 end
		if iChance == 40 then iChance = 30 end
		tTable.Chance = iChance
		
		for iCityState, pCityState in pairs(Players) do
			if pCityState:IsEverAlive() and pCityState:IsMinorCiv() and pCityState:IsAlive() and (Teams[pPlayer:GetTeam()]:IsHasMet(pCityState:GetTeam())) then
			
				local sKey = "Decisions_IroquoisWar" .. iCityState
				local sName = pCityState:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISWAR", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_IROQUOISWAR_DESC"
				tTempDecisions[sKey].Data1 = pCityState
				tTempDecisions[sKey].Data2 = tTable
				tTempDecisions[sKey].Weight = 0
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_IROQUOIS")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCityState, tTable)
					local sKey = "Decisions_IroquoisWar" .. pCityState:GetID()
					local sName = pCityState:GetName()

					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISWAR_ENACTED_DESC", sName)
						return false, false, true
					end
					if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MEDIEVAL then return false, false end
					if load(pPlayer, "Decisions_IroquoisWar") >= 5 then
						return false, false
					end
					
					local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * 30 * iMod)
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISWAR_DESC", sName, tTable.Chance, iReward)
					if (tTable.Unit == nil) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCityState, tTable)
					local sKey = "Decisions_IroquoisWar" .. pCityState:GetID()
					local iReward = math.ceil(((pPlayer:GetCurrentEra() + 1) * 30 * iMod)/pPlayer:GetNumCities())
					
					pCityState:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -60)
					if GetRandom(1, 100) <= tTable.Chance then
						tTable.Unit:Kill()
					end
					
					for pCity in pPlayer:Cities() do
						pCity:ChangeFood(iReward)
					end					
					
					local iTimes = load(pPlayer, "Decisions_IroquoisWar") + 1
					save(pPlayer, "Decisions_IroquoisWar", iTimes)
					save(pPlayer, sKey, true)
				end
				)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_IROQUOIS, "Decisions_IroquoisWar", Decisions_IroquoisWar)

--------------------------------------------------------------------------------------------------------------------------
-- Iroquois: Ratify the Gayanashagowa
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IroquoisLawofPeace = {}
	Decisions_IroquoisLawofPeace.Name = "TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE"
	Decisions_IroquoisLawofPeace.Desc = "TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_DESC"
	HookDecisionCivilizationIcon(Decisions_IroquoisLawofPeace, "CIVILIZATION_IROQUOIS")
	Decisions_IroquoisLawofPeace.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_IROQUOIS then return false, false end
		if load(pPlayer, "Decisions_IroquoisLawofPeace") == true then
			Decisions_IroquoisLawofPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_IroquoisLawofPeace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local bConnected = true
		local iCities = 1
		for pCity in pPlayer:Cities() do
			if not pCity:IsCapital() then
				iCities = iCities + 1
				if not(pPlayer:IsCapitalConnectedToCity(pCity)) then
					bConnected = false
				end
			end
		end
		if iCities < 3 then return true, false end
		if not(bConnected) then return true, false end
		return true, true
	end
	)
	
	Decisions_IroquoisLawofPeace.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_IROQUOISLAWOFPEACE, 1)
		save(pPlayer, "Decisions_IroquoisLawofPeace", true)
	end
	)

	Decisions_IroquoisLawofPeace.Monitors = {}
	Decisions_IroquoisLawofPeace.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_IroquoisLawofPeace") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_IROQUOISLAWOFPEACE, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_IROQUOIS, "Decisions_IroquoisLawofPeace", Decisions_IroquoisLawofPeace)

--------------------------------------------------------------------------------------------------------------------------
-- Byzantium: Raise the Theodosian Wall 
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ByzantiumWalls = {}
	Decisions_ByzantiumWalls.Name = "TXT_KEY_DECISIONS_BYZANTIUMWALLS"
	Decisions_ByzantiumWalls.Desc = "TXT_KEY_DECISIONS_BYZANTIUMWALLS_DESC"
	Decisions_ByzantiumWalls.Pedia = "TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS"
	HookDecisionCivilizationIcon(Decisions_ByzantiumWalls, "CIVILIZATION_BYZANTIUM")
	Decisions_ByzantiumWalls.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BYZANTIUM then return false, false end
		if load(pPlayer, "Decisions_ByzantiumWalls") == true then
			Decisions_ByzantiumWalls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMWALLS_ENACTED_DESC")
			return false, false, true
		end
		local pCity = pPlayer:GetCapitalCity()
		if not(pCity) then return false, false end
		local iCost = math.ceil(pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_WALLS) * 1.5)
		Decisions_ByzantiumWalls.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMWALLS_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MASONRY)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ByzantiumWalls.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil((pPlayer:GetCapitalCity():GetBuildingPurchaseCost(GameInfoTypes.BUILDING_WALLS)) * 1.5)
		
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_BYZANTIUMWALLS, 1)
		save(pPlayer, "Decisions_ByzantiumWalls", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BYZANTIUM, "Decisions_ByzantiumWalls", Decisions_ByzantiumWalls)

--------------------------------------------------------------------------------------------------------------------------
-- Byzantium: Establish the Succession Laws of Porphyrogennetos
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ByzantiumPorphyrogennetos = {}
	Decisions_ByzantiumPorphyrogennetos.Name = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS"
	Decisions_ByzantiumPorphyrogennetos.Desc = "TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC"
	HookDecisionCivilizationIcon(Decisions_ByzantiumPorphyrogennetos, "CIVILIZATION_BYZANTIUM")
	Decisions_ByzantiumPorphyrogennetos.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BYZANTIUM then return false, false end
		if load(pPlayer, "Decisions_ByzantiumPorphyrogennetos") == true then
			Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_ByzantiumPorphyrogennetos.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BYZANTIUMPORPHYROGENNETOS_DESC", iCost)
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
		local iEra = pPlayer:GetCurrentEra()
		if (iEra == GameInfoTypes.ERA_CLASSICAL or iEra == GameInfoTypes.ERA_MEDIEVAL) and (pPlayer:GetGold() >= iCost) and (pPlayer:IsGoldenAge()) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ByzantiumPorphyrogennetos.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(400 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, 2)
		save(pPlayer, "Decisions_ByzantiumPorphyrogennetos", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BYZANTIUM, "Decisions_ByzantiumPorphyrogennetos", Decisions_ByzantiumPorphyrogennetos)

--------------------------------------------------------------------------------------------------------------------------
-- Indonesia: Sumpah Palapa
--------------------------------------------------------------------------------------------------------------------------

tDecisions_IndonesiaSumpahPalapa = {}
table.insert(tDecisions_IndonesiaSumpahPalapa, GameInfoTypes.PROMOTION_MYSTIC_BLADE)
for row in GameInfo.UnitPromotions_PostCombatRandomPromotion("PromotionType = 'PROMOTION_MYSTIC_BLADE'") do
	table.insert(tDecisions_IndonesiaSumpahPalapa, GameInfoTypes[row.NewPromotion])
end

local Decisions_IndonesiaSumpahPalapa = {}
	Decisions_IndonesiaSumpahPalapa.Name = "TXT_KEY_DECISIONS_INDONESIASUMPAHPALAPA"
	Decisions_IndonesiaSumpahPalapa.Desc = "TXT_KEY_DECISIONS_INDONESIASUMPAHPALAPA_DESC"
	HookDecisionCivilizationIcon(Decisions_IndonesiaSumpahPalapa, "CIVILIZATION_INDONESIA")
	Decisions_IndonesiaSumpahPalapa.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INDONESIA then return false, false end
		if load(pPlayer, "Decisions_IndonesiaSumpahPalapa") == true then
			Decisions_IndonesiaSumpahPalapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDONESIASUMPAHPALAPA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_IndonesiaSumpahPalapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDONESIASUMPAHPALAPA_DESC")
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then return true, false end
		if Teams[pPlayer:GetTeam()]:GetAtWarCount() < 1 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local iMysticBlade = 0
		for pAdjacentPlot in PlotAreaSweepIterator(Map.GetPlot(pCity:GetX(), pCity:GetY()), 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
				local pUnit = pAdjacentPlot:GetUnit(iVal)
				for iKey, iPromotion in ipairs(tDecisions_IndonesiaSumpahPalapa) do
					if pUnit:IsHasPromotion(iPromotion) then
						iMysticBlade = iMysticBlade + 1
						break
					end
				end
			end
		end
		if iMysticBlade < 3 then 
			return true, false 	
		else
			return true, true
		end
	end
	)
	
	Decisions_IndonesiaSumpahPalapa.DoFunc = (
	function(pPlayer)
		local pCity = pPlayer:GetCapitalCity()
		local iMysticBlade = 0
		for pAdjacentPlot in PlotAreaSweepIterator(Map.GetPlot(pCity:GetX(), pCity:GetY()), 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if iMysticBlade >= 3 then break end
			
			for iVal = 0,(pAdjacentPlot:GetNumUnits() - 1) do
				if iMysticBlade >= 3 then break end
				
				local pUnit = pAdjacentPlot:GetUnit(iVal)
				for iKey, iPromotion in ipairs(tDecisions_IndonesiaSumpahPalapa) do
					if pUnit:IsHasPromotion(iPromotion) then
						pUnit:ChangeExperience(30)
						iMysticBlade = iMysticBlade + 1
						break
					end
				end
			end
		end
		InitUnitFromCity(pCity, GameInfoTypes.UNIT_GREAT_GENERAL, 1)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_IndonesiaSumpahPalapa", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INDONESIA, "Decisions_IndonesiaSumpahPalapa", Decisions_IndonesiaSumpahPalapa)

--------------------------------------------------------------------------------------------------------------------------
-- Indonesia: Take Control of the Spice Trade
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IndonesiaSpice = {}
	Decisions_IndonesiaSpice.sSpice = ""
	Decisions_IndonesiaSpice.tListSpice = {}
	for row in GameInfo.Resources("CivilizationType = 'CIVILIZATION_INDONESIA'") do
		table.insert(Decisions_IndonesiaSpice.tListSpice, GameInfoTypes[row.Type])
		Decisions_IndonesiaSpice.sSpice = Decisions_IndonesiaSpice.sSpice .. "[NEWLINE][ICON_BULLET] " .. row.IconString .. " " .. Locale.ConvertTextKey(row.Description)
	end
	Decisions_IndonesiaSpice.Name = "TXT_KEY_DECISIONS_INDONESIASPICE"
	Decisions_IndonesiaSpice.Desc = "TXT_KEY_DECISIONS_INDONESIASPICE_DESC"
	HookDecisionCivilizationIcon(Decisions_IndonesiaSpice, "CIVILIZATION_INDONESIA")
	Decisions_IndonesiaSpice.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INDONESIA then return false, false end
		if load(pPlayer, "Decisions_IndonesiaSpice") == true then
			Decisions_IndonesiaSpice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDONESIASPICE_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_IndonesiaSpice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDONESIASPICE_DESC", Decisions_IndonesiaSpice.sSpice)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCapitalCity() == nil then return true, false end
		
		local iResAvailable = 0
		for iKey, iRes in ipairs(Decisions_IndonesiaSpice.tListSpice) do
			if (pPlayer:GetNumResourceAvailable(iRes, false) > 0) then
				iResAvailable = iResAvailable + 1
			end
		end
		
		if iResAvailable < 1 then return true, false else return true, true end
	end
	)
	
	Decisions_IndonesiaSpice.DoFunc = (
	function(pPlayer)
		local pCity = pPlayer:GetCapitalCity()
		local pPlot = pCity:Plot()
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:InitUnit(GameInfoTypes.UNIT_CARGO_SHIP, pPlot:GetX(), pPlot:GetY())
		pPlayer:InitUnit(GameInfoTypes.UNIT_CARGO_SHIP, pPlot:GetX(), pPlot:GetY())
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_INDONESIASPICE, 1)
		save(pPlayer, "Decisions_IndonesiaSpice", true)
	end
	)
	
	Decisions_IndonesiaSpice.Monitors = {}
	Decisions_IndonesiaSpice.Monitors[GameEvents.PlayerDoTurn] = (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INDONESIA) then
			return
		end
		if load(pPlayer, "Decisions_IndonesiaSpice") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_INDONESIASPICE, 1)
		end
	end
	)
	
if #Decisions_IndonesiaSpice.tListSpice > 0 then 
	Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INDONESIA, "Decisions_IndonesiaSpice", Decisions_IndonesiaSpice)
end

--------------------------------------------------------------------------------------------------------------------------
-- America: Emancipation Proclamation
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AmericaEmancipation = {}
	Decisions_AmericaEmancipation.Name = "TXT_KEY_DECISIONS_AMERICAEMANCIPATION"
	Decisions_AmericaEmancipation.Desc = "TXT_KEY_DECISIONS_AMERICAEMANCIPATION_DESC"
	HookDecisionCivilizationIcon(Decisions_AmericaEmancipation, "CIVILIZATION_AMERICA")
	Decisions_AmericaEmancipation.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AMERICA) then
			return false, false
		end
		if load(pPlayer, "Decisions_AmericaEmancipation") == true then
			Decisions_AmericaEmancipation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICAEMANCIPATION_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_AmericaEmancipation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICAEMANCIPATION_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra ~= GameInfoTypes.ERA_MODERN) and (iEra ~= GameInfoTypes.ERA_INDUSTRIAL) then
			return true, false
		else
			return true, true
		end
	end
	)
	
	Decisions_AmericaEmancipation.DoFunc = (
	function(pPlayer)
		local iTurns = math.ceil(25 * iGAMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGoldenAgeTurns(iTurns)
		for pCity in pPlayer:Cities() do
			pCity:ChangeWeLoveTheKingDayCounter(iTurns)
		end
		save(pPlayer, "Decisions_AmericaEmancipation", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AMERICA, "Decisions_AmericaEmancipation", Decisions_AmericaEmancipation)

--------------------------------------------------------------------------------------------------------------------------
-- America: The Louisiana Purchase
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AmericanPurchase = {}
	Decisions_AmericanPurchase.Name = "TXT_KEY_DECISIONS_AMERICANPURCHASE"
	Decisions_AmericanPurchase.Desc = "TXT_KEY_DECISIONS_AMERICANPURCHASE_DESC"
	HookDecisionCivilizationIcon(Decisions_AmericanPurchase, "CIVILIZATION_AMERICA")
	Decisions_AmericanPurchase.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AMERICA then return false, false end
		if load(pPlayer, "Decisions_AmericanPurchase") == true then
			Decisions_AmericanPurchase.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICANPURCHASE_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(iMod * 800)
		Decisions_AmericanPurchase.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AMERICANPURCHASE_DESC", iCost)
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then
			return true, false
		else
			return true, true
		end
	end
	)
	
	Decisions_AmericanPurchase.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(iMod * 800)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_AmericanPurchase", true)
	end
	)

	Decisions_AmericanPurchase.Monitors = {}
	Decisions_AmericanPurchase.Monitors[GameEvents.PlayerCityFounded] = (
	function(iPlayer, iCityX, iCityY)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_AmericanPurchase") ~= true then return end
		local pPlot = Map.GetPlot(iCityX, iCityY)
		local pCity = pPlot:GetPlotCity()
		local iCity = pCity:GetID()
		
		local tPlots = {pCity:GetBuyablePlotList()}
		for iPlot = 1,8 do
			local tPlots = {pCity:GetBuyablePlotList()}
			tPlots[1]:SetOwner(iPlayer, iCity, true, true)
		end
		
		if load(pPlayer, "bDecisions_AmericanPurchase") ~= true then
			pCity:SetName("Baton Rouge")
			save(pPlayer, "bDecisions_AmericanPurchase", true)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AMERICA, "Decisions_AmericanPurchase", Decisions_AmericanPurchase)

--------------------------------------------------------------------------------------------------------------------------
-- Arabia: Found the House of Wisdom
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ArabiaHouseOfWisdom = {}
	Decisions_ArabiaHouseOfWisdom.Name = "TXT_KEY_DECISIONS_ARABIAHOUSEOFWISDOM"
	Decisions_ArabiaHouseOfWisdom.Desc = "TXT_KEY_DECISIONS_ARABIAHOUSEOFWISDOM_DESC"
	HookDecisionCivilizationIcon(Decisions_ArabiaHouseOfWisdom, "CIVILIZATION_ARABIA")
	Decisions_ArabiaHouseOfWisdom.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ARABIA then return false, false end
		if load(pPlayer, "Decisions_ArabiaHouseOfWisdom") == true then
			Decisions_ArabiaHouseOfWisdom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ARABIAHOUSEOFWISDOM_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(iMod * 800)
		local iNumTrade = 0
		for pUnit in pPlayer:Units() do if pUnit:IsTrade() then iNumTrade = iNumTrade + 1 end end
		local iReward = math.ceil(40 * iMod) * iNumTrade
		Decisions_ArabiaHouseOfWisdom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ARABIAHOUSEOFWISDOM_DESC", iCost, iReward)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_ArabiaHouseOfWisdom.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(iMod * 800)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iNumTrade = 0
		for pUnit in pPlayer:Units() do if pUnit:IsTrade() then iNumTrade = iNumTrade + 1 end end
		local iReward = math.ceil(40 * iMod) * iNumTrade
		LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iReward)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ARABIAHOUSEOFWISDOM, true)
		
		save(pPlayer, "Decisions_ArabiaHouseOfWisdom", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ARABIA, "Decisions_ArabiaHouseOfWisdom", Decisions_ArabiaHouseOfWisdom)

--------------------------------------------------------------------------------------------------------------------------
-- Arabia: The Rise of Saladin
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ArabiaSaladin = {}
	Decisions_ArabiaSaladin.Name = "TXT_KEY_DECISIONS_ARABIASALADIN"
	Decisions_ArabiaSaladin.Desc = "TXT_KEY_DECISIONS_ARABIASALADIN_DESC"
	HookDecisionCivilizationIcon(Decisions_ArabiaSaladin, "CIVILIZATION_ARABIA")
	Decisions_ArabiaSaladin.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ARABIA then return false, false end
		if load(pPlayer, "Decisions_ArabiaSaladin") then
			local iXP = load(pPlayer, "Decisions_ArabiaSaladin")
			local iXP2 =  math.ceil(iXP/3)
			Decisions_ArabiaSaladin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ARABIASALADIN_ENACTED_DESC", iXP2, iXP)
			return false, false, true
		end
	
		local iXP = 0
		local iXP2 = 0
		local sString = ""
		local iUnity = ""
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		if iReligion ~= nil then 
			iUnity = GetReligiousUnity(pPlayer, iReligion)
			iXP = math.ceil(iUnity * 100 / 3)
			iXP2 =  math.ceil(iXP/3)
			sString = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ARABIASALADIN_NOTE", math.ceil(iUnity * 100))
		end
		Decisions_ArabiaSaladin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ARABIASALADIN_DESC", iXP2, iXP, sString)
		
		if iReligion == nil then return true, false end
		if iUnity < 0.75 then return true, false end
		if pPlayer:GetCurrentEra() ~= GameInfoTypes.ERA_MEDIEVAL then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false) < 1) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then 
			return true, false
		else
			return true, true
		end
	end
	)
	
	Decisions_ArabiaSaladin.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local iReligion = GetPlayerMajorityReligion(pPlayer)
		local iUnity = GetReligiousUnity(pPlayer, iReligion)
		local iXP = math.ceil(iUnity * 100 / 3)
		local iXP2 =  math.ceil(iXP/3)

		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				pUnit:ChangeExperience(iXP2)
			end
		end

		local tGeneral = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_GENERAL, 1)
		
		save(pPlayer, "Decisions_ArabiaSaladin", iXP)
	end
	)

	Decisions_ArabiaSaladin.Monitors = {}
	Decisions_ArabiaSaladin.Monitors[GameEvents.CityTrained] = (
	function(iPlayer, iCity, iUnit)
		local pPlayer = Players[iPlayer]
		local iXP = load(pPlayer, "Decisions_ArabiaSaladin")

		if not iXP then return end

		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:IsCombatUnit() then
			pUnit:ChangeExperience(iXP)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ARABIA, "Decisions_ArabiaSaladin", Decisions_ArabiaSaladin)

--------------------------------------------------------------------------------------------------------------------------
-- France: Organise the Grande Armée
--------------------------------------------------------------------------------------------------------------------------

local Decisions_FranceArmee = {}
	Decisions_FranceArmee.Name = "TXT_KEY_DECISIONS_FRANCEARMEE"
	Decisions_FranceArmee.Desc = "TXT_KEY_DECISIONS_FRANCEARMEE_DESC"
	HookDecisionCivilizationIcon(Decisions_FranceArmee, "CIVILIZATION_FRANCE")
	Decisions_FranceArmee.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_FRANCE then return false, false end
		if load(pPlayer, "Decisions_FranceArmee") == true then
			Decisions_FranceArmee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEARMEE_ENACTED_DESC")
			return false, false, true
		end
		Decisions_FranceArmee.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEARMEE_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUNPOWDER)) then return true, false end
		local iNumUnits = 0
		local iGunpowder = GameInfo.UnitCombatInfos.UNITCOMBAT_GUN.ID
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitCombatType() == iGunpowder then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 8 then return true, false end
		return true, true
	end
	)
	
	Decisions_FranceArmee.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_FRANCEARMEE, true)
		save(pPlayer, "Decisions_FranceArmee", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_FRANCE, "Decisions_FranceArmee", Decisions_FranceArmee)

--------------------------------------------------------------------------------------------------------------------------
-- France: Create the Estates-General
--------------------------------------------------------------------------------------------------------------------------

local Decisions_FranceEstates = {}
	Decisions_FranceEstates.Name = "TXT_KEY_DECISIONS_FRANCEESTATES"
	Decisions_FranceEstates.Desc = "TXT_KEY_DECISIONS_FRANCEESTATES_DESC"
	HookDecisionCivilizationIcon(Decisions_FranceEstates, "CIVILIZATION_FRANCE")
	Decisions_FranceEstates.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_FRANCE then return false, false end
		if load(pPlayer, "Decisions_FranceEstates") == true then
			Decisions_FranceEstates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEESTATES_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300*iMod)
		Decisions_FranceEstates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_FRANCEESTATES_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetNumPolicyBranchesFinished() < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_FranceEstates.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300*iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ESTATES_GENERAL, true)
		save(pPlayer, "Decisions_FranceEstates", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_FRANCE, "Decisions_FranceEstates", Decisions_FranceEstates)

--------------------------------------------------------------------------------------------------------------------------
-- Ottomans: The Law code of Suleiman
--------------------------------------------------------------------------------------------------------------------------

local Decisions_OttomanKanuni = {}
	Decisions_OttomanKanuni.Name = "TXT_KEY_DECISIONS_OTTOMANKANUNI"
	Decisions_OttomanKanuni.Desc = "TXT_KEY_DECISIONS_OTTOMANKANUNI_DESC"
	HookDecisionCivilizationIcon(Decisions_OttomanKanuni, "CIVILIZATION_OTTOMAN")
	Decisions_OttomanKanuni.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_OTTOMAN then return false, false end
		if load(pPlayer, "Decisions_OttomanKanuni") == true then
			Decisions_OttomanKanuni.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_OTTOMANKANUNI_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300*iMod)
		Decisions_OttomanKanuni.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_OTTOMANKANUNI_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE then return true, false end
		if pPlayer:GetNumCities() < 4 then return true, false end
		return true, true
	end
	)
	
	Decisions_OttomanKanuni.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300*iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_OTTOMANKANUNI, true)
		save(pPlayer, "Decisions_OttomanKanuni", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_OTTOMAN, "Decisions_OttomanKanuni", Decisions_OttomanKanuni)

--------------------------------------------------------------------------------------------------------------------------
-- Ottomans: Become a Gunpowder Empire
--------------------------------------------------------------------------------------------------------------------------

local Decisions_OttomanGunpowder = {}
    Decisions_OttomanGunpowder.Name = "TXT_KEY_DECISIONS_OTTOMANGUNPOWDER"
	Decisions_OttomanGunpowder.Desc = "TXT_KEY_DECISIONS_OTTOMANGUNPOWDER_DESC"
	HookDecisionCivilizationIcon(Decisions_OttomanGunpowder, "CIVILIZATION_OTTOMAN")
	Decisions_OttomanGunpowder.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_OTTOMAN then return false, false end
		if load(pPlayer, "Decisions_OttomanGunpowder") == true then
			Decisions_OttomanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_OTTOMANGUNPOWDER_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		
		Decisions_OttomanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_OTTOMANGUNPOWDER_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUNPOWDER)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_OttomanGunpowder.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_OTTOMANGUNPOWDER, true)
		save(pPlayer, "Decisions_OttomanGunpowder", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_OTTOMAN, "Decisions_OttomanGunpowder", Decisions_OttomanGunpowder)

--------------------------------------------------------------------------------------------------------------------------
-- England: Patronise the Virginia Company
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EnglishVirginia = {}
	Decisions_EnglishVirginia.Name = "TXT_KEY_DECISIONS_ENGLISHVIRGINIA"
	Decisions_EnglishVirginia.Desc = "TXT_KEY_DECISIONS_ENGLISHVIRGINIA_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglishVirginia, "CIVILIZATION_ENGLAND")
	Decisions_EnglishVirginia.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ENGLAND then return false, false end
		if load(pPlayer, "Decisions_EnglishVirginia") == true then
			Decisions_EnglishVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHVIRGINIA_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(800 * iMod)
		Decisions_EnglishVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHVIRGINIA_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ASTRONOMY)) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		return true, true
	end
	)
	
	Decisions_EnglishVirginia.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_EnglishVirginia", true)
	end
	)
	
	Decisions_EnglishVirginia.Monitors = {}
	Decisions_EnglishVirginia.Monitors[GameEvents.PlayerCityFounded] = (
	function(iPlayer, iCityX, iCityY)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_EnglishVirginia") ~= true then return end
		local pPlot = Map.GetPlot(iCityX, iCityY)
		local pCity = pPlot:GetPlotCity()
		local iCity = pCity:GetID()
		
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local iResource = pAdjacentPlot:GetResourceType()
			local iOwner = pAdjacentPlot:GetOwner()
			if (iResource ~= -1) and (iOwner == iPlayer or iOwner == -1) then
				if GameInfo.Resources[iResource].ResourceClassType == "RESOURCECLASS_LUXURY" then
				
					local iImprovement = GameInfoTypes.IMPROVEMENT_LANDMARK
					for row in GameInfo.Improvement_ResourceTypes("ResourceType = '" .. GameInfo.Resources[iResource].Type .. "'") do
						if iImprovement > GameInfoTypes[row.ImprovementType] then
							iImprovement = GameInfoTypes[row.ImprovementType]
						end
					end
					
					if iImprovement ~= -1 then
						pAdjacentPlot:SetOwner(iPlayer, iCity, true, true)
						local iBuild = -1
						for row in GameInfo.Builds("ImprovementType = '" .. GameInfo.Improvements[iImprovement].Type .. "'") do
							iBuild = row.ID
							break
						end
						if iBuild ~= -1 then
							if pAdjacentPlot:IsBuildRemovesFeature(iBuild) then
								pAdjacentPlot:SetFeatureType(-1)
							end
							pAdjacentPlot:SetImprovementType(iImprovement)
						end
					end
				end
			end
		end	
		
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ENGLAND, "Decisions_EnglishVirginia", Decisions_EnglishVirginia)

--------------------------------------------------------------------------------------------------------------------------
-- England: Create the Counter Armada
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EnglishArmada = {}
	Decisions_EnglishArmada.Name = "TXT_KEY_DECISIONS_ENGLISHARMADA"
	Decisions_EnglishArmada.Desc = "TXT_KEY_DECISIONS_ENGLISHARMADA_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglishArmada, "CIVILIZATION_ENGLAND")
	Decisions_EnglishArmada.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ENGLAND then return false, false end
		if load(pPlayer, "Decisions_EnglishArmada") == true then
			Decisions_EnglishArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHARMADA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_EnglishArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHARMADA_DESC")
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and pUnit:IsCombatUnit()) then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_EnglishArmada.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ENGLISHARMADA, true)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_ADMIRAL, 1)
		save(pPlayer, "Decisions_EnglishArmada", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ENGLAND, "Decisions_EnglishArmada", Decisions_EnglishArmada)

--------------------------------------------------------------------------------------------------------------------------
-- Denmark: Raid a City State
--------------------------------------------------------------------------------------------------------------------------

local Decisions_DenmarkRaid = {}
	Decisions_DenmarkRaid.Name = "TXT_KEY_DECISIONS_DENMARKRAID"
	Decisions_DenmarkRaid.Desc = "TXT_KEY_DECISIONS_DENMARKRAID_DESC"
	Decisions_DenmarkRaid.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_DENMARK then return false, false end
		
		if load(pPlayer, "Decisions_DenmarkRaid") == nil then
			save(pPlayer, "Decisions_DenmarkRaid", 0)
		end
		
		local tTable = {}
		local iChance = 35
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity then
		
			local pTargetUnit = nil
			local iMelee = GameInfo.UnitCombatInfos.UNITCOMBAT_MELEE.ID
		
			local pPlot = pCity:Plot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				if pUnit:GetUnitCombatType() == iMelee then
					pTargetUnit = pUnit
					break
				end
			end
			
			tTable.Unit = pTargetUnit
			if pTargetUnit then
				iChance = iChance - (pTargetUnit:GetLevel() * 5)
			end
		end
		
		if iChance < 10 then iChance = 10 end
		if iChance == 35 then iChance = 30 end
		tTable.Chance = iChance
		
		for iCityState, pCityState in pairs(Players) do
			if pCityState:IsEverAlive() and pCityState:IsMinorCiv() and pCityState:IsAlive() and (Teams[pPlayer:GetTeam()]:IsHasMet(pCityState:GetTeam())) then
			
				local sKey = "Decisions_DenmarkRaid" .. iCityState
				local sName = pCityState:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DENMARKRAID", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_DENMARKRAID_DESC"
				tTempDecisions[sKey].Data1 = pCityState
				tTempDecisions[sKey].Data2 = tTable
				tTempDecisions[sKey].Weight = 0
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_DENMARK")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCityState, tTable)
					local sKey = "Decisions_DenmarkRaid" .. pCityState:GetID()
					local sName = pCityState:GetName()

					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DENMARKRAID_ENACTED_DESC", sName)
						return false, false, true
					end
					if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MEDIEVAL then return false, false end
					if load(pPlayer, "Decisions_DenmarkRaid") >= 8 then
						return false, false
					end
					
					local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * 75 * iMod)
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DENMARKRAID_DESC", sName, tTable.Chance, iReward)
					if (tTable.Unit == nil) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCityState, tTable)
					local sKey = "Decisions_DenmarkRaid" .. pCityState:GetID()
					local iReward = math.ceil((pPlayer:GetCurrentEra() + 1) * 75 * iMod)
					
					pCityState:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -60)
					if GetRandom(1, 100) <= tTable.Chance then
						tTable.Unit:Kill()
					end
					pPlayer:ChangeGold(iReward)
					
					local iTimes = load(pPlayer, "Decisions_DenmarkRaid") + 1
					save(pPlayer, "Decisions_DenmarkRaid", iTimes)
					save(pPlayer, sKey, true)
				end
				)
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_DENMARK, "Decisions_DenmarkRaid", Decisions_DenmarkRaid)

--------------------------------------------------------------------------------------------------------------------------
-- Denmark: Call the Thing
--------------------------------------------------------------------------------------------------------------------------

local Decisions_DenmarkThing = {}
	Decisions_DenmarkThing.Name = "TXT_KEY_DECISIONS_DENMARKTHING"
	Decisions_DenmarkThing.Desc = "TXT_KEY_DECISIONS_DENMARKTHING_DESC"
	HookDecisionCivilizationIcon(Decisions_DenmarkThing, "CIVILIZATION_DENMARK")
	Decisions_DenmarkThing.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_DENMARK then return false, false end
		if load(pPlayer, "Decisions_DenmarkThing") == true then
			Decisions_DenmarkThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DENMARKTHING_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300 * iMod)
		Decisions_DenmarkThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DENMARKTHING_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL then return false, false end
		
		local iNumUnits = 0
		local iMelee = GameInfo.UnitCombatInfos.UNITCOMBAT_MELEE.ID
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitCombatType() == iMelee then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 8 then return true, false end
		return true, true
	end
	)
	
	Decisions_DenmarkThing.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_DENMARKTHING, true)
		save(pPlayer, "Decisions_DenmarkThing", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_DENMARK, "Decisions_DenmarkThing", Decisions_DenmarkThing)

--------------------------------------------------------------------------------------------------------------------------
-- Aztecs: Form the Imperial Jaguars and Eagles
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AztecImperialArmy = {}
	Decisions_AztecImperialArmy.Name = "TXT_KEY_DECISIONS_AZTECIMPERIALARMY"
	Decisions_AztecImperialArmy.Desc = "TXT_KEY_DECISIONS_AZTECIMPERIALARMY_DESC"
	HookDecisionCivilizationIcon(Decisions_AztecImperialArmy, "CIVILIZATION_AZTEC")
	Decisions_AztecImperialArmy.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AZTEC then return false, false end
		if load(pPlayer, "Decisions_AztecImperialArmy") == true then
			Decisions_AztecImperialArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECIMPERIALARMY_ENACTED_DESC")
			return false, false, true
		end
		Decisions_AztecImperialArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECIMPERIALARMY_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		local iNumUnits = 0
		local iPromotion = GameInfoTypes.PROMOTION_JAGUAR
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(iPromotion) then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_AztecImperialArmy.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iPromotion = GameInfoTypes.PROMOTION_JAGUAR
		for pUnit in pPlayer:Units() do
			if pUnit:IsHasPromotion(iPromotion) then
				pUnit:ChangeExperience(30)
			end
		end
		save(pPlayer, "Decisions_AztecImperialArmy", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AZTEC, "Decisions_AztecImperialArmy", Decisions_AztecImperialArmy)

--------------------------------------------------------------------------------------------------------------------------
-- Aztecs: Enact the Flower Wars
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AztecFlowerWar = {}
	Decisions_AztecFlowerWar.Name = "TXT_KEY_DECISIONS_AZTECFLOWERWAR"
	Decisions_AztecFlowerWar.Desc = "TXT_KEY_DECISIONS_AZTECFLOWERWAR_DESC"
	HookDecisionCivilizationIcon(Decisions_AztecFlowerWar, "CIVILIZATION_AZTEC")
	Decisions_AztecFlowerWar.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AZTEC then return false, false end
		if load(pPlayer, "Decisions_AztecFlowerWar") == true then
			Decisions_AztecFlowerWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECFLOWERWAR_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300 * iMod)
		Decisions_AztecFlowerWar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AZTECFLOWERWAR_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then return true, false end
		return true, true
	end
	)
	
	Decisions_AztecFlowerWar.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300*iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_AZTECFLOWERWAR, true)
		save(pPlayer, "Decisions_AztecFlowerWar", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AZTEC, "Decisions_AztecFlowerWar", Decisions_AztecFlowerWar)

--------------------------------------------------------------------------------------------------------------------------
-- Carthage: Dispatch Hanno’s Voyage
--------------------------------------------------------------------------------------------------------------------------

local Decisions_CarthageHanno = {}
	Decisions_CarthageHanno.Name = "TXT_KEY_DECISIONS_CARTHAGEHANNO"
	Decisions_CarthageHanno.Desc = "TXT_KEY_DECISIONS_CARTHAGEHANNO_DESC"
	Decisions_CarthageHanno.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_NAVALMELEE' OR CombatClass = 'UNITCOMBAT_NAVALRANGED'") do
		Decisions_CarthageHanno.Data1[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_CarthageHanno, "CIVILIZATION_CARTHAGE")
	Decisions_CarthageHanno.CanFunc = (
	function(pPlayer, tUnitTypes)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CARTHAGE) then return false, false end

		local iEra = load(pPlayer, "Decisions_CarthageHanno")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_CarthageHanno", nil)
			else
				Decisions_CarthageHanno.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CARTHAGEHANNO_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_CarthageHanno.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CARTHAGEHANNO_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local pTargetCity = nil
		for pCity in pPlayer:Cities() do 
			if pCity:IsCoastal() then  pTargetCity = pCity break end
		end
		if pTargetCity == nil then  return true, false end  
		
		Decisions_CarthageHanno.Data2 = nil
		for sUnitType, iCombat in pairs(tUnitTypes) do
			if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
				if Decisions_CarthageHanno.Data2 == nil then
					Decisions_CarthageHanno.Data2 = GameInfoTypes[sUnitType]
				elseif iCombat > GameInfo.Units[Decisions_CarthageHanno.Data2].Combat then
					Decisions_CarthageHanno.Data2 = GameInfoTypes[sUnitType]
				end
			end
		end
		if Decisions_CarthageHanno.Data2 == nil then return true, false end
		return true, true
	end
	)
	
	Decisions_CarthageHanno.DoFunc = (
	function(pPlayer, tUnitTypes, iUnitType)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local pTargetCity = nil
		for pCity in pPlayer:Cities() do 
			if pCity:IsCoastal() then  pTargetCity = pCity break end
		end

		InitUnitFromCity(pTargetCity, GameInfoTypes.UNIT_SETTLER, 1)
		InitUnitFromCity(pTargetCity, iUnitType, 2)
		InitUnitFromCity(pTargetCity, GameInfoTypes.UNIT_GREAT_ADMIRAL, 1)
		save(pPlayer, "Decisions_CarthageHanno", pPlayer:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CARTHAGE, "Decisions_CarthageHanno", Decisions_CarthageHanno)

--------------------------------------------------------------------------------------------------------------------------
-- Carthage: Expand the Cothons
--------------------------------------------------------------------------------------------------------------------------

local Decisions_CarthageCothons = {}
	Decisions_CarthageCothons.Name = "TXT_KEY_DECISIONS_CARTHAGECOTHONS"
	Decisions_CarthageCothons.Desc = "TXT_KEY_DECISIONS_CARTHAGECOTHONS_DESC"
	HookDecisionCivilizationIcon(Decisions_CarthageCothons, "CIVILIZATION_CARTHAGE")
	Decisions_CarthageCothons.Weight = nil
	Decisions_CarthageCothons.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CARTHAGE) then return false, false end
		if load(pPlayer, "Decisions_CarthageCothons") == true then
			Decisions_CarthageCothons.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CARTHAGECOTHONS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		if (pPlayer:GetNumCities() > 4) then iCost = math.ceil(100 * iMod * pPlayer:GetNumCities()) end
		Decisions_CarthageCothons.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CARTHAGECOTHONS_DESC", iCost)
		
		if (pPlayer:GetNumCities() < 4) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(pPlayer:IsGoldenAge()) then return true, false end

		return true, true
	end
	)
	
	Decisions_CarthageCothons.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod * pPlayer:GetNumCities())
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_CARTHAGECOTHONS, true)
		save(pPlayer, "Decisions_CarthageCothons", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CARTHAGE, "Decisions_CarthageCothons", Decisions_CarthageCothons)

--------------------------------------------------------------------------------------------------------------------------
-- Maya: Endorse Pok-Ta-Pok
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MayaBallGame = {}
    Decisions_MayaBallGame.Name = "TXT_KEY_DECISIONS_MAYABALLGAME"
	Decisions_MayaBallGame.Desc = "TXT_KEY_DECISIONS_MAYABALLGAME_DESC"
	HookDecisionCivilizationIcon(Decisions_MayaBallGame, "CIVILIZATION_MAYA")
	Decisions_MayaBallGame.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MAYA then return false, false end
		if load(pPlayer, "Decisions_MayaBallGame") == true then
			Decisions_MayaBallGame.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MAYABALLGAME_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_MayaBallGame.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MAYABALLGAME_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end
		if (pPlayer:GetNumCities() > pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_MAYA_PYRAMID)) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THEOLOGY)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MayaBallGame.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_MAYABALLGAME, true)
		save(pPlayer, "Decisions_MayaBallGame", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MAYA, "Decisions_MayaBallGame", Decisions_MayaBallGame)

--------------------------------------------------------------------------------------------------------------------------
-- Maya: Improve our Atlatls
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MayaAtlatl = {}
    Decisions_MayaAtlatl.Name = "TXT_KEY_DECISIONS_MAYAATLATL"
	Decisions_MayaAtlatl.Desc = "TXT_KEY_DECISIONS_MAYAATLATL_DESC"
	HookDecisionCivilizationIcon(Decisions_MayaAtlatl, "CIVILIZATION_MAYA")
	Decisions_MayaAtlatl.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MAYA then return false, false end
		if load(pPlayer, "Decisions_MayaAtlatl") == true then
			Decisions_MayaAtlatl.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MAYAATLATL_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_MayaAtlatl.tAtlatl = {}
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == GameInfoTypes.UNIT_MAYAN_ATLATLIST then table.insert(Decisions_MayaAtlatl.tAtlatl, pUnit) end
		end

		local iNum = #Decisions_MayaAtlatl.tAtlatl
		local iCost = math.ceil(30 * iMod * iNum)
		
		Decisions_MayaAtlatl.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MAYAATLATL_DESC", iCost)
		
		if iNum < 1 then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CONSTRUCTION)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MayaAtlatl.DoFunc = (
	function(pPlayer)
		local iNum = #Decisions_MayaAtlatl.tAtlatl
		local iCost = math.ceil(30 * iMod * iNum)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		for iKey, pUnit in ipairs(Decisions_MayaAtlatl.tAtlatl) do
			local pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_COMPOSITE_BOWMAN, pUnit:GetX(), pUnit:GetY())
			pNewUnit:Convert(pUnit)
		end
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_MAYAATLATL, true)
		save(pPlayer, "Decisions_MayaAtlatl", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MAYA, "Decisions_MayaAtlatl", Decisions_MayaAtlatl)

--------------------------------------------------------------------------------------------------------------------------
-- Korea: Introduce Hangul
--------------------------------------------------------------------------------------------------------------------------

local Decisions_KoreanHangul = {}
    Decisions_KoreanHangul.Name = "TXT_KEY_DECISIONS_KOREANHANGUL"
	Decisions_KoreanHangul.Desc = "TXT_KEY_DECISIONS_KOREANHANGUL_DESC"
	HookDecisionCivilizationIcon(Decisions_KoreanHangul, "CIVILIZATION_KOREA")
	Decisions_KoreanHangul.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_KOREA then return false, false end
		if load(pPlayer, "Decisions_KoreanHangul") == true then
			Decisions_KoreanHangul.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KOREANHANGUL_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(pPlayer:GetResearchCost(GameInfoTypes.TECH_WRITING))
		Decisions_KoreanHangul.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KOREANHANGUL_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetCurrentResearch() == -1) then return true, false end
		if (pPlayer:GetResearchProgress(pPlayer:GetCurrentResearch()) < iCost) then return true, false end
		
		local iEra = pPlayer:GetCurrentEra()
		if not(iEra == GameInfoTypes.ERA_RENAISSANCE or iEra == GameInfoTypes.ERA_MEDIEVAL) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_KoreanHangul.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(pPlayer:GetResearchCost(GameInfoTypes.TECH_WRITING))
		local pTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
		pTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), -iCost, pPlayer:GetID())
		
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_KOREANHANGUL, true)
		save(pPlayer, "Decisions_KoreanHangul", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_KOREA, "Decisions_KoreanHangul", Decisions_KoreanHangul)

--------------------------------------------------------------------------------------------------------------------------
-- Korea: Subsidise the development of Gunpowder Weaponry
--------------------------------------------------------------------------------------------------------------------------

local Decisions_KoreanGunpowder = {}
    Decisions_KoreanGunpowder.Name = "TXT_KEY_DECISIONS_KOREANGUNPOWDER"
	Decisions_KoreanGunpowder.Desc = "TXT_KEY_DECISIONS_KOREANGUNPOWDER_DESC"
	HookDecisionCivilizationIcon(Decisions_KoreanGunpowder, "CIVILIZATION_KOREA")
	Decisions_KoreanGunpowder.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_KOREA then return false, false end
		if load(pPlayer, "Decisions_KoreanGunpowder") == true then
			Decisions_KoreanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KOREANGUNPOWDER_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		
		Decisions_KoreanGunpowder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_KOREANGUNPOWDER_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHYSICS)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_KoreanGunpowder.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_KOREANGUNPOWDER, true)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_KOREAN_HWACHA, 2)
		save(pPlayer, "Decisions_KoreanGunpowder", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_KOREA, "Decisions_KoreanGunpowder", Decisions_KoreanGunpowder)

--------------------------------------------------------------------------------------------------------------------------
-- Songhai: Recruit Scholars for the Sankoré University
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SonghaiSankore = {}
    Decisions_SonghaiSankore.Name = "TXT_KEY_DECISIONS_SONGHAISANKORE"
	Decisions_SonghaiSankore.Desc = "TXT_KEY_DECISIONS_SONGHAISANKORE_DESC"
	HookDecisionCivilizationIcon(Decisions_SonghaiSankore, "CIVILIZATION_SONGHAI")
	Decisions_SonghaiSankore.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SONGHAI then return false, false end
		if load(pPlayer, "Decisions_SonghaiSankore") == true then
			Decisions_SonghaiSankore.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SONGHAISANKORE_ENACTED_DESC")
			return false, false, true
		end

		local iCult = math.ceil(100 * iMod)
		local iGold = math.ceil(300 * iMod)

		Decisions_SonghaiSankore.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SONGHAISANKORE_DESC", iCult, iGold)
		
		if (pPlayer:GetJONSCulture() < iCult) then return true, false end
		if (pPlayer:GetGold() < iGold) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_EDUCATION)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_SonghaiSankore.DoFunc = (
	function(pPlayer)
		local iCult = math.ceil(100 * iMod)
		local iGold = math.ceil(300 * iMod)
		pPlayer:ChangeJONSCulture(-iCult)
		pPlayer:ChangeGold(-iGold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_SONGHAISANKORE, true)
		save(pPlayer, "Decisions_SonghaiSankore", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SONGHAI, "Decisions_SonghaiSankore", Decisions_SonghaiSankore)

--------------------------------------------------------------------------------------------------------------------------
-- Songhai: Police our Trade Routes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_SonghaiTradeRoute = {}
    Decisions_SonghaiTradeRoute.Name = "TXT_KEY_DECISIONS_SONGHAITRADEROUTE"
	Decisions_SonghaiTradeRoute.Desc = "TXT_KEY_DECISIONS_SONGHAITRADEROUTE_DESC"
	Decisions_SonghaiTradeRoute.Data1 = {}
	
	Decisions_SonghaiTradeRoute.Data1.Mounted = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MOUNTED' OR CombatClass = 'UNITCOMBAT_ARMOR'") do
		Decisions_SonghaiTradeRoute.Data1.Mounted[row.Type] = row.Combat
	end
	Decisions_SonghaiTradeRoute.Data1.Melee = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_SonghaiTradeRoute.Data1.Melee[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_SonghaiTradeRoute, "CIVILIZATION_SONGHAI")
	
	Decisions_SonghaiTradeRoute.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SONGHAI then return false, false end
		
		local iEra = load(pPlayer, "Decisions_SonghaiTradeRoute")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_SonghaiTradeRoute", nil)
			else
				Decisions_SonghaiTradeRoute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SONGHAITRADEROUTE_ENACTED_DESC")
				return false, false, true
			end
		end
		

		local iCost = math.ceil(200 * iMod) 		
		Decisions_SonghaiTradeRoute.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SONGHAITRADEROUTE_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetNumInternationalTradeRoutesUsed() < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_SonghaiTradeRoute.DoFunc = (
	function(pPlayer, tUnitTable)
		local iCost = math.ceil(200 * iMod)
		for iNumRoutes = 1, pPlayer:GetNumInternationalTradeRoutesUsed() do
		
			local iUnit = nil
			for sUnitType, iCombat in pairs(tUnitTable.Mounted) do
				if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
					if iUnit == nil then
						iUnit = GameInfoTypes[sUnitType]
					elseif iCombat > GameInfo.Units[iUnit].Combat then
						iUnit = GameInfoTypes[sUnitType]
					end
				end
			end
			if iUnit ~= nil then InitUnitFromCity(pPlayer:GetCapitalCity(), iUnit, 1)
			else
				for sUnitType, iCombat in pairs(tUnitTable.Melee) do
					if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
						if iUnit == nil then
							iUnit = GameInfoTypes[sUnitType]
						elseif iCombat > GameInfo.Units[iUnit].Combat then
							iUnit = GameInfoTypes[sUnitType]
						end
					end
				end
			
				if iUnit ~= nil then InitUnitFromCity(pPlayer:GetCapitalCity(), iUnit, 1) end
			end
		end
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_SonghaiTradeRoute", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SONGHAI, "Decisions_SonghaiTradeRoute", Decisions_SonghaiTradeRoute)

--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Institute the Casa da Índia
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PortugalCasaDaIndia = {}
    Decisions_PortugalCasaDaIndia.Name = "TXT_KEY_DECISIONS_PORTUGALCASADAINDIA"
	Decisions_PortugalCasaDaIndia.Desc = "TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_DESC"
	HookDecisionCivilizationIcon(Decisions_PortugalCasaDaIndia, "CIVILIZATION_PORTUGAL")
	Decisions_PortugalCasaDaIndia.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PORTUGAL then return false, false end
		if load(pPlayer, "Decisions_PortugalCasaDaIndia") == true then
			Decisions_PortugalCasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(300 * iMod)
		Decisions_PortugalCasaDaIndia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALCASADAINDIA_DESC", iCost)
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetNumInternationalTradeRoutesUsed() < pPlayer:GetNumInternationalTradeRoutesAvailable()) then return true, false end
		
		return true, true		
	end
	)
	
	Decisions_PortugalCasaDaIndia.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PORTUGALCASADAINDIA, 1)
		save(pPlayer, "Decisions_PortugalCasaDaIndia", true)
	end
	)
	
	Decisions_PortugalCasaDaIndia.Monitors = {}
	Decisions_PortugalCasaDaIndia.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_PortugalCasaDaIndia") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PORTUGALCASADAINDIA, 1)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_PORTUGAL, "Decisions_PortugalCasaDaIndia", Decisions_PortugalCasaDaIndia)

--------------------------------------------------------------------------------------------------------------------------
-- Portugal: Collect Trade Taxes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PortugalTradeTaxes = {}
    Decisions_PortugalTradeTaxes.Name = "TXT_KEY_DECISIONS_PORTUGALTRADETAXES"
	Decisions_PortugalTradeTaxes.Desc = "TXT_KEY_DECISIONS_PORTUGALTRADETAXES_DESC"
	HookDecisionCivilizationIcon(Decisions_PortugalTradeTaxes, "CIVILIZATION_PORTUGAL")
	Decisions_PortugalTradeTaxes.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PORTUGAL then return false, false end
		
		local iEra = load(pPlayer, "Decisions_PortugalTradeTaxes")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_PortugalTradeTaxes", nil)
			else
				Decisions_PortugalTradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALTRADETAXES_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and (pUnit:IsCombatUnit() or pUnit:IsTrade())) then
				iNumUnits = iNumUnits + 1
			end
		end
		local iReward = math.ceil(iNumUnits * iMod * 200)
		Decisions_PortugalTradeTaxes.Data1 = iReward
		Decisions_PortugalTradeTaxes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PORTUGALTRADETAXES_DESC", iReward)
		if iNumUnits < 8 then return true, false end
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_NAVIGATION)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PortugalTradeTaxes.DoFunc = (
	function(pPlayer, iReward)
		pPlayer:ChangeGold(iReward)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_PortugalTradeTaxes", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_PORTUGAL, "Decisions_PortugalTradeTaxes", Decisions_PortugalTradeTaxes)

--------------------------------------------------------------------------------------------------------------------------
-- Assyria: Issue Resettlement Orders
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AssyriaResettlement = {}
    Decisions_AssyriaResettlement.Name = "TXT_KEY_DECISIONS_ASSYRIARESETTLEMENT"
	Decisions_AssyriaResettlement.Desc = "TXT_KEY_DECISIONS_ASSYRIARESETTLEMENT_DESC"
	HookDecisionCivilizationIcon(Decisions_AssyriaResettlement, "CIVILIZATION_ASSYRIA")
	Decisions_AssyriaResettlement.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ASSYRIA then return false, false end
		if load(pPlayer, "Decisions_AssyriaResettlement") == true then
			Decisions_AssyriaResettlement.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASSYRIARESETTLEMENT_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		
		Decisions_AssyriaResettlement.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASSYRIARESETTLEMENT_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false)) < 1 then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BRONZE_WORKING)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AssyriaResettlement.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(400 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_AssyriaResettlement", true)
	end
	)
	
	Decisions_AssyriaResettlement.Monitors = {}
	Decisions_AssyriaResettlement.Monitors[GameEvents.CityCaptureComplete] =  (	
	function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	
		if not(bConquest) then return end
		
		local pPlayer = Players[iNewOwner]
		if load(pPlayer, "Decisions_AssyriaResettlement") == true then
			local pPlot = Map.GetPlot(iX, iY)
			for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (pAdjacentPlot:GetOwner() == iNewOwner) then
					if (pAdjacentPlot:GetImprovementType() ~= -1) then
						if (pAdjacentPlot:IsImprovementPillaged()) then
							pAdjacentPlot:SetImprovementPillaged(false)
						end
					end
				end
			end
		end
		
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ASSYRIA, "Decisions_AssyriaResettlement", Decisions_AssyriaResettlement)

--------------------------------------------------------------------------------------------------------------------------
-- Assyria: Call for Ilku Service
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AssyrianIlku = {}
    Decisions_AssyrianIlku.Name = "TXT_KEY_DECISIONS_ASSYRIANILKU"
	Decisions_AssyrianIlku.Desc = "TXT_KEY_DECISIONS_ASSYRIANILKU_DESC"
	Decisions_AssyrianIlku.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_AssyrianIlku.Data1[row.Type] = row.Combat
	end
	Decisions_AssyrianIlku.Data1.UNIT_ASSYRIAN_SIEGE_TOWER = nil
	HookDecisionCivilizationIcon(Decisions_AssyrianIlku, "CIVILIZATION_ASSYRIA")
	Decisions_AssyrianIlku.CanFunc = (
	function(pPlayer, tUnitTable)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ASSYRIA then return false, false end

		local iEra = load(pPlayer, "Decisions_AssyrianIlku")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_AssyrianIlku", nil)
			else
				Decisions_AssyrianIlku.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASSYRIANILKU_ENACTED_DESC")
				return false, false, true
			end
		end
		
		Decisions_AssyrianIlku.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ASSYRIANILKU_DESC")
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MATHEMATICS)) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AssyrianIlku.DoFunc = (
	function(pPlayer, tUnitTable)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		for pCity in pPlayer:Cities() do
			if (pCity:IsCapital() and pPlayer:CanTrain(GameInfoTypes.UNIT_ASSYRIAN_SIEGE_TOWER)) then
				InitUnitFromCity(pCity, GameInfoTypes.UNIT_ASSYRIAN_SIEGE_TOWER, 1)
			else
				local iUnit = nil
				for sUnitType, iCombat in pairs(tUnitTable) do
					if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
						if iUnit == nil then
							iUnit = GameInfoTypes[sUnitType]
						elseif iCombat > GameInfo.Units[iUnit].Combat then
							iUnit = GameInfoTypes[sUnitType]
						end
					end
				end
				if iUnit ~= nil then InitUnitFromCity(pCity, iUnit, 1) end
			end
		end
		save(pPlayer, "Decisions_AssyrianIlku", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ASSYRIA, "Decisions_AssyrianIlku", Decisions_AssyrianIlku)

--------------------------------------------------------------------------------------------------------------------------
-- Austria: Found the Hofkriegsrat
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AustrianHofkriegsrat = {}
    Decisions_AustrianHofkriegsrat.Name = "TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT"
	Decisions_AustrianHofkriegsrat.Desc = "TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT_DESC"
	HookDecisionCivilizationIcon(Decisions_AustrianHofkriegsrat, "CIVILIZATION_AUSTRIA")
	Decisions_AustrianHofkriegsrat.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AUSTRIA then return false, false end
		if load(pPlayer, "Decisions_AustrianHofkriegsrat") == true then
			Decisions_AustrianHofkriegsrat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(800 * iMod)
		Decisions_AustrianHofkriegsrat.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AustrianHofkriegsrat.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT, true)
		save(pPlayer, "Decisions_AustrianHofkriegsrat", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AUSTRIA, "Decisions_AustrianHofkriegsrat", Decisions_AustrianHofkriegsrat)

--------------------------------------------------------------------------------------------------------------------------
-- Austria: Tu Felix Austria Nube
--------------------------------------------------------------------------------------------------------------------------

local Decisions_AustrianHabsburg = {}
    Decisions_AustrianHabsburg.Name = "TXT_KEY_DECISIONS_AUSTRIANHABSBURG"
	Decisions_AustrianHabsburg.Desc = "TXT_KEY_DECISIONS_AUSTRIANHABSBURG_DESC"
	HookDecisionCivilizationIcon(Decisions_AustrianHabsburg, "CIVILIZATION_AUSTRIA")
	Decisions_AustrianHabsburg.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AUSTRIA then return false, false end
		if load(pPlayer, "Decisions_AustrianHabsburg") == true then
			Decisions_AustrianHabsburg.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIANHABSBURG_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(200 * iMod)
		Decisions_AustrianHabsburg.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_AUSTRIANHABSBURG_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		return true, true
	end
	)
	
	Decisions_AustrianHabsburg.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_AUSTRIANHABSBURG, true)
		save(pPlayer, "Decisions_AustrianHabsburg", true)
	end
	)
	
	Decisions_AustrianHabsburg.Monitors = {}
	Decisions_AustrianHabsburg.Monitors[GameEvents.CityCaptureComplete] =  (	
	function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	
		if bConquest then return end
		if not(Players[iOldOwner]:IsMinorCiv()) then return end
		
		local pPlayer = Players[iNewOwner]
		
		if load(pPlayer, "Decisions_AustrianHabsburg") ~= true then return end
		if load(pPlayer, "Decisions_AustrianHabsburg" .. iOldOwner) == true then return end
		
		local iTurns = math.ceil(25 * iGAMod)
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		
		pCity:ChangeWeLoveTheKingDayCounter(iTurns)
		pPlayer:ChangeNumResourceTotal(iMagistrate, 1)
			
		save(pPlayer, "Decisions_AustrianHabsburg" .. iOldOwner, true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_AUSTRIA, "Decisions_AustrianHabsburg", Decisions_AustrianHabsburg)

--------------------------------------------------------------------------------------------------------------------------
-- Brazil: Develop Ethanol Fuel
--------------------------------------------------------------------------------------------------------------------------

local Decisions_BrazilEthanol = {}
    Decisions_BrazilEthanol.Name = "TXT_KEY_DECISIONS_BRAZILETHANOL"
	Decisions_BrazilEthanol.Desc = "TXT_KEY_DECISIONS_BRAZILETHANOL_DESC"
	HookDecisionCivilizationIcon(Decisions_BrazilEthanol, "CIVILIZATION_BRAZIL")
	Decisions_BrazilEthanol.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BRAZIL then return false, false end
		if load(pPlayer, "Decisions_BrazilEthanol") == true then
			Decisions_BrazilEthanol.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BRAZILETHANOL_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(600 * iMod)
		Decisions_BrazilEthanol.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BRAZILETHANOL_DESC", iCost)
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_COMBUSTION)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_BrazilEthanol.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(600 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_BRAZILETHANOL, true)
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_OIL, 3)
		save(pPlayer, "Decisions_BrazilEthanol", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BRAZIL, "Decisions_BrazilEthanol", Decisions_BrazilEthanol)

--------------------------------------------------------------------------------------------------------------------------
-- Brazil: Dispatch the Bandeirantes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_BrazilBandeirantes = {}
    Decisions_BrazilBandeirantes.Name = "TXT_KEY_DECISIONS_BRAZILBANDEIRANTES"
	Decisions_BrazilBandeirantes.Desc = "TXT_KEY_DECISIONS_BRAZILBANDEIRANTES_DESC"
	HookDecisionCivilizationIcon(Decisions_BrazilBandeirantes, "CIVILIZATION_BRAZIL")
	Decisions_BrazilBandeirantes.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BRAZIL then return false, false end
		if load(pPlayer, "Decisions_BrazilBandeirantes") == true then
			Decisions_BrazilBandeirantes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BRAZILBANDEIRANTES_ENACTED_DESC")
			return false, false, true
		end
		
		local iCult = math.ceil(100 * iMod)
		local iGold = math.ceil(500 * iMod)

		Decisions_BrazilBandeirantes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BRAZILBANDEIRANTES_DESC", iCult, iGold)
		
		if (pPlayer:GetJONSCulture() < iCult) then return true, false end
		if (pPlayer:GetGold() < iGold) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUNPOWDER)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_BrazilBandeirantes.DoFunc = (
	function(pPlayer)
		local iCult = math.ceil(100 * iMod)
		local iGold = math.ceil(500 * iMod)
		pPlayer:ChangeJONSCulture(-iCult)
		pPlayer:ChangeGold(-iGold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_BRAZILBANDEIRANTES, true)
		save(pPlayer, "Decisions_BrazilBandeirantes", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BRAZIL, "Decisions_BrazilBandeirantes", Decisions_BrazilBandeirantes)

--------------------------------------------------------------------------------------------------------------------------
-- China: Establish the Imperial Exams
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ChinaImperialExam = {}
    Decisions_ChinaImperialExam.Name = "TXT_KEY_DECISIONS_CHINAIMPERIALEXAM"
	Decisions_ChinaImperialExam.Desc = "TXT_KEY_DECISIONS_CHINAIMPERIALEXAM_DESC"
	HookDecisionCivilizationIcon(Decisions_ChinaImperialExam, "CIVILIZATION_CHINA")
	Decisions_ChinaImperialExam.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CHINA then return false, false end
		if load(pPlayer, "Decisions_ChinaImperialExam") == true then
			Decisions_ChinaImperialExam.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CHINAIMPERIALEXAM_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(600 * iMod)
		Decisions_ChinaImperialExam.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CHINAIMPERIALEXAM_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_CLASSICAL then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ChinaImperialExam.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(600 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_CHINAIMPERIALEXAM, true)
		save(pPlayer, "Decisions_ChinaImperialExam", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CHINA, "Decisions_ChinaImperialExam", Decisions_ChinaImperialExam)

--------------------------------------------------------------------------------------------------------------------------
-- China: Create the Fubing Zhi
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ChinaFubingZhi = {}
    Decisions_ChinaFubingZhi.Name = "TXT_KEY_DECISIONS_CHINAFUBINGZHI"
	Decisions_ChinaFubingZhi.Desc = "TXT_KEY_DECISIONS_CHINAFUBINGZHI_DESC"
	HookDecisionCivilizationIcon(Decisions_ChinaFubingZhi, "CIVILIZATION_CHINA")
	Decisions_ChinaFubingZhi.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CHINA then return false, false end
		if load(pPlayer, "Decisions_ChinaFubingZhi") == true then
			Decisions_ChinaFubingZhi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CHINAFUBINGZHI_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_ChinaFubingZhi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CHINAFUBINGZHI_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end		
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_CLASSICAL then return true, false end
		
		local iNumUnits = 0
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 5 then return true, false end
		
		local pCity = pPlayer:GetCapitalCity()
		local pGreatGeneral = nil
		Decisions_ChinaFubingZhi.Data1 = nil
		if pCity == nil then return true, false end		
		local pPlot = pCity:Plot()
		for iVal = 0,(pPlot:GetNumUnits() - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			local iUnitClass = pUnit:GetUnitClassType()
			if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_GREAT_GENERAL) then
				pGreatGeneral = pUnit
				break
			end
		end
		if pGreatGeneral then Decisions_ChinaFubingZhi.Data1 = pGreatGeneral else return true, false end
		
		return true, true
	end
	)
	
	Decisions_ChinaFubingZhi.DoFunc = (
	function(pPlayer, pUnit)
		local iCost = math.ceil(400 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pUnit:Kill()
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_CHINAFUBINGZHI, true)
		save(pPlayer, "Decisions_ChinaFubingZhi", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CHINA, "Decisions_ChinaFubingZhi", Decisions_ChinaFubingZhi)

--------------------------------------------------------------------------------------------------------------------------
-- Persia: Establish the Satrapies
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PersiaSatrapy = {}
    Decisions_PersiaSatrapy.Name = "TXT_KEY_DECISIONS_PERSIASATRAPY"
	Decisions_PersiaSatrapy.Desc = "TXT_KEY_DECISIONS_PERSIASATRAPY_DESC"
	HookDecisionCivilizationIcon(Decisions_PersiaSatrapy, "CIVILIZATION_PERSIA")
	Decisions_PersiaSatrapy.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PERSIA then return false, false end
		if load(pPlayer, "Decisions_PersiaSatrapy") == true then
			Decisions_PersiaSatrapy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PERSIASATRAPY_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_PersiaSatrapy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PERSIASATRAPY_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		local bSatraps = true
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() == iPlayer) and not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_SATRAPS_COURT))) then bSatraps = false end
		end
		if not(bSatraps) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_PersiaSatrapy.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_PERSIASATRAPY, true)
		save(pPlayer, "Decisions_PersiaSatrapy", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_PERSIA, "Decisions_PersiaSatrapy", Decisions_PersiaSatrapy)

--------------------------------------------------------------------------------------------------------------------------
-- Persia: Create the Savaran Cavalry
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PersiaSavaran = {}
    Decisions_PersiaSavaran.Name = "TXT_KEY_DECISIONS_PERSIASAVARAN"
	Decisions_PersiaSavaran.Desc = "TXT_KEY_DECISIONS_PERSIASAVARAN_DESC"
	HookDecisionCivilizationIcon(Decisions_PersiaSavaran, "CIVILIZATION_PERSIA")
	Decisions_PersiaSavaran.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PERSIA then return false, false end
		if load(pPlayer, "Decisions_PersiaSavaran") == true then
			Decisions_PersiaSavaran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PERSIASAVARAN_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(300 * iMod)
		Decisions_PersiaSavaran.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PERSIASAVARAN_DESC", iCost)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_HORSEBACK_RIDING)) then return true, false end

		return true, true
	end
	)
	
	Decisions_PersiaSavaran.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_PERSIASAVARAN, true)
		save(pPlayer, "Decisions_PersiaSavaran", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_PERSIA, "Decisions_PersiaSavaran", Decisions_PersiaSavaran)

--------------------------------------------------------------------------------------------------------------------------
-- Morocco: Establish the Black Guard
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MoroccoBlackGuard = {}
    Decisions_MoroccoBlackGuard.Name = "TXT_KEY_DECISIONS_MOROCCOBLACKGUARD"
	Decisions_MoroccoBlackGuard.Desc = "TXT_KEY_DECISIONS_MOROCCOBLACKGUARD_DESC"
	HookDecisionCivilizationIcon(Decisions_MoroccoBlackGuard, "CIVILIZATION_MOROCCO")
	Decisions_MoroccoBlackGuard.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MOROCCO then return false, false end
		if load(pPlayer, "Decisions_MoroccoBlackGuard") == true then
			Decisions_MoroccoBlackGuard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOROCCOBLACKGUARD_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_MoroccoBlackGuard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOROCCOBLACKGUARD_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfoTypes.ERA_RENAISSANCE) then return true, false end
		if (pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_KASBAH) < 5) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MoroccoBlackGuard.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_MOROCCOBLACKGUARD, true)
		save(pPlayer, "Decisions_MoroccoBlackGuard", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MOROCCO, "Decisions_MoroccoBlackGuard", Decisions_MoroccoBlackGuard)

--------------------------------------------------------------------------------------------------------------------------
-- Morocco: Plunder Campaign
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MoroccoPlunder = {}
    Decisions_MoroccoPlunder.Name = "TXT_KEY_DECISIONS_MOROCCOPLUNDER"
	Decisions_MoroccoPlunder.Desc = "TXT_KEY_DECISIONS_MOROCCOPLUNDER_DESC"
	HookDecisionCivilizationIcon(Decisions_MoroccoPlunder, "CIVILIZATION_MOROCCO")
	Decisions_MoroccoPlunder.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MOROCCO then return false, false end
		if load(pPlayer, "Decisions_MoroccoPlunder") == true then
			Decisions_MoroccoPlunder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOROCCOPLUNDER_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(200 * iMod)
		Decisions_MoroccoPlunder.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MOROCCOPLUNDER_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUNPOWDER)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MoroccoPlunder.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_MOROCCOPLUNDER, true)
		save(pPlayer, "Decisions_MoroccoPlunder", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MOROCCO, "Decisions_MoroccoPlunder", Decisions_MoroccoPlunder)

--------------------------------------------------------------------------------------------------------------------------
-- Mongolia: Incorporate Subdued Peoples
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MongoliaExecution = {}
    Decisions_MongoliaExecution.Name = "TXT_KEY_DECISIONS_MONGOLIAEXECUTION"
	Decisions_MongoliaExecution.Desc = "TXT_KEY_DECISIONS_MONGOLIAEXECUTION_DESC"
	HookDecisionCivilizationIcon(Decisions_MongoliaExecution, "CIVILIZATION_MONGOL")
	Decisions_MongoliaExecution.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MONGOL then return false, false end
		if load(pPlayer, "Decisions_MongoliaExecution") == true then
			Decisions_MongoliaExecution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MONGOLIAEXECUTION_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_MongoliaExecution.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MONGOLIAEXECUTION_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL) then return true, false end
		
		local bHasConquered = false
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() ~= iPlayer)) then bHasConquered = true end
		end
		if not(bHasConquered) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_MongoliaExecution.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_MONGOLIAEXECUTION, true)
		save(pPlayer, "Decisions_MongoliaExecution", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MONGOL, "Decisions_MongoliaExecution", Decisions_MongoliaExecution)

--------------------------------------------------------------------------------------------------------------------------
-- Mongolia: Establish the Yam
--------------------------------------------------------------------------------------------------------------------------

local Decisions_MongoliaSilkRoad = {}
    Decisions_MongoliaSilkRoad.Name = "TXT_KEY_DECISIONS_MONGOLIASILKROAD"
	Decisions_MongoliaSilkRoad.Desc = "TXT_KEY_DECISIONS_MONGOLIASILKROAD_DESC"
	HookDecisionCivilizationIcon(Decisions_MongoliaSilkRoad, "CIVILIZATION_MONGOL")
	Decisions_MongoliaSilkRoad.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MONGOL then return false, false end
		if load(pPlayer, "Decisions_MongoliaSilkRoad") == true then
			Decisions_MongoliaSilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MONGOLIASILKROAD_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(100 * iMod)
		Decisions_MongoliaSilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MONGOLIASILKROAD_DESC", iCost)
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		local iHasConquered = 0
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() ~= iPlayer)) then iHasConquered = iHasConquered + 1 end
		end
		if (iHasConquered < 3) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_MongoliaSilkRoad.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_MONGOLIASILKROAD, 1)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_MONGOLIASILKROAD2, 1)
		end
		save(pPlayer, "Decisions_MongoliaSilkRoad", true)
	end
	)
	
	Decisions_MongoliaSilkRoad.Monitors = {}
	Decisions_MongoliaSilkRoad.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_MongoliaSilkRoad") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_MONGOLIASILKROAD, 1)
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_MONGOLIASILKROAD2, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MONGOL, "Decisions_MongoliaSilkRoad", Decisions_MongoliaSilkRoad)

--------------------------------------------------------------------------------------------------------------------------
-- Babylon: Collate the Star Catalogues
--------------------------------------------------------------------------------------------------------------------------

local Decisions_BabylonObservatory = {}
    Decisions_BabylonObservatory.Name = "TXT_KEY_DECISIONS_BABYLONOBSERVATORY"
	Decisions_BabylonObservatory.Desc = "TXT_KEY_DECISIONS_BABYLONOBSERVATORY_DESC"
	HookDecisionCivilizationIcon(Decisions_BabylonObservatory, "CIVILIZATION_BABYLON")
	Decisions_BabylonObservatory.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BABYLON then return false, false end
		if load(pPlayer, "Decisions_BabylonObservatory") == true then
			Decisions_BabylonObservatory.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONOBSERVATORY_ENACTED_DESC")
			return false, false, true
		end
		
		local pCity = pPlayer:GetCapitalCity()
		if not(pCity) then return false, false end
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_OBSERVATORY)) * 1)
		Decisions_BabylonObservatory.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONOBSERVATORY_DESC", iCost)
		if (pCity:IsHasBuilding(GameInfoTypes.BUILDING_OBSERVATORY)) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHILOSOPHY)) then return true, false end

		return true, true
	end
	)
	
	Decisions_BabylonObservatory.DoFunc = (
	function(pPlayer)
		local pCity = pPlayer:GetCapitalCity()
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_OBSERVATORY)) * 1)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_OBSERVATORY, 1)
		save(pPlayer, "Decisions_BabylonObservatory", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BABYLON, "Decisions_BabylonObservatory", Decisions_BabylonObservatory)

--------------------------------------------------------------------------------------------------------------------------
-- Babylon: Construct the Ishtar Gate
--------------------------------------------------------------------------------------------------------------------------

local Decisions_BabylonGates = {}
    Decisions_BabylonGates.Name = "TXT_KEY_DECISIONS_BABYLONGATES"
	Decisions_BabylonGates.Desc = "TXT_KEY_DECISIONS_BABYLONGATES_DESC"
	Decisions_BabylonGates.Pedia = "TXT_KEY_DECISIONS_BUILDING_BABYLONGATES"
	HookDecisionCivilizationIcon(Decisions_BabylonGates, "CIVILIZATION_BABYLON")
	Decisions_BabylonGates.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BABYLON then return false, false end
		if load(pPlayer, "Decisions_BabylonGates") == true then
			Decisions_BabylonGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONGATES_ENACTED_DESC")
			return false, false, true
		end
		
		local pCity = pPlayer:GetCapitalCity()
		if not(pCity) then return false, false end
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_WALLS)) * 1.5)
		local iReward = math.ceil(80 * iMod)
		Decisions_BabylonGates.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BABYLONGATES_DESC", iCost, iReward)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MASONRY)) then return true, false end

		return true, true
	end
	)
	
	Decisions_BabylonGates.DoFunc = (
	function(pPlayer)
		local pCity = pPlayer:GetCapitalCity()
		local iCost = math.ceil((pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_WALLS)) * 1.5)
		local iReward = math.ceil(80 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeFaith(iReward)
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_BABYLONGATES, 1)
		save(pPlayer, "Decisions_BabylonGates", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BABYLON, "Decisions_BabylonGates", Decisions_BabylonGates)

--------------------------------------------------------------------------------------------------------------------------
-- Celts: Capitalise on the Tin trade
--------------------------------------------------------------------------------------------------------------------------

local Decisions_CeltsTinTrade = {}
    Decisions_CeltsTinTrade.Name = "TXT_KEY_DECISIONS_CELTSTINTRADE"
	Decisions_CeltsTinTrade.Desc = "TXT_KEY_DECISIONS_CELTSTINTRADE_DESC"
	HookDecisionCivilizationIcon(Decisions_CeltsTinTrade, "CIVILIZATION_CELTS")
	Decisions_CeltsTinTrade.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CELTS then return false, false end
		if load(pPlayer, "Decisions_CeltsTinTrade") == true then
			Decisions_CeltsTinTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CELTSTINTRADE_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_CeltsTinTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CELTSTINTRADE_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetNumInternationalTradeRoutesUsed() < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_BRONZE_WORKING)) then return true, false end

		return true, true
	end
	)
	
	Decisions_CeltsTinTrade.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CELTSTINTRADE, 1)
		end
		save(pPlayer, "Decisions_CeltsTinTrade", true)
	end
	)
	
	Decisions_CeltsTinTrade.Monitors = {}
	Decisions_CeltsTinTrade.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_CeltsTinTrade") == true then
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CELTSTINTRADE, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CELTS, "Decisions_CeltsTinTrade", Decisions_CeltsTinTrade)

--------------------------------------------------------------------------------------------------------------------------
-- Celts: Refine the Uilleann pipes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_CeltsUilleannPipes = {}
    Decisions_CeltsUilleannPipes.Name = "TXT_KEY_DECISIONS_CELTSUILLEANNPIPES"
	Decisions_CeltsUilleannPipes.Desc = "TXT_KEY_DECISIONS_CELTSUILLEANNPIPES_DESC"
	Decisions_CeltsUilleannPipes.Weight = (function(pPlayer) if (pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CEILIDH_HALL)/pPlayer:GetNumCities() < 0.5) then return false else return true end end)
	HookDecisionCivilizationIcon(Decisions_CeltsUilleannPipes, "CIVILIZATION_CELTS")
	Decisions_CeltsUilleannPipes.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CELTS then return false, false end
		if load(pPlayer, "Decisions_CeltsUilleannPipes") == true then
			Decisions_CeltsUilleannPipes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CELTSUILLEANNPIPES_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		local iReward = math.ceil((pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_AMPHITHEATER) + pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CEILIDH_HALL)) * 50 * iMod)
		if iReward < math.ceil(50 * iMod) then iReward = math.ceil(50 * iMod) end
		
		Decisions_CeltsUilleannPipes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CELTSUILLEANNPIPES_DESC", iCost, iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CEILIDH_HALL) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_CeltsUilleannPipes.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(800 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iReward = math.ceil((pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_AMPHITHEATER) + pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CEILIDH_HALL)) * 50 * iMod)
		pPlayer:ChangeJONSCulture(iReward)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_MUSICIAN, 2)
		
		save(pPlayer, "Decisions_CeltsUilleannPipes", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CELTS, "Decisions_CeltsUilleannPipes", Decisions_CeltsUilleannPipes)

--------------------------------------------------------------------------------------------------------------------------
-- Greece: Develop the Phalanx formation
--------------------------------------------------------------------------------------------------------------------------

local Decisions_GreecePhalanx = {}
    Decisions_GreecePhalanx.Name = "TXT_KEY_DECISIONS_GREECEPHALANX"
	Decisions_GreecePhalanx.Desc = "TXT_KEY_DECISIONS_GREECEPHALANX_DESC"
	HookDecisionCivilizationIcon(Decisions_GreecePhalanx, "CIVILIZATION_GREECE")
	Decisions_GreecePhalanx.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_GREECE then return false, false end
		if load(pPlayer, "Decisions_GreecePhalanx") == true then
			Decisions_GreecePhalanx.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GREECEPHALANX_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_GreecePhalanx.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GREECEPHALANX_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_IRON_WORKING)) then return true, false end
		
		local iNumUnits = 0
		local iUnitType = GameInfoTypes.UNIT_GREEK_HOPLITE
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iUnitType then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 5 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_GreecePhalanx.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(400 * iMod)
		
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
	
		local iUnitType = GameInfoTypes.UNIT_GREEK_HOPLITE
		local iNewUnitType = GameInfoTypes.UNIT_PIKEMAN
		local iPromotion = GameInfoTypes.PROMOTION_DECISIONS_GREECEPHALANX
		
		local tHoplite = {}
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iUnitType then table.insert(tHoplite, pUnit) end
		end
		for iKey, pUnit in ipairs(tHoplite) do
			local pNewUnit = pPlayer:InitUnit(iNewUnitType, pUnit:GetX(), pUnit:GetY())
			pNewUnit:Convert(pUnit)
			pNewUnit:SetHasPromotion(iPromotion, true)
		end
		
		save(pPlayer, "Decisions_GreecePhalanx", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_GREECE, "Decisions_GreecePhalanx", Decisions_GreecePhalanx)

--------------------------------------------------------------------------------------------------------------------------
-- Greece: Rally the Philhellenes
--------------------------------------------------------------------------------------------------------------------------

local Decisions_GreecePhilhellenism = {}
    Decisions_GreecePhilhellenism.Name = "TXT_KEY_DECISIONS_GREECEPHILHELLENISM"
	Decisions_GreecePhilhellenism.Desc = "TXT_KEY_DECISIONS_GREECEPHILHELLENISM_DESC"
	HookDecisionCivilizationIcon(Decisions_GreecePhilhellenism, "CIVILIZATION_GREECE")
	Decisions_GreecePhilhellenism.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_GREECE then return false, false end
		if load(pPlayer, "Decisions_GreecePhilhellenism") == true then
			Decisions_GreecePhilhellenism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GREECEPHILHELLENISM_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(600 * iMod)
		Decisions_GreecePhilhellenism.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GREECEPHILHELLENISM_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetNumPolicyBranchesFinished() < 2) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		
		local iNumAllies = 0
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam())) then
				if pCS:IsAllies(pPlayer:GetID()) then iNumAllies = iNumAllies + 1 end
			end
		end
		if iNumAllies < 3 then return true, false end
		
		return true, true
	end
	)
	
	Decisions_GreecePhilhellenism.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(600 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_GreecePhilhellenism", true)
	end
	)
	
	-- Main monitor func
	Decisions_GreecePhilhellenism.Monitors = {}
	Decisions_GreecePhilhellenism.Monitors[Events.WarStateChanged] =  (
	function(iAttacker, iDefender, bWar)
	--For once we don't actually care who is the aggressor, so skip the check and allow it to run twice	

		if bWar then

			if (Teams[iAttacker]:GetAtWarCount() == 0) then return end
			
			--Check if defender contains any major civs
			local bMajor = false
			for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local pPlayer = Players[iPlayer]
				if pPlayer:GetTeam() == iDefender then bMajor = true end
			end
			if not(bMajor) then return end
		
			for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local pPlayer = Players[iPlayer]
				if pPlayer:GetTeam() == iAttacker then Decisions_GreecePhilhellenism.PhilhellenismCheck(pPlayer) end
			end

		end
	end
	)
	
	--Define available Unit Types
	Decisions_GreecePhilhellenism.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_GreecePhilhellenism.Data1[row.Type] = row.Combat
	end
	
	--Secondary monitor func
	Decisions_GreecePhilhellenism.PhilhellenismCheck = (
	function(pPlayer)
		if load(pPlayer, "Decisions_GreecePhilhellenism") ~= true then return end
		
		local iNumAllies = 0
		for iCS, pCS in pairs(Players) do
			if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam())) then
				if pCS:IsAllies(pPlayer:GetID()) then iNumAllies = iNumAllies + 1 end
			end
		end
		
		local iUnitType = nil
		for sUnitType, iCombat in pairs(Decisions_GreecePhilhellenism.Data1) do
			if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
				if iUnitType == nil then
					iUnitType = GameInfoTypes[sUnitType]
				elseif iCombat > GameInfo.Units[iUnitType].Combat then
					iUnitType = GameInfoTypes[sUnitType]
				end
			end
		end
		
		if iUnitType == nil then return end
		if iNumAllies < 1 then return end
		
		for iNum = 1, iNumAllies do
			local sAiType = GameInfo.Units[iUnitType].DefaultUnitAI
			pPlayer:AddFreeUnit(iUnitType, GameInfoTypes[sAiType])
		end
		if pPlayer:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_GREECEPHILHELLENISM_NOTIFICATION"))
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_GREECE, "Decisions_GreecePhilhellenism", Decisions_GreecePhilhellenism)

--------------------------------------------------------------------------------------------------------------------------
-- India: Found the House of Worship
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IndiaReligions = {}
    Decisions_IndiaReligions.Name = "TXT_KEY_DECISIONS_INDIARELIGIONS"
	Decisions_IndiaReligions.Desc = "TXT_KEY_DECISIONS_INDIARELIGIONS_DESC"
	HookDecisionCivilizationIcon(Decisions_IndiaReligions, "CIVILIZATION_INDIA")
	Decisions_IndiaReligions.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INDIA then return false, false end
		if load(pPlayer, "Decisions_IndiaReligions") == true then
			Decisions_IndiaReligions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDIARELIGIONS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(100 * iMod)
		Decisions_IndiaReligions.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDIARELIGIONS_DESC", iCost)		
		
		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (GetNumReligionsinEmpire(pPlayer) < 2)  then return true, false end
		
		return true, true
	end
	)
	
	Decisions_IndiaReligions.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod)
		pPlayer:ChangeFaith(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_INDIARELIGIONS, true)
		save(pPlayer, "Decisions_IndiaReligions", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INDIA, "Decisions_IndiaReligions", Decisions_IndiaReligions)

--------------------------------------------------------------------------------------------------------------------------
-- India: Standardise the Devanagari Script
--------------------------------------------------------------------------------------------------------------------------

local Decisions_IndiaDevangariScript = {}
    Decisions_IndiaDevangariScript.Name = "TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT"
	Decisions_IndiaDevangariScript.Desc = "TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT_DESC"
	HookDecisionCivilizationIcon(Decisions_IndiaDevangariScript, "CIVILIZATION_INDIA")
	Decisions_IndiaDevangariScript.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_INDIA then return false, false end
		if load(pPlayer, "Decisions_IndiaDevangariScript") == true then
			Decisions_IndiaDevangariScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_IndiaDevangariScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_MEDIEVAL then return true, false end
		
		return true, true
	end
	)
	
	Decisions_IndiaDevangariScript.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_IndiaDevangariScript", true)
	end
	)
	
	Decisions_IndiaDevangariScript.Monitors = {}
	Decisions_IndiaDevangariScript.Monitors[GameEvents.SetPopulation] =  (
	function(iX, iY, iOldPop, iNewPop)
		if iNewPop < iOldPop then return end
		
		local pPlot				= Map.GetPlot(iX, iY)
		local pCity  			= pPlot:GetPlotCity()
		local iPlayer 			= pCity:GetOwner()
		local pPlayer			= Players[iPlayer]
		
		if load(pPlayer, "Decisions_IndiaDevangariScript") ~= true then return end
		
		local iBonus = math.ceil(((iNewPop ^ 1.88) / 4) * iMod)
		LuaEvents.Sukritact_ChangeResearchProgress(pPlayer:GetID(), iBonus)
		pPlayer:ChangeJONSCulture(iBonus)
		
		if pPlayer:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_INDIADEVANGARISCRIPT_NOTIFICATION", pCity:GetName(), iBonus))
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_INDIA, "Decisions_IndiaDevangariScript", Decisions_IndiaDevangariScript)

--------------------------------------------------------------------------------------------------------------------------
-- Japan: Appoint the Shogun
--------------------------------------------------------------------------------------------------------------------------

local Decisions_JapanShogunate = {}
    Decisions_JapanShogunate.Name = "TXT_KEY_DECISIONS_JAPANSHOGUNATE"
	Decisions_JapanShogunate.Desc = "TXT_KEY_DECISIONS_JAPANSHOGUNATE_DESC"
	HookDecisionCivilizationIcon(Decisions_JapanShogunate, "CIVILIZATION_JAPAN")
	Decisions_JapanShogunate.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JAPAN then return false, false end
		if load(pPlayer, "Decisions_JapanShogunate") == true then
			Decisions_JapanShogunate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JAPANSHOGUNATE_ENACTED_DESC")
			return false, false, true
		end

		local iCost = math.ceil(500 * iMod)
		Decisions_JapanShogunate.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JAPANSHOGUNATE_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_CASTLE)/pPlayer:GetNumCities() < 0.5) then return true, false end		
		
		return true, true
	end
	)
	
	Decisions_JapanShogunate.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_JAPANESE_SAMURAI, 2)
		
		local tGeneral = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_GENERAL, 1)
		tGeneral[1]:SetName("Minamoto no Yoritomo")
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_JAPANSHOGUNATE, true)
		
		save(pPlayer, "Decisions_JapanShogunate", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_JAPAN, "Decisions_JapanShogunate", Decisions_JapanShogunate)

--------------------------------------------------------------------------------------------------------------------------
-- Japan: Patronise the Theatres
--------------------------------------------------------------------------------------------------------------------------

local Decisions_JapanTheatre = {}
    Decisions_JapanTheatre.Name = "TXT_KEY_DECISIONS_JAPANTHEATRE"
	Decisions_JapanTheatre.Desc = "TXT_KEY_DECISIONS_JAPANTHEATRE_DESC"
	HookDecisionCivilizationIcon(Decisions_JapanTheatre, "CIVILIZATION_JAPAN")
	Decisions_JapanTheatre.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JAPAN then return false, false end
		if load(pPlayer, "Decisions_JapanTheatre") == true then
			Decisions_JapanTheatre.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JAPANTHEATRE_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_JapanTheatre.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JAPANTHEATRE_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_AMPHITHEATER) < 1) then return true, false end
		if (pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_OPERA_HOUSE) < 1) then return true, false end
		
		return true, true		
	end
	)
	
	Decisions_JapanTheatre.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_JAPANTHEATRE, true)
		
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_MUSICIAN, 1)
		
		save(pPlayer, "Decisions_JapanTheatre", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_JAPAN, "Decisions_JapanTheatre", Decisions_JapanTheatre)

--------------------------------------------------------------------------------------------------------------------------
-- Ethiopia: Mint Aksumite coinage
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EthiopiaCoinage = {}
    Decisions_EthiopiaCoinage.Name = "TXT_KEY_DECISIONS_ETHIOPIACOINAGE"
	Decisions_EthiopiaCoinage.Desc = "TXT_KEY_DECISIONS_ETHIOPIACOINAGE_DESC"
	HookDecisionCivilizationIcon(Decisions_EthiopiaCoinage, "CIVILIZATION_ETHIOPIA")
	Decisions_EthiopiaCoinage.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ETHIOPIA then return false, false end
		if load(pPlayer, "Decisions_EthiopiaCoinage") == true then
			Decisions_EthiopiaCoinage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ETHIOPIACOINAGE_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(150 * iMod)
		Decisions_EthiopiaCoinage.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ETHIOPIACOINAGE_DESC", iCost)
		
		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetNumCities() > pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_STELE)) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CURRENCY)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EthiopiaCoinage.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(150 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ETHIOPIACOINAGE, true)
		
		save(pPlayer, "Decisions_EthiopiaCoinage", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ETHIOPIA, "Decisions_EthiopiaCoinage", Decisions_EthiopiaCoinage)

--------------------------------------------------------------------------------------------------------------------------
-- Ethiopia: Establish the Solomonic Dynasty
--------------------------------------------------------------------------------------------------------------------------

local Decisions_EthiopiaSolomonic = {}
    Decisions_EthiopiaSolomonic.Name = "TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC"
	Decisions_EthiopiaSolomonic.Desc = "TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC_DESC"
	HookDecisionCivilizationIcon(Decisions_EthiopiaSolomonic, "CIVILIZATION_ETHIOPIA")
	Decisions_EthiopiaSolomonic.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ETHIOPIA then return false, false end
		if load(pPlayer, "Decisions_EthiopiaSolomonic") == true then
			Decisions_EthiopiaSolomonic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(400 * iMod)
		Decisions_EthiopiaSolomonic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC_DESC", iCost)		
		
		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THEOLOGY)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_EthiopiaSolomonic.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(400 * iMod)
		pPlayer:ChangeFaith(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ETHIOPIASOLOMONIC, 1)
		end		

		save(pPlayer, "Decisions_EthiopiaSolomonic", true)
	end
	)
	
	Decisions_EthiopiaSolomonic.Monitors = {}
	Decisions_EthiopiaSolomonic.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_EthiopiaSolomonic") == true then
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ETHIOPIASOLOMONIC, 1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ETHIOPIA, "Decisions_EthiopiaSolomonic", Decisions_EthiopiaSolomonic)

--------------------------------------------------------------------------------------------------------------------------
-- Huns: Demand Ransom
--------------------------------------------------------------------------------------------------------------------------

local Decisions_HunsRansom = {}
    Decisions_HunsRansom.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM_EXAMPLE")
	Decisions_HunsRansom.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM_EXAMPLE_DESC")
	Decisions_HunsRansom.Weight = 0
	HookDecisionCivilizationIcon(Decisions_HunsRansom, "CIVILIZATION_HUNS")
	Decisions_HunsRansom.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_HUNS then return false, false end
		
		local pTeam = Teams[pPlayer:GetTeam()]
		local tUnitLocations = {}
		if pTeam:GetAtWarCount(true) > 0 then
			for pUnit in pPlayer:Units() do
				if pUnit:IsCombatUnit() then
					local iOwner = pUnit:GetPlot():GetOwner()
					if tUnitLocations[iOwner] == nil then
						tUnitLocations[iOwner] = 1
					else
						tUnitLocations[iOwner] = tUnitLocations[iOwner] + 1
					end
				end
			end
		end
		
		local iNumEnacted = load(pPlayer, "Decisions_HunsRansom_Num")
		if iNumEnacted == nil then
			iNumEnacted = 0
			save(pPlayer, "Decisions_HunsRansom_Num", iNumEnacted)
		end
		local bMaxEnacted = iNumEnacted >= 3
		
		--Generate Decisions
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			if iPlayer ~= pPlayer:GetID() then
				local pEnemy = Players[iPlayer]
				if pEnemy:IsEverAlive() and pEnemy:IsAlive() and pTeam:IsHasMet(pEnemy:GetTeam()) then
			
					local sKey = "Decisions_HunsRansom" .. iPlayer
					local tData = {}
						tData.Civ = iPlayer
						tData.Name = pEnemy:GetName()
						tData.Units = tUnitLocations[iPlayer]
					
					tTempDecisions[sKey] = {}
					tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM", tData.Name)
					tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_HUNSRANSOM_EXAMPLE_DESC"
					tTempDecisions[sKey].Data1 = tData
					tTempDecisions[sKey].Data2 = bMaxEnacted
					tTempDecisions[sKey].Weight = 0
					tTempDecisions[sKey].Type = "Civilization"
					HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_HUNS")
					tTempDecisions[sKey].CanFunc = (
					function(pPlayer, tData, bMaxEnacted)
						local sName = tData.Name	
						if load(pPlayer, sKey) == true then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM_ENACTED_DESC", sName)
							return false, false, true
						end
						
						if bMaxEnacted then return false, false end
						
						local pTeam = Teams[pPlayer:GetTeam()]
						local iEnemy = tData.Civ
						local pEnemy = Players[iEnemy]
						local iEnemyTeam = pEnemy:GetTeam()
						local sKey = "Decisions_HunsRansom" .. iEnemy
						local iNumUnits = tData.Units
						local iReward = math.ceil(150 * iMod)
						print(sName, iNumUnits)
						if (iNumUnits ~= nil and iNumUnits > 0) then
							iReward = math.ceil(iNumUnits * 100 * iMod)
						else 
							iNumUnits = 0
						end
						print(sName, iNumUnits, iReward)
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM_DESC", sName, iReward)
						
						if not(pTeam:IsAtWar(iEnemyTeam)) then return true, false end
						if not(pEnemy:IsWillAcceptPeaceWithPlayer(pPlayer:GetID())) then
							tTempDecisions[sKey].Desc = tTempDecisions[sKey].Desc .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRANSOM_NOT_WILLING", sName)
							return true, false
						end
						if iNumUnits < 1 then return true, false end
						if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
						if pPlayer:GetMilitaryMight() < pEnemy:GetMilitaryMight() then return true, false end
						if pPlayer:IsPeaceBlocked(iEnemyTeam)  then return true, false end
						
						return true, true
					end
					)
					
					tTempDecisions[sKey].DoFunc = (
					function(pPlayer, tData)
					
						for eEvent, fFunc in pairs(Decisions_HunsRansom.Monitors) do
							eEvent.Remove(fFunc)
							eEvent.Add(fFunc)
						end
						save("GAME", "Decisions_HunsRansom_Monitors", true)					
					
						local iPlayer = pPlayer:GetID()
						local pTeam = Teams[pPlayer:GetTeam()]
						local iEnemy = tData.Civ
						local pEnemy = Players[iEnemy]
						local iEnemyTeam = pEnemy:GetTeam()
						local sKey = "Decisions_HunsRansom" .. iEnemy
						local iNumUnits = tData.Units
						local iReward = math.ceil(iNumUnits * 100 * iMod)
						
						pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
						pPlayer:ChangeGold(iReward)
						
						pTeam:MakePeace(iEnemyTeam)
						pTeam:SetPermanentWarPeace(iEnemyTeam, true)
						local tVal = {["P1"] = pPlayer:GetTeam(), ["P2"] = iEnemyTeam, ["Turns"] =  Game.GetGameTurn() + GameInfo.GameSpeeds[Game.GetGameSpeedType()].PeaceDealDuration}
						table.insert(Decisions_HunsRansom.Table, tVal)
						save("Game", "Decisions_HunsRansom_Table", Decisions_HunsRansom.SerialiseSchedule(Decisions_HunsRansom.Table))
						
						for pUnit in pPlayer:Units() do
							local pPlot = pUnit:GetPlot()
							if pPlot:GetTeam() == iEnemyTeam then pUnit:JumpToNearestValidPlot() end
						end
												
						local iNumEnacted = load(pPlayer, "Decisions_HunsRansom_Num")
						save(pPlayer, "Decisions_HunsRansom_Num", (iNumEnacted + 1))
			
						save(pPlayer, sKey, true)
					end
					)
				end
			end
		end
		--End Generation
		if bMaxEnacted then return false, false end
		return true, false
	end
	)
	
	Decisions_HunsRansom.SerialiseSchedule = (
	function(tTable)
		local sStr = ""
		for iKey, tVal in ipairs(tTable) do
			sStr = sStr .. tVal.P1 .. "_%player2_" .. tVal.P2 .. "_%turn_" .. tVal.Turns .. "_%newline_"
		end
		return sStr
	end	
	)
	Decisions_HunsRansom.DeserialiseEventSchedule = (
	function(sStr)
		local tTable = {}
		while string.find(sStr, "_%%newline_") do
			local iS, iE = string.find(sStr, "_%%newline_")
			local sEntry = string.sub(sStr, 0, iS-1)
			
			local iSE, iEE = string.find(sEntry, "_%%player2_")
			local iSN, iEN = string.find(sEntry, "_%%turn_")
			
			local tVal = {["P1"] = tonumber(string.sub(sEntry, 0, iSE-1)), ["P2"] = tonumber(string.sub(sEntry, iEE+1, iSN-1)), ["Turns"] =  tonumber(string.sub(sEntry, iEN+1))}
			table.insert(tTable, tVal)
			
			sStr = string.sub(sStr, iE+1)
		end
		return tTable
	end
	)
	Decisions_HunsRansom.Initialise = (
	function()
		if Decisions_HunsRansom.Table == nil then
			local sData = load("Game", "Decisions_HunsRansom_Table")
			if sData then
				Decisions_HunsRansom.Table = Decisions_HunsRansom.DeserialiseEventSchedule(sData)
			else
				Decisions_HunsRansom.Table = {}
			end
		end
	end
	)
	
	Decisions_HunsRansom.Monitors = {}
	Decisions_HunsRansom.Monitors[GameEvents.PlayerDoTurn] =  (	
	function(iPlayer)
		if iPlayer ~= 0 then return end
		Decisions_HunsRansom.Initialise()
		for iKey, tData in ipairs(Decisions_HunsRansom.Table) do
			if tData.Turns <= Game.GetGameTurn() then
				Teams[tData.P1]:SetPermanentWarPeace(tData.P2, false)
				table.remove(Decisions_HunsRansom.Table, iKey)
				save("Game", "Decisions_HunsRansom_Table", Decisions_HunsRansom.SerialiseSchedule(Decisions_HunsRansom.Table))
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_HUNS, "Decisions_HunsRansom", Decisions_HunsRansom)

--------------------------------------------------------------------------------------------------------------------------
-- Huns: Refine the Recurve Bow
--------------------------------------------------------------------------------------------------------------------------

local Decisions_HunsRecurveBow = {}
    Decisions_HunsRecurveBow.Name = "TXT_KEY_DECISIONS_HUNSRECURVEBOW"
	Decisions_HunsRecurveBow.Desc = "TXT_KEY_DECISIONS_HUNSRECURVEBOW_DESC"
	Decisions_HunsRecurveBow.Data1 = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_ARCHER'") do
		Decisions_HunsRecurveBow.Data1[row.Type] = row.Combat
	end
	HookDecisionCivilizationIcon(Decisions_HunsRecurveBow, "CIVILIZATION_HUNS")
	Decisions_HunsRecurveBow.CanFunc = (
	function(pPlayer, tUnitTypes)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_HUNS then return false, false end
		if load(pPlayer, "Decisions_HunsRecurveBow") == true then
			Decisions_HunsRecurveBow.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRECURVEBOW_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(450 * iMod)
		Decisions_HunsRecurveBow.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_HUNSRECURVEBOW_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_THE_WHEEL)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_HunsRecurveBow.DoFunc = (
	function(pPlayer, tUnitTypes)
		local iCost = math.ceil(450 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_HUNSRECURVEBOW, true)
		
		for iVal = 1, 2 do
			local iUnit = nil
			for sUnitType, iCombat in pairs(tUnitTypes) do
				if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
					if iUnit == nil then
						iUnit = GameInfoTypes[sUnitType]
					elseif iCombat > GameInfo.Units[iUnit].Combat then
						iUnit = GameInfoTypes[sUnitType]
					end
				end
			end
			if iUnit ~= nil then InitUnitFromCity(pPlayer:GetCapitalCity(), iUnit, 1) end
		end
		
		save(pPlayer, "Decisions_HunsRecurveBow", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_HUNS, "Decisions_HunsRecurveBow", Decisions_HunsRecurveBow)

--------------------------------------------------------------------------------------------------------------------------
-- Zulu: Amabutho Conscription
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ZuluAmabutho = {}
    Decisions_ZuluAmabutho.Name = "TXT_KEY_DECISIONS_ZULUAMABUTHO"
	Decisions_ZuluAmabutho.Desc = "TXT_KEY_DECISIONS_ZULUAMABUTHO_DESC"
	HookDecisionCivilizationIcon(Decisions_ZuluAmabutho, "CIVILIZATION_ZULU")
	Decisions_ZuluAmabutho.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ZULU then return false, false end
		if load(pPlayer, "Decisions_ZuluAmabutho") == true then
			Decisions_ZuluAmabutho.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZULUAMABUTHO_ENACTED_DESC")
			return false, false, true
		end
		Decisions_ZuluAmabutho.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZULUAMABUTHO_DESC")
		local bPopMinimum = true
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if (pCity:GetPopulation() < 3) then bPopMinimum = false end
		end
		if not(bPopMinimum) then return true, false end 
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ZuluAmabutho.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		for pCity in pPlayer:Cities() do
			pCity:ChangePopulation(-1, true)
		end
		save(pPlayer, "Decisions_ZuluAmabutho", true)
	end
	)
	
	Decisions_ZuluAmabutho.tUnits = {}
	for row in GameInfo.Units("CombatClass = 'UNITCOMBAT_MELEE' OR CombatClass = 'UNITCOMBAT_GUN'") do
		Decisions_ZuluAmabutho.tUnits[row.Type] = row.Combat
	end
	
	Decisions_ZuluAmabutho.Monitors = {}
	Decisions_ZuluAmabutho.Monitors[GameEvents.SetPopulation] =  (
	function(iX, iY, iOldPop, iNewPop)
		if iNewPop < iOldPop then return end
		
		local pPlot				= Map.GetPlot(iX, iY)
		local pCity  			= pPlot:GetPlotCity()
		local iPlayer 			= pCity:GetOwner()
		local pPlayer			= Players[iPlayer]
		
		if load(pPlayer, "Decisions_ZuluAmabutho") ~= true then return end
		
		local iCity = CompileCityID(pCity)
		local iTime = load(pPlayer, "Decisions_ZuluAmabutho_" .. iCity)
		if iTime == nil then save(pPlayer, "Decisions_ZuluAmabutho_" .. iCity, 1) return end
		if iTime < 3 then save(pPlayer, "Decisions_ZuluAmabutho_" .. iCity, iTime + 1) return end
		
		local iUnit = nil
		for sUnitType, iCombat in pairs(tDecisions.Decisions_ZuluAmabutho.tUnits) do
			if pPlayer:CanTrain(GameInfoTypes[sUnitType]) then
				if iUnit == nil then
					iUnit = GameInfoTypes[sUnitType]
				elseif iCombat > GameInfo.Units[iUnit].Combat then
					iUnit = GameInfoTypes[sUnitType]
				end
			end
		end
		if iUnit ~= nil then InitUnitFromCity(pCity, iUnit, 1) end
		save(pPlayer, "Decisions_ZuluAmabutho_" .. iCity, 0)
		
		if pPlayer:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZULUAMABUTHO_NOTIFICATION", pCity:GetName()))
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ZULU, "Decisions_ZuluAmabutho", Decisions_ZuluAmabutho)

--------------------------------------------------------------------------------------------------------------------------
-- Zulu: Recruit Udibi
--------------------------------------------------------------------------------------------------------------------------

local Decisions_ZuluUdibi = {}
    Decisions_ZuluUdibi.Name = "TXT_KEY_DECISIONS_ZULUUDIBI"
	Decisions_ZuluUdibi.Desc = "TXT_KEY_DECISIONS_ZULUUDIBI_DESC"
	HookDecisionCivilizationIcon(Decisions_ZuluUdibi, "CIVILIZATION_ZULU")
	Decisions_ZuluUdibi.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_ZULU then return false, false end

		local iEra = load(pPlayer, "Decisions_ZuluUdibi")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_ZuluUdibi", nil)
			else
				Decisions_ZuluUdibi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZULUUDIBI_ENACTED_DESC")
				return false, false, true
			end
		end
		
		Decisions_ZuluUdibi.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZULUUDIBI_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		local bIkanda = true
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() == iPlayer) and not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_IKANDA))) then bIkanda = false end
		end
		if not(bIkanda) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_ZuluUdibi.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local iLand = GameInfoTypes.DOMAIN_LAND
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() and pUnit:GetDomainType() == iLand then
				pUnit:SetDamage(0)
				pUnit:ChangeExperience(10)
			end
		end
		
		save(pPlayer, "Decisions_ZuluUdibi", pPlayer:GetCurrentEra())
	end
	)
	
	Decisions_ZuluUdibi.Weight = (
	function(pPlayer) 
		return Teams[pPlayer:GetTeam()]:GetAtWarCount(false) > 0
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_ZULU, "Decisions_ZuluUdibi", Decisions_ZuluUdibi)