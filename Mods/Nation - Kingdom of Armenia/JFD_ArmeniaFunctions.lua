-- Armenia_Functions
-- Author: JFD
-- DateCreated: 2/3/2014 6:04:01 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("JFD_ArmeniaDynamicTopPanelSupport")
include("NewSaveUtils.lua"); MY_MOD_NAME = "Armenia";
include("PlotIterators");
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
local buildingArmeniaConversionID = GameInfoTypes["BUILDING_JFD_ARMENIAN_CONVERSION"]
local buildingShrineID = GameInfoTypes["BUILDING_SHRINE"]
local buildingTempleID = GameInfoTypes["BUILDING_TEMPLE"]
local buildingVankID = GameInfoTypes["BUILDING_JFD_ARMENIAN_MONASTERY"]
local buildingVankFaithID = GameInfoTypes["BUILDING_JFD_ARMENIAN_FAITH"]
local buildingClassTempleID = GameInfoTypes["BUILDINGCLASS_TEMPLE"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ARMENIA"]
local isArmeniaCivActive = JFD_IsCivilisationActive(civilisationID)
local mathFloor = math.floor
local policyArmeniaID = GameInfoTypes["POLICY_JFD_ARMENIA"]
local unitMamikonianID = GameInfoTypes["UNIT_JFD_MAMIKONIAN"]
local unitMamikonianProphetID = GameInfoTypes["UNIT_JFD_MAMIKONIAN_PROPHET"]
local unitCombatMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local unitPromotionNakhararID = GameInfoTypes["PROMOTION_JFD_NAKHARAR"]
local unitPromotionSightPenaltyID = GameInfoTypes["PROMOTION_SIGHT_PENALTY"]
local yieldGoldID = GameInfoTypes["YIELD_GOLD"]

if isArmeniaCivActive then
	print("King Tiridates III is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ArmenianConversion
----------------------------------------------------------------------------------------------------------------------------
function JFD_ArmenianConversion(playerID, holyCityID, religionID)
	local player = Players[playerID]
	if player:GetCivilizationType() ~= civilisationID then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (otherPlayer:GetCivilizationType() == civilisationID and otherPlayer:IsEverAlive() and GetPersistentProperty("JFD_FirstWorldReligion") == nil) then
				SetPersistentProperty("JFD_FirstWorldReligion", religionID)
				JFD_ConvertArmenia(otherPlayerID)
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.ReligionFounded.Add(JFD_ArmenianConversion)
end

function JFD_ConvertArmenia(playerID)
	local player = Players[playerID]
	local firstWorldReligion = JFD_GetFirstWorldReligion()
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local religiousLeader = Players[JFD_GetArmenianReligiousLeader()]
		if not (player:HasCreatedPantheon()) then
			player:SetFaith(Game.GetMinimumFaithNextPantheon())
			Game.FoundPantheon(playerID, religiousLeader:GetBeliefInPantheon())
		end
		player:GetCapitalCity():AdoptReligionFully(firstWorldReligion)
		
		local activeTeam = Game.GetActiveTeam()
		local religiousLeaderTeam = religiousLeader:GetTeam()
		if not (Teams[activeTeam]:IsHasMet(religiousLeaderTeam)) then
			Teams[activeTeam]:Meet(religiousLeaderTeam, true)
		end
	
		if player:IsHuman() then	
			local religionDesc = GameInfo.Religions[firstWorldReligion].Description
			local description = Locale.ConvertTextKey("TXT_KEY_ARMENIAN_CONVERSION_DESC_UNKNOWN", religionDesc)
			local descriptionShort = Locale.ConvertTextKey("TXT_KEY_ARMENIAN_CONVERSION_SHORT", religionDesc) 
			player:AddNotification(NotificationTypes["NOTIFICATION_RELIGION_SPREAD_NATURAL"], description, descriptionShort)
		end
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyArmeniaID, true)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ArmenianFaith
----------------------------------------------------------------------------------------------------------------------------
function JFD_ArmenianFaith(playerID)
	local player = Players[playerID]
	local firstWorldReligion = JFD_GetFirstWorldReligion()
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if firstWorldReligion then 
			if player:HasReligionInMostCities(firstWorldReligion) then
				local religiousLeaderFaith = JFD_GetFaithFromFirstReligion(playerID)
				player:ChangeFaith(religiousLeaderFaith)
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ArmenianFaith)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ArmenianOccupiedConversion
----------------------------------------------------------------------------------------------------------------------------
function JFD_ArmenianOccupiedConversion(ownerID, religionID, iX, iY)
	local player = Players[ownerID]	
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local firstWorldReligion = JFD_GetFirstWorldReligion()
		local city = Map.GetPlot(iX, iY):GetPlotCity()
		if (city:IsOccupied() and religionID == firstWorldReligion) then
			if not city:IsHasBuilding(buildingArmeniaConversionID) then
				city:SetNumRealBuilding(buildingArmeniaConversionID, 1) 
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.CityConvertsReligion.Add(JFD_ArmenianOccupiedConversion)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_HasMountainWithinBorders
----------------------------------------------------------------------------------------------------------------------------
function JFD_HasMountains(playerID, city)
	local player = Players[playerID]
	local cityID = city:GetID()
	local playerTeam = player:GetTeam()
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	local numMountains = 0 
	for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		local x = adjacentPlot:GetX()
		local y = adjacentPlot:GetY()
		if adjacentPlot:GetOwner() == playerID and adjacentPlot:IsMountain() then
			numMountains = numMountains + 1
			break
		end
	end

	if numMountains > 0 then return true end
