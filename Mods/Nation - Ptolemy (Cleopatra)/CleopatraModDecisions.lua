--========================================================================================================================
-- Civ Specific Decisions
--========================================================================================================================
--========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
 local civilisationID = GameInfoTypes["CIVILIZATION_LITE_TARCISIO_PTOLEMIES"]
--========================================================================================================================
--========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Decisions_Lite_Tarcisio_Ptolemies_Calendar
--------------------------------------------------------------------------------------------------------------------------
local Decisions_Lite_Tarcisio_Ptolemies_Calendar = {}
	Decisions_Lite_Tarcisio_Ptolemies_Calendar.Name = "TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_CALENDAR"
	Decisions_Lite_Tarcisio_Ptolemies_Calendar.Desc = "TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_CALENDAR_DESC"
	HookDecisionCivilizationIcon(Decisions_Lite_Tarcisio_Ptolemies_Calendar, civilisationID)
	Decisions_Lite_Tarcisio_Ptolemies_Calendar.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationID) then return false, false end
		if load(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Calendar") == true then
			Decisions_Lite_Tarcisio_Ptolemies_Calendar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_CALENDAR_ENACTED_DESC")
			return false, false, true
		end

		local iCurrentEra = pPlayer:GetCurrentEra()
		local gold = math.ceil((iCurrentEra + 1) * 150 * iMod)
		Decisions_Lite_Tarcisio_Ptolemies_Calendar.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_CALENDAR_DESC", gold)

		local numLibraries = pPlayer:CountNumBuildings(GameInfoTypes["BUILDING_LIBRARY"])
		if (numLibraries < 3) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < gold) then return true, false end

		return true, true
	end
	)
       
	Decisions_Lite_Tarcisio_Ptolemies_Calendar.DoFunc = (
	function(pPlayer)
		local iCurrentEra = pPlayer:GetCurrentEra()
		local gold = math.ceil((iCurrentEra + 1) * 150 * iMod)

		pPlayer:ChangeGold(-gold)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		local capitalX = pPlayer:GetCapitalCity():GetX()
		local capitalY = pPlayer:GetCapitalCity():GetY()
		pPlayer:InitUnit(GameInfoTypes["UNIT_SCIENTIST"], capitalX, capitalY)

		save(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Calendar", true)
	end
	)
       
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Lite_Tarcisio_Ptolemies_Calendar", Decisions_Lite_Tarcisio_Ptolemies_Calendar)
--------------------------------------------------------------------------------------------------------------------------
-- Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help
--------------------------------------------------------------------------------------------------------------------------
local Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help = {}
	Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.Name = "TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_EMPLOY_FOREIGN_HELP"
	Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.Desc = "TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_EMPLOY_FOREIGN_HELP_DESC"
	HookDecisionCivilizationIcon(Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help, civilisationID)
	Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationID) then return false, false end
		local numTimesEnacted = load(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help")
		if numTimesEnacted == nil then
			numTimesEnacted = 0
		end
		if numTimesEnacted >= 2 then
			Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_EMPLOY_FOREIGN_HELP_ENACTED_DESC")
			return false, false, true
		end
		local era = load(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help_Era")
		local currentEra = pPlayer:GetCurrentEra()
		if era ~= nil then
			if not(era < currentEra) then
				Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_EMPLOY_FOREIGN_HELP_ENACTED_DESC")
				return false, false, true
			end
		end

		local numEmbassies = 0
		local teamID = pPlayer:GetTeam()
		local team = Teams[teamID]
		for aPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local otherPlayer = Players[aPlayer]
			local otherTeamID = otherPlayer:GetTeam()
			local otherTeam = Teams[otherTeamID]
			if team:HasEmbassyAtTeam(otherTeamID) then
				numEmbassies = numEmbassies + 1
			end
		end

		local numUnits = math.ceil(numEmbassies * 0.40)
		local numExp = math.ceil((numEmbassies / 2) * 5)

		local iCurrentEra = pPlayer:GetCurrentEra()
		local gold = math.ceil((iCurrentEra + 1) * 250 * iMod)
		Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LITE_TARCISIO_PTOLEMIES_EMPLOY_FOREIGN_HELP_DESC", gold, numUnits, numExp)

		if (numEmbassies < 5) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < gold) then return true, false end

		return true, true
	end
	)
       
	Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help.DoFunc = (
	function(pPlayer)
		local iCurrentEra = pPlayer:GetCurrentEra()
		local gold = math.ceil((iCurrentEra + 1) * 250 * iMod)

		pPlayer:ChangeGold(-gold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local numEmbassies = 0
		local teamID = pPlayer:GetTeam()
		local team = Teams[teamID]
		for aPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local otherPlayer = Players[aPlayer]
			local otherTeamID = otherPlayer:GetTeam()
			local otherTeam = Teams[otherTeamID]
			if team:HasEmbassyAtTeam(otherTeamID) then
				numEmbassies = numEmbassies + 1
			end
		end

		local numUnits = math.ceil(numEmbassies * 0.40)
		local numExp = math.ceil((numEmbassies / 2) * 5)

		local tcmunit1 = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]
		local tcmunit2 = GameInfoTypes["UNIT_INFANTRY"]
		local tcmunit3 = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
		local tcmunit4 = GameInfoTypes["UNIT_RIFLEMAN"]
		local tcmunit5 = GameInfoTypes["UNIT_MUSKETMAN"]
		local tcmunit6 = GameInfoTypes["UNIT_PIKEMAN"]
		local tcmunit7 = GameInfoTypes["UNIT_SPEARMAN"]
		local tcmunit8 = GameInfoTypes["UNIT_WARRIOR"]

		local tcmunitList = {
			tcmunit1,
			tcmunit2,
			tcmunit3,
			tcmunit4,
			tcmunit5,
			tcmunit6,
			tcmunit7,
			tcmunit8
			}

		local militaryUnit
		for _, unitID in ipairs(tcmunitList) do
			if pPlayer:CanTrain(unitID) then
				militaryUnit = unitID
				break
			end
		end
		
		local capitalX = pPlayer:GetCapitalCity():GetX()
		local capitalY = pPlayer:GetCapitalCity():GetY()

		for potato = 0, numUnits -1, 1 do
			pPlayer:InitUnit(militaryUnit, capitalX, capitalY):ChangeExperience(numExp)
		end

		local capital = pPlayer:GetCapitalCity()
		local plot = capital:Plot()
		for i = 0, plot:GetNumUnits() - 1, 1 do
			local otherUnit = plot:GetUnit(i)
			if otherUnit and otherUnit:IsCombatUnit() then  
				otherUnit:JumpToNearestValidPlot()
			end
		end
		
		local numTimes = load(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Calendar") 
		if numTimes == nil then
			numTimes = 0
		end
		numTimes = numTimes + 1

		save(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help", numTimes)
		save(pPlayer, "Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help_Era", iCurrentEra)
	end
	)
       
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help", Decisions_Lite_Tarcisio_Ptolemies_Employ_Foreign_Help)
--========================================================================================================================
--========================================================================================================================