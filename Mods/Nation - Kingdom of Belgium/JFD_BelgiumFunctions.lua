-- JFD_CoreFunctions
-- Author: JFD
-- DateCreated: 6/24/2014 4:29:58 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUniqueUnit
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetUniqueUnit(player, unitClass)
  local unitType = nil
  local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type

  for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
    unitType = uniqueUnit.UnitType
    break
  end

  if (unitType == nil) then
    unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
  end

  return unitType
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BELGIUM"]
local improvementBelgianPlantationID = GameInfoTypes["IMPROVEMENT_JFD_BELGIAN_PLANTATION"]
local isBelgiumCivActive = JFD_IsCivilisationActive(civilisationID)
local unitBelgianWorkerID = GameInfoTypes["UNIT_JFD_BELGIAN_WORKER"]
local unitWorkerID = GameInfoTypes["UNIT_WORKER"]
local unitPromotionChasseurID = GameInfoTypes["PROMOTION_JFD_CHASSEUR"]
local unitPromotionChasseurMarchID = GameInfoTypes["PROMOTION_JFD_CHASSEUR_MARCH"]
				
if isBelgiumCivActive then
	print("King Albert is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_TreatyOfLondon
----------------------------------------------------------------------------------------------------------------------------
local militarySupport = {}
  militarySupport.ERA_ANCIENT = "UNITCLASS_WARRIOR"
  militarySupport.ERA_CLASSICAL = "UNITCLASS_SPEARMAN"
  militarySupport.ERA_MEDIEVAL = "UNITCLASS_PIKEMAN"
  militarySupport.ERA_RENAISSANCE = "UNITCLASS_MUSKETMAN"
  militarySupport.ERA_ENLIGHTENMENT = "UNITCLASS_LINE_INFANTRY"
  militarySupport.ERA_INDUSTRIAL = "UNITCLASS_RIFLEMAN"
  militarySupport.ERA_MODERN = "UNITCLASS_GREAT_WAR_INFANTRY"
  militarySupport.ERA_POSTMODERN = "UNITCLASS_INFANTRY"
  militarySupport.ERA_FUTURE = "UNITCLASS_INFANTRY"
		
function JFD_SendMilitarySupport(player, otherPlayer, attackingPlayer)
	local unitClass = militarySupport[GameInfo.Eras[otherPlayer:GetCurrentEra()].Type]
	local unitType = JFD_GetUniqueUnit(otherPlayer, unitClass)
	local aiType = GameInfo.Units[unitType].DefaultUnitAI
	player:AddFreeUnit(GameInfoTypes[unitType], GameInfoTypes[aiType])
	
	if player:IsHuman() then
		local description = Locale.ConvertTextKey('TXT_KEY_JFD_BELGIUM_MILITARY_SUPPORT', otherPlayer:GetName(), GameInfo.Units[unitType].Description, attackingPlayer:GetCivilizationDescription())
		local descriptionShort = Locale.ConvertTextKey("TXT_KEY_JFD_BELGIUM_MILITARY_SUPPORT_SHORT", otherPlayer:GetName())
		player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], description, descriptionShort)
	end
end

function JFD_TreatyOfLondon(teamID, otherTeamID)
	local player = Players[Teams[teamID]:GetLeaderID()]
	local otherPlayer = Players[Teams[otherTeamID]:GetLeaderID()]
	if (otherPlayer:GetCivilizationType() == civilisationID and not (player:IsMinorCiv())) then
		local belgianFriends = {}
		local count = 1
		for friendPlayerID, friend in pairs(Players) do
			if otherPlayer:IsAlive() and otherPlayer ~= albert and not otherPlayer:IsMinorCiv() then
				if friend:IsDoF(otherPlayer:GetID()) then
					belgianFriends[count] = friendPlayerID
					count= count + 1
				end
			end
		end

		for i, v in pairs(belgianFriends) do
			JFD_SendMilitarySupport(otherPlayer, Players[v], player)	
		end
	end
end
GameEvents.DeclareWar.Add(JFD_TreatyOfLondon)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_ChasseurMarch
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetWarPartner(player)
	local warPartner
	for playerID = 0, GameDefines.MAX_CIV_PLAYERS-1 do
		if playerID ~= player:GetID() then
			if Teams[Players[playerID]:GetTeam()]:IsAtWar(player:GetTeam()) then
				warPartner = Players[playerID]
			end
		end
	end
		
	return warPartner
end

function JFD_ChasseurMarch(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() then
		local coalitionWar = false
		if JFD_GetWarPartner(player) then
			local warPartner = JFD_GetWarPartner(player)
			for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS-1 do
				if iPlayer ~= playerID then
					local otherPlayer = Players[iPlayer]
					local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
					if JFD_GetWarPartner(otherPlayer) == warPartner and otherPlayer:IsDoF(playerID) then
						coalitionWar = true
						break
					end
				end
			end
				
			for unit in player:Units() do
				if coalitionWar then
					if unit:IsHasPromotion(unitPromotionChasseurID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, true)
						unit:SetHasPromotion(unitPromotionChasseurID, false)
					end
				else
					if unit:IsHasPromotion(unitPromotionChasseurMarchID) then
						unit:SetHasPromotion(unitPromotionChasseurMarchID, false)
						unit:SetHasPromotion(unitPromotionChasseurID, true)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_ChasseurMarch)
--------------------------------------------------------------------------------------------------------------------------
-- JFD_BelgianWorker
--------------------------------------------------------------------------------------------------------------------------
function JFD_BelgianWorkerTraining(playerID, unitID)
	local player = Players[playerID]
    if unitID == unitBelgianWorkerID then 
		return 
	end

	return true
end
GameEvents.PlayerCanTrain.Add(JFD_BelgianWorkerTraining)

function JFD_BelgianWorker(playerID, unitID)
    local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
       	 if player:GetUnitByID(unitID):GetUnitType() == unitWorkerID then
			unit = player:GetUnitByID(unitID)
			local newUnit
			newUnit = player:InitUnit(unitBelgianWorkerID, unit:GetX(), unit:GetY())
			
			newUnit:Convert(unit)
         end
    end
end

if isBelgiumCivActive then
	Events.SerialEventUnitCreated.Add(JFD_BelgianWorker)
end

function JFD_BelgianColonies(playerID, iX, iY, improvementID)
	local player = Players[playerID]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		if improvementID == improvementBelgianPlantationID then
			if Map.GetPlot(iX, iY) then
				local plot = Map.GetPlot(iX, iY)
				if plot:GetOwner() ~= playerID then
					plot:SetOwner(playerID)
				end
			end
		end
	end
end

if isBelgiumCivActive then
	GameEvents.BuildFinished.Add(JFD_BelgianColonies)
end
--==========================================================================================================================
--==========================================================================================================================