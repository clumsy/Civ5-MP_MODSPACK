-- JFD_AngloSaxonsFunctions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_AtPeace
--------------------------------------------------------------
function JFD_AtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(false) == 0 then atPeace = true end

	return atPeace
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Globals
----------------------------------------------------------------------------------------------------------------------------
local buildingMilanInvestmentsID = GameInfoTypes["BUILDING_JFD_MILAN_INVESTMENTS"]
local buildingPalazzoID = GameInfoTypes["BUILDING_JFD_PALAZZO"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local isMilanCivActive = JFD_IsCivilisationActive(civilisationID)
local mathCeil = math.ceil
local mathFloor = math.floor
local mathMin = math.min
local policyAmbrosianRepublicID = GameInfoTypes["POLICY_JFD_MILAN_AMBROSIAN_REPUBLIC"]
local policyMilanWarTimeInfluenceID = GameInfoTypes["POLICY_JFD_MILAN"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local yieldGoldID = GameInfoTypes["YIELD_GOLD"]

if isMilanCivActive then
	print("Gian Visconti is in the game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_InitMilan
--------------------------------------------------------------------------------------------------------------------------
function JFD_InitMilan()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if player:GetCivilizationType() == civilisationID then
			if player:HasPolicy(policyAmbrosianRepublicID) then
				local description =  Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_AMBROSIAN_REPUBLIC_DESC");
				local descriptionQuery = {"UPDATE Language_en_US SET Text = '".. description .."' WHERE Tag IN ('TXT_KEY_CIV_JFD_MILAN_DESC', 'TXT_KEY_CIV_JFD_MILAN_SHORT_DESC')"}
				for i, iQuery in pairs(descriptionQuery) do
					for result in DB.Query(iQuery) do
					end
				end
				-- refresh UI texts
				Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
			end
		end
	end 
end

if isMilanCivActive then
	Events.LoadScreenClose.Add(JFD_InitMilan)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MilaneseInvestments
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetPurchaseCostMod(playerID)
	local costMod = 0
	for minorPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
		local minorCiv = Players[minorPlayerID]
		if (minorCiv:GetCapitalCity() and minorCiv:IsAlive()) then
			if minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 1 then
				costMod = costMod + 1
			elseif minorCiv:GetMinorCivFriendshipLevelWithMajor(playerID) == 2 then
				costMod = costMod + 2
			end
		end
	end

	return mathFloor(costMod)
end

function JFD_MilaneseInvestments(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		local capital = player:GetCapitalCity() 
		if capital then
			capital:SetNumRealBuilding(buildingMilanInvestmentsID, mathMin(6, JFD_GetPurchaseCostMod(playerID)))
		end
	end
end

if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_MilaneseInvestments)
	Events.SerialEventEnterCityScreen.Add(JFD_MilaneseInvestments)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_MilanWarTimeInfluence
----------------------------------------------------------------------------------------------------------------------------
function JFD_MilanWarTimeInfluence(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		if not (JFD_AtPeace(playerID)) then
			if not player:HasPolicy(policyMilanWarTimeInfluenceID) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyMilanWarTimeInfluenceID, true)
			end
		else
			if player:HasPolicy(policyMilanWarTimeInfluenceID) then
				player:SetHasPolicy(policyMilanWarTimeInfluenceID, false)
			end
		end
	end
end

if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_MilanWarTimeInfluence)
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PalazzoGoldtoMerchants
----------------------------------------------------------------------------------------------------------------------------
function JFD_PalazzoGoldtoMerchants(playerID)
	local player = Players[playerID];
    if (player:IsEverAlive() and player:GetCivilizationType() == civilisationID) then 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingPalazzoID) then
				local merchantBoost = mathCeil(city:GetBaseYieldRate(yieldGoldID) * 33/100)
				city:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, merchantBoost*100)
			end	
		end
	end
end

if isMilanCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PalazzoGoldtoMerchants)
end
--==========================================================================================================================
--==========================================================================================================================