-- Decisions Support
-- Author: John -- template by JFD
-- DateCreated: 10/8/2014 7:56:32 PM
--------------------------------------------------------------
--=======================================================================================================================
print("Loading the Inuit Council's Decisions")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Inuit: Adopt Cable-Backed Bows
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLInuitAdoptCableBows = {}
	Decisions_CLInuitAdoptCableBows.Name = "TXT_KEY_DECISIONS_CLINUIT_ADOPTCABLEBOWS_NAME"
	Decisions_CLInuitAdoptCableBows.Desc = "TXT_KEY_DECISIONS_CLINUIT_ADOPTCABLEBOWS_DESC"
	HookDecisionCivilizationIcon(Decisions_CLInuitAdoptCableBows, "CIVILIZATION_CLINUIT")
	Decisions_CLInuitAdoptCableBows.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLINUIT) then return false, false end
		if load(pPlayer, "Decisions_CLInuitAdoptCableBows") == true then
			Decisions_CLInuitAdoptCableBows.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLINUIT_ADOPTCABLEBOWS_ADOPTED")
			return false, false, true
		end
		
		local iCost = math.ceil(300 * iMod)
		Decisions_CLInuitAdoptCableBows.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLINUIT_ADOPTCABLEBOWS_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		local iNtestines = (pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_WHALE, true) + pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_DEER, true))
		if not(iNtestines >= 3) then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_CLInuitAdoptCableBows.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(300 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		for pCity in pPlayer:Cities() do
			local pPlot = pCity:Plot()
			if pPlot:IsCoastalLand() then
				pCity:SetNumRealBuildings(GameInfoTypes.BUILDING_ACBWIDGETBIG, 1)
				local iGuts = 0
				for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
					local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
					if pSpecificPlot ~= nil then
						if pSpecificPlot:GetOwner() == pCity:GetOwner() then
							if pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_WHALE or pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_DEER then
								iGuts = iGuts + 1
							end
						end
					end
				end
				pCity:SetNumRealBuildings(GameInfoTypes.BUILDING_ACBWIDGETSMALL, iGuts)
			end
		end
		save(pPlayer, "Decisions_CLInuitAdoptCableBows", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CLINUIT"], "Decisions_CLInuitAdoptCableBows", Decisions_CLInuitAdoptCableBows)

function ModerateWhaleBows(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_CLINUIT then
		if Decisions_CLInuitAdoptCableBows then
			for pCity in pPlayer:Cities() do
				local pPlot = pCity:Plot()
				if (pCity ~= nil and pPlot:IsCoastalLand()) then
					pCity:SetNumRealBuildings(GameInfoTypes.BUILDING_ACBWIDGETBIG, 1)
					local iGuts = 0
					for pCityPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
						local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
						if pSpecificPlot ~= nil then
							if pSpecificPlot:GetOwner() == pCity:GetOwner() then
								if pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_WHALE or pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_DEER then
									iGuts = iGuts + 1
								end
							end
						end
					end
					pCity:SetNumRealBuildings(GameInfoTypes.BUILDING_ACBWIDGETSMALL, iGuts)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ModerateWhaleBows)
-------------------------------------------------------------------------------------------------------------------------
-- Inuit: Train Elite Snipers
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLInuitTrainEliteSnipers = {}
	Decisions_CLInuitTrainEliteSnipers.Name = "TXT_KEY_DECISIONS_CLINUIT_ELITESNIPERS_NAME"
	Decisions_CLInuitTrainEliteSnipers.Desc = "TXT_KEY_DECISIONS_CLINUIT_ELITESNIPERS_DESC"
	HookDecisionCivilizationIcon(Decisions_CLInuitTrainEliteSnipers, "CIVILIZATION_CLINUIT")
	Decisions_CLInuitTrainEliteSnipers.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CLINUIT) then return false, false end
		
		local iEra = load(pPlayer, "Decisions_CLInuitTrainEliteSnipers")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_CLInuitTrainEliteSnipers", nil)
			else
				Decisions_CLInuitTrainEliteSnipers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLINUIT_ELITESNIPERS_ADOPTED")
				return false, false, true
			end
		end
		
		local iCost = math.ceil(1000 * iMod)
		Decisions_CLInuitTrainEliteSnipers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CLINUIT_ELITESNIPERS_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		
		local iTeam = pPlayer:GetTeam()
		if Teams[iTeam]:IsHasTech(GameInfoTypes.TECH_REPLACEABLE_PARTS) then
			if Teams[iTeam]:GetDefensivePactCount() > 0 then return true, false
			end
		end
		
		return true, true
	end
	)
	
	Decisions_CLInuitTrainEliteSnipers.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(1000 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		local pCap = pPlayer:GetCapitalCity()
		local pPlot = pCap:GetPlot()
		local jUnit1 = pPlayer:InitUnit(GameInfoTypes.UNIT_GREAT_WAR_INFANTRY, pPlot:GetX(), pPlot:GetY());
		jUnit1:JumpToNearestValidPlot();
		local jUnit2 = pPlayer:InitUnit(GameInfoTypes.UNIT_GREAT_WAR_INFANTRY, pPlot:GetX(), pPlot:GetY());
		jUnit2:JumpToNearestValidPlot();
		local jUnit3 = pPlayer:InitUnit(GameInfoTypes.UNIT_GREAT_WAR_INFANTRY, pPlot:GetX(), pPlot:GetY());
		jUnit3:JumpToNearestValidPlot();
		save(pPlayer, "Decisions_CLInuitTrainEliteSnipers", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CLINUIT"], "Decisions_CLInuitTrainEliteSnipers", Decisions_CLInuitTrainEliteSnipers)
--=======================================================================================================================
--=======================================================================================================================