end

function JFD_HasMountainWithinBorders(playerID, cityID, buildingID)
	local player = Players[playerID]
    if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		if buildingID == buildingVankID then
			if not (city:IsHasBuilding(buildingVankFaithID)) then
				if JFD_HasMountains(playerID, city) then 
					player:GetCityByID(cityID):SetNumRealBuilding(buildingVankFaithID, 1) 
				end
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.CityConstructed.Add(JFD_HasMountainWithinBorders)
end	
---------------------------------------------------------------------------------------------------------------------------
-- JFD_VankConversion
----------------------------------------------------------------------------------------------------------------------------
function JFD_VankConversion(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local firstWorldReligion = JFD_GetFirstWorldReligion()
		if firstWorldReligion then
			for city in player:Cities() do
				if city:IsHasBuilding(buildingVankID) and city:GetNumGreatWorksInBuilding(buildingClassTempleID) > 0 then
					for religion in GameInfo.Religions() do
						if (city:GetNumFollowers(religion.ID) > 0 and religion.ID ~= firstWorldReligion) then
							city:ConvertPercentFollowers(firstWorldReligion, religion.ID, 20) 
						end
					end
				end
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_VankConversion)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFDMamikonianProphet
----------------------------------------------------------------------------------------------------------------------------
function JFD_MamikonianProphet(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		local firstWorldReligion = JFD_GetFirstWorldReligion()
	   	if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == unitProphetID then 
			local unit = player:GetUnitByID(unitID)
			local newUnit
			if player:IsHuman() then
				newUnit = player:InitUnit(unitMamikonianID, unit:GetX(), unit:GetY())
			else
				newUnit = player:InitUnit(unitMamikonianProphetID, unit:GetX(), unit:GetY())
			end
			newUnit:Convert(unit)
			if newUnit:IsHasPromotion(unitPromotionSightPenaltyID) then
				newUnit:SetHasPromotion(unitPromotionSightPenaltyID, false)
			end
		end
    end
end
Events.SerialEventUnitCreated.Add(JFD_MamikonianProphet)
----------------------------------------------------------------------------------------------------------------------------
-- JFDMamikonianBoost
----------------------------------------------------------------------------------------------------------------------------
function JFDMamikonianBoost(playerID)
	local player = Players[playerID]
	local mamikonianNearby = false
	for unit in player:Units() do
		if (unit:GetUnitCombatType() == unitCombatMountedID and not (unit:IsEmbarked())) then
			for mamikonian in player:Units() do
				if mamikonian:GetUnitType() == unitMamikonianID then
					if Map.PlotDistance(unit:GetX(), unit:GetY(), mamikonian:GetX(), mamikonian:GetY()) < 3 then
						mamikonianNearby = true
					end
				end
			end
			
			if mamikonianNearby then
				if not unit:IsHasPromotion(unitPromotionNakhararID) then
					unit:SetHasPromotion(unitPromotionNakhararID, true)
				end
			else
				if unit:IsHasPromotion(unitPromotionNakhararID) then
					unit:SetHasPromotion(unitPromotionNakhararID, false)
				end
			end
			
		else
			if unit:IsHasPromotion(unitPromotionNakhararID) then
				unit:SetHasPromotion(unitPromotionNakhararID, false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFDMamikonianBoost) 
GameEvents.PlayerDoTurn.Add(JFDMamikonianBoost)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_NakhararPillaging
----------------------------------------------------------------------------------------------------------------------------
function JFD_NakhararPillaging(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then 
		local firstWorldReligion = JFD_GetFirstWorldReligion()
		local city = Map.GetPlot(iX, iY):GetPlotCity()
		if (city:GetReligiousMajority() > 0 and city:GetReligiousMajority() ~= firstWorldReligion) then
			if city:GetGarrisonedUnit():IsHasPromotion(unitPromotionNakhararID) then
				local goldPillaged = mathFloor(city:GetBaseYieldRate(yieldGoldID) * 50 / 100)
				player:ChangeGold(goldPillaged)
				if city:IsHasBuilding(buildingTempleID) then
					city:SetNumRealBuilding(buildingTempleID, 0)
				end
				
				if city:IsHasBuilding(buildingShrineID) then
					city:SetNumRealBuilding(buildingShrineID, 0)
				end
				
				if player:IsHuman() then
					local alertmessage = Locale.ConvertTextKey("TXT_KEY_NAKHARAR_ALERT", goldPillaged)
					Events.GameplayAlertMessage(alertmessage)
				end
			end
		end
	end
end

if isArmeniaCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_NakhararPillaging)
end
--==========================================================================================================================
--==========================================================================================================================