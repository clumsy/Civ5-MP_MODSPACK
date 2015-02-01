-- JFD_CoreFunctions
-- Author: JFD
-- DateCreated: 6/24/2014 4:29:58 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_MC_AYYUBIDS"]

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

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == communityPatchID) then
		isUsingCP = true
		break
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	print("Saladin is in this game")
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- JFD_BlockAyyubidCavalry
----------------------------------------------------------------------------------------------------------------------------
function JFD_BlockAyyubidCavalry(playerID, unitID)
	if unitID == GameInfoTypes["UNIT_JFD_AYYUBID_CHARIOT"] or unitID == GameInfoTypes["UNIT_JFD_AYYUBID_HORSEMAN"] or unitID == GameInfoTypes["UNIT_JFD_AYYUBID_MAMLUK"] or unitID == GameInfoTypes["UNIT_JFD_AYYUBID_LANCER"] then
		return
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BlockAyyubidCavalry)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_AmiralMuminin
----------------------------------------------------------------------------------------------------------------------------
local militarySupport = {}
  militarySupport.ERA_ANCIENT = "UNIT_JFD_AYYUBID_CHARIOT"
  militarySupport.ERA_CLASSICAL = "UNIT_JFD_AYYUBID_HORSEMAN"
  militarySupport.ERA_MEDIEVAL = "UNIT_JFD_AYYUBID_MAMLUK"
  militarySupport.ERA_RENAISSANCE = "UNIT_JFD_AYYUBID_LANCER"
		
function JFD_SendMilitarySupport(playerID)
	local player = Players[playerID]
	local unitType = militarySupport[GameInfo.Eras[player:GetCurrentEra()].Type]
	local aiType = GameInfo.Units[unitType].DefaultUnitAI
	if player:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
	elseif player:GetCurrentEra() == GameInfoTypes["ERA_CLASSICAL"] then
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
	elseif player:GetCurrentEra() == GameInfoTypes["ERA_MEDIEVAL"] then
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
	elseif player:GetCurrentEra() == GameInfoTypes["ERA_RENAISSANCE"] then
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
		player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
	end	
	
	if player:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_CALIPHATE', GameInfo.Units[unitType].Description)
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_CALIPHATE_SHORT")
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end

	Events.AudioPlay2DSound("AS2D_MC_CALIPHATE_FX")
end

function JFD_AmiralMuminin(playerID, unitID)
    local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		local unit = player:GetUnitByID(unitID)
       	if unit and unit:GetUnitType() == GameInfoTypes["UNIT_PROPHET"] and not unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_CALIPHATE"]) then 
			JFD_SendMilitarySupport(playerID)				
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_CALIPHATE"], true)
		end
    end
end

if JFD_IsCivilisationActive(civilisationID) then
	Events.SerialEventUnitCreated.Add(JFD_AmiralMuminin)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CaliphateConquests
----------------------------------------------------------------------------------------------------------------------------
function JFD_CaliphateConquests(oldPlayerID, capital, iX, iY, newPlayerID)
	local player = Players[newPlayerID]
	if player:GetCivilizationType() == civilisationID then 
		if player:GetReligionCreatedByPlayer() > 0 or player:GetCapitalCity():GetReligiousMajority() > 0 then
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			local city = Map.GetPlot(iX, iY):GetPlotCity()
			city:AdoptReligionFully(religionID)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityCaptureComplete.Add(JFD_CaliphateConquests)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MadrasahFaith
----------------------------------------------------------------------------------------------------------------------------
function JFD_MadrasahFaith(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationID then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_MC_AYYUBID_MADRASAH"]) then
				local extraScience = math.floor(city:GetBaseYieldRateFromBuildings(GameInfoTypes["YIELD_SCIENCE"]) * 10/ 100)
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_AYYUBID_MADRASAH_SCIENCE"], extraScience)
			else
				if city:IsHasBuilding(GameInfoTypes["BUILDING_MC_AYYUBID_MADRASAH_SCIENCE"]) then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_AYYUBID_MADRASAH_SCIENCE"], 0)
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(JFD_MadrasahFaith)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MamlukDesertIgnorance
----------------------------------------------------------------------------------------------------------------------------
function JFD_MamlukDesertIgnorance(playerID)
	local player = Players[playerID]
	local inDesert = false
	for unit in player:Units() do
		local promotionHelpID = GameInfoTypes["PROMOTION_JFD_AYYUBID_MAMELUKE_IGNORES_TERRAIN_PENALTY_INFO"]
		local promotionID = GameInfoTypes["PROMOTION_JFD_AYYUBID_MAMELUKE_IGNORES_TERRAIN_PENALTY"]
		if unit and unit:IsHasPromotion(promotionHelpID) or unit:IsHasPromotion(promotionID) then
			if Map.GetPlot(unit:GetX(), unit:GetY()):GetTerrainType() == GameInfoTypes["TERRAIN_DESERT"] then
				inDesert = true
			end
			
			print(inDesert)
			if inDesert then
				if unit:IsHasPromotion(promotionHelpID) then
					unit:SetHasPromotion(promotionID, true)
					unit:SetHasPromotion(promotionHelpID, false)
				end
			else
				if unit:IsHasPromotion(promotionID) then
					unit:SetHasPromotion(promotionID, false)
					unit:SetHasPromotion(promotionHelpID, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_MamlukDesertIgnorance) 
GameEvents.PlayerDoTurn.Add(JFD_MamlukDesertIgnorance)
--==========================================================================================================================
--==========================================================================================================================