-- Decisions Support
-- Author: John -- template by JFD
-- DateCreated: 10/8/2014 7:56:32 PM
--------------------------------------------------------------
--=======================================================================================================================
print("Loading the Blackfoot Confederacy's Decisions")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Blackfoot: Honor the Warrior Society
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLHonorWarriorSociety = {}
	Decisions_CLHonorWarriorSociety.Name = "TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_HONORWARRIORSOCIETY_NAME"
	Decisions_CLHonorWarriorSociety.Desc = "TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_HONORWARRIORSOCIETY_DESC"
	HookDecisionCivilizationIcon(Decisions_CLHonorWarriorSociety, "CIVILIZATION_BLACKFOOTFIRSTNATION")
	Decisions_CLHonorWarriorSociety.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION) then return false, false end
		if load(pPlayer, "Decisions_CLHonorWarriorSociety") == true then
			Decisions_CLHonorWarriorSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_HONORWARRIORSOCIETY_ADOPTED")
			return false, false, true
		end
		
		Decisions_CLHonorWarriorSociety.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_HONORWARRIORSOCIETY_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_GUILDS) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end

		return true, true
	end
	)
	
	Decisions_CLHonorWarriorSociety.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_CLHonorWarriorSociety", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BLACKFOOTFIRSTNATION"], "Decisions_CLHonorWarriorSociety", Decisions_CLHonorWarriorSociety)

function HonorExplosion(player, unit)
	local pPlayer = Players[player]
	local pUnit = pPlayer:GetUnitByID(unit)
	if load(pPlayer, "Decisions_CLHonorWarriorSociety") == true then
		local iBonus = pUnit:GetLevel()
		local iCulture = math.ceil(iBonus * 2.25 * iMod)
		local iGolden = math.ceil(iBonus * 3.5 * iMod)
		if pPlayer:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_HONORWARRIORSOCIETY_NOTIFICATION", pUnit:GetName(), iCulture, iGolden))
		end
	end
end
GameEvents.UnitPromoted.Add(HonorExplosion)

--=======================================================================================================================
-- Blackfoot: Preserve the Buffalo
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLPreserveBuffalo = {}
	Decisions_CLPreserveBuffalo.Name = "TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_PRESERVEBUFFALO_NAME"
	Decisions_CLPreserveBuffalo.Desc = "TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_PRESERVEBUFFALO_DESC"
	HookDecisionCivilizationIcon(Decisions_CLPreserveBuffalo, "CIVILIZATION_BLACKFOOTFIRSTNATION")
	Decisions_CLPreserveBuffalo.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BLACKFOOTFIRSTNATION) then return false, false end
		if load(pPlayer, "Decisions_CLPreserveBuffalo") == true then
			Decisions_CLPreserveBuffalo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_PRESERVEBUFFALO_ADOPTED")
			return false, false, true
		end
		
		Decisions_CLPreserveBuffalo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BLACKFOOTFIRSTNATION_PRESERVEBUFFALO_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		print("Bison number: " .. pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_BISON))
		if (pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_BISON, false) == 0) or ((pPlayer:GetNumResourceTotal(GameInfoTypes.RESOURCE_BISON) * 10) > pPlayer:GetTotalPopulation()) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end

		return true, true
	end
	)
	
	Decisions_CLPreserveBuffalo.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_CLPreserveBuffalo", true)
	end
	)
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BLACKFOOTFIRSTNATION"], "Decisions_CLPreserveBuffalo", Decisions_CLPreserveBuffalo)

function PreserveBuffalo(player)
	local pPlayer = Players[player]
	if load(pPlayer, "Decisions_CLPreserveBuffalo") == true then
		for pCity in pPlayer:Cities() do
			for pCityPlot = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pSpecificPlot = pCity:GetCityIndexPlot(pCityPlot)
				if pSpecificPlot:GetResourceType(-1) == GameInfoTypes.RESOURCE_BISON then
					pSpecificPlot:SetResourceType(GameInfoTypes.RESOURCE_PRESERVEDBISON, 1)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(PreserveBuffalo)