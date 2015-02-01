-- JFD_HolyRomanFunctions
-- Author: JFD
-- DateCreated: 11/5/2014 10:07:36 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("JFD_HolyRomeDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AddPromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_AddPromotion(unit, promotionID)
	if not unit:IsHasPromotion(promotionID) then
		unit:SetHasPromotion(promotionID, true)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"]
local civilisationAustriaID = GameInfoTypes["CIVILIZATION_AUSTRIA"]
local civilisationVeniceID = GameInfoTypes["CIVILIZATION_VENICE"]

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
	print("Emperor Charles V is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsRevisedAustria
------------------------------------------------------------------------------------------------------------------------
function JFD_IsRevisedAustria()
	for row in GameInfo.Traits("JFD_CulturalGPPAnnexCityStates == 1") do
		if row.Type == "TRAIT_ANNEX_CITY_STATE" then
			return true
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsRevisedVenice
------------------------------------------------------------------------------------------------------------------------
function JFD_IsRevisedVenice()
	for row in GameInfo.Traits("JFD_TradeLovesPuppetCities == 1") do
		if row.Type == "TRAIT_SUPER_CITY_STATE" then
			return true
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_RemovePromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_RemovePromotion(unit, promotionID)
	if unit:IsHasPromotion(promotionID) then
		unit:SetHasPromotion(promotionID, false)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(description)
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end   
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
local rathausID = GameInfoTypes["BUILDING_JFD_RATHAUS"]
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BlockGreatAmbassadorsAndConqustadores
----------------------------------------------------------------------------------------------------------------------------
function JFD_BlockGreatAmbassadorsAndConqustadores(playerID, unitID)
	local player = Players[playerID]
	if unitID == GameInfoTypes["UNIT_JFD_GREAT_AMBASSADOR"] or unitID == GameInfoTypes["UNIT_JFD_HRE_CONQUISTADOR"] then
		return
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockGreatAmbassadorsAndConqustadores)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_RathausLimit
----------------------------------------------------------------------------------------------------------------------------
function JFD_RathausLimit(playerID, buildingID)
	local player = Players[playerID]
	if buildingID == GameInfoTypes["BUILDING_JFD_RATHAUS"] then
		if player:GetCivilizationType() ~= civilisationID then return false end
		local limit = 3
		local worldSize = Map.GetWorldSize()
		if worldSize == GameInfoTypes["WORLDSIZE_DUEL"] or worldSize == GameInfoTypes["WORLDSIZE_TINY"] then limit = 1
		elseif worldSize == GameInfoTypes["WORLDSIZE_SMALL"] then limit = 2
		elseif worldSize == GameInfoTypes["WORLDSIZE_LARGE"] then limit = 4
		elseif worldSize == GameInfoTypes["WORLDSIZE_HUGE"] then limit = 5
		end

		if player:CountNumBuildings(rathausID) >= limit then return false end
	end

	return true
end
GameEvents.PlayerCanConstruct.Add(JFD_RathausLimit)

function JFD_RathausLimitCity(playerID, cityID, buildingID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if buildingID == rathausID then
		if player:GetCivilizationType() ~= civilisationID then return false end
		if not city:IsPuppet() then return false end
	end

	if city:IsHasBuilding(rathausID) then 
		local buildingClassID = GameInfoTypes[GameInfo.Buildings[buildingID].BuildingClass]
		if GameInfo.BuildingClasses[buildingClassID].MaxPlayerInstances == 1 or GameInfo.BuildingClasses[buildingClassID].MaxGlobalInstances == 1 then return false end
	end

	return true
end
GameEvents.CityCanConstruct.Add(JFD_RathausLimitCity)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_LimitedFreeTraining
----------------------------------------------------------------------------------------------------------------------------
function JFD_LimitedFreeTraining(playerID, cityID, unitID)
	local player = Players[playerID]
	local city = player:GetCityByID(cityID)
	if player:GetCityByID(cityID):IsHasBuilding(rathausID) then 
		local unit = player:GetUnitByID(unitID)
		if GameInfo.Units[unitID].Combat > 0 then return false end
	end

	return true
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityCanTrain.Add(JFD_LimitedFreeTraining)
end
---------------------------------------------------------------------------------------------------------------------------
-- JFD_CreateFreeImperialCity
----------------------------------------------------------------------------------------------------------------------------
function JFD_CreateFreeImperialCity(playerID, cityID, buildingID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsAlive() then
		if buildingID == rathausID then
			local city = player:GetCityByID(cityID)
			if player:IsHuman() then
				player:AddNotification(NotificationTypes["NOTIFICATION_MET_MINOR"], Locale.ConvertTextKey("TXT_KEY_JFD_IMPERIAL_CITY_FOUNDED", city:GetName()), Locale.ConvertTextKey("TXT_KEY_JFD_IMPERIAL_CITY_FOUNDED_SHORT"))
			end
			
			if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
				JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_IMPERIAL_CITY", city:GetName())) 
			end
			city:SetName(Locale.ConvertTextKey("TXT_KEY_JFD_IMPERIAL_CITY", city:GetName()))
			city:SetPuppet(false)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_FIC"], 1)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityConstructed.Add(JFD_CreateFreeImperialCity)
end
---------------------------------------------------------------------------------------------------------------------------
-- JFD_GoldAndFaithFromAllies
----------------------------------------------------------------------------------------------------------------------------
function JFD_GoldAndFaithFromAllies(playerID, cityID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsAlive() then
		local numFaith = JFD_GetFaithFromMinors(playerID)
		local numGold = JFD_GetGoldFromMinors(playerID)
		player:ChangeFaith(numFaith)
		player:ChangeGold(numGold)
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_GoldAndFaithFromAllies)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_DoppelsoldnerLandsneckhtBonus
----------------------------------------------------------------------------------------------------------------------------
function JFD_DoppelsoldnerLandsneckhtBonus(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
		for unit in player:Units() do
			local doppelSoldnerAdjacent = false
			local landsneckhtUnitID = GameInfoTypes["UNIT_GERMAN_LANDSKNECHT"]
			local landsneckhtPromotionID = GameInfoTypes["PROMOTION_JFD_LANSKNECHT"]
			if unit and unit:GetUnitType() == landsneckhtUnitID then
				for doppelsoldner in player:Units() do
					local doppelsoldnerPromotionID = GameInfoTypes["PROMOTION_JFD_DOPPELSOLDNER"]
					if doppelsoldner:IsHasPromotion(doppelsoldnerPromotionID) then
						if Map.PlotDistance(unit:GetX(), unit:GetY(), doppelsoldner:GetX(), doppelsoldner:GetY()) < 2 then
							doppelSoldnerAdjacent = true
						end
					end
				end
				
				if doppelSoldnerAdjacent then
					JFD_AddPromotion(unit, landsneckhtPromotionID)
				else
					JFD_RemovePromotion(unit, landsneckhtPromotionID)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.UnitSetXY.Add(JFD_DoppelsoldnerLandsneckhtBonus) 
	GameEvents.PlayerDoTurn.Add(JFD_DoppelsoldnerLandsneckhtBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ConquistadorCities
----------------------------------------------------------------------------------------------------------------------------
g_CustomsHousePlayerID = 0
g_CustomsHouseiX = 0
g_CustomsHouseiY = 0
g_CustomsHouseID = 0

function JFD_ConquistadorCities(playerID, iX, iY, improvementID)
	if g_CustomsHousePlayerID == playerID and g_CustomsHouseiX == iX and g_CustomsHouseiY == iY and g_CustomsHouseID == improvementID then return end

	print(g_CustomsHousePlayerID, g_CustomsHouseiX, g_CustomsHouseiY, g_CustomsHouseID)

	g_CustomsHousePlayerID = playerID
	g_CustomsHouseiX = iX
	g_CustomsHouseiY = iY
	g_CustomsHouseID = improvementID 

	print("bein g calleD")
	local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		if improvementID == GameInfoTypes["IMPROVEMENT_JFD_HOLY_ROMAN_CITY"] then
			if Map.GetPlot(iX, iY) then
				local plot = Map.GetPlot(iX, iY)
				local conquistadore = plot:GetUnit()
				local cityName
				if conquistadore:GetName() == "Francisco Pizarro (Conquistador)" then cityName = "Lima"
				elseif conquistadore:GetName() == "Hernán Cortés (Conquistador)" then cityName = "Mexico City"
				elseif conquistadore:GetName() == "Diego de Cuéllar (Conquistador)" then cityName = "Baracoa"
				elseif conquistadore:GetName() == "Pedro Arias Dávila (Conquistador)" then cityName = "Dariena"
				elseif conquistadore:GetName() == "Hernández de Córdoba (Conquistador)" then cityName = "Granada"
				elseif conquistadore:GetName() == "Juan Bautista de Anza (Conquistador)" then cityName = "Monterey"
				elseif conquistadore:GetName() == "Pedro de Valdivia (Conquistador)" then cityName = "Santiago de Chile" 
				elseif conquistadore:GetName() == "Miguel de Legazpi (Conquistador)" then cityName = "Cebu"
				end	
			
				plot:SetImprovementType(-1)
				local newCity = player:InitCity(iX, iY)
				newCity:SetPuppet(true)
				newCity:SetProductionAutomated(true)
				plot:SetOwner(playerID)
				newCity:SetName(cityName)
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.BuildFinished.Add(JFD_ConquistadorCities)
end 
--==========================================================================================================================
-- CORE AUSTRIA FUNCTIONS
--==========================================================================================================================
-- JFD_AustrianAIHandiCap
----------------------------------------------------------------------------------------------------------------------------
function JFD_AustrianAIHandiCap()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationAustriaID and not player:IsHuman() then
			if not player:HasPolicy(GameInfoTypes[GameInfoTypes["POLICY_JFD_AUSTRIA"]]) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_JFD_AUSTRIA"], true)	
			end
		end
	end 
end

if JFD_IsCivilisationActive(civilisationAustriaID) and JFD_IsRevisedAustria() then
	Events.SequenceGameInitComplete.Add(JFD_AustrianAIHandiCap)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AustrianCulturalGreatPeople
----------------------------------------------------------------------------------------------------------------------------
local austrianArtistUnitID = GameInfoTypes["UNIT_JFD_AUSTRIAN_ARTIST"]
local austrianMusicianUnitID = GameInfoTypes["UNIT_JFD_AUSTRIAN_MUSICIAN"]
local austrianWriterUnitID = GameInfoTypes["UNIT_JFD_AUSTRIAN_WRITER"]

function JFD_BlockAustrianCulturalGreatPeople(playerID, unitID)
	if unitID == austrianArtistUnitID or unitID == austrianMusicianUnitID or unitID == austrianWriterUnitID then
		return
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockAustrianCulturalGreatPeople)

function JFD_AustrianCulturalGreatPeople(playerID, unitID)
    local player = Players[playerID]
    if player:GetCivilizationType() == civilisationAustriaID and player:IsEverAlive() then
		local oldUnit = player:GetUnitByID(unitID)
       	if player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_ARTIST"] then
           local newUnit = player:InitUnit(austrianArtistUnitID, oldUnit:GetX(), oldUnit:GetY())
           newUnit:Convert(oldUnit)
        elseif player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_MUSICIAN"] then
           local newUnit = player:InitUnit(austrianMusicianUnitID, oldUnit:GetX(), oldUnit:GetY())
           newUnit:Convert(oldUnit)
		elseif player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_WRITER"] then
           local newUnit = player:InitUnit(austrianWriterUnitID, oldUnit:GetX(), oldUnit:GetY())
           newUnit:Convert(oldUnit)
		end
    end
end

if JFD_IsCivilisationActive(civilisationAustriaID) and JFD_IsRevisedAustria() then
	Events.SerialEventUnitCreated.Add(JFD_AustrianCulturalGreatPeople)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_HappinessFromAcquiredCityStatesToGreatPeopleGeneration
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetHappinessFromAcquiredCS(playerID)
	local player = Players[playerID]
	local happiness = 0
	for city in player:Cities() do
		if Players[city:GetOriginalOwner()]:IsMinorCiv() then
			happiness = happiness + city:GetLocalHappiness()
		end
	end
	
	return happiness
end

function JFD_HappinessFromAcquiredCityStatesToGreatPeopleGeneration(playerID)
	local player = Players[playerID]
    if player:GetCivilizationType() == civilisationAustriaID and player:IsEverAlive() then
		if player:GetCapitalCity() then 
			local happinessFromAcquiredCS = math.min(JFD_GetHappinessFromAcquiredCS(playerID), 20)
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_AUSTRIAN_GREAT_PEOPLE_GEN"], happinessFromAcquiredCS)
		end
	end
end

if JFD_IsCivilisationActive(civilisationAustriaID) and JFD_IsRevisedAustria() then
	GameEvents.PlayerDoTurn.Add(JFD_HappinessFromAcquiredCityStatesToGreatPeopleGeneration)
end
--==========================================================================================================================
-- CORE VENICE FUNCTIONS
--==========================================================================================================================
-- JFD_VenetianMerchants
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumPuppets(playerID)
	local player = Players[playerID]
	local numPuppets = 0 
	for city in player:Cities() do
		if city:IsPuppet() then
			numPuppets = numPuppets + 1
		end
	end

	return numPuppets
end

function JFD_VenetianMerchants(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationVeniceID and player:IsEverAlive() then
		if player:GetCapitalCity() then
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_VENICE"], JFD_GetNumPuppets(playerID))
		end
	end
end

if JFD_IsCivilisationActive(civilisationVeniceID) and JFD_IsRevisedVenice() then
	GameEvents.PlayerDoTurn.Add(JFD_VenetianMerchants)
end
--==========================================================================================================================
--==========================================================================================================================