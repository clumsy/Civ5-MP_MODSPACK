-- JFD_KhazariaFunctions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPietyPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPietyPrestige()
	local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	local isUsingPiety = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
	  if (mod.ID == pietyPrestigeModID) then
	    isUsingPiety = true
	    break
	  end
	end

	return isUsingPiety
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetKhazars
------------------------------------------------------------------------------------------------------------------------
local bulan = nil

function JFD_GetBulan()
	if bulan == nil then	
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local player = Players[iPlayer]			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_KHAZARIA"] then
				bulan = player
				break
			end
		end
	end
	
	return bulan
end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local buildingDefensePenaltyID = GameInfoTypes["BUILDING_JFD_NEGATIVE_DEFENSE"]
local buildingKhaganBekXPID = GameInfoTypes["BUILDING_JFD_BEK_MOUNTED_XP"]
local buildingShulID = GameInfoTypes["BUILDING_JFD_SHUL"]
local buildingShulGoldID = GameInfoTypes["BUILDING_JFD_SHUL_GOLD"]
local bulanPlayer = JFD_GetBulan()
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_KHAZARIA"]
local isKhazariaCivActive = JFD_IsCivilisationActive(civilisationID)
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathFloor = math.floor
local unitPromotionKhaganBekID = GameInfoTypes["PROMOTION_JFD_KHAGAN_BEK"]

if isKhazariaCivActive then
	print("Khagan Bek Bulan is in this game")
end

if isUsingPietyPrestige then
	include("PietyUtils.lua")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_KhazarianDisporia
--------------------------------------------------------------------------------------------------------------------------
function JFD_InitiateDiaspora(playerID, oldPlayerID, city, religionID)
	local player = Players[playerID]
	local numCities = player:GetNumCities()
	local numImmigrants = city:GetNumFollowers(religionID)
	local foodChange = mathFloor(15 + 6 * (numImmigrants - 1) + ((numImmigrants - 1) * 1.8))
	foodChange = mathFloor(foodChange * 33/ 100)
	
	player:GetCapitalCity():ChangeFood(foodChange)
	
	if player:IsHuman() then
		local religionName = Game.GetReligionName(religionID)
		local description = Locale.ConvertTextKey("TXT_KEY_JFD_DIASPORA_DESC_NOTIFICATION", religionName, city:GetName(), foodChange)
		local shortDescription = Locale.ConvertTextKey("TXT_KEY_JFD_DIASPORA_SHORT_DESC_NOTIFICATION", religionName, Players[oldPlayerID]:GetCivilizationDescription())
		player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, description, shortDescription)
	end
end

function JFD_KhazarianImmigration(playerID, isCapital, cityX, cityY, newPlayerID)
	local player = Players[newPlayerID]
	local oldPlayer = Players[playerID]
	local city = Map.GetPlot(cityX, cityY):GetPlotCity()
	
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do	
		local khazarPlayer = Players[iPlayer]
		if khazarPlayer:GetCivilizationType() == civilisationID then
			local religionID = khazarPlayer:GetReligionCreatedByPlayer() or khazarPlayer:GetCapitalCity():GetReligiousMajority()
			if isUsingPietyPrestige then religionID = JFD_GetStateReligion(iPlayer) end
			
			if religionID then
				if city:GetNumFollowers(religionID) > 0 then
					JFD_InitiateDiaspora(iPlayer, playerID, city, religionID)
				end
			end
		end
	end
end

if isKhazariaCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_KhazarianImmigration)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_ReligiousResistance
--------------------------------------------------------------------------------------------------------------------------
function JFD_ReligiousResistance(playerID)
	local player = Players[playerID]
	if (player ~= bulanPlayer and not player:IsBarbarian()) then
		local religionID = bulanPlayer:GetReligionCreatedByPlayer() or bulanPlayer:GetCapitalCity():GetReligiousMajority()
		if isUsingPietyPrestige then religionID = JFD_GetStateReligion(bulanPlayer:GetID()) end
		
		if religionID then
			for city in player:Cities() do
				if Teams[player:GetTeam()]:IsAtWar(bulanPlayer:GetTeam()) then
					if city:GetNumFollowers(khazarReligionID) > 0 then
						city:SetNumRealBuilding(buildingDefensePenaltyID, city:GetNumFollowers(khazarReligionID))
					else
						if city:IsHasBuilding(buildingDefensePenaltyID) then
							city:SetNumRealBuilding(buildingDefensePenaltyID, 0)
						end
					end
				else
					if city:IsHasBuilding(buildingDefensePenaltyID) then
						city:SetNumRealBuilding(buildingDefensePenaltyID, 0)
					end
				end
			end	
		end			
	end
end	

if isKhazariaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_ReligiousResistance)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Synagogue
--------------------------------------------------------------------------------------------------------------------------
function JFD_Synagogue(playerID)
	local player = Players[playerID]
	 if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingShulID) then
				local numFollowers = mathFloor(city:GetNumFollowers(JFD_GetKhazarReligion()) * 50 /100)
				city:SetNumRealBuilding(buildingShulGoldID, numFollowers)
			else
				if city:IsHasBuilding(buildingShulGoldID) then
					city:SetNumRealBuilding(buildingShulGoldID, 0)
				end
			end
		end
	end
end

if isKhazariaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_Synagogue)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_KhaganBek
--------------------------------------------------------------------------------------------------------------------------
function JFD_KhaganBek(playerID)
	local player = Players[playerID]
	local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
	if isUsingPietyPrestige then religionID = JFD_GetStateReligion(playerID) end
		
	if religionID then
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionKhaganBekID) then
				local unitX = unit:GetX()
				local unitY = unit:GetY()
				for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
					local otherPlayer = Players[otherPlayerID]
					if (otherPlayer:IsAlive() and otherPlayerID ~= playerID) then
						local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
						if otherPlayerTeam:IsAtWar(player:GetTeam()) then
							for city in otherPlayer:Cities() do
								local convertPercent = 0
								local cityX = city:GetX()
								local cityY = city:GetY()
								if Map.PlotDistance(unitX, unitY, cityX, cityY) < 2 then
									convertPercent = 30
								elseif Map.PlotDistance(unitX, unitY, cityX, cityY) < 3 then
									convertPercent = 20
								end
								
								if convertPercent > 0 then
									city:ConvertPercentFollowers(playerReligion, -1, convertPercent)
								end
							end
						end
					end
				end
			end
		end		
	end
end
GameEvents.PlayerDoTurn.Add(JFD_KhaganBek)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_BekMountedXP
----------------------------------------------------------------------------------------------------------------------------	
function JFD_BekMountedXP(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() then
		for city in player:Cities() do
			local bekIsHere = false
			local plot = city:Plot()
			for i = 0, plot:GetNumUnits() - 1, 1 do
				if plot then
					if plot:GetUnit(i):IsHasPromotion(unitPromotionKhaganBekID) then
						bekIsHere = true
					end
				end
			end
					
			if bekIsHere then
				if not city:IsHasBuilding(buildingKhaganBekXPID) then
					city:SetNumRealBuilding(buildingKhaganBekXPID, 1)
				end
			else
				if city:IsHasBuilding(buildingKhaganBekXPID) then
					city:SetNumRealBuilding(buildingKhaganBekXPID, 0)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_BekMountedXP)
GameEvents.PlayerDoTurn.Add(JFD_BekMountedXP)
--==========================================================================================================================
--==========================================================================================================================