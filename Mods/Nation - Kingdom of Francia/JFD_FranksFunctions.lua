-- JFD_FranksFunction
-- Author: JFD
-- DateCreated: 1/12/2014 6:46:53 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("IconSupport")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_AddPromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_AddPromotion(unit, promotionType)
	if not unit:IsHasPromotion(GameInfoTypes[promotionType]) then
		unit:SetHasPromotion(GameInfoTypes[promotionType], true)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
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
-------------------------------------------------------------------------------------------------------------------------
-- GetStrongestMilitaryUnit
-------------------------------------------------------------------------------------------------------------------------
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_THE_FRANKS"]
local improvementSiegeUnitID = GameInfoTypes["IMPROVEMENT_JFD_SIEGE_UNIT"]
local isFranciaCivActive = JFD_IsCivilisationActive(civilisationID)
local policyCarolingianEmpireID = GameInfoTypes["POLICY_CAROLINGIAN_EMPIRE"]
local unitProphet = nil

if isFranciaCivActive then
	print("Emperor Charlemagne is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
--InitCharlemagne
----------------------------------------------------------------------------------------------------------------------------
function InitCharlemagne(player)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
			if player:HasPolicy(policyCarolingianEmpireID) then
				local civilisationAdj = Locale.ConvertTextKey("TXT_KEY_JFD_CAROLINGIAN");
				local civilisationDesc =  Locale.ConvertTextKey("TXT_KEY_JFD_CAROLINGIAN_EMPIRE_DESC");
				local leaderName =  Locale.ConvertTextKey("TXT_KEY_JFD_CHARLES_AUGUSTUS");
				local query = {"UPDATE Language_en_US SET Text = '".. leaderName .."' WHERE Tag = 'TXT_KEY_LEADER_JFD_CHARLEMAGNE'",
					"UPDATE Language_en_US SET Text = '".. civilisationAdj .."' WHERE Tag = 'TXT_KEY_CIV_JFD_THE_FRANKS_ADJECTIVE'",
					"UPDATE Language_en_US SET Text = '".. civilisationDesc .."' WHERE Tag = 'TXT_KEY_CIV_JFD_THE_FRANKS_DESC'"}
				for i, iQuery in pairs(query) do
					for result in DB.Query(iQuery) do
					end
				end
				-- refresh UI texts
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			end
		end
	end 
end

if isFranciaCivActive then
	Events.LoadScreenClose.Add(InitCharlemagne)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CharlemagnesPiety
----------------------------------------------------------------------------------------------------------------------------
function JFD_CharlemagnePiety(oldOwnerID, isCapital, cityX, cityY, newOwnerID, iPop, bConquest)
	local player = Players[newOwnerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		if oldOwnerID ~= newOwnerID then
			local city = Map.GetPlot(cityX, cityY):GetPlotCity()
			local frankishFaithPerTurn = ((player:GetTotalFaithPerTurn() + 2) * 50 / 100)*(city:GetPopulation())
			player:ChangeFaith(frankishFaithPerTurn)
			if (player:IsHuman() and frankishFaithPerTurn > 0) then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_POLICY_FAITH_ALERT", frankishFaithPerTurn))
			end
		end
	end
end

if isFranciaCivActive then
	GameEvents.CityCaptureComplete.Add(JFD_CharlemagnePiety)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CharlemagnesSiegeUnits
----------------------------------------------------------------------------------------------------------------------------
 function JFD_CharlemagnesSiegeUnits(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
		if improvementID == improvementSiegeUnitID then
			local plot = Map.GetPlot(plotX, plotY)
			local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_SIEGE")
			plot:SetImprovementType(-1)
			player:InitUnit(unitID, plotX, plotY)
		end
	end
end

if isFranciaCivActive then
	GameEvents.BuildFinished.Add(JFD_CharlemagnesSiegeUnits)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_CarolingianPietyProphetPolicies
----------------------------------------------------------------------------------------------------------------------------
function JFD_CarolingianPietyProphetPolicies(playerID, unitID)
    local player = Players[playerID]
	unitProphet = player:GetUnitByID(unitID)
    if player:IsAlive() and player:GetCivilizationType() == civilisationID then 
       	if player:GetUnitByID(unitID) and player:GetUnitByID(unitID):GetUnitType() == GameInfoTypes["UNIT_PROPHET"] and player:GetFaith() == 0 then 
			if player:IsHuman() then
				JFD_ShowFranksPopup()
			else
				if player:GetReligionCreatedByPlayer() <= 0 then
					return
				else
					if JFD_GetRandom(1, 100) <= 60 then
						player:ChangeNumFreePolicies(1)
						unitProphet:Kill()
					end
				end
			end
		end
    end
end

function JFD_FranksProphet(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	
	if popupOpen then
		JFD_HideFranksPopup()
	end
end
Controls.Button1:RegisterCallback(Mouse.eLClick, JFD_FranksProphet)

function JFD_FranksPolicy(playerID)
	local decriptionShort = Locale.ConvertTextKey('TXT_KEY_JFD_FREE_POLICY_SHORT')
	local description = Locale.ConvertTextKey('TXT_KEY_JFD_FREE_POLICY_DESC')
	unitProphet:Kill()
	activePlayer:AddNotification(NotificationTypes["NOTIFICATION_FREE_POLICY"], description, decriptionShort)
	activePlayer:ChangeNumFreePolicies(1)
	
	if popupOpen then
		JFD_HideFranksPopup()
	end
end
Controls.Button2:RegisterCallback(Mouse.eLClick, JFD_FranksPolicy)

function JFD_ShowFranksPopup()
	CivIconHookup(activePlayerID, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	Controls.ButtonStack:CalculateSize()
	Controls.JFDFranksUI:DoAutoSize()
	Controls.JFDFranksUIBG:SetHide(false)
	Controls.JFDFranksUI:SetHide(false)
	popupOpen = true
end

function JFD_HideFranksPopup()
	Controls.JFDFranksUIBG:SetHide(true)
	Controls.JFDFranksUI:SetHide(true)
end

if isFranciaCivActive then
	Events.SerialEventUnitCreated.Add(JFD_CarolingianPietyProphetPolicies)
end
--=======================================================================================================================================================================================
--=======================================================================================================================================================================================