-- JFD_GermansEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's The Germans Events: loaded")
--==========================================================================================================================
-- MapModData
--==========================================================================================================================
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties;
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GERMANS"]
local chosenResourceID = nil
local chosenTribe = nil
local chosenTribePlot = nil
local chosenTribeResourceID = nil
local currentCraft = nil
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local improvementEncampmentUpgradedID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED"]
local improvementEncampmentUpgradedDeerID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER"]
local improvementEncampmentUpgradedHorseID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE"]
local improvementEncampmentUpgradedIronID = GameInfoTypes["IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON"]
local mathCeil = math.ceil
local resourceDeerID = GameInfoTypes["RESOURCE_DEER"]
local resourceIronID = GameInfoTypes["RESOURCE_IRON"]
local resourceHorseID = GameInfoTypes["RESOURCE_HORSE"]
local yieldFaithID = GameInfoTypes["YIELD_FAITH"]
--------------------------------------------------------------------------------------------------------------------------
--  Sacred Grove
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGermansSacredGrove = {}
	Event_JFDGermansSacredGrove.Name = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE"
	Event_JFDGermansSacredGrove.Desc = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_DESC"
	Event_JFDGermansSacredGrove.Weight = 10
	Event_JFDGermansSacredGrove.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID	then return false end
			if player:GetCurrentEra() > eraMedievalID			then return false end
			if load(player, "Event_JFDGermansSacredGrove")		then return false end

			local germanTribes = {}
			local count = 1
			for row in GameInfo.Civilization_JFD_TribalNames() do
				if GetPersistentProperty(row.TribalName) then
					germanTribes[count] = row.TribalName
					count = count + 1	
				end
			end
			
			if #germanTribes == 0 then return false end
			local randomTribe = JFD_GetRandom(1, #germanTribes)
			chosenTribe = germanTribes[randomTribe]

			Event_JFDGermansSacredGrove.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_DESC", chosenTribe)
			return true
		end
		)
	Event_JFDGermansSacredGrove.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGermansSacredGrove.Outcomes[1] = {}
	Event_JFDGermansSacredGrove.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_1"
	Event_JFDGermansSacredGrove.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_1"
	Event_JFDGermansSacredGrove.Outcomes[1].CanFunc = (
		function(player)	
			local faithReward = mathCeil(200 * iMod)

			Event_JFDGermansSacredGrove.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_1", chosenTribe)
			Event_JFDGermansSacredGrove.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_1", faithReward)
			return true
		end
		)
	Event_JFDGermansSacredGrove.Outcomes[1].DoFunc = (
		function(player) 
			local faithReward = mathCeil(200 * iMod)
			player:ChangeFaith(faithReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_1_NOTIFICATION", chosenTribe), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDGermansSacredGrove.Outcomes[2] = {}
	Event_JFDGermansSacredGrove.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_2"
	Event_JFDGermansSacredGrove.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_2"
	Event_JFDGermansSacredGrove.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDGermansSacredGrove.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_2", chosenTribe)
			return true
		end
		)
	Event_JFDGermansSacredGrove.Outcomes[2].DoFunc = (
		function(player) 
			local tribalNameX = chosenTribe .. "X"
			local tribalNameY = chosenTribe .. "Y"
			local plotX = GetPersistentProperty(tribalNameX)
			local plotY = GetPersistentProperty(tribalNameY)
			Game.SetPlotExtraYield(plotX, plotY, yieldFaithID, 3)
		
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_2_NOTIFICATION", chosenTribe), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE"))
			save(player, "Event_JFDGermansSacredGrove", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDGermansSacredGrove.Outcomes[3] = {}
	Event_JFDGermansSacredGrove.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_3"
	Event_JFDGermansSacredGrove.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_3"
	Event_JFDGermansSacredGrove.Outcomes[3].CanFunc = (
		function(player)	
			local goldenAgeReward = mathCeil(100 * iMod)
			Event_JFDGermansSacredGrove.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_3", goldenAgeReward)
			return true
		end
		)
	Event_JFDGermansSacredGrove.Outcomes[3].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_SACRED_GROVE_OUTCOME_RESULT_3_NOTIFICATION", chosenTribe), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_SACRED_GROVE"))
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDGermansSacredGrove", Event_JFDGermansSacredGrove)
--------------------------------------------------------------------------------------------------------------------------
--  Kidnapped Son
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGermansKidnappedSon = {}
	Event_JFDGermansKidnappedSon.Name = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING"
	Event_JFDGermansKidnappedSon.Desc = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_DESC"
	Event_JFDGermansKidnappedSon.Weight = 10
	Event_JFDGermansKidnappedSon.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() > eraMedievalID then return false end
			
			local germanTribes = {}
			local count = 1
			for row in GameInfo.Civilization_JFD_TribalNames() do
				if GetPersistentProperty(row.TribalName) then
					germanTribes[count] = row.TribalName
					count = count + 1	
				end
			end
			
			if #germanTribes == 0 then return false end
			local randomTribe = JFD_GetRandom(1, #germanTribes)
			chosenTribe = germanTribes[randomTribe]

			Event_JFDGermansKidnappedSon.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_DESC", chosenTribe)
			
			return true
		end
		)
	Event_JFDGermansKidnappedSon.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGermansKidnappedSon.Outcomes[1] = {}
	Event_JFDGermansKidnappedSon.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_1"
	Event_JFDGermansKidnappedSon.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_1"
	Event_JFDGermansKidnappedSon.Outcomes[1].CanFunc = (
		function(player)			
			local goldenAgeReward = mathCeil(50 * iMod)

			Event_JFDGermansKidnappedSon.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_1", goldenAgeReward)
			return true
		end
		)
	Event_JFDGermansKidnappedSon.Outcomes[1].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(50 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDGermansKidnappedSon.Outcomes[2] = {}
	Event_JFDGermansKidnappedSon.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_2"
	Event_JFDGermansKidnappedSon.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_2"
	Event_JFDGermansKidnappedSon.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(60 * iMod)
			local goldReward = mathCeil(111 * iMod)
			if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
			
			Event_JFDGermansKidnappedSon.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_2", goldenAgeCost, goldReward)
			return true
		end
		)
	Event_JFDGermansKidnappedSon.Outcomes[2].DoFunc = (
		function(player) 
			local goldenAgeCost = mathCeil(60 * iMod)
			local goldReward = mathCeil(111 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeGold(goldReward)
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDGermansKidnappedSon.Outcomes[3] = {}
	Event_JFDGermansKidnappedSon.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_3"
	Event_JFDGermansKidnappedSon.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_3"
	Event_JFDGermansKidnappedSon.Outcomes[3].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(15 * iMod)
			Event_JFDGermansKidnappedSon.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_3", cultureReward)
			return true
		end
		)
	Event_JFDGermansKidnappedSon.Outcomes[3].DoFunc = (
		function(player)
			local cultureReward = mathCeil(15 * iMod)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_KIDNAPPING_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_KIDNAPPING"))
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDGermansKidnappedSon", Event_JFDGermansKidnappedSon)
--------------------------------------------------------------------------------------------------------------------------
--  New Craft
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDGermansNewCraft = {}
	Event_JFDGermansNewCraft.Name = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT"
	Event_JFDGermansNewCraft.Desc = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_DESC"
	Event_JFDGermansNewCraft.Weight = 5
	Event_JFDGermansNewCraft.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID	then return false end
			if load(player, "Event_JFDGermansNewCraft")	then return false end

			local goldCost = math.ceil(200 * iMod)
			if player:GetGold() < goldCost then return false end
			
			local germanTribes = {}
			local count = 1
			for row in GameInfo.Civilization_JFD_TribalNames() do
				if GetPersistentProperty(row.TribalName) then
					germanTribes[count] = row.TribalName
					count = count + 1	
				end
			end
			
			if #germanTribes == 0 then return false end
			local randomTribe = JFD_GetRandom(1, #germanTribes)
			chosenTribe = germanTribes[randomTribe]

			local tribalNameX = chosenTribe .. "X"
			local tribalNameY = chosenTribe .. "Y"
			local plotX = GetPersistentProperty(tribalNameX)
			local plotY = GetPersistentProperty(tribalNameY)
			local plot = Map.GetPlot(plotX, plotY)
			local plotImprovementID = plot:GetImprovementType()
			currentCraft = "[ICON_RES_HORSE] Horse-breeding"
			chosenTribeResourceID = resourceHorseID
			if (plotImprovementID ~= improvementEncampmentUpgradedDeerID and plotImprovementID ~= improvementEncampmentUpgradedHorseID and plotImprovementID ~= improvementEncampmentUpgradedIronID) then return false end
			if plotImprovementID == improvementEncampmentUpgradedDeerID then
				currentCraft = "[ICON_RES_DEER] Hunting"
				chosenTribeResourceID = resourceDeerID
			elseif plotImprovementID == improvementEncampmentUpgradedIronID then
				currentCraft = "[ICON_RES_IRON] Metal-working"
				chosenTribeResourceID = resourceIronID
			end
			chosenTribePlot = plot

			local resources = {}
			local resourceCount = 1
			for row in GameInfo.Resources() do
				local type = row.Type
				if ((row.ResourceClassType == "RESOURCECLASS_LUXURY" and row.GroupRand > 0) and not (type == "RESOURCE_WHALE") and not (type == "RESOURCE_CORAL") and not (type == "RESOURCE_PEARLS") and not (type == "RESOURCE_CRAB")) then
					resources[resourceCount] = row.ID
				end
			end
			if #resources == 0 then return false end
			chosenResourceID = resources[JFD_GetRandom(1, #resources)]

			local resource = GameInfo.Resources[chosenResourceID]
			local resourceFontIcon = resource.IconString
			local resourceDescription = resource.Description
			Event_JFDGermansNewCraft.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_DESC", chosenTribe, resourceFontIcon, resourceDescription, currentCraft)
			
			return true
		end
		)
	Event_JFDGermansNewCraft.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDGermansNewCraft.Outcomes[1] = {}
	Event_JFDGermansNewCraft.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_1"
	Event_JFDGermansNewCraft.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_1"
	Event_JFDGermansNewCraft.Outcomes[1].CanFunc = (
		function(player)	
			local goldCost = math.ceil(200 * iMod)		
			local resource = GameInfo.Resources[chosenResourceID]
			local resourceFontIcon = resource.IconString
			local resourceDescription = resource.Description
			Event_JFDGermansNewCraft.Outcomes[1].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_1", chosenTribe, resourceFontIcon, resourceDescription)
			Event_JFDGermansNewCraft.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_1", goldCost, chosenTribe, resourceFontIcon, resourceDescription)
			return true
		end
		)
	Event_JFDGermansNewCraft.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = math.ceil(200 * iMod)		
			local resource = GameInfo.Resources[chosenResourceID]
			local resourceFontIcon = resource.IconString
			local resourceDescription = resource.Description
			player:ChangeGold(-goldCost)
			chosenTribePlot:SetResourceType(chosenResourceID, 1)
			chosenTribePlot:SetImprovementType(improvementEncampmentUpgradedID)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_1_NOTIFICATION", chosenTribe, resourceFontIcon, resourceDescription), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_WORLD_EVENT_JEWELLERS", chosenTribe, resourceFontIcon, resourceDescription))
			save(player, "Event_JFDGermansNewCraft", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDGermansNewCraft.Outcomes[2] = {}
	Event_JFDGermansNewCraft.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_2"
	Event_JFDGermansNewCraft.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_2"
	Event_JFDGermansNewCraft.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDGermansNewCraft.Outcomes[2].Name = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_2", currentCraft)
			Event_JFDGermansNewCraft.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDGermansNewCraft.Outcomes[2].DoFunc = (
		function(player) 
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_GERMANS_NEW_CRAFT_OUTCOME_RESULT_2_NOTIFICATION", chosenTribe, resourceFontIcon, resourceDescription), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_GERMANS_NEW_CRAFT"))
			save(player, "Event_JFDGermansNewCraft", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDGermansNewCraft", Event_JFDGermansNewCraft)
--=======================================================================================================================
--=======================================================================================================================


