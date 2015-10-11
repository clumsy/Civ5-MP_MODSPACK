-- Decisions
-- Author: DJSHenninger
-- DateCreated: 3/1/2015 9:15:39 AM
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
--------------------------------------------------------------------------------------------------------------------------
-- Enact Dusan's Code
--------------------------------------------------------------------------------------------------------------------------
local Decisions_DJSHSerbiaEnactDusansCode = {}
	Decisions_DJSHSerbiaEnactDusansCode.Name = "TXT_KEY_DECISIONS_DJSH_SERBIA_ENACT_DUSANS_CODE"
	Decisions_DJSHSerbiaEnactDusansCode.Desc = "TXT_KEY_DECISIONS_DJSH_SERBIA_ENACT_DUSANS_CODE_DESC"
	HookDecisionCivilizationIcon(Decisions_DJSHSerbiaEnactDusansCode, "CIVILIZATION_DJSH_SERBIA")
	Decisions_DJSHSerbiaEnactDusansCode.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA"] then return false, false end
		local iEra = load(player, "Decisions_DJSHSerbiaEnactDusansCode")
		local iCurrentEra = player:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(player, "Decisions_DJSHSerbiaEnactDusansCode", nil)
			else
				Decisions_DJSHSerbiaEnactDusansCode.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_SERBIA_ENACT_DUSANS_CODE_ENACTED_DESC")
				return false, false, true
			end
		end

		local goldCost = math.ceil(player:GetNumPolicies() * 30 * iMod)
		local faithReward = math.ceil(player:GetNumPolicies() * 20 * iMod)
		Decisions_DJSHSerbiaEnactDusansCode.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_SERBIA_ENACT_DUSANS_CODE_DESC", goldCost, faithReward)

		if player:GetGold() < goldCost 							then return true, false end
		if player:GetCurrentEra() < GameInfoTypes["ERA_MEDIEVAL"] 	then return true, false end

		return true, true
	end
	)

Decisions_DJSHSerbiaEnactDusansCode.DoFunc = (
	function(player)
		local goldCost = math.ceil(player:GetNumPolicies() * 30 * iMod)
		local faithReward = math.ceil(player:GetNumPolicies() * 20 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeFaith(faithReward)
		
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_SERBIA_ENACT_DUSANS_CODE")) 
		save(player, "Decisions_DJSHSerbiaEnactDusansCode", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA"], "Decisions_DJSHSerbiaEnactDusansCode", Decisions_DJSHSerbiaEnactDusansCode)
--------------------------------------------------------------------------------------------------------------------------
-- Monastery of the Holy Archangels
--------------------------------------------------------------------------------------------------------------------------
local Decisions_DJSHMonasteryHolyArchangels = {}
	Decisions_DJSHMonasteryHolyArchangels.Name = "TXT_KEY_DECISIONS_DJSH_MONASTERY_HOLY_ARCHANGELS"
	Decisions_DJSHMonasteryHolyArchangels.Desc = "TXT_KEY_DECISIONS_DJSH_MONASTERY_HOLY_ARCHANGELS_DESC"
	HookDecisionCivilizationIcon(Decisions_DJSHMonasteryHolyArchangels, "CIVILIZATION_DJSH_SERBIA")
	Decisions_DJSHMonasteryHolyArchangels.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_DJSH_SERBIA"] then 
		return false, false 
		end
		if load(player, "Decisions_DJSHMonasteryHolyArchangels") == true then
			Decisions_DJSHMonasteryHolyArchangels.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_MONASTERY_HOLY_ARCHANGELS_ENACTED_DESC")
			return false, false, true 
		end

		local goldCost = math.ceil(300 * iMod)
		Decisions_DJSHMonasteryHolyArchangels.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DJSH_MONASTERY_HOLY_ARCHANGELS_DESC", goldCost)

		if not player:HasCreatedReligion()						then return true, false end
		if player:GetGold() < goldCost 							then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if player:GetCurrentEra() < GameInfoTypes["ERA_MEDIEVAL"] 	then return true, false end

		return true, true
	end
	)		

Decisions_DJSHMonasteryHolyArchangels.DoFunc = (
	function(player)
		local goldCost = math.ceil(300 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_DJSH_MONASTERY_HOLY_ARCHANGELS"], true)
		player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_MONASTERY_HOLY_ARCHANGELS"], 1)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DJSH_MONASTERY_HOLY_ARCHANGELS")) 
		save(player, "Decisions_DJSHMonasteryHolyArchangels", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_DJSH_SERBIA"], "Decisions_DJSHMonasteryHolyArchangels", Decisions_DJSHMonasteryHolyArchangels)