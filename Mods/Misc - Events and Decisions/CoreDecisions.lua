-- Core Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Core Decisions: loaded")

--=======================================================================================================================
-- General Decisions
--=======================================================================================================================
-- Tax Reform
--------------------------------------------------------------------------------------------------------------------------

local Decisions_TaxReform = {}
	Decisions_TaxReform.Name = "TXT_KEY_DECISIONS_TAXREFORM"
	Decisions_TaxReform.Desc = "TXT_KEY_DECISIONS_TAXREFORM_DESC"
	Decisions_TaxReform.Weight = 0
	Decisions_TaxReform.CanFunc = (
	function(pPlayer)		
	
		local iEra = load(pPlayer, "Decisions_TaxReform")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_TaxReform", nil)
			else
				Decisions_TaxReform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAXREFORM_ENACTED_DESC")
				return false, false, true
			end
		end
		if pPlayer:GetNumCities() < 1 then
			return false, false
		end
		
		local iCost = math.ceil(pPlayer:GetTotalPopulation() * 5 * iMod)
		local iReward = math.ceil(pPlayer:GetTotalPopulation() * 15 * iMod)
		Decisions_TaxReform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TAXREFORM_DESC", iCost, iReward)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		if iCurrentEra == GameInfoTypes.ERA_ANCIENT then
			return true, false
		end
		
		if pPlayer:GetJONSCulture() >= iCost then
			return true, true
		else 
			return true, false
		end
	end
	)
	
	Decisions_TaxReform.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(pPlayer:GetTotalPopulation() * 5 * iMod)
		local iReward = math.ceil(pPlayer:GetTotalPopulation() * 15 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeGold(iReward)
		save(pPlayer, "Decisions_TaxReform", pPlayer:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_TaxReform"] = Decisions_TaxReform

--------------------------------------------------------------------------------------------------------------------------
-- Formalize Scales, Weights and Measures
--------------------------------------------------------------------------------------------------------------------------

local Decisions_WeightsFormal = {}
	Decisions_WeightsFormal.Name = "TXT_KEY_DECISIONS_WEIGHTSFORMAL"
	Decisions_WeightsFormal.Desc = "TXT_KEY_DECISIONS_WEIGHTSFORMAL_DESC"
	Decisions_WeightsFormal.CanFunc = (
	function(pPlayer)
		if load(pPlayer, "Decisions_WeightsFormal") == true then
			Decisions_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_WEIGHTSFORMAL_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(300 * iMod)
		Decisions_WeightsFormal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_WEIGHTSFORMAL_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MATHEMATICS)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_WeightsFormal.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_WEIGHTSFORMAL, 1)
		end
		save(pPlayer, "Decisions_WeightsFormal", true)
	end
	)

	Decisions_WeightsFormal.Monitors = {}
	Decisions_WeightsFormal.Monitors[GameEvents.PlayerCityFounded] = (	
	function(iOwner, iCityX, iCityY)
		local pPlayer = Players[iOwner]
		local pCity = (Map.GetPlot(iCityX, iCityY):GetPlotCity())
		if load(pPlayer, "Decisions_WeightsFormal") == true then
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_WEIGHTSFORMAL, 1)
		else
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_WEIGHTSFORMAL, 0)
		end
	end
	)
	
	Decisions_WeightsFormal.Monitors[GameEvents.CityCaptureComplete] = (	
	function (iOldOwner, bIsCapital, iCityX, iCityY, iOwner, iPop, bConquest)
		Decisions_WeightsFormal.Monitors[GameEvents.PlayerCityFounded](iOwner, iCityX, iCityY)
	end
	)

tDecisions["Decisions_WeightsFormal"] = Decisions_WeightsFormal

-------------------------------------------------------------------------------------------------------------------------
-- Invite Great Person
-------------------------------------------------------------------------------------------------------------------------

