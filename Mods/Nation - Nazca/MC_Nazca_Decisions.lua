-- Nazca Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Nazca Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Nazca: Support the Craftsmen
-------------------------------------------------------------------------------------------------------------------------
local Decisions_NazcaCraftsmen = {}
    Decisions_NazcaCraftsmen.Name = "TXT_KEY_DECISIONS_NAZCACRAFTSMEN"
	Decisions_NazcaCraftsmen.Desc = "TXT_KEY_DECISIONS_NAZCACRAFTSMEN_DESC"
	HookDecisionCivilizationIcon(Decisions_NazcaCraftsmen, "CIVILIZATION_MC_NAZCA")
	Decisions_NazcaCraftsmen.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_NAZCA then return false, false end
		
		local pCapital = pPlayer:GetCapitalCity()
		if not(pCapital) then return end
		
		if load(pPlayer, "Decisions_NazcaCraftsmen") == true then
			Decisions_NazcaCraftsmen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NAZCACRAFTSMEN_ENACTED_DESC", pCapital:GetName())
			return false, false, true
		end
		
		local iCost = math.ceil(500 * iMod)
		Decisions_NazcaCraftsmen.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NAZCACRAFTSMEN_DESC", pCapital:GetName(), iCost)
		if (pPlayer:GetGold() < iCost) then	return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_CLASSICAL then return true, false end	
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_POTTERY)) then return true, false end		
		
		return true, true
	end
	)
	
	Decisions_NazcaCraftsmen.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(500 * iMod)	
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		save(pPlayer, "Decisions_NazcaCraftsmen", true)
	end
	)
	
	Decisions_NazcaCraftsmen.Monitors = {}
	Decisions_NazcaCraftsmen.Monitors[GameEvents.SetPopulation] =  (
	function(iX, iY, iOldPop, iNewPop)
		if iNewPop < iOldPop then return end
		
		local pPlot				= Map.GetPlot(iX, iY)
		local pCity  			= pPlot:GetPlotCity()
		
		if not(pCity:IsCapital()) then return end
		
		local iPlayer 			= pCity:GetOwner()
		local pPlayer			= Players[iPlayer]
		
		if load(pPlayer, "Decisions_NazcaCraftsmen") ~= true then return end
		
		local iCity = math.ceil(15 * iMod * pPlayer:GetNumCities())
		local iGeoglyph = math.ceil(5 * iMod * pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_GEOGLYPHS))
		
		pPlayer:ChangeJONSCulture(iCity + iGeoglyph)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_NAZCA, "Decisions_NazcaCraftsmen", Decisions_NazcaCraftsmen)
-------------------------------------------------------------------------------------------------------------------------
-- Nazca: Adopt the Trophy Head Practice
-------------------------------------------------------------------------------------------------------------------------
local Decisions_NazcaTrophyHead = {}
    Decisions_NazcaTrophyHead.Name = "TXT_KEY_DECISIONS_NAZCATROPHYHEAD"
	Decisions_NazcaTrophyHead.Desc = "TXT_KEY_DECISIONS_NAZCATROPHYHEAD_DESC"
	HookDecisionCivilizationIcon(Decisions_NazcaTrophyHead, "CIVILIZATION_MC_NAZCA")
	Decisions_NazcaTrophyHead.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_NAZCA then return false, false end
		if load(pPlayer, "Decisions_NazcaTrophyHead") == true then
			Decisions_NazcaTrophyHead.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NAZCATROPHYHEAD_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_NazcaTrophyHead.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NAZCATROPHYHEAD_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetTotalJONSCulturePerTurn() < 10) then return true, false end

		return true, true
	end
	)
	
	Decisions_NazcaTrophyHead.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_NazcaTrophyHead", true)
	end
	)
	
	Decisions_NazcaTrophyHead.Monitors = {}
	Decisions_NazcaTrophyHead.Monitors[GameEvents.UnitPrekill] =  (
	function(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)
	
		if not(iByPlayer) then return end
		if iPlayer == iByPlayer then return end
		
		local pPlot				= Map.GetPlot(iX, iY)
		local iPlotOwner  		= pPlot:GetOwner()
		local pPlayer			= Players[iPlotOwner]
		
		if load(pPlayer, "Decisions_NazcaTrophyHead") ~= true then return end
		
		local tUnit = GameInfo.Units[iUnitType]
		local iCombat = tUnit.Combat
		if iCombat < tUnit.RangedCombat then iCombat = tUnit.RangedCombat end
		if iCombat < 1 then return end
		
		pPlayer:ChangeGoldenAgeProgressMeter(iCombat)
	end
	)
	
	Decisions_NazcaTrophyHead.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if not(pPlayer:IsBarbarian()) then return end
		
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot()
			
			local iPlotOwner  		= pPlot:GetOwner()
			if iPlotOwner < 0 then return end
			
			local pPlotOwner		= Players[iPlotOwner]
			if load(pPlotOwner, "Decisions_NazcaTrophyHead") == true then
				pUnit:ChangeDamage(10, iPlotOwner)
			end			
		end
		
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_NAZCA, "Decisions_NazcaTrophyHead", Decisions_NazcaTrophyHead)
