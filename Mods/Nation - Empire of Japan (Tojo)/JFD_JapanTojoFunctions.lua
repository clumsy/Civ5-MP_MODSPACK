-- JFD_AmericaRooseveltFunctions
-- Author: JFD
-- DateCreated: 8/2/2013 7:09:28 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("FLuaVector.lua")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_JAPAN_TOJO"]
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local isJapanTojoCivilisationActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
local policyKantaiKessenID = GameInfoTypes["POLICY_JFD_KANTAI_KESSEN"]
local promotionKantaiKessenID = GameInfoTypes["PROMOTION_JFD_KANTAI_KESSEN"]
local promotionTojoID = GameInfoTypes["PROMOTION_JFD_JAPAN_TOJO"]
local unitCombatNavalRangedID = GameInfoTypes["UNITCOMBAT_NAVALRANGED"]

if isJapanTojoCivilisationActive then
	print("Prime Minister Tojo is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_TojoNavalScienceFromKills
----------------------------------------------------------------------------------------------------------------------------
function JFD_TojoNavalScienceFromKills(killerID, killedID, killedUnitID)
	local player = Players[killerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		local unit = GameInfo.Units[killedUnitID]
		local currentResearch = player:GetCurrentResearch()
		if currentResearch then
			if (unit.CombatClass == "UNITCOMBAT_NAVALRANGED" or unit.CombatClass == "UNITCOMBAT_NAVALMELEE") then	
				local scienceBoost = mathFloor(unit.Combat * 50 / 100)
				local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
				teamTechs:ChangeResearchProgress(currentResearch, scienceBoost, killerID)
				
				if player:IsHuman() then 
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_RESEARCH] Science from defeating an enemy naval unit in battle", scienceBoost)) 
				end
			end
		end
	end
end

if isJapanTojoCivilisationActive then
	GameEvents.UnitKilledInCombat.Add(JFD_TojoNavalScienceFromKills)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_TojoNavalAssimilation
----------------------------------------------------------------------------------------------------------------------------
function JFD_TojoNavalAssimilation(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local navalGarrison = false
		local navalUnit
		for city in player:Cities() do
			if (city:IsRazing() or city:GetResistanceTurns() > 0) then
				local plot = Map.GetPlot(city:GetX(), city:GetY()) 
				for i = 0, plot:GetNumUnits() - 1 do
					if plot:GetUnit(i):IsHasPromotion(promotionTojoID) then
						navalGarrison = plot:GetUnit(i)
					end
				end
						
				if navalGarrison then
					local raisingSpeed = (navalGarrison:GetLevel() / 50)
					if raisingSpeed >= 1 then
						if city:IsRazing() then
							city:ChangeRazingTurns(-raisingSpeed)
						elseif city:GetResistanceTurns() > 0 then
							city:ChangeResistanceTurns(-raisingSpeed)
						end
					end
				end
			end
		end
	end
end

if isJapanTojoCivilisationActive then
	GameEvents.PlayerDoTurn.Add(JFD_TojoNavalAssimilation)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_TojoNavalHealFromTechs
----------------------------------------------------------------------------------------------------------------------------
function JFD_TojoNavalHealFromTechs(teamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for unit in player:Units() do
			if (unit:GetDomainType() == domainSeaID and unit:IsCombatUnit()) then
				unit:ChangeDamage(-25)
			end
		end
	end
end

if isJapanTojoCivilisationActive then
	GameEvents.TeamTechResearched.Add(JFD_TojoNavalHealFromTechs)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_KantaiKessen
----------------------------------------------------------------------------------------------------------------------------
function JFD_KantaiKessen(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationTojoID and player:IsEverAlive() and player:HasPolicy(policyKantaiKessenID)) then
		for unit in player:Units() do
			if unit:GetUnitCombatType() == unitCombatNavalRangedID then
				if unit:GetPlot():GetPlotCity() then
					if not (unit:IsHasPromotion(promotionKantaiKessenID)) then
						unit:SetHasPromotion(promotionKantaiKessenID, true)
					end
				else
					if unit:IsHasPromotion(promotionKantaiKessenID) then
						unit:SetHasPromotion(promotionKantaiKessenID, false)
					end
				end
			end
		end
	end
end

if isJapanTojoCivilisationActive then
	GameEvents.PlayerDoTurn.Add(JFD_KantaiKessen)
	GameEvents.UnitSetXY.Add(JFD_KantaiKessen)
end
--==========================================================================================================================
-- CORE NOBUNAGA FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingDojoID = GameInfoTypes["BUILDING_JFD_DOJO"]
local buildingTempleID = GameInfoTypes["BUILDING_TEMPLE"]
local civilisationJapanID = GameInfoTypes["CIVILIZATION_JAPAN"]
local isJapanCivilisationActive = JFD_IsCivilisationActive(civilisationJapanID)
local mathMin = math.min
local promotionBushidoID = GameInfoTypes["PROMOTION_JFD_BUSHIDO"]
local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"] 
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"] 
local yieldCultureID = GameInfoTypes["YIELD_CULTURE"]

if isJapanCivilisationActive then
	print("Daiymo Nobunaga is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_DojoExperienceFromCulture
--------------------------------------------------------------------------------------------------------------------------
function JFD_DojoExperienceFromCulture(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationJapanID and player:IsEverAlive()) then
		local city = player:GetCityByID(cityID)
		if city:IsHasBuilding(buildingDojoID) then
			local unit = player:GetUnitByID(unitID)
			if (unit:GetUnitCombatType() == unitCombatMeleeID or unit:GetUnitCombatType() == unitCombatGunID) then	
				local experiencePercent = 20
				if city:IsHasBuilding(buildingTempleID) then experiencePercent = 30 end
				
				local experienceFromCulture = city:GetYieldRate(yieldCultureID) * experiencePercent / 100
				unit:ChangeExperience(mathMin(experienceFromCulture, 20))
			end
		end
	end
end

if isJapanCivilisationActive then
	GameEvents.CityTrained.Add(JFD_DojoExperienceFromCulture)
end
--==========================================================================================================================
--==========================================================================================================================