local Decisions_InviteGreatPerson = {}
	Decisions_InviteGreatPerson.Name = "TXT_KEY_DECISIONS_INVITEGREATPERSON"
	Decisions_InviteGreatPerson.Desc = "TXT_KEY_DECISIONS_INVITEGREATPERSON_DESC"
	Decisions_InviteGreatPerson.CanFunc = (
	function(pPlayer)
	
		local iEra = load(pPlayer, "Decisions_InviteGreatPerson")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_InviteGreatPerson", nil)
			else
				Decisions_InviteGreatPerson.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INVITEGREATPERSON_ENACTED_DESC")
				return false, false, true
			end
		end
		if iCurrentEra < GameInfoTypes.ERA_CLASSICAL then return false, false end
		if pPlayer:GetNumCities() < 1 then
			return false, false
		end
		
		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		Decisions_InviteGreatPerson.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_INVITEGREATPERSON_DESC", iCost)
		if (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_InviteGreatPerson.DoFunc = (
	function(pPlayer)
		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		local tGreatPeople = {}
		local tInclude = {["UNITCLASS_SCIENTIST"] = 1, ["UNITCLASS_ENGINEER"] = 1, ["UNITCLASS_MERCHANT"] = 1, ["UNITCLASS_GREAT_GENERAL"] = 1}
		for sKey, iVal in pairs(tInclude) do
			iUnit = GameInfoTypes[JFD_GetUniqueUnit(pPlayer, sKey)]
			table.insert(tGreatPeople, iUnit)
		end
		
		local pPlot = pPlayer:GetCapitalCity():Plot()
		pPlayer:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], pPlot:GetX(), pPlot:GetY())
		
		save(pPlayer, "Decisions_InviteGreatPerson", pPlayer:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_InviteGreatPerson"] = Decisions_InviteGreatPerson

-------------------------------------------------------------------------------------------------------------------------
-- Promote the Arts
-------------------------------------------------------------------------------------------------------------------------

local Decisions_PromoteTheArts = {}
	Decisions_PromoteTheArts.Name = "TXT_KEY_DECISIONS_PROMOTETHEARTS"
	Decisions_PromoteTheArts.Desc = "TXT_KEY_DECISIONS_PROMOTETHEARTS_DESC"
	Decisions_PromoteTheArts.CanFunc = (
	function(pPlayer)
	
		local iEra = load(pPlayer, "Decisions_PromoteTheArts")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_PromoteTheArts", nil)
			else
				Decisions_PromoteTheArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PROMOTETHEARTS_ENACTED_DESC")
				return false, false, true
			end
		end
		if iCurrentEra < GameInfoTypes.ERA_CLASSICAL then return false, false end
		if pPlayer:GetNumCities() < 1 then
			return false, false
		end
		
		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		Decisions_PromoteTheArts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PROMOTETHEARTS_DESC", iCost)
		if (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_PromoteTheArts.DoFunc = (
	function(pPlayer)
		local iCurrentEra = pPlayer:GetCurrentEra()
		local iCost = math.ceil((iCurrentEra + 1) * 250 * iMod)
		pPlayer:ChangeGold(-iCost)
		
		local tGreatPeople = {}
		local tInclude = {}
		tInclude.UNITCLASS_WRITER = 1
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS)) then tInclude.UNITCLASS_ARTIST = 1 end
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ACOUSTICS)) then tInclude.UNITCLASS_MUSICIAN = 1 end
		for sKey, iVal in pairs(tInclude) do
			iUnit = GameInfoTypes[JFD_GetUniqueUnit(pPlayer, sKey)]
			table.insert(tGreatPeople, iUnit)
		end
		local pPlot = pPlayer:GetCapitalCity():Plot()
		pPlayer:InitUnit(tGreatPeople[GetRandom(1, #tGreatPeople)], pPlot:GetX(), pPlot:GetY())
		
		save(pPlayer, "Decisions_PromoteTheArts", pPlayer:GetCurrentEra())
	end
	)
	
tDecisions["Decisions_PromoteTheArts"] = Decisions_PromoteTheArts

-------------------------------------------------------------------------------------------------------------------------
-- Compile Code of Laws
-------------------------------------------------------------------------------------------------------------------------

local Decisions_CodeOfLaws = {}
	Decisions_CodeOfLaws.Name = "TXT_KEY_DECISIONS_CODEOFLAWS"
	Decisions_CodeOfLaws.Desc = "TXT_KEY_DECISIONS_CODEOFLAWS_DESC"
	Decisions_CodeOfLaws.Pedia = "TXT_KEY_DECISIONS_BUILDING_CODEOFLAWS"
	Decisions_CodeOfLaws.CanFunc = (
	function(pPlayer)
		if load(pPlayer, "Decisions_CodeOfLaws") == true then
			Decisions_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CODEOFLAWS_ENACTED_DESC")
			return false, false, true
		end
		local iCost = math.ceil(200 * iMod)
		Decisions_CodeOfLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CODEOFLAWS_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_PHILOSOPHY)) and (pPlayer:GetJONSCulture() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_CodeOfLaws.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(200 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CODEOFLAWS, 1)
		save(pPlayer, "Decisions_CodeOfLaws", true)
	end
	)
	
tDecisions.Decisions_CodeOfLaws = Decisions_CodeOfLaws

-------------------------------------------------------------------------------------------------------------------------
-- Nationalise the Utilities
-------------------------------------------------------------------------------------------------------------------------

local Decisions_NationaliseUtilities = {}
	Decisions_NationaliseUtilities.Name = "TXT_KEY_DECISIONS_NATIONALISEUTILITIES"
	Decisions_NationaliseUtilities.Desc = "TXT_KEY_DECISIONS_NATIONALISEUTILITIES_DESC"
	Decisions_NationaliseUtilities.CanFunc = (
	function(pPlayer)
		if load(pPlayer, "Decisions_NationaliseUtilities") == true then
			Decisions_NationaliseUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NATIONALISEUTILITIES_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(300 * iMod)
		local iTurns = math.ceil(5 * iGAMod)
		Decisions_NationaliseUtilities.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NATIONALISEUTILITIES_DESC", iCost, iTurns)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_INDUSTRIALIZATION)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_NationaliseUtilities.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		local iTurns = math.ceil(5 * iGAMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_NATIONALISEUTILITIES, 1)
		pPlayer:GetCapitalCity():ChangeResistanceTurns(iTurns)
		save(pPlayer, "Decisions_NationaliseUtilities", true)
	end
	)

	Decisions_NationaliseUtilities.Monitors = {}
	Decisions_NationaliseUtilities.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_NationaliseUtilities") == true then
			pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_NATIONALISEUTILITIES, 1)
		end
	end
	)
	
