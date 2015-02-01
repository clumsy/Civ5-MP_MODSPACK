-- JFD_KhazariaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Khazaria Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
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
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_KHAZARIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local freePlot = nil
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()
local mathCeil = math.ceil
local religionID = nil
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local techHorsebackRiding = GameInfoTypes["TECH_ANIMAL_HUSBANDRY"]

if isUsingPietyPrestige then
	include("JFD_PietyUtils.lua")
end
--------------------------------------------------------------------------------------------------------------------------
-- Wise Sage
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDKhazariaSage = {}
	Event_JFDKhazariaSage.Name = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE"
	Event_JFDKhazariaSage.Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_DESC"
	Event_JFDKhazariaSage.Weight = 5
	Event_JFDKhazariaSage.CanFunc = (
		function(player)			
		if player:GetCivilizationType() ~= civilisationID then return false end

		local khazarReligionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
		if isUsingPietyPrestige then khazarReligionID = JFD_GetStateReligion(player:GetID()) end
		
		local religions = {}
		local count = 1
		for religion in GameInfo.Religions() do
			if (Game.GetHolyCityForReligion(religion.ID, -1) and religion.ID ~= khazarReligionID) then
				religions[count] = religion.ID
				count = count + 1
			end
		end

		religionID = religions[GetRandom(1, #religions)]
		if religionID == nil then return false end
			
		Event_JFDKhazariaSage.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_DESC", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFDKhazariaSage.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDKhazariaSage.Outcomes[1] = {}
	Event_JFDKhazariaSage.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_1"
	Event_JFDKhazariaSage.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_1"
	Event_JFDKhazariaSage.Outcomes[1].CanFunc = (
		function(player)
			local playerID = player:GetID()
			local reward = mathCeil(50 * iMod)
			local yield = "[ICON_PEACE] Faith"
			if isUsingPietyPrestige then
				local hasStateReligion = JFD_HasStateReligion(playerID)
				if hasStateReligion then
					yield = "[ICON_JFD_PIETY] Piety"
					reward = mathCeil(15 * iMod)
				end
			end
			
			Event_JFDKhazariaSage.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_1", reward, yield)
			return true
		end
		)
	Event_JFDKhazariaSage.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local reward = mathCeil(50 * iMod)
			if isUsingPietyPrestige then
				local hasStateReligion = JFD_HasStateReligion(playerID)
				if hasStateReligion then
					reward = mathCeil(15 * iMod)
					JFD_ChangePiety(playerID, reward)
				end
			else
				player:ChangeFaith(reward)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_SAGE"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDKhazariaSage.Outcomes[2] = {}
	Event_JFDKhazariaSage.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_2"
	Event_JFDKhazariaSage.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_2"
	Event_JFDKhazariaSage.Outcomes[2].CanFunc = (
		function(player)	
			local religionName = Game.GetReligionName(religionID)
			local description = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_2"
			if isUsingPietyPrestige then
				description = "TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_2_PIETY"
			end
			Event_JFDKhazariaSage.Outcomes[2].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_SAGE_OUTCOME_2", religionName)
			Event_JFDKhazariaSage.Outcomes[2].Desc = Locale.ConvertTextKey(description, religionName)
			return true
		end
		)
	Event_JFDKhazariaSage.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local convertPercent = 100
			if isUsingPietyPrestige then
				JFD_EstablishStateReligion(playerID, religionID)
				convertPercent = 50
			end
			ConvertPlayerReligion(player, religionID, convertPercent)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_KHAZARIA_SAGE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_SAGE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_KHAZARIA_SAGE")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDKhazariaSage", Event_JFDKhazariaSage)
--------------------------------------------------------------------------------------------------------------------------
-- Horse Breeder
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDKhazariaHorseBreeder = {}
	Event_JFDKhazariaHorseBreeder.Name = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER"
	Event_JFDKhazariaHorseBreeder.Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_DESC"
	Event_JFDKhazariaHorseBreeder.Weight = 5
	Event_JFDKhazariaHorseBreeder.CanFunc = (
		function(player)			
		if player:GetCivilizationType() ~= civilisationID then return false end
		if not (Teams[player:GetTeam()]:IsHasTech(techHorsebackRiding)) then return false end
		if player:GetCurrentEra() >= eraRenaissanceID then return false end
		
		local capital = player:GetCapitalCity()
		local freePlots = {}
		local count = 1
		for cityPlot = 0, capital:GetNumCityPlots() - 1, 1 do
			local plot = capital:GetCityIndexPlot(cityPlot)
			if plot:GetResourceType() == -1 and plot:GetImprovementType() == -1 then
				freePlots[count] = plot
				count = count + 1
			end
		end
		
		freePlot = freePlots[GetRandom(2, #freePlots)]
		if freePlot == nil then return false end
		
		Event_JFDKhazariaHorseBreeder.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_DESC")
		
			return true
		end
		)
	Event_JFDKhazariaHorseBreeder.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDKhazariaHorseBreeder.Outcomes[1] = {}
	Event_JFDKhazariaHorseBreeder.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_1"
	Event_JFDKhazariaHorseBreeder.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_1"
	Event_JFDKhazariaHorseBreeder.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDKhazariaHorseBreeder.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDKhazariaHorseBreeder.Outcomes[1].DoFunc = (
		function(player) 			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDKhazariaHorseBreeder.Outcomes[2] = {}
	Event_JFDKhazariaHorseBreeder.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_2"
	Event_JFDKhazariaHorseBreeder.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_2"
	Event_JFDKhazariaHorseBreeder.Outcomes[2].CanFunc = (
		function(player)	
			local goldCost = mathCeil(356 * iMod)
			if player:GetGold() < goldCost then return false end
			Event_JFDKhazariaHorseBreeder.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_2", goldCost)
			return true
		end
		)
	Event_JFDKhazariaHorseBreeder.Outcomes[2].DoFunc = (
		function(player) 
			local goldCost = mathCeil(356 * iMod)
			player:ChangeGold(-goldCost)
			freePlot:SetResourceType(resourceHorseID, 2)
			if freePlot:GetOwner() == -1 then
				freePlot:SetOwner(player:GetID())
			end
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_KHAZARIA_HORSE_BREEDER_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_KHAZARIA_HORSE_BREEDER"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDKhazariaHorseBreeder", Event_JFDKhazariaHorseBreeder)
--=======================================================================================================================
--=======================================================================================================================


