-- JFD_IcelandDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Iceland Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingClassAmphitheaterID = GameInfoTypes["BUILDINGCLASS_AMPHITHEATER"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ICELAND"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local policyLandnamabokID = GameInfoTypes["POLICY_JFD_LANDNAMABOK"]
local unitIcelandicSkald = nil
local unitSkaldID = GameInfoTypes["UNIT_JFD_SKALD"]
-------------------------------------------------------------------------------------------------------------------------
-- Iceland: Assemble the Allthing
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AssembleTheAllThing = {}
	Decisions_AssembleTheAllThing.Name = "TXT_KEY_DECISIONS_JFD_ICELAND_ASSEMBLE_THE_ALTHING"
	Decisions_AssembleTheAllThing.Desc = "TXT_KEY_DECISIONS_JFD_ICELAND_ASSEMBLE_THE_ALTHING_DESC"
	HookDecisionCivilizationIcon(Decisions_AssembleTheAllThing, "CIVILIZATION_JFD_ICELAND")
	Decisions_AssembleTheAllThing.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		local era = load(player, "Decisions_AssembleTheAllThing")
		local currentEra = player:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(player, "Decisions_AssembleTheAllThing", nil)
			else
				Decisions_AssembleTheAllThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ICELAND_ASSEMBLE_THE_ALTHING_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local goldenAgeReward = mathCeil(120 * iMod)
		local cultureReward = mathCeil(50 * iMod)
		Decisions_AssembleTheAllThing.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ICELAND_ASSEMBLE_THE_ALTHING_DESC", goldenAgeReward, cultureReward)
		
		if (not player:GetCapitalCity()) 														then return true, false end
		if player:GetBuildingClassCount(buildingClassAmphitheaterID < player:GetNumCities()) 	then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 								then return true, false end

		return true, true
	end
	)
	
	Decisions_AssembleTheAllThing.DoFunc = (
	function(player)
		local goldenAgeReward = mathCeil(120 * iMod)
		local cultureReward = mathCeil(50 * iMod)
		player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
		player:ChangeJONSCulture(cultureReward)
		player:ChangeNumResourceTotal(iMagistrate, 1)
		save(player, "Decisions_AssembleTheAllThing", player:GetCurrentEra())
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ICELAND_ASSEMBLE_THE_ALTHING"))
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AssembleTheAllThing", Decisions_AssembleTheAllThing)
-------------------------------------------------------------------------------------------------------------------------
-- Iceland: Compose the Landnámabók
-------------------------------------------------------------------------------------------------------------------------
local Decisions_Londnamabok = {}
	Decisions_Londnamabok.Name = "TXT_KEY_DECISIONS_JFD_ICELAND_COMPOSE_THE_LANDNAMABOK"
	Decisions_Londnamabok.Desc = "TXT_KEY_DECISIONS_JFD_ICELAND_COMPOSE_THE_LANDNAMABOK_DESC"
	HookDecisionCivilizationIcon(Decisions_Londnamabok, "CIVILIZATION_JFD_ICELAND")
	Decisions_Londnamabok.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_Londnamabok") == true then
			Decisions_Londnamabok.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ICELAND_COMPOSE_THE_LANDNAMABOK_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_Londnamabok.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_ICELAND_COMPOSE_THE_LANDNAMABOK_DESC")
		
		if not (player:GetCapitalCity()) then return true, false end
		if player:GetCurrentEra() < eraMedievalID then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		
		unitIcelandicSkald = nil
		local plot = player:GetCapitalCity():Plot()
		for iVal = 0,(plot:GetNumUnits() - 1) do
			local unit = plot:GetUnit(iVal)
			if unit:GetUnitType() == unitSkaldID then
				unitIcelandicSkald = unit
				break
			end
		end

		if unitIcelandicSkald ~= nil then
			return true, true
		else
			return true, false
		end

		return true, true
	end
	)
	
	Decisions_Londnamabok.DoFunc = (
	function(player)
		unitIcelandicSkald:Kill()
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyLandnamabokID, true)
		save(player, "Decisions_Londnamabok", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_Londnamabok", Decisions_Londnamabok)
--=======================================================================================================================
--=======================================================================================================================
