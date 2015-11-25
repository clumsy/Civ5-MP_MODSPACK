--------------------------------------------------------------------------------------------------------------------------
-- Minoa: Hold Leaping Bull Festivals
--------------------------------------------------------------------------------------------------------------------------
local Decisions_MinoanBull = {}
    Decisions_MinoanBull.Name = "TXT_KEY_DECISIONS_MINOANBULL"
    Decisions_MinoanBull.Desc = "TXT_KEY_DECISIONS_MINOANBULL_DESC"
	HookDecisionCivilizationIcon(Decisions_MinoanBull, "CIVILIZATION_MC_MINOA")
	Decisions_MinoanBull.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_MINOA then return false, false end
		if load(pPlayer, "Decisions_MinoanBull") == true then
			Decisions_MinoanBull.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MINOANBULL_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(100 * iMod * (pPlayer:GetCurrentEra() + 1))
		
		local iBaseNum = 5 + pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_PASTURE)
		local iReward = math.ceil(10 * iMod * iBaseNum)
		
		Decisions_MinoanBull.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MINOANBULL_DESC", iCost, iReward, iBaseNum)
		
		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetExcessHappiness() < 1) then return true, false end
		if (Teams[pPlayer:GetTeam()]:GetAtWarCount(false) > 0) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ANIMAL_HUSBANDRY)) then return true, false end
		
		return true, true		
	end
	)
	
	Decisions_MinoanBull.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod * (pPlayer:GetCurrentEra() + 1))
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeGold(-iCost)
		
		local iBaseNum = 5 + pPlayer:GetImprovementCount(GameInfoTypes.IMPROVEMENT_PASTURE)
		local iReward = math.ceil(10 * iMod * iBaseNum)
		
		pPlayer:ChangeFaith(iReward)
		pPlayer:ChangeGoldenAgeTurns(iBaseNum)
	
		save(pPlayer, "Decisions_MinoanBull", true)
	end
	)
	
	Decisions_MinoanBull.Monitors = {}
	Decisions_MinoanBull.Monitors[LuaEvents.PlayerEnteredNewEra] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if load(pPlayer, "Decisions_MinoanBull") then
			save(pPlayer, "Decisions_MinoanBull", false)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_MINOA, "Decisions_MinoanBull", Decisions_MinoanBull)

--------------------------------------------------------------------------------------------------------------------------
-- Minoa: Construct the Great Labyrinth
--------------------------------------------------------------------------------------------------------------------------
local Decisions_MinoanLabyrinth = {}
    Decisions_MinoanLabyrinth.Name = "TXT_KEY_DECISIONS_MINOANLABYRINTH"
	Decisions_MinoanLabyrinth.Desc = "TXT_KEY_DECISIONS_MINOANLABYRINTH_DESC"
	Decisions_MinoanLabyrinth.Pedia = "TXT_KEY_BUILDING_DECISIONS_MINOANLABYRINTH"
	HookDecisionCivilizationIcon(Decisions_MinoanLabyrinth, "CIVILIZATION_MC_MINOA")
	Decisions_MinoanLabyrinth.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_MINOA then return false, false end
		if load(pPlayer, "Decisions_MinoanLabyrinth") == true then
			Decisions_MinoanLabyrinth.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MINOANLABYRINTH_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(350 * iMod)
		
		Decisions_MinoanLabyrinth.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_MINOANLABYRINTH_DESC", iCost)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if not(pPlayer:GetCapitalCity()) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetNumCities() > pPlayer:CountNumBuildings(GameInfoTypes.BUILDING_MC_MINOAN_ANAKTORA)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MinoanLabyrinth.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(350 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		local pCity = pPlayer:GetCapitalCity()
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_MINOANLABYRINTH, 1)
		
		save(pPlayer, "Decisions_MinoanLabyrinth", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_MINOA, "Decisions_MinoanLabyrinth", Decisions_MinoanLabyrinth)

