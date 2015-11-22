-- Papal_States_Functions
-- Author: JFD
-- DateCreated: 11/23/2013 12:54:04 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]

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

if JFD_IsCivilisationActive(civilisationID) then
	print("Pope Pius IX is in this game")
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- JFD_InitPapalStates
--------------------------------------------------------------------------------------------------------------------------
function JFD_InitPapalStates(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationID then
			if not player:HasPolicy(GameInfoTypes["POLICY_JFD_PAPAL_STATES"]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_JFD_PAPAL_STATES"], true)	
			end
		end
	end 
end

if JFD_IsCivilisationActive(civilisationID) then
	Events.SequenceGameInitComplete.Add(JFD_InitPapalStates)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PapalDisciples
--------------------------------------------------------------------------------------------------------------------------
function JFD_BlockDisciples(playerID, unitID)
	if unitID == GameInfoTypes["UNIT_JFD_DISCIPLE"] then
		return
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockDisciples)

function JFD_PapalDisciples(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		local unit = player:GetUnitByID(unitID)
       	if unit and unit:GetUnitType() == GameInfoTypes["UNIT_PROPHET"] and not unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_PAPAL_STATES"]) then 
			player:AddFreeUnit(GameInfoTypes["UNIT_JFD_DISCIPLE"], GameInfoTypes["UNITAI_ARTIST"])
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_PAPAL_STATES"], true)

			if player:IsHuman() then
				local description = Locale.ConvertTextKey('TXT_KEY_JFD_DISCIPLE')
				local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_DISCIPLE_SHORT")
				Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
				Events.AudioPlay2DSound("AS2D_INTERFACE_FAITH_PURCHASE")
			end
		end
    end
end

if JFD_IsCivilisationActive(civilisationID) then
	Events.SerialEventUnitCreated.Add(JFD_PapalDisciples)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissGuardTourism
--------------------------------------------------------------------------------------------------------------------------
function JFD_SwissGuardTourism(playerID)
	local player = Players[playerID]
	if player:IsAlive() and not player:IsMinorCiv() and not player:IsBarbarian() then
		for city in player:Cities() do
			if city:GetGarrisonedUnit() and city:GetGarrisonedUnit():IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_TOURISM"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SWISS_GUARD_TOURISM"], 1)
			else
				if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_SWISS_GUARD_TOURISM"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_SWISS_GUARD_TOURISM"], 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SwissGuardTourism)
GameEvents.UnitSetXY.Add(JFD_SwissGuardTourism)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SwissGuardCapitalHealing
--------------------------------------------------------------------------------------------------------------------------
function JFD_SwissGuardCapitalHealing(playerID)
	local player = Players[playerID]
	local adjacentToCapital = false
	for unit in player:Units() do
		if unit and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING_INFO"]) or unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING"]) then
			if Map.PlotDistance(unit:GetX(), unit:GetY(), player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY()) < 2 then
				adjacentToCapital = true
			end
			
			local swissGuardPromotionIDInfo = GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING_INFO"]
			local swissGuardPromotionID = GameInfoTypes["PROMOTION_JFD_SWISS_GUARD_HEALING"]
			if adjacentToCapital then
				if unit:IsHasPromotion(swissGuardPromotionIDInfo) then
					unit:SetHasPromotion(swissGuardPromotionID, true)
					unit:SetHasPromotion(swissGuardPromotionIDInfo, false)
				end
			else
				if unit:IsHasPromotion(swissGuardPromotionID) then
					unit:SetHasPromotion(swissGuardPromotionID, false)
					unit:SetHasPromotion(swissGuardPromotionIDInfo, true)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_SwissGuardCapitalHealing)
GameEvents.UnitSetXY.Add(JFD_SwissGuardCapitalHealing)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockChapels
--------------------------------------------------------------------------------------------------------------------------
function JFD_BlockChapels(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if buildingID == GameInfoTypes["BUILDING_JFD_CHAPEL_ART"] then
		if not player:GetCivilizationType() == civilisationID then
			return
		else
			if not city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_WRITING"]) then
				return 
			end
			
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if city:GetNumFollowers(religionID) < 7 then
				return
			end
		end
	end

	if buildingID == GameInfoTypes["BUILDING_JFD_CHAPEL_MUSIC"] then
		if not player:GetCivilizationType() == civilisationID then
			return
		else
			if not city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_ART"]) then
				return 
			end
			
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if city:GetNumFollowers(religionID) < 14 then
				return
			end
		end
	end
	
	return true
end
GameEvents.CityCanConstruct.Add(JFD_BlockChapels)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ChapelFaith
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumChapelGreatWorksFilled(playerID)
	local player = Players[playerID]
	local numChapelGreatWorksFilled = 0
	for city in player:Cities() do
		if city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_TEMPLE"]) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 2
		end

		if city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_JFD_CHAPEL_MUSIC"]) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 2
		end

		if city:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_JFD_CHAPEL_ART"]) > 0 then
			numChapelGreatWorksFilled = numChapelGreatWorksFilled + 2
		end
	end

	return numChapelGreatWorksFilled
end

function JFD_ChapelFaith(playerID)
	 local player = Players[playerID]
	 if player:IsAlive() and player:GetCivilizationType() == civilisationID and player:GetCapitalCity() then 
		player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_FAITH"], JFD_GetNumChapelGreatWorksFilled(playerID))
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_ChapelFaith)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SocietasJesu
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetPapalReligion()
	local religionID
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		if Players[iPlayer]:GetCivilizationType() == civilisationID then
			religionID = Players[iPlayer]:GetReligionCreatedByPlayer() or Players[iPlayer]:GetCapitalCity():GetReligiousMajority()
		end
	end

	return religionID
end

function JFD_SocietasJesu(playerID)
	local player = Players[playerID]
	if player:HasPolicy(GameInfoTypes["POLICY_JFD_PAPAL_SOCIETAS_JESU"]) then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local otherPlayer = Players[iPlayer]
			for city in otherPlayer:Cities() do
				if city:GetNumFollowers(JFD_GetPapalReligion()) > 0 then
					city:ConvertPercentFollowers( JFD_GetPapalReligion(), -1, 100)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_SocietasJesu)
end
--=======================================================================================================================================================================================
--=======================================================================================================================================================================================