tDecisions.Decisions_NationaliseUtilities = Decisions_NationaliseUtilities

--------------------------------------------------------------------------------------------------------------------------
-- Subsidise Public Transport
--------------------------------------------------------------------------------------------------------------------------

local Decisions_PublicTransport = {}
	Decisions_PublicTransport.Name = "TXT_KEY_DECISIONS_PUBLICTRANSPORT"
	Decisions_PublicTransport.Desc = "TXT_KEY_DECISIONS_PUBLICTRANSPORT_DESC"
	Decisions_PublicTransport.CanFunc = (
	function(pPlayer)
		--Generate Decisions
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_STEAM_POWER)) then return end
		
		for pCity in pPlayer:Cities() do
			if (pCity:GetPopulation() > 19 or pCity:IsCapital()) then
				local sKey = "Decisions_PublicTransport" .. CompileCityID(pCity)
				local sName = pCity:GetName()
				
				local sNote = ""
				if (pCity:IsCapital()) then sNote = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PUBLICTRANSPORT_NOTE") end
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PUBLICTRANSPORT", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_PUBLICTRANSPORT_DESC"
				tTempDecisions[sKey].Pedia = "TXT_KEY_DECISIONS_BUILDING_PUBLICTRANSPORT"
				tTempDecisions[sKey].Data1 = pCity
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_PublicTransport" .. CompileCityID(pCity)
					local sName = pCity:GetName()

					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PUBLICTRANSPORT_ENACTED_DESC", sName, sNote)
						return false, false, true
					end
					
					if pCity:IsHasBuilding(GameInfoTypes.BUILDING_DECISIONS_PUBLICTRANSPORT) then return false, false end
					
					local iCost = math.ceil(pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_FACTORY) * 1.5)
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PUBLICTRANSPORT_DESC", sName, iCost, sNote)
					if (pPlayer:GetGold() < iCost) then	return true, false end
					
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_PublicTransport" .. CompileCityID(pCity)
					local iCost = math.ceil(pCity:GetBuildingPurchaseCost(GameInfoTypes.BUILDING_FACTORY) * 1.5)
					local iTurns = math.ceil(20 * iGAMod)
					pCity:ChangeWeLoveTheKingDayCounter(iTurns)
					pPlayer:ChangeGold(-iCost)
					pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_PUBLICTRANSPORT, 1)
					
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)

	
tDecisions.Decisions_PublicTransport = Decisions_PublicTransport

--------------------------------------------------------------------------------------------------------------------------
--Set Up a Universities Funding Council
--------------------------------------------------------------------------------------------------------------------------

local Decisions_UniversityGrants = {}
	Decisions_UniversityGrants.Name = "TXT_KEY_DECISIONS_UNIVERSITYGRANTS"
	Decisions_UniversityGrants.Desc = "TXT_KEY_DECISIONS_UNIVERSITYGRANTS_DESC"
	Decisions_UniversityGrants.CanFunc = (
	function(pPlayer)
		if load(pPlayer, "Decisions_UniversityGrants") == true then
			Decisions_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UNIVERSITYGRANTS_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(600 * iMod)
		Decisions_UniversityGrants.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UNIVERSITYGRANTS_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		if (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHAEOLOGY)) and (pPlayer:GetGold() >= iCost) then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_UniversityGrants.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(600 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-iCost)
		local pCity = pPlayer:GetCapitalCity()
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_UNIVERSITYGRANTS, 1)
		InitUnitFromCity(pCity, GameInfoTypes.UNIT_ARCHAEOLOGIST, 2)
		save(pPlayer, "Decisions_UniversityGrants", true)
	end
	)
	
tDecisions.Decisions_UniversityGrants = Decisions_UniversityGrants

--------------------------------------------------------------------------------------------------------------------------
-- Establish a National Language Council
--------------------------------------------------------------------------------------------------------------------------