-- JFD_MilanDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Milan Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetMercenaryUnit
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetMercenaryUnit(playerID)
	local currentEra = Players[playerID]:GetCurrentEra()
	local meleeCount = 0
	local meleeUnits = {}
	local meleeUnit
	local mountedCount = 0
	local mountedUnits = {}
	local mountedUnit
	local rangedCount = 0
	local rangedUnits = {} 
	local rangedUnit
	if load(player, "MainMercenary") ~= nil then return end
	
	for unit in GameInfo.Units() do
		if unit.CombatClass == "UNITCOMBAT_ARCHER" then
			if unit.PrereqTech then
				local eraType = GameInfo.Technologies[unit.PrereqTech].Era
				local eraID = GameInfoTypes[eraType]
				if eraID == currentEra then
					print(unit.Type)
					rangedUnits[rangedCount] = unit
					rangedCount = rangedCount + 1
				end
			end
		elseif (unit.CombatClass == "UNITCOMBAT_MELEE" or unit.CombatClass == "UNITCOMBAT_GUN") then
			if unit.PrereqTech then
				local eraType = GameInfo.Technologies[unit.PrereqTech].Era
				local eraID = GameInfoTypes[eraType]
				if eraID == currentEra then
					meleeUnits[meleeCount] = unit
					meleeCount = meleeCount + 1
				end
			end
		elseif (unit.CombatClass == "UNITCOMBAT_MOUNTED" or unit.CombatClass == "UNITCOMBAT_ARMOR") then
			if unit.PrereqTech then
				local eraType = GameInfo.Technologies[unit.PrereqTech].Era
				local eraID = GameInfoTypes[eraType]
				if eraID == currentEra then
					mountedUnits[mountedCount] = unit
					mountedCount = mountedCount + 1
				end
			end
		end
	end

	meleeUnit = meleeUnits[JFD_GetRandom(1, #meleeUnits)]
	altMeleeUnit = meleeUnits[JFD_GetRandom(1, #meleeUnits)]
	mountedUnit = mountedUnits[JFD_GetRandom(1, #mountedUnits)]
	rangedUnit = rangedUnits[JFD_GetRandom(1, #rangedUnits)]

	return meleeUnit, altMeleeUnit, mountedUnit, rangedUnit
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumCityStateFriends
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumCityStateFriends(playerID)
	local numCSFriends = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:GetCapitalCity() and minorCiv:IsAlive()) then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1 then
				numCSFriends = numCSFriends + 1
			end
		end
	end

	return numCSFriends
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
local buildingMilanInvestmentsID = GameInfoTypes["BUILDING_JFD_MILAN_INVESTMENTS"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local policyAmbrosianRepublicID = GameInfoTypes["POLICY_JFD_MILAN_AMBROSIAN_REPUBLIC"]
local policyMachiavelliID = GameInfoTypes["POLICY_JFD_MILAN_MACHIAVELLI"]
local promotionForeignLandsID = GameInfoTypes["PROMOTION_FOREIGN_LANDS"]
-------------------------------------------------------------------------------------------------------------------------
-- Milan: Hire Mercenaries
-------------------------------------------------------------------------------------------------------------------------
local Decisions_MilanHireMercenaries = {}
	Decisions_MilanHireMercenaries.Name = "TXT_KEY_DECISIONS_JFD_MILAN_HIRE_MERCENARIES"
	Decisions_MilanHireMercenaries.Desc = "TXT_KEY_DECISIONS_JFD_MILAN_HIRE_MERCENARIES_DESC"
	HookDecisionCivilizationIcon(Decisions_MilanHireMercenaries, "CIVILIZATION_JFD_MILAN")
	Decisions_MilanHireMercenaries.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID	then return false, false end
		if player:HasPolicy(policyMachiavelliID)			then return false, false end
		
		local currentEra = player:GetCurrentEra()
		local mercenaryEra = load(player, "MainMercenaryEra")
		if not (mercenaryEra) then
			save(player, "MainMercenaryEra", currentEra)
		elseif mercenaryEra < currentEra then
			save(player, "MainMercenary", nil)
			save(player, "SecondaryMercenary", nil)
			save(player, "MainMercenaryEra", currentEra)
		end

		local era = load(player, "Decisions_MilanHireMercenaries")
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_MilanHireMercenaries", nil)
				save(player, "MainMercenary", nil)
				save(player, "SecondaryMercenary", nil)
			else
				Decisions_MilanHireMercenaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_HIRE_MERCENARIES_ENACTED_DESC")
				return false, false, true
			end
		end
		
		if (not (load(player, "MainMercenary")) and not (load(player, "SecondaryMercenary"))) then
			local meleeUnit, altMeleeUnit, mountedUnit, rangedUnit = JFD_GetMercenaryUnit(player:GetID())
			local mainMercenary = meleeUnit
			local secondaryMercenary = rangedUnit or altMeleeUnit
			if (mountedUnit and JFD_GetRandom(1,3) == 3) then mainMercenary = mountedUnit end

			print(meleeUnit, mountedUnit, rangedUnit)
			print(mainMercenary, secondaryMercenary)
			save(player, "MainMercenary", mainMercenary.Type)
			save(player, "SecondaryMercenary", secondaryMercenary.Type)
		end
		
		mainMercenary = GameInfo.Units[load(player, "MainMercenary")]
		secondaryMercenary = GameInfo.Units[load(player, "SecondaryMercenary")]
		local costReduction = (player:CountNumBuildings(buildingMilanInvestmentsID) * 5)
		local goldCost = mathCeil(mainMercenary.Cost + (secondaryMercenary.Cost *2))
		goldCost = mathCeil(goldCost - (goldCost * costReduction/100)) + (200 * iMod)
		Decisions_MilanHireMercenaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_HIRE_MERCENARIES_DESC", goldCost, mainMercenary.Description, secondaryMercenary.Description)
		
		if JFD_GetNumCityStateFriends(player:GetID()) == 0	then return true, false end
		if player:GetGold() < goldCost						then return true, false end

		return true, true
	end
	)
	
	Decisions_MilanHireMercenaries.DoFunc = (
	function(player)
		local mainMercenary = GameInfo.Units[load(player, "MainMercenary")]
		local secondaryMercenary = GameInfo.Units[load(player, "SecondaryMercenary")]
		local costReduction = (player:CountNumBuildings(buildingMilanInvestmentsID) * 5)
		local goldCost = mathCeil(mainMercenary.Cost + (secondaryMercenary.Cost *2))
		goldCost = mathCeil(goldCost - (goldCost * costReduction/100)) + (200 * iMod)
		player:ChangeGold(-goldCost)

		local capitalX = player:GetCapitalCity():GetX() + 1
		local capitalY = player:GetCapitalCity():GetY() + 1
		local unitOne = player:InitUnit(mainMercenary.ID, capitalX, capitalY)
		local unitTwo = player:InitUnit(secondaryMercenary.ID, capitalX, capitalY)
		local unitThree = player:InitUnit(secondaryMercenary.ID, capitalX, capitalY)
		unitOne:SetName("Mercenary")
		unitOne:SetHasPromotion(promotionForeignLandsID, true)
		unitOne:JumpToNearestValidPlot()
		unitTwo:SetName("Mercenary")
		unitTwo:SetHasPromotion(promotionForeignLandsID, true)
		unitTwo:JumpToNearestValidPlot()
		unitThree:SetName("Mercenary")
		unitThree:SetHasPromotion(promotionForeignLandsID, true)
		unitThree:JumpToNearestValidPlot()
		save(player, "Decisions_MilanHireMercenaries", player:GetCurrentEra())
		save(player, "MainMercenary", nil)
		save(player, "SecondaryMercenary", nil)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_MilanHireMercenaries", Decisions_MilanHireMercenaries)
-------------------------------------------------------------------------------------------------------------------------
-- Milan: Establish the Ambrosian Republic
-------------------------------------------------------------------------------------------------------------------------
local Decisions_MilanAmbrosianRepublic = {}
	Decisions_MilanAmbrosianRepublic.Name = "TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC"
	Decisions_MilanAmbrosianRepublic.Desc = "TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC"
	HookDecisionCivilizationIcon(Decisions_MilanAmbrosianRepublic, "CIVILIZATION_JFD_MILAN")
	Decisions_MilanAmbrosianRepublic.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_MilanAmbrosianRepublic") == true then
			Decisions_MilanAmbrosianRepublic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(1200 * iMod)
		Decisions_MilanAmbrosianRepublic.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1	then return true, false end
		if player:GetGold() < goldCost								then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID				then return true, false end
		
		return true, true
	end
	)
	
	Decisions_MilanAmbrosianRepublic.DoFunc = (
	function(player)
		local goldCost = mathCeil(1200 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyAmbrosianRepublicID, true)
		local numLiberty = 0
		for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_LIBERTY'") do
			if player:HasPolicy(policy.ID) then
				numLiberty = numLiberty + 1
			else
				player:SetHasPolicy(policy.ID, true)
			end
		end

		player:ChangeNumResourceTotal(iMagistrate, numLiberty)
		local description =  Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC");
		local descriptionQuery = {"UPDATE Language_en_US SET Text = '".. description .."' WHERE Tag IN ('TXT_KEY_CIV_JFD_MILAN_DESC', 'TXT_KEY_CIV_JFD_MILAN_SHORT_DESC')"}
		for i, iQuery in pairs(descriptionQuery) do
			for result in DB.Query(iQuery) do
			end
		end
		-- refresh UI texts
		Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_MILAN_AMBROSIAN_REPUBLIC"))
		save(player, "Decisions_MilanAmbrosianRepublic", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_MilanAmbrosianRepublic", Decisions_MilanAmbrosianRepublic)
--=======================================================================================================================
--=======================================================================================================================
