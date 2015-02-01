-- Great Britain Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Great British Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingNationalTreasuryID = GameInfoTypes["BUILDING_NATIONAL_TREASURY"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local policyEastIndiaCompanyID = GameInfoTypes["POLICY_JFD_EAST_INDIA_COMPANY"]
local techAstronomyID = GameInfoTypes["TECH_ASTRONOMY"]
-------------------------------------------------------------------------------------------------------------------------
-- Great Britain: Open Westminster Parliament
-------------------------------------------------------------------------------------------------------------------------
local Decisions_WestminsterParliament = {}
	Decisions_WestminsterParliament.Name = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_PARLIAMENT"
	Decisions_WestminsterParliament.Desc = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_PARLIAMENT_DESC"
	HookDecisionCivilizationIcon(Decisions_WestminsterParliament, "CIVILIZATION_JFD_GREAT_BRITAIN")
	Decisions_WestminsterParliament.CanFunc = (
	function(player)		
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		local era = load(player, "Decisions_WestminsterParliament")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_WestminsterParliament", nil)
			else
				Decisions_WestminsterParliament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_PARLIAMENT_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local nextPolicyCost = player:GetNextPolicyCost()
		local goldCost = mathCeil((nextPolicyCost * 1.5) * iMod)
		Decisions_WestminsterParliament.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_WESTMINSTER_PARLIAMENT_DESC", goldCost)
		
		if currentEra < eraMedievalID 								then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		
		return true, true
	end
	)
	
	Decisions_WestminsterParliament.DoFunc = (
	function(player)
		local nextPolicyCost = player:GetNextPolicyCost()
		local goldCost = mathCeil((nextPolicyCost * 1.5) * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		player:ChangeNumFreePolicies(1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_WESTMINSTER_PARLIAMENT")) 
		save(player, "Decisions_WestminsterParliament", player:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_WestminsterParliament", Decisions_WestminsterParliament)
-------------------------------------------------------------------------------------------------------------------------
-- Great Britain: Found the British East India Company
-------------------------------------------------------------------------------------------------------------------------
local Decisions_EastIndiaCompany = {}
	Decisions_EastIndiaCompany.Name = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EAST_INDIA_COMPANY"
	Decisions_EastIndiaCompany.Desc = "TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EAST_INDIA_COMPANY_DESC"
	HookDecisionCivilizationIcon(Decisions_EastIndiaCompany, "CIVILIZATION_JFD_GREAT_BRITAIN")
	Decisions_EastIndiaCompany.Weight = nil
	Decisions_EastIndiaCompany.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_EastIndiaCompany") == true then
			Decisions_EastIndiaCompany.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EAST_INDIA_COMPANY_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(200 * player:GetNumCities())
		Decisions_EastIndiaCompany.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_GREAT_BRITAIN_EAST_INDIA_COMPANY_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1		then return true, false end
		if player:GetGold() < goldCost 									then return true, false end
		if player:CountNumBuildings(buildingNationalTreasuryID) == 0 	then return true, false end

		local era = player:GetCurrentEra()
		if not(era >= eraIndustrialID) then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_EastIndiaCompany.DoFunc = (
	function(player)
		local goldCost = mathCeil(200 * player:GetNumCities())
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEastIndiaCompanyID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_VICTORIA_EAST_INDIA_COMPANY")) 
		save(player, "Decisions_EastIndiaCompany", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_EastIndiaCompany", Decisions_EastIndiaCompany)
--------------------------------------------------------------------------------------------------------------------------
-- England: Patronise the Virginia Company
--------------------------------------------------------------------------------------------------------------------------
local Decisions_EnglishVirginia = {}
	Decisions_EnglishVirginia.Name = "TXT_KEY_DECISIONS_ENGLISHVIRGINIA"
	Decisions_EnglishVirginia.Desc = "TXT_KEY_DECISIONS_ENGLISHVIRGINIA_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglishVirginia, "CIVILIZATION_JFD_ENGLAND")
	Decisions_EnglishVirginia.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JFD_ENGLAND then return false, false end
		if load(player, "Decisions_EnglishVirginia") == true then
			Decisions_EnglishVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHVIRGINIA_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(800 * iMod)
		Decisions_EnglishVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHVIRGINIA_DESC", goldCost)
		if player:GetGold() < goldCost								then return true, false end
		if not(Teams[player:GetTeam()]:IsHasTech(techAstronomyID))	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		return true, true
	end
	)
	
	Decisions_EnglishVirginia.DoFunc = (
	function(player)
		local goldCost = mathCeil(800 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ELIZABETH_VIRGINIA_COMPANY")) 
		save(player, "Decisions_EnglishVirginia", true)
	end
	)
	
	Decisions_EnglishVirginia.Monitors = {}
	Decisions_EnglishVirginia.Monitors[GameEvents.PlayerCityFounded] = (
	function(iPlayer, iCityX, iCityY)
		local player = Players[iPlayer]
		if load(player, "Decisions_EnglishVirginia") ~= true then return end
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
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_ENGLAND"], "Decisions_EnglishVirginia", Decisions_EnglishVirginia)
--------------------------------------------------------------------------------------------------------------------------
-- England: Create the Counter Armada
--------------------------------------------------------------------------------------------------------------------------
local Decisions_EnglishArmada = {}
	Decisions_EnglishArmada.Name = "TXT_KEY_DECISIONS_ENGLISHARMADA"
	Decisions_EnglishArmada.Desc = "TXT_KEY_DECISIONS_ENGLISHARMADA_DESC"
	HookDecisionCivilizationIcon(Decisions_EnglishArmada, "CIVILIZATION_JFD_ENGLAND")
	Decisions_EnglishArmada.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JFD_ENGLAND then return false, false end
		if load(player, "Decisions_EnglishArmada") == true then
			Decisions_EnglishArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHARMADA_ENACTED_DESC")
			return false, false, true
		end
		Decisions_EnglishArmada.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ENGLISHARMADA_DESC")
		if (player:GetCapitalCity() == nil) then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		local iNumUnits = 0
		for pUnit in player:Units() do
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and pUnit:IsCombatUnit()) then
				iNumUnits = iNumUnits + 1
			end
		end
		if iNumUnits < 5 then return true, false end
		return true, true
	end
	)
	
	Decisions_EnglishArmada.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ENGLISHARMADA, true)
		InitUnitFromCity(player:GetCapitalCity(), GameInfoTypes.UNIT_GREAT_ADMIRAL, 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ELIZABETH_ARMADA")) 
		save(player, "Decisions_EnglishArmada", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_ENGLAND"], "Decisions_EnglishArmada", Decisions_EnglishArmada)
--=======================================================================================================================
--=======================================================================================================